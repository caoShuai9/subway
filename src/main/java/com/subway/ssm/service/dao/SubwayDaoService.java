package com.subway.ssm.service.dao;

import com.subway.ssm.entity.SubwayInfo;

import java.util.List;


public interface SubwayDaoService {

    SubwayInfo getSubway(Long subwayId);


    void deleteSubway(Long subwayId);


    List<SubwayInfo> getSubwayList();


    void insertSubway(SubwayInfo subwayInfo);


    void editSubway(SubwayInfo subwayInfo);


}
