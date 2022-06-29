package com.subway.ssm.service.dao;

import com.subway.ssm.entity.SubwayStationInfo;

import java.util.List;

public interface SubwayStationDaoService {

    SubwayStationInfo getSubwayStationById(Long subwayStationId);


    SubwayStationInfo getSubwayStationByAddress(String address);


    List<SubwayStationInfo> getSubwayStationBySubwayId(Long subwayId);


    List<SubwayStationInfo> getSubwayStationList();

//    List<SubwayStationInfo> getSubwayStationList(Integer page,Integer limit);


    void insertSubwayStation(SubwayStationInfo subwayInfo);


    void editSubwayStation(SubwayStationInfo subwayStationInfo);



    void deleteSubwayStation(Long id);

}
