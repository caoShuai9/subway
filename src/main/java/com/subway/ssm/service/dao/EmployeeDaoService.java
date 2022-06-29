package com.subway.ssm.service.dao;

import com.subway.ssm.entity.Employee;

import java.util.List;

public interface EmployeeDaoService {

    void deleteByUserId(Integer userId);


    List<Employee> listEmployee();

    void update(Employee employee);

    void insert(Employee employee);

}
