package com.karl.dao;

import com.karl.entity.College;
import com.karl.entity.CollegeExample;
import com.karl.entity.Relation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollegeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    long countByExample(CollegeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    int deleteByExample(CollegeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    int insert(College record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    int insertSelective(College record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    List<College> selectByExample(CollegeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    College selectByPrimaryKey(Integer cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") College record, @Param("example") CollegeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") College record, @Param("example") CollegeExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(College record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table college
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(College record);
    List<Relation> selectTree();
}