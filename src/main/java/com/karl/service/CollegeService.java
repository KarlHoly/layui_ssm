package com.karl.service;

import com.github.pagehelper.PageInfo;
import com.karl.entity.College;
import com.karl.entity.Relation;

import java.util.List;

public interface CollegeService {
    List<College> findAll();
    PageInfo<College> findAllColleges(int page,int pageSize,College college);
    void insert(College college);
    List<Relation> selectTree();
}
