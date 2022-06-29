package com.subway.ssm.service.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.subway.ssm.entity.Employee;
import com.subway.ssm.entity.User;
import com.subway.ssm.mapper.ArticleMapper;
import com.subway.ssm.mapper.CommentMapper;
import com.subway.ssm.mapper.UserMapper;
import com.subway.ssm.service.ArticleService;
import com.subway.ssm.service.UserService;
import com.subway.ssm.service.dao.EmployeeDaoService;
import com.subway.ssm.util.DateUtils;
import org.apache.cxf.common.util.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 用户管理
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private EmployeeDaoService employeeDaoService;

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<User> listUser() {
        List<User> userList = userMapper.listUser();
        List<Employee> employeeList = employeeDaoService.listEmployee();
        userList = getUser(userList,employeeList);
        return userList;
    }

    @Override
    public List<User> listStaff() {
        List<User> userList = userMapper.listStaff();
        List<Employee> employeeList = employeeDaoService.listEmployee();
        userList = getUser(userList,employeeList);

        for (User user:userList){
            String userRegisterTimeShow = DateUtils.formatDate(user.getUserRegisterTime(),"yyyy-MM-dd HH:mm");
            user.setUserRegisterTimeShow(userRegisterTimeShow);
            String userLastLoginTimeShow = DateUtils.formatDate(user.getUserLastLoginTime(),"yyyy-MM-dd HH:mm");
            user.setUserLastLoginTimeShow(userLastLoginTimeShow);
            String startingTimeShow = DateUtils.formatDate(user.getBeginTime(),"HH:mm");
            user.setBeginTimeShow(startingTimeShow);
            String endTimeShow = DateUtils.formatDate(user.getEndTime(),"HH:mm");
            user.setEndTimeShow(endTimeShow);
        }

        return userList;
    }

    @Override
    public List<User> searchUser(String keywords) {
        List<User> userList = userMapper.searchUser(keywords);
        List<Employee> employeeList = employeeDaoService.listEmployee();
        userList = getUser(userList,employeeList);

        for (User user:userList){
            String userRegisterTimeShow = DateUtils.formatDate(user.getUserRegisterTime(),"yyyy-MM-dd HH:mm");
            user.setUserRegisterTimeShow(userRegisterTimeShow);
            String userLastLoginTimeShow = DateUtils.formatDate(user.getUserLastLoginTime(),"yyyy-MM-dd HH:mm");
            user.setUserLastLoginTimeShow(userLastLoginTimeShow);
            String startingTimeShow = DateUtils.formatDate(user.getBeginTime(),"HH:mm");
            user.setBeginTimeShow(startingTimeShow);
            String endTimeShow = DateUtils.formatDate(user.getEndTime(),"HH:mm");
            user.setEndTimeShow(endTimeShow);
        }

        return userList;    }

    @Override
    public User getUserById(Integer id) {
        User user = userMapper.getUserById(id);
        if (user==null){
            return null;
        }
        List<Employee> employeeList = employeeDaoService.listEmployee();
        user = employee2User(user,employeeList);
        return user;
    }

    @Override
    public void updateUser(User user) {
        Date startingTime = DateUtils.formatDate(user.getBeginTimeShow(),"HH:mm");
        user.setBeginTime(startingTime);
        Date endTime = DateUtils.formatDate(user.getEndTimeShow(),"HH:mm");
        user.setEndTime(endTime);

        Employee employee = user2Employee(user);
        employeeDaoService.deleteByUserId(employee.getUserId());
        employeeDaoService.insert(employee);
        userMapper.update(user);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUser(Integer id) {
        // 删除用户
        userMapper.deleteById(id);
        // 删除用户员工信息
        employeeDaoService.deleteByUserId(id);
        // 删除评论
        commentMapper.deleteByUserId(id);
        // 删除文章
        List<Integer> articleIds = articleMapper.listArticleIdsByUserId(id);
        if (articleIds != null && articleIds.size() > 0) {
            for (Integer articleId : articleIds) {
                articleService.deleteArticle(articleId);
            }
        }
    }

    @Override
    public User insertUser(User user) {
        user.setUserRegisterTime(new Date());

        Employee employee = user2Employee(user);
        employeeDaoService.update(employee);
        userMapper.insert(user);
        return user;
    }

    @Override
    public User getUserByNameOrEmail(String str) {
        User user = userMapper.getUserByNameOrEmail(str);
        if (user==null){
            return null;
        }
        List<Employee> employeeList = employeeDaoService.listEmployee();
        user = employee2User(user,employeeList);
        initUser(user);
        return user;
    }

    private void initUser(User user){
        String startingTimeShow = DateUtils.formatDate(user.getBeginTime(),"HH:mm");
        user.setBeginTimeShow(startingTimeShow);
        String endTimeShow = DateUtils.formatDate(user.getEndTime(),"HH:mm");
        user.setEndTimeShow(endTimeShow);
        if (startingTimeShow!=null&&endTimeShow!=null){
            if(startingTimeShow.compareTo(endTimeShow)<0){
                String nowTimeShow = DateUtils.formatDate(new Date(),"HH:mm");
                if (startingTimeShow.compareTo(nowTimeShow)<0&&
                        nowTimeShow.compareTo(endTimeShow)<0){
                    user.setWorkingStatus("上班时间");
                }
            }else{
                String nowTimeShow = DateUtils.formatDate(new Date(),"HH:mm");
                if (startingTimeShow.compareTo(nowTimeShow)<0&&
                        nowTimeShow.compareTo(endTimeShow)<0){

                }else{
                    user.setWorkingStatus("上班时间");
                }
            }
        }
    }

    @Override
    public User getUserByName(String name) {
        User user = userMapper.getUserByName(name);
        if (user==null){
            return null;
        }
        List<Employee> employeeList = employeeDaoService.listEmployee();
        user = employee2User(user,employeeList);
        initUser(user);
        return user;
    }

    @Override
    public User getUserByEmail(String email) {
        User user = userMapper.getUserByEmail(email);
        if (user==null){
            return null;
        }
        List<Employee> employeeList = employeeDaoService.listEmployee();
        user = employee2User(user,employeeList);
        initUser(user);
        return user;
    }



    public static List<User> getUser(List<User> userList,List<Employee> employeeList){
        if (CollectionUtils.isEmpty(userList)){
            return Lists.newArrayList();
        }
        Map<Integer,Employee> employeeMap = Maps.newHashMap();
        if (!CollectionUtils.isEmpty(employeeList)){
            for (Employee employee:employeeList){
                employeeMap.put(employee.getUserId(),employee);
            }
        }



        for (User user:userList){
            Employee employee = employeeMap.get(user.getUserId());
            if(employee==null){
                employee = new Employee();
            }
            user.setWage(employee.getWage());
            user.setLeader(employee.getLeader());
            user.setBeginTime(employee.getBeginTime());
            user.setEndTime(employee.getEndTime());
            user.setDepartment(employee.getDepartment());
        }
        return userList;
    }



    public static User employee2User(User user,List<Employee> employeeList){
        if (user==null){
            return null;
        }

        Map<Integer,Employee> employeeMap = Maps.newHashMap();
        if (!CollectionUtils.isEmpty(employeeList)){
            for (Employee employee:employeeList){
                employeeMap.put(employee.getUserId(),employee);
            }
        }

        Employee employee = employeeMap.get(user.getUserId());
        if(employee==null){
            employee = new Employee();
        }
        user.setWage(employee.getWage());
        user.setLeader(employee.getLeader());
        user.setBeginTime(employee.getBeginTime());
        user.setEndTime(employee.getEndTime());
        user.setDepartment(employee.getDepartment());
        return user;
    }



    public static Employee user2Employee(User user){
        if (user==null){
            return null;
        }
        Employee employee = new Employee();
        employee.setUserId(user.getUserId());
        employee.setUserName(user.getUserName());
        employee.setWage(user.getWage());
        employee.setLeader(user.getLeader());
        employee.setBeginTime(user.getBeginTime());
        employee.setEndTime(user.getEndTime());
        employee.setDepartment(user.getDepartment());
        return employee;
    }

}
