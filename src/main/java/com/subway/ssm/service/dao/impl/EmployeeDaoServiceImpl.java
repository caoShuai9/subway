package com.subway.ssm.service.dao.impl;

import com.subway.ssm.entity.Employee;
import com.subway.ssm.entity.EmployeeExample;
import com.subway.ssm.mapper.EmployeeMapper;
import com.subway.ssm.service.dao.EmployeeDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeDaoServiceImpl implements EmployeeDaoService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public void deleteByUserId(Integer userId){
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andUserIdEqualTo(userId);
        employeeMapper.deleteByExample(example);
    }

    @Override
    public List<Employee> listEmployee() {
        EmployeeExample example = new EmployeeExample();
        return employeeMapper.selectByExample(example);
    }

    @Override
    public void update(Employee employee) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andUserIdEqualTo(employee.getUserId());
        employeeMapper.updateByExample(employee,example);
    }

    @Override
    public void insert(Employee employee) {
        employeeMapper.insert(employee);
    }


}
