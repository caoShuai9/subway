package com.subway.ssm.mapper;

import com.subway.ssm.entity.Employee;
import com.subway.ssm.entity.EmployeeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* Created by Mybatis Generator 2021/03/31
*/
public interface EmployeeMapper {
    /**
     *
     * @mbg.generated 2021-03-31
     */
    long countByExample(EmployeeExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int deleteByExample(EmployeeExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int deleteByPrimaryKey(Long employeeId);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int insert(Employee record);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int insertSelective(Employee record);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    List<Employee> selectByExample(EmployeeExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    Employee selectByPrimaryKey(Long employeeId);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int updateByPrimaryKeySelective(Employee record);

    /**
     *
     * @mbg.generated 2021-03-31
     */
    int updateByPrimaryKey(Employee record);

    java.util.Map<String, Object> sumByExample(EmployeeExample example);
}