package com.subway.ssm.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
* Created by Mybatis Generator 2021/05/05
*/
@Data
@NoArgsConstructor
public class SubwayStationInfo implements Serializable {
    /**
     * 地铁站点id
     */
    private Long subwayStationId;

    /**
     * 地铁站点名称
     */
    private String subwayStationName;

    /**
     * 地铁线路id
     */
    private Long subwayId;

    /**
     * 地铁线路名称
     */
    private String subwayName;

    /**
     * 站点附近地址
     */
    private String subwayStationInfo;

    /**
     * 是否换乘站
     */
    private String ifTransfer;

    /**
     * 换乘线路id
     */
    private String transferSubwayId;

    /**
     * 换乘线路名称
     */
    private String transferSubwayName;

    /**
     * 所在区名称
     */
    private String districtName;

    /**
     * 开始时间
     */
    private Date startingTime;

    /**
     * 开始时间
     */
    private String startingTimeShow;

    /**
     * 结束时间
     */
    private Date endTime;

    /**
     * 结束时间
     */
    private String endTimeShow;

    /**
     * 介绍备注
     */
    private String remark;

    /**
     * 站点权重
     */
    private String weights;

    /**
     * subway_station_info
     */
    private static final long serialVersionUID = 1L;
}