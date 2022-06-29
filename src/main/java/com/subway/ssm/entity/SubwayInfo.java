package com.subway.ssm.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
* Created by Mybatis Generator 2021/03/23
*/
@Data
@NoArgsConstructor
public class SubwayInfo implements Serializable {
    /**
     * 地铁线路id
     */
    private Long subwayId;

    /**
     * 地铁线路名称
     */
    private String subwayName;

    /**
     * 地铁线路备注
     */
    private String subwayRemark;

    /**
     * 地铁始发时间
     */
    private Date startingTime;

    private String startingTimeShow;

    /**
     * 地铁末班时间
     */
    private Date endTime;

    private String endTimeShow;

    /**
     * subway_info
     */
    private static final long serialVersionUID = 1L;
}