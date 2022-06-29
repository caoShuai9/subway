package com.subway.ssm.service;

import com.subway.ssm.entity.StationUtilArg;
import com.subway.ssm.entity.StationUtilResponse;
import com.subway.ssm.entity.SubwayInfo;

import java.util.List;

public interface SubwayService {


    SubwayInfo getSubway(Long subwayId);

    void deleteSubway(Long subwayId);


    void insertSubway(SubwayInfo subwayInfo);


    void editSubway(SubwayInfo subwayInfo);


    List<SubwayInfo> getSubwayList();

}
