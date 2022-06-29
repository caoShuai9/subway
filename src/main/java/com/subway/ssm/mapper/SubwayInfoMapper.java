package com.subway.ssm.mapper;

import com.subway.ssm.entity.SubwayInfo;
import com.subway.ssm.entity.SubwayInfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* Created by Mybatis Generator 2021/03/23
*/
public interface SubwayInfoMapper {
    /**
     *
     * @mbg.generated 2021-03-23
     */
    long countByExample(SubwayInfoExample example);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    int deleteByExample(SubwayInfoExample example);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    int deleteByPrimaryKey(Long subwayId);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    int insert(SubwayInfo record);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    int insertSelective(SubwayInfo record);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    List<SubwayInfo> selectByExample(SubwayInfoExample example);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    SubwayInfo selectByPrimaryKey(Long subwayId);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    int updateByExampleSelective(@Param("record") SubwayInfo record, @Param("example") SubwayInfoExample example);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    int updateByExample(@Param("record") SubwayInfo record, @Param("example") SubwayInfoExample example);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    int updateByPrimaryKeySelective(SubwayInfo record);

    /**
     *
     * @mbg.generated 2021-03-23
     */
    int updateByPrimaryKey(SubwayInfo record);

    java.util.Map<String, Object> sumByExample(SubwayInfoExample example);
}