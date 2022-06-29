package com.subway.ssm.entity;


import lombok.Data;

@Data
public class StationUtilArg {

    private String outset;

    private String reach;

    private Long outsetStation;

    private Long reachStation;

    /**
     * 出发地点
     */
    private String startingAddress;

    /**
     * 到达地点
     */
    private String arrivalAddress;

}
