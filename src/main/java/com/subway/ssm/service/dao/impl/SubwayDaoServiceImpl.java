package com.subway.ssm.service.dao.impl;

import com.subway.ssm.entity.SubwayInfo;
import com.subway.ssm.entity.SubwayInfoExample;
import com.subway.ssm.entity.SubwayStationInfo;
import com.subway.ssm.entity.SubwayStationInfoExample;
import com.subway.ssm.mapper.SubwayInfoMapper;
import com.subway.ssm.mapper.SubwayStationInfoMapper;
import com.subway.ssm.service.dao.SubwayDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class SubwayDaoServiceImpl implements SubwayDaoService {


    @Autowired
    private SubwayInfoMapper subwayInfoMapper;

    @Override
    public SubwayInfo getSubway(Long subwayId) {
        SubwayInfoExample example = new SubwayInfoExample();
        SubwayInfoExample.Criteria criteria = example.createCriteria();
        criteria.andSubwayIdEqualTo(subwayId);
        List<SubwayInfo> subwayList = subwayInfoMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(subwayList)){
            return null;
        }
        return subwayList.get(0);
    }

    @Override
    public void deleteSubway(Long subwayId) {
        SubwayInfoExample example = new SubwayInfoExample();
        SubwayInfoExample.Criteria criteria = example.createCriteria();
        criteria.andSubwayIdEqualTo(subwayId);
        subwayInfoMapper.deleteByExample(example);
    }

    @Override
    public List<SubwayInfo> getSubwayList() {
        SubwayInfoExample example = new SubwayInfoExample();
        List<SubwayInfo> subwayList = subwayInfoMapper.selectByExample(example);
        return subwayList;
    }

    @Override
    public void insertSubway(SubwayInfo subwayInfo) {
        subwayInfoMapper.insert(subwayInfo);
    }

    @Override
    public void editSubway(SubwayInfo subwayInfo) {
        SubwayInfoExample example = new SubwayInfoExample();
        SubwayInfoExample.Criteria criteria = example.createCriteria();
        criteria.andSubwayIdEqualTo(subwayInfo.getSubwayId());
        subwayInfoMapper.updateByExample(subwayInfo,example);
    }


}
