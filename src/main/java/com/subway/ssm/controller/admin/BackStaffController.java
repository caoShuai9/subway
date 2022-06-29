package com.subway.ssm.controller.admin;


import com.subway.ssm.entity.User;
import com.subway.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin/staff")
public class BackStaffController {


    @Autowired
    private UserService userService;


    /**
     * 后台用户列表显示
     *
     * @return
     */
    @RequestMapping(value = "")
    public ModelAndView userList() {
        ModelAndView modelandview = new ModelAndView();
        List<User> userList = userService.listStaff();
        modelandview.addObject("userList", userList);
        modelandview.setViewName("Admin/staff/index");
        return modelandview;
    }






    /**
     * 编辑用户页面显示
     *
     * @return
     */
    @RequestMapping(value = "/insert")
    public ModelAndView insertUserView() {
        ModelAndView modelAndView = new ModelAndView();
        List<User> userList = userService.listUser();
        modelAndView.addObject("userList", userList);
        modelAndView.setViewName("Admin/staff/insert");
        return modelAndView;
    }

    /**
     * 编辑用户页面显示
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit/{id}")
    public ModelAndView editUserView(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        User user = userService.getUserById(id);
        modelAndView.addObject("user", user);
        modelAndView.setViewName("Admin/staff/edit");
        return modelAndView;
    }


    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id}")
    public String deleteUser(@PathVariable("id") Integer id) {
        User user = userService.getUserById(id);
        user.setUserType("1");
        userService.updateUser(user);
        return "redirect:/admin/staff";
    }

    /**
     * 编辑用户提交
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    public String editUserSubmit(User user) {
        user.setUserType("2");
        userService.updateUser(user);
        return "redirect:/admin/staff";
    }

}
