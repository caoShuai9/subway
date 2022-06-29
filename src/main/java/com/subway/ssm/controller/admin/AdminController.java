package com.subway.ssm.controller.admin;

import com.github.pagehelper.util.StringUtil;
import com.subway.ssm.dto.JsonResult;
import com.subway.ssm.entity.Article;
import com.subway.ssm.entity.Comment;
import com.subway.ssm.entity.LoginLog;
import com.subway.ssm.entity.User;
import com.subway.ssm.enums.UserRole;
import com.subway.ssm.mapper.LoginLogMapper;
import com.subway.ssm.service.ArticleService;
import com.subway.ssm.service.CommentService;
import com.subway.ssm.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.subway.ssm.util.MyUtils.getIpAddr;

/**
 * @author liuyanzhao
 */
@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private LoginLogMapper loginLogMapper;

    /**
     * 后台首页
     *
     * @return
     */
    @RequestMapping("/admin")
    public String index(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer userId = null;
        if (!UserRole.ADMIN.getValue().equals(user.getUserRole())) {
            // 用户查询自己的文章, 管理员查询所有的
            userId = user.getUserId();
        }
        //文章列表
        List<Article> articleList = articleService.listRecentArticle(userId, 5);
        model.addAttribute("articleList", articleList);
        return "Admin/index";
    }

    /**
     * 登录页面显示
     *
     * @return
     */
    @RequestMapping("/login")
    public String loginPage() {
        return "Admin/login";
    }


    /**
     * 登录页面显示
     *
     * @return
     */
    @RequestMapping("/register")
    public String registerPage() {
        return "Admin/register";
    }

    /**
     * 登录验证
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/loginVerify", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8"})
    @ResponseBody
    public String loginVerify(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberme = request.getParameter("rememberme");
        User user = userService.getUserByNameOrEmail(username);



        if (user == null) {
            map.put("code", 0);
            map.put("msg", "用户名无效！");
        } else if (!user.getUserPass().equals(password)) {
            map.put("code", 0);
            map.put("msg", "密码错误！");
        } else {
            String ip = getIpAddr(request);
            LoginLog record = new LoginLog();
            record.setUserId(user.getUserId());
            record.setUserName(user.getUserName());
            record.setUserIp(ip);
            record.setLoginTime(new Date());
            loginLogMapper.insert(record);
            //登录成功
            map.put("code", 1);
            map.put("msg", "");
            //添加session
            request.getSession().setAttribute("user", user);
            //添加cookie
            if (rememberme != null) {
                //创建两个Cookie对象
                Cookie nameCookie = new Cookie("username", username);
                //设置Cookie的有效期为3天
                nameCookie.setMaxAge(60 * 60 * 24 * 3);
                Cookie pwdCookie = new Cookie("password", password);
                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
                response.addCookie(nameCookie);
                response.addCookie(pwdCookie);
            }
            user.setUserLastLoginTime(new Date());
            user.setUserLastLoginIp(getIpAddr(request));
            userService.updateUser(user);

        }
        String result = new JSONObject(map).toString();
        return result;
    }




    private String getIpAddr(HttpServletRequest request) {
        String remoteAddr = request.getHeader("X-Forwarded-For");
        if (StringUtil.isEmpty(remoteAddr)) {
            remoteAddr = request.getHeader("Proxy-Client-IP");
        }
        if (StringUtil.isEmpty(remoteAddr)) {
            remoteAddr = request.getHeader("WL-Proxy-Client-IP");
        }
        return remoteAddr != null ? remoteAddr : request.getRemoteAddr();
    }



    /**
     * 登录验证
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/registerSubmit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult registerSubmit(HttpServletRequest request) {
        String username = request.getParameter("username");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User checkUserName = userService.getUserByName(username);
        if (checkUserName != null) {
            return new JsonResult().fail("用户名已存在");
        }
        User checkEmail = userService.getUserByEmail(username);
        if (checkEmail != null) {
            return new JsonResult().fail("电子邮箱已存在");
        }

        // 添加用户
        User user = new User();
        user.setUserId((int) System.currentTimeMillis());
        user.setUserType("1");//普通用户
        user.setUserName(username);
        user.setUserNickname(nickname);
        user.setUserPass(password);
        user.setUserEmail(email);
        user.setUserStatus(1);
        user.setUserRole(UserRole.USER.getValue());
        try {
            userService.insertUser(user);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().fail("系统异常");
        }
        return new JsonResult().ok("注册成功");
    }

    /**
     * 退出登录
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/login";
    }


    /**
     * 基本信息页面显示
     *
     * @return
     */
    @RequestMapping(value = "/admin/profile")
    public ModelAndView userProfileView(HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();
        User sessionUser = (User) session.getAttribute("user");
        User user = userService.getUserById(sessionUser.getUserId());
        modelAndView.addObject("user", user);

        modelAndView.setViewName("Admin/User/profile");
        return modelAndView;
    }

    /**
     * 编辑个人信息页面显示
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin/profile/edit")
    public ModelAndView editUserView(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        User loginUser = (User) session.getAttribute("user");
        User user = userService.getUserById(loginUser.getUserId());
        modelAndView.addObject("user", user);

        modelAndView.setViewName("Admin/User/editProfile");
        return modelAndView;
    }


    /**
     * 编辑用户提交
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/admin/profile/save", method = RequestMethod.POST)
    public String saveProfile(User user, HttpSession session) {
        User dbUser = (User) session.getAttribute("user");

        user.setUserId(dbUser.getUserId());
        userService.updateUser(user);
        return "redirect:/admin/profile";
    }


}
