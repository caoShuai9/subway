package com.subway.ssm.service;

import com.subway.ssm.entity.StationUtilArg;
import com.subway.ssm.entity.StationUtilResponse;
import com.subway.ssm.entity.SubwayInfo;
import com.subway.ssm.entity.SubwayStationInfo;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

public interface SubwayStationService {

    SubwayStationInfo getSubwayStationById(Long subwayStationId);


    List<SubwayStationInfo> getSubwayStationBySubwayId(Long subwayId);


    //分页
//    List<SubwayStationInfo> getSubwayStationList(Integer page,Integer limit);

    List<SubwayStationInfo> getSubwayStationList();

    void insertSubwayStation(SubwayStationInfo subwayStationInfo);


    void editSubwayStation(SubwayStationInfo subwayStationInfo);



    void deleteSubwayStation(Long id);


    StationUtilResponse getStationUtil(StationUtilArg arg);

}
