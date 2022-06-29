package com.subway.ssm.mapper;

import com.subway.ssm.entity.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface CommentMapper {
    /**
     * 添加
     *
     * @param comment 评论
     * @return 影响行数
     */
    int insert(Comment comment);

    /**
     * 根据文章id获取评论列表
     *
     * @param id ID
     * @return 列表
     */
    List<Comment> listCommentByArticleId(@Param(value = "id") Integer id);

    /**
     * 根据用户ID删除
     *
     * @param userId 用户ID
     * @return 影响函数
     */
    Integer deleteByUserId(Integer userId);


    /**
     * 根据文章ID删除
     *
     * @param articleId 文章ID
     * @return 影响函数
     */
    Integer deleteByArticleId(Integer articleId);

    Integer deleteBycommentId(Integer commentId);

}