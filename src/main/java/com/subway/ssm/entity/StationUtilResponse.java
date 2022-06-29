package com.subway.ssm.entity;

import lombok.Data;

import java.util.List;

@Data
public class StationUtilResponse {


    /**
     * 开始时间
     */
    private String startingTimeShow;


    /**
     * 结尾时间
     */
    private String endTimeShow;


    /**
     * 价格
     */
    private String price;


    /**
     * 路线
     */
    private String subwayPath;


}
