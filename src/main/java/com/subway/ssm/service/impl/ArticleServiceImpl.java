package com.subway.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.subway.ssm.entity.*;
import com.subway.ssm.enums.ArticleCommentStatus;
import com.subway.ssm.mapper.*;
import com.subway.ssm.service.ArticleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * 文章Servie实现
 *
 * @author 言曌
 * @date 2017/8/24
 */
@Service
@Slf4j
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Article> listRecentArticle(Integer userId, Integer limit) {
        return articleMapper.listArticleByLimit(userId, limit);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateArticleDetail(Article article) {
        article.setArticleUpdateTime(new Date());
        articleMapper.update(article);
    }

    @Override
    public void updateArticle(Article article) {
        articleMapper.update(article);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteArticle(Integer id) {
        articleMapper.deleteById(id);
        commentMapper.deleteByArticleId(id);
    }


    @Override
    public PageInfo<Article> pageArticle(Integer pageIndex,
                                         Integer pageSize,
                                         HashMap<String, Object> criteria) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Article> articleList = articleMapper.findAll(criteria);
        return new PageInfo<>(articleList);
    }


    @Override
    public PageInfo<Article> indexPageArticle(Integer pageIndex,
                                         Integer pageSize,
                                         HashMap<String, Object> criteria) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Article> articleList = articleMapper.findCommonAll(criteria);
        return new PageInfo<>(articleList);
    }



    @Override
    public Article getArticleByStatusAndId(Integer status, Integer id) {
        Article article = articleMapper.getArticleByStatusAndId(status, id);
        return article;
    }




    @Override
    public Article getAfterArticle(Integer id) {
        return articleMapper.getAfterArticle(id);
    }

    @Override
    public Article getPreArticle(Integer id) {
        return articleMapper.getPreArticle(id);
    }

    /******************************************************************************/

    @Override
    public List<Article> listRandomHostArticle(Integer limit) {
        return articleMapper.listRandomHostArticle(limit);
    }


    @Override
    public List<Article> listLostFoundArticle(Integer limit) {
        return articleMapper.listLostFoundArticle(limit);
    }

    /******************************************************************************/



    @Override
    @Transactional(rollbackFor = Exception.class)
    public void insertArticle(Article article) {
        //添加文章
        article.setArticleCreateTime(new Date());
        article.setArticleUpdateTime(new Date());
        article.setArticleIsComment(ArticleCommentStatus.ALLOW.getValue());
        article.setArticleViewCount(0);
        article.setArticleLikeCount(0);
        article.setArticleCommentCount(0);
        article.setArticleOrder(1);
        articleMapper.insert(article);
    }


    @Override
    public void updateCommentCount(Integer articleId) {
        articleMapper.updateCommentCount(articleId);
    }




}
