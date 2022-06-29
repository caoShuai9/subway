package com.subway.ssm.service.dao.impl;

import com.github.pagehelper.PageHelper;
import com.subway.ssm.entity.SubwayInfo;
import com.subway.ssm.entity.SubwayInfoExample;
import com.subway.ssm.entity.SubwayStationInfo;
import com.subway.ssm.entity.SubwayStationInfoExample;
import com.subway.ssm.mapper.SubwayStationInfoMapper;
import com.subway.ssm.service.dao.SubwayStationDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class SubwayStationDaoServiceImpl implements SubwayStationDaoService {


    @Autowired
    private SubwayStationInfoMapper subwayStationInfoMapper;


    @Override
    public SubwayStationInfo getSubwayStationById(Long subwayStationId){
        SubwayStationInfoExample example = new SubwayStationInfoExample();
        SubwayStationInfoExample.Criteria criteria = example.createCriteria();
        criteria.andSubwayStationIdEqualTo(subwayStationId);
        List<SubwayStationInfo> subwayStationList = subwayStationInfoMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(subwayStationList)){
            return null;
        }
        return subwayStationList.get(0);
    }

    @Override
    public SubwayStationInfo getSubwayStationByAddress(String address) {
        SubwayStationInfoExample example = new SubwayStationInfoExample();
        SubwayStationInfoExample.Criteria criteria = example.createCriteria();
        criteria.andSubwayStationInfoLike("%"+address+"%");
        List<SubwayStationInfo> subwayStationList = subwayStationInfoMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(subwayStationList)){
            return null;
        }
        return subwayStationList.get(0);
    }

    @Override
    public List<SubwayStationInfo> getSubwayStationBySubwayId(Long subwayId){
        SubwayStationInfoExample example = new SubwayStationInfoExample();
        SubwayStationInfoExample.Criteria criteria = example.createCriteria();
        criteria.andSubwayIdEqualTo(subwayId);
        List<SubwayStationInfo> subwayStationList = subwayStationInfoMapper.selectByExample(example);
        return subwayStationList;
    }

    @Override
    public List<SubwayStationInfo> getSubwayStationList() {
        SubwayStationInfoExample example = new SubwayStationInfoExample();
        List<SubwayStationInfo> subwayStationList = subwayStationInfoMapper.selectByExample(example);
        return subwayStationList;
    }

//    @Override
//    public List<SubwayStationInfo> getSubwayStationList(Integer page, Integer limit) {
//        PageHelper.startPage(page, limit);
//        List<SubwayStationInfo> list = subwayStationInfoMapper.selectAllSubwayStation();
//        return list;
//    }

    @Override
    public void insertSubwayStation(SubwayStationInfo subwayStation) {
        subwayStationInfoMapper.insert(subwayStation);
    }

    @Override
    public void editSubwayStation(SubwayStationInfo subwayStationInfo) {
        SubwayStationInfoExample example = new SubwayStationInfoExample();
        SubwayStationInfoExample.Criteria criteria = example.createCriteria();
        criteria.andSubwayStationIdEqualTo(subwayStationInfo.getSubwayStationId());
        subwayStationInfoMapper.updateByExample(subwayStationInfo,example);
    }

    @Override
    public void deleteSubwayStation(Long id) {
        SubwayStationInfoExample example = new SubwayStationInfoExample();
        SubwayStationInfoExample.Criteria criteria = example.createCriteria();
        criteria.andSubwayStationIdEqualTo(id);
        subwayStationInfoMapper.deleteByExample(example);
    }

}
