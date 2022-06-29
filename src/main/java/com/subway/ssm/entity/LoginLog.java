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
public class LoginLog implements Serializable {
    /**
     * 日志id自增主键
     */
    private Long id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 工资
     */
    private String userIp;

    /**
     * 登录时间
     */
    private Date loginTime;

    /**
     * login_log
     */
    private static final long serialVersionUID = 1L;
}