package com.subway.ssm.service.impl;

import com.subway.ssm.service.EmployeeService;
import com.subway.ssm.service.dao.EmployeeDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDaoService employeeDaoService;

}
