package com.subway.ssm.controller.home;

import cn.hutool.http.HtmlUtil;
import com.subway.ssm.dto.JsonResult;
import com.subway.ssm.entity.Article;
import com.subway.ssm.entity.Comment;
import com.subway.ssm.entity.User;
import com.subway.ssm.enums.ArticleStatus;
import com.subway.ssm.enums.Role;
import com.subway.ssm.service.ArticleService;
import com.subway.ssm.service.CommentService;
import com.subway.ssm.util.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
@RestController
public class CommentController {
    @Autowired
    private CommentService commentService;

    @Autowired
    private ArticleService articleService;

    /**
     * 添加评论
     *
     * @param request
     * @param comment
     */
    @RequestMapping(value = "/comment", method = {RequestMethod.POST})
    public JsonResult insertComment(HttpServletRequest request, Comment comment, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new JsonResult().fail("请先登录");
        }
        Article article = articleService.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), comment.getCommentArticleId());
        if (article == null) {
            return new JsonResult().fail("文章不存在");
        }
        //添加评论
        comment.setCommentUserId(user.getUserId());
        comment.setCommentCreateTime(new Date());
        comment.setCommentIp(MyUtils.getIpAddr(request));
        if (Objects.equals(user.getUserId(), article.getArticleUserId())) {
            comment.setCommentRole(Role.OWNER.getValue());
        } else {
            comment.setCommentRole(Role.VISITOR.getValue());
        }
//        comment.setCommentAuthorAvatar(MyUtils.getGravatar(comment.getCommentAuthorEmail()));

        //过滤字符，防止XSS攻击
        comment.setCommentContent(HtmlUtil.escape(comment.getCommentContent()));

        comment.setCommentAuthorName(user.getUserNickname());
        comment.setCommentAuthorEmail(user.getUserEmail());
        comment.setCommentAuthorUrl(user.getUserUrl());
        try {
            commentService.insertComment(comment);
            //更新文章的评论数
            articleService.updateCommentCount(article.getArticleId());
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().fail();
        }
        return new JsonResult().ok();
    }

    /**
     * 添加评论
     *
     * @param request
     * @param comment
     */
    @RequestMapping(value = "/systemComment", method = {RequestMethod.POST})
    public JsonResult insertSystemComment(HttpServletRequest request, Comment comment, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return new JsonResult().fail("请先登录");
        }

        //系统评论默认0
        comment.setCommentArticleId(0);
        //添加评论
        comment.setCommentUserId(user.getUserId());
        comment.setCommentCreateTime(new Date());
        comment.setCommentIp(MyUtils.getIpAddr(request));
        comment.setCommentRole(Role.OWNER.getValue());

//        comment.setCommentAuthorAvatar(MyUtils.getGravatar(comment.getCommentAuthorEmail()));

        //过滤字符，防止XSS攻击
        comment.setCommentContent(HtmlUtil.escape(comment.getCommentContent()));

        comment.setCommentAuthorName(user.getUserNickname());
        comment.setCommentAuthorEmail(user.getUserEmail());
        comment.setCommentAuthorUrl(user.getUserUrl());
        try {
            commentService.insertComment(comment);
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult().fail();
        }
        return new JsonResult().ok();
    }
    /**
     * 删除评论
     */
    @RequestMapping(value = "/admin/comment/delete/{id}")
    public JsonResult deleteComment(@PathVariable("id") Integer id){

        commentService.deleteComment(id);

        return new JsonResult().ok();
    }




}
