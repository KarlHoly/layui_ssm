package com.karl.service;

import com.github.pagehelper.PageInfo;
import com.karl.entity.Major;

public interface MajorService {
    PageInfo<Major> findAll(Integer page,Integer limit ,Major major);
    void insert(Major major);
    void deletes(int []ids);
    void update(Major major);
    Major findById(int id);
    void deleteById(int id);
}
