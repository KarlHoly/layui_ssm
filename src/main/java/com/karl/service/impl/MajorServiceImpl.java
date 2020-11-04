package com.karl.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.karl.dao.MajorMapper;
import com.karl.entity.Major;
import com.karl.entity.MajorExample;
import com.karl.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MajorServiceImpl implements MajorService {
    @Autowired
    private MajorMapper majorMapper;
    @Override
    public PageInfo<Major> findAll(Integer page, Integer limit, Major major) {
        PageHelper.startPage(page,limit);
        MajorExample example =new MajorExample();
        MajorExample.Criteria criteria = example.createCriteria();
        if (major.getMname()!=null){
          criteria.andMnameLike("%"+major.getMname()+"%");
        };
        if (major.getCid()!=null&&major.getCid()!=-1){
            criteria.andCidEqualTo(major.getCid());
        }
        List<Major> majors = majorMapper.selectByExample(example);
        PageInfo<Major> pageInfo = new PageInfo(majors);
        return pageInfo;
    }

    @Override
    public void insert(Major major) {
        majorMapper.insert(major);
    }

    @Override
    public void deletes(int[] ids) {
        for (int i = 0; i < ids.length; i++) {
            majorMapper.deleteByPrimaryKey(ids[i]);
        }
    }

    @Override
    public void update(Major major) {
        majorMapper.updateByPrimaryKey(major);
    }

    @Override
    public Major findById(int id) {
        Major major = majorMapper.selectByPrimaryKey(id);
        return major;
    }

    @Override
    public void deleteById(int id) {
        majorMapper.deleteByPrimaryKey(id);
    }

}
