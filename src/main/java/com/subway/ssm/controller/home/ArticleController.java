package com.subway.ssm.controller.home;


import com.alibaba.fastjson.JSON;
import com.subway.ssm.entity.Article;
import com.subway.ssm.entity.Comment;
import com.subway.ssm.entity.User;
import com.subway.ssm.enums.ArticleStatus;
import com.subway.ssm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private UserService userService;


    /**
     * 文章详情页显示
     *
     * @param articleId 文章ID
     * @return modelAndView
     */
    @RequestMapping(value = "/article/{articleId}")
    public String getArticleDetailPage(@PathVariable("articleId") Integer articleId, Model model) {

        //文章信息，分类，标签，作者，评论
        Article article = articleService.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), articleId);
        if (article == null) {
            return "Home/Error/404";
        }
        //用户信息
        User user = userService.getUserById(article.getArticleUserId());
        article.setUser(user);
        //文章信息
        model.addAttribute("article", article);
        //评论列表
        List<Comment> commentList = commentService.listCommentByArticleId(articleId);
        model.addAttribute("commentList", commentList);
        //获取下一篇文章
        Article afterArticle = articleService.getAfterArticle(articleId);
        model.addAttribute("afterArticle", afterArticle);
        //获取上一篇文章
        Article preArticle = articleService.getPreArticle(articleId);
        model.addAttribute("preArticle", preArticle);
        return "Home/Page/articleDetail";
    }

    /**
     * 文章访问量数增加
     *
     * @param id 文章ID
     * @return 访问量数量
     */
    @RequestMapping(value = "/article/view/{id}", method = {RequestMethod.POST}, produces = {"text/plain;charset=UTF-8"})
    @ResponseBody
    public String increaseViewCount(@PathVariable("id") Integer id) {
        Article article = articleService.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), id);
        Integer articleCount = article.getArticleViewCount() + 1;
        article.setArticleViewCount(articleCount);
        articleService.updateArticle(article);
        return JSON.toJSONString(articleCount);
    }

}
