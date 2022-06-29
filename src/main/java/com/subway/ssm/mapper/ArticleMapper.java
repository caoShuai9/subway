package com.subway.ssm.mapper;

import com.subway.ssm.entity.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

/**
 * 文章Mapper
 *
 * @author liuyanzhao
 */
@Mapper
public interface ArticleMapper {

    /**
     * 根据ID删除
     *
     * @param articleId 文章ID
     * @return 影响函数
     */
    Integer deleteById(Integer articleId);

    /**
     * 添加文章
     *
     * @param article 文章
     * @return 文章
     */
    Integer insert(Article article);

    /**
     * 更新文章
     *
     * @param article 文章
     * @return 影响行数
     */
    Integer update(Article article);

    /**
     * 获得所有的文章
     *
     * @param criteria 查询条件
     * @return 文章列表
     */
    List<Article> findAll(HashMap<String, Object> criteria);

    /**
     * 获得所有的文章
     *
     * @param criteria 查询条件
     * @return 文章列表
     */
    List<Article> findCommonAll(HashMap<String, Object> criteria);






    /**
     * 根据id查询用户信息
     *
     * @param status 状态
     * @param id 文章ID
     * @return 文章
     */
    Article getArticleByStatusAndId(@Param(value = "status") Integer status, @Param(value = "id") Integer id);






    /**
     * 获得上一篇文章
     *
     * @param id 文章ID
     * @return 文章
     */
    Article getAfterArticle(@Param(value = "id") Integer id);

    /**
     * 获得下一篇文章
     *
     * @param id 文章ID
     * @return 文章
     */
    Article getPreArticle(@Param(value = "id") Integer id);


    /******************************************************************************/

    /**
     * 获取地铁热点新闻信息
     * @param limit
     * @return
     */
    List<Article> listRandomHostArticle(@Param(value = "limit") Integer limit);

    /**
     * 获取失物招领信息
     * @param limit
     * @return
     */
    List<Article> listLostFoundArticle(@Param(value = "limit") Integer limit);


    /******************************************************************************/

    /**
     * 更新文章的评论数
     *
     * @param articleId 文章ID
     */
    void updateCommentCount(@Param(value = "articleId") Integer articleId);

    /**
     * 获得最新文章
     *
     * @param limit 查询数量
     * @return 列表
     */
    List<Article> listArticleByLimit(@Param("userId") Integer userId, @Param("limit") Integer limit);


    /**
     * 获得一个用户的文章id集合
     * @param userId
     * @return
     */
    List<Integer> listArticleIdsByUserId(Integer userId);
}