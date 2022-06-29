package com.subway.ssm.mapper;

import com.subway.ssm.entity.LoginLog;
import com.subway.ssm.entity.LoginLogExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* Created by Mybatis Generator 2021/03/31
*/
public interface LoginLogMapper {
    /**
     *
     * @mbg.generated 2021-03-31
     */
    long countByExample(LoginLogExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int deleteByExample(LoginLogExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int deleteByPrimaryKey(Long id);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int insert(LoginLog record);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int insertSelective(LoginLog record);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    List<LoginLog> selectByExample(LoginLogExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    LoginLog selectByPrimaryKey(Long id);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int updateByExampleSelective(@Param("record") LoginLog record, @Param("example") LoginLogExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int updateByExample(@Param("record") LoginLog record, @Param("example") LoginLogExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int updateByPrimaryKeySelective(LoginLog record);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int updateByPrimaryKey(LoginLog record);

    java.util.Map<String, Object> sumByExample(LoginLogExample example);
}