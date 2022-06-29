package com.subway.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
import com.subway.ssm.entity.StationUtilArg;
import com.subway.ssm.entity.StationUtilResponse;
import com.subway.ssm.entity.SubwayInfo;
import com.subway.ssm.entity.SubwayStationInfo;
import com.subway.ssm.service.SubwayService;
import com.subway.ssm.service.SubwayStationService;
import com.subway.ssm.service.dao.SubwayStationDaoService;
import com.subway.ssm.util.DateUtils;
import com.subway.ssm.util.StationUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.Inet4Address;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class SubwayStationServiceImpl implements SubwayStationService {

    @Autowired
    private SubwayStationDaoService subwayStationDaoService;


    @Autowired
    private SubwayService subwayService;

    @Override
    public SubwayStationInfo getSubwayStationById(Long subwayStationId){
        SubwayStationInfo subwayStation =
                subwayStationDaoService.getSubwayStationById(subwayStationId);
        String startingTimeShow = DateUtils.formatDate(subwayStation.getStartingTime(),"HH:mm");
        subwayStation.setStartingTimeShow(startingTimeShow);
        String endTimeShow = DateUtils.formatDate(subwayStation.getEndTime(),"HH:mm");
        subwayStation.setEndTimeShow(endTimeShow);
        return subwayStation;
    }


    @Override
    public List<SubwayStationInfo> getSubwayStationBySubwayId(Long subwayId){
        List<SubwayStationInfo> subwayStationList =
                subwayStationDaoService.getSubwayStationBySubwayId(subwayId);
        for (SubwayStationInfo subwayStation:subwayStationList){
            String startingTimeShow = DateUtils.formatDate(subwayStation.getStartingTime(),"HH:mm");
            subwayStation.setStartingTimeShow(startingTimeShow);
            String endTimeShow = DateUtils.formatDate(subwayStation.getEndTime(),"HH:mm");
            subwayStation.setEndTimeShow(endTimeShow);
        }
        return subwayStationList;
    }

    @Override
    public List<SubwayStationInfo> getSubwayStationList() {
//        PageHelper.startPage(page,limit);//分页
        List<SubwayStationInfo> subwayStationList =
                subwayStationDaoService.getSubwayStationList();
        for (SubwayStationInfo subwayStation:subwayStationList){
            String startingTimeShow = DateUtils.formatDate(subwayStation.getStartingTime(),"HH:mm");
            subwayStation.setStartingTimeShow(startingTimeShow);
            String endTimeShow = DateUtils.formatDate(subwayStation.getEndTime(),"HH:mm");
            subwayStation.setEndTimeShow(endTimeShow);
        }
        return subwayStationList;
    }

//    @Override
//    public List<SubwayStationInfo> getSubwayStationList(Integer page,Integer limit) {
//        PageHelper.startPage(page,limit);//分页
//        List<SubwayStationInfo> subwayStationList =
//                subwayStationDaoService.getSubwayStationList();
//        for (SubwayStationInfo subwayStation:subwayStationList){
//            String startingTimeShow = DateUtils.formatDate(subwayStation.getStartingTime(),"HH:mm");
//            subwayStation.setStartingTimeShow(startingTimeShow);
//            String endTimeShow = DateUtils.formatDate(subwayStation.getEndTime(),"HH:mm");
//            subwayStation.setEndTimeShow(endTimeShow);
//        }
//        return subwayStationList;
//    }

    @Override
    public void insertSubwayStation(SubwayStationInfo subwayStationInfo) {
        List<SubwayInfo> subwayList = subwayService.getSubwayList();
        Map<String,String> map = Maps.newHashMap();
        for (SubwayInfo subway:subwayList){
            map.put(subway.getSubwayId()+"",subway.getSubwayName());
        }
        String transferSubwayName = map.get(subwayStationInfo.getTransferSubwayId());
        String subwayName = map.get(subwayStationInfo.getSubwayId()+"");
        subwayStationInfo.setTransferSubwayName(transferSubwayName);
        subwayStationInfo.setSubwayName(subwayName);

        Date startingTime = DateUtils.formatDate(subwayStationInfo.getStartingTimeShow(),"HH:mm");
        subwayStationInfo.setStartingTime(startingTime);
        Date endTime = DateUtils.formatDate(subwayStationInfo.getEndTimeShow(),"HH:mm");
        subwayStationInfo.setEndTime(endTime);

        subwayStationDaoService.insertSubwayStation(subwayStationInfo);
    }

    @Override
    public void editSubwayStation(SubwayStationInfo subwayStationInfo) {
        List<SubwayInfo> subwayList = subwayService.getSubwayList();
        Map<String,String> map = Maps.newHashMap();
        for (SubwayInfo subway:subwayList){
            map.put(subway.getSubwayId()+"",subway.getSubwayName());
        }
        String transferSubwayName = map.get(subwayStationInfo.getTransferSubwayId());
        String subwayName = map.get(subwayStationInfo.getSubwayId()+"");
        subwayStationInfo.setTransferSubwayName(transferSubwayName);
        subwayStationInfo.setSubwayName(subwayName);

        Date startingTime = DateUtils.formatDate(subwayStationInfo.getStartingTimeShow(),"HH:mm");
        subwayStationInfo.setStartingTime(startingTime);
        Date endTime = DateUtils.formatDate(subwayStationInfo.getEndTimeShow(),"HH:mm");
        subwayStationInfo.setEndTime(endTime);

        subwayStationDaoService.editSubwayStation(subwayStationInfo);
    }

    @Override
    public void deleteSubwayStation(Long id) {
        subwayStationDaoService.deleteSubwayStation(id);
    }



    @Override
    public StationUtilResponse getStationUtil(StationUtilArg arg) {
        SubwayStationInfo outsetStation;
        SubwayStationInfo reachStation;
        if (StringUtils.isNotBlank(arg.getStartingAddress())||
                StringUtils.isNotBlank(arg.getArrivalAddress())){
            outsetStation = subwayStationDaoService.getSubwayStationByAddress(arg.getStartingAddress());
            reachStation =  subwayStationDaoService.getSubwayStationByAddress(arg.getArrivalAddress());
        }else{
            outsetStation = subwayStationDaoService.getSubwayStationById(arg.getOutsetStation());
            reachStation = subwayStationDaoService.getSubwayStationById(arg.getReachStation());
        }

        SubwayInfo outset = subwayService.getSubway(new Long(outsetStation.getSubwayId()));
        SubwayInfo reach = subwayService.getSubway(new Long(reachStation.getSubwayId()));

        StationUtilResponse response = StationUtil.getStationList(outsetStation,reachStation);
        response.setStartingTimeShow(outset.getStartingTimeShow());
        response.setEndTimeShow(reach.getEndTimeShow());
        return response;
    }

}
