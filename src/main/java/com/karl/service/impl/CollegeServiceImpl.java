package com.karl.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.karl.dao.CollegeMapper;
import com.karl.entity.College;
import com.karl.entity.CollegeExample;

import com.karl.entity.Relation;
import com.karl.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CollegeServiceImpl implements CollegeService {
@Autowired
private CollegeMapper collegeMapper;
    @Override
    public List<College> findAll() {
        CollegeExample example =new CollegeExample();
        List<College> list = collegeMapper.selectByExample(example);
        return list;
    }

    @Override
    public PageInfo<College> findAllColleges(int page, int pageSize, College college) {
        PageHelper.startPage(page,pageSize);
        CollegeExample example = new CollegeExample();
        List<College> colleges = collegeMapper.selectByExample(example);
        PageInfo<College> pageInfo = new PageInfo<>(colleges);
        return pageInfo;
    }

    @Override
    public void insert(College college) {
        collegeMapper.insert(college);
    }

    @Override
    public List<Relation>  selectTree() {
        List<Relation> relations = collegeMapper.selectTree();
        return relations;
    }
}
