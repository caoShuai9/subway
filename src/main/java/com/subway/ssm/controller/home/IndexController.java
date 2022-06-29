package com.subway.ssm.controller.home;

import com.github.pagehelper.PageInfo;
import com.subway.ssm.entity.*;
import com.subway.ssm.enums.ArticleStatus;
import com.subway.ssm.enums.NoticeStatus;
import com.subway.ssm.enums.UserRole;
import com.subway.ssm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * 用户的controller
 *
 * @author 言曌
 * @date 2017/8/24
 */
@Controller
public class IndexController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private CommentService commentService;

    /**
     * 主页信息展示
     * @param pageIndex
     * @param pageSize
     * @param model
     * @return
     */
    @RequestMapping(value = {"/", "/article"})
    public String index(@RequestParam(required = false, defaultValue = "1") Integer pageIndex,
                        @RequestParam(required = false, defaultValue = "10") Integer pageSize, Model model) {
        HashMap<String, Object> criteria = new HashMap<>(1);
        criteria.put("status", ArticleStatus.PUBLISH.getValue());
        //文章列表
        PageInfo<Article> articleList = articleService.indexPageArticle(pageIndex, pageSize, criteria);
        model.addAttribute("pageInfo", articleList);

        //公告
        List<Notice> noticeList = noticeService.listNotice(NoticeStatus.NORMAL.getValue());
        model.addAttribute("noticeList", noticeList);

        model.addAttribute("pageUrlPrefix", "/article?pageIndex");
        return "Home/index";
    }


    /**
     * 主页查询新闻文章
     * @param keywords
     * @param pageIndex
     * @param pageSize
     * @param model
     * @return
     */
    @RequestMapping(value = "/search")
    public String search(
            @RequestParam("keywords") String keywords,
            @RequestParam(required = false, defaultValue = "1") Integer pageIndex,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize, Model model) {
        //文章列表
        HashMap<String, Object> criteria = new HashMap<>(2);
        criteria.put("status", ArticleStatus.PUBLISH.getValue());
        criteria.put("keywords", keywords);
        PageInfo<Article> articlePageInfo = articleService.pageArticle(pageIndex, pageSize, criteria);
        model.addAttribute("pageInfo", articlePageInfo);
        model.addAttribute("pageUrlPrefix", "/search?pageIndex");
        return "Home/Page/search";
    }

    @RequestMapping("/404")
    public String NotFound(@RequestParam(required = false) String message, Model model) {
        model.addAttribute("message", message);
        return "Home/Error/404";
    }


    @RequestMapping("/403")
    public String Page403(@RequestParam(required = false) String message, Model model) {
        model.addAttribute("message", message);
        return "Home/Error/403";
    }

    @RequestMapping("/500")
    public String ServerError(@RequestParam(required = false) String message, Model model) {
        model.addAttribute("message", message);
        return "Home/Error/500";
    }


    /**
     * 留言板
     *
     * @return
     */
    @RequestMapping(value = "/message")
    public String message(Model model) {
        //评论列表
        List<Comment> commentList = commentService.listCommentByArticleId(0);
        model.addAttribute("commentList", commentList);
        return "Home/Page/message";
    }


    /**
     * 用户信息
     *
     * @return
     */
    @RequestMapping(value = "/userInfo")
    public String userInfo(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        return "Home/Page/user";
    }
}




