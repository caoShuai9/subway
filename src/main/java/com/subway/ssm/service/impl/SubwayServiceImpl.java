package com.subway.ssm.service.impl;

import com.subway.ssm.entity.StationUtilArg;
import com.subway.ssm.entity.StationUtilResponse;
import com.subway.ssm.entity.SubwayInfo;
import com.subway.ssm.service.SubwayService;
import com.subway.ssm.service.dao.SubwayDaoService;
import com.subway.ssm.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SubwayServiceImpl implements SubwayService {

    @Autowired
    private SubwayDaoService subwayDaoService;



    @Override
    public SubwayInfo getSubway(Long subwayId){
        SubwayInfo subwayInfo = subwayDaoService.getSubway(subwayId);
        String startingTimeShow = DateUtils.formatDate(subwayInfo.getStartingTime(),"HH:mm");
        subwayInfo.setStartingTimeShow(startingTimeShow);
        String endTimeShow = DateUtils.formatDate(subwayInfo.getEndTime(),"HH:mm");
        subwayInfo.setEndTimeShow(endTimeShow);
        return subwayInfo;
    }


    @Override
    public void deleteSubway(Long subwayId) {
        subwayDaoService.deleteSubway(subwayId);
    }

    @Override
    public void insertSubway(SubwayInfo subwayInfo) {
        Date startingTime = DateUtils.formatDate(subwayInfo.getStartingTimeShow(),"HH:mm");
        subwayInfo.setStartingTime(startingTime);
        Date endTime = DateUtils.formatDate(subwayInfo.getEndTimeShow(),"HH:mm");
        subwayInfo.setEndTime(endTime);
        subwayDaoService.insertSubway(subwayInfo);
    }

    @Override
    public void editSubway(SubwayInfo subwayInfo) {
        Date startingTime = DateUtils.formatDate(subwayInfo.getStartingTimeShow(),"HH:mm");
        subwayInfo.setStartingTime(startingTime);
        Date endTime = DateUtils.formatDate(subwayInfo.getEndTimeShow(),"HH:mm");
        subwayInfo.setEndTime(endTime);
        subwayDaoService.editSubway(subwayInfo);
    }


    @Override
    public List<SubwayInfo> getSubwayList(){
        List<SubwayInfo> subwayList = subwayDaoService.getSubwayList();
        for (SubwayInfo subwayInfo:subwayList){
            String startingTimeShow = DateUtils.formatDate(subwayInfo.getStartingTime(),"HH:mm");
            subwayInfo.setStartingTimeShow(startingTimeShow);
            String endTimeShow = DateUtils.formatDate(subwayInfo.getEndTime(),"HH:mm");
            subwayInfo.setEndTimeShow(endTimeShow);
        }
        return subwayList;
    }

}
