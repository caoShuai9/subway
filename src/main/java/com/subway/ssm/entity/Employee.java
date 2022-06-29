package com.subway.ssm.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
* Created by Mybatis Generator 2021/03/31
*/
@Data
@NoArgsConstructor
public class Employee implements Serializable {
    /**
     * 员工id自增主键
     */
    private Long employeeId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 
     */
    private String userName;

    /**
     * 工资
     */
    private String wage;

    /**
     * 直属领导
     */
    private String leader;

    /**
     * 开始上班时间
     */
    private Date beginTime;

    /**
     * 结束上班时间
     */
    private Date endTime;

    /**
     * 员工部门
     */
    private String department;

    /**
     * employee
     */
    private static final long serialVersionUID = 1L;
}