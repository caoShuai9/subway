package com.subway.ssm.mapper;

import com.subway.ssm.entity.SubwayStationInfo;
import com.subway.ssm.entity.SubwayStationInfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* Created by Mybatis Generator 2021/05/05
*/
public interface SubwayStationInfoMapper {
    /**
     *
     * @mbg.generated 2021-05-05
     */
    long countByExample(SubwayStationInfoExample example);

    /**
     *
     * @mbg.generated 2021-05-05
     */
    int deleteByExample(SubwayStationInfoExample example);

    /**
     *
     * @mbg.generated 2021-05-05
     */
    int deleteByPrimaryKey(Long subwayStationId);

    /**
     *
     * @mbg.generated 2021-05-05
     */
    int insert(SubwayStationInfo record);

    /**
     *
     * @mbg.generated 2021-05-05
     */
    int insertSelective(SubwayStationInfo record);

    /**
     *
     * @mbg.generated 2021-05-05
     */
    List<SubwayStationInfo> selectByExample(SubwayStationInfoExample example);

    List<SubwayStationInfo> selectAllSubwayStation();

    /**
     *
     * @mbg.generated 2021-05-05
     */
    SubwayStationInfo selectByPrimaryKey(Long subwayStationId);

    /**
     *
     * @mbg.generated 2021-05-05
     */
    int updateByExampleSelective(@Param("record") SubwayStationInfo record, @Param("example") SubwayStationInfoExample example);

    /**
     *
     * @mbg.generated 2021-05-05
     */
    int updateByExample(@Param("record") SubwayStationInfo record, @Param("example") SubwayStationInfoExample example);

    /**
     *
     * @mbg.generated 2021-05-05
     */
    int updateByPrimaryKeySelective(SubwayStationInfo record);

    /**
     *
     * @mbg.generated 2021-05-05
     */
    int updateByPrimaryKey(SubwayStationInfo record);

    java.util.Map<String, Object> sumByExample(SubwayStationInfoExample example);
}