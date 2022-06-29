package com.subway.ssm.service;

import com.github.pagehelper.PageInfo;
import com.subway.ssm.entity.Article;

import java.util.HashMap;
import java.util.List;


public interface ArticleService {


    /**
     * 获得最新文章
     *
     * @param limit 查询数量
     * @return 列表
     */
    List<Article> listRecentArticle(Integer userId, Integer limit);


    /**
     * 修改文章详细信息
     *
     * @param article 文章
     */
    void updateArticleDetail(Article article);

    /**
     * 修改文章简单信息
     *
     * @param article 文章
     */
    void updateArticle(Article article);


    /**
     * 删除文章
     *
     * @param id 文章ID
     */
    void deleteArticle(Integer id);

    /**
     * 分页显示
     *
     * @param pageIndex 第几页开始
     * @param pageSize  一页显示多少
     * @param criteria  查询条件
     * @return 文章列表
     */
    PageInfo<Article> pageArticle(Integer pageIndex,
                                  Integer pageSize,
                                  HashMap<String, Object> criteria);


    PageInfo<Article> indexPageArticle(Integer pageIndex,
                                       Integer pageSize,
                                       HashMap<String, Object> criteria);

    /**
     * 文章详情页面显示
     *
     * @param status 状态
     * @param id     文章ID
     * @return 文章
     */
    Article getArticleByStatusAndId(Integer status, Integer id);


    /**
     * 获得上一篇文章
     *
     * @param id 文章ID
     * @return 文章
     */
    Article getAfterArticle(Integer id);

    /**
     * 获得下一篇文章
     *
     * @param id 文章ID
     * @return 文章
     */
    Article getPreArticle(Integer id);


    /******************************************************************************/

    List<Article> listRandomHostArticle(Integer limit);


    List<Article> listLostFoundArticle(Integer limit);
    /******************************************************************************/

    /**
     * 添加文章
     *
     * @param article 文章
     */
    void insertArticle(Article article);


    /**
     * 更新文章的评论数
     *
     * @param articleId 文章ID
     */
    void updateCommentCount(Integer articleId);

}
