package com.subway.ssm.service.impl;

import com.subway.ssm.entity.Options;
import com.subway.ssm.mapper.OptionsMapper;
import com.subway.ssm.service.OptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 *
 * @author 言曌
 * @date 2017/9/7
 */
@Service
public class OptionsServiceImpl implements OptionsService {


    @Autowired
    private OptionsMapper optionsMapper;

    @Override
    @Cacheable(value = "default", key = "'options'")
    public Options getOptions() {
        return optionsMapper.getOptions();
    }
//
//    @Override
//    @CacheEvict(value = "default", key = "'options'")
//    public void insertOptions(Options options) {
//        optionsMapper.insert(options);
//    }

//    @Override
//    @CacheEvict(value = "default", key = "'options'")
//    public void updateOptions(Options options) {
//        optionsMapper.update(options);
//    }
}
