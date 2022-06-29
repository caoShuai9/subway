package com.subway.ssm.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author liuyanzhao
 */
@Data
public class User implements Serializable{
    private static final long serialVersionUID = -4415517704211731385L;
    private Integer userId;

    private String userName;

    private String userPass;

    private String userNickname;

    private String userEmail;

    private String userUrl;

    private String userType;

    private String userLastLoginIp;

    private Date userRegisterTime;

    private String userRegisterTimeShow;

    private Date userLastLoginTime;

    private String userLastLoginTimeShow;

    private Integer userStatus;

    private String userRole;

    private String wage;

    private String leader;

    private String department;

    private Date beginTime;

    private String beginTimeShow;

    private Date endTime;

    private String endTimeShow;

    private String workingStatus = "非上班时间";

}