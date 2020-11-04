package com.karl.controller;

import com.github.pagehelper.PageInfo;
import com.karl.entity.Major;
import com.karl.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("major")
public class MajorController {
    @Autowired
    private MajorService majorService;

    @ResponseBody
    @RequestMapping("list")
    public Map list(Major major, @RequestParam(value = "page",required = false,defaultValue = "1") Integer page, @RequestParam(value = "pageSize",required = false,defaultValue = "4")Integer pageSize){
        PageInfo<Major> majors = majorService.findAll(page, pageSize, major);
        System.out.println(major.getCid());
        Map map = new HashMap();
        map.put("msg","null");
        map.put("code",0);
        map.put("count",majors.getTotal());
        map.put("data",majors.getList());
        return map;
    }

    @ResponseBody
    @RequestMapping("insert")
    public Map insert(Major major){
        Map map = new HashMap();
        majorService.insert(major);
        map.put("msg","添加成功");
        return map;
    }
    @ResponseBody
    @RequestMapping("deletes")
    public Map delete(int[] ids){
        Map map = new HashMap();
        majorService.deletes(ids);
        map.put("msg","删除成功");
        return map;
    }
    @ResponseBody
    @RequestMapping("update")
    public Map update(Major major){
        Map map = new HashMap();
        majorService.update(major);
        map.put("msg","修改成功");
        return map;
    }
    @ResponseBody
    @RequestMapping("findById")
    public Map update(@RequestParam(value = "id",required = false) int id){
        Map map = new HashMap();
        Major byId = majorService.findById(id);
        map.put("major",byId);
        map.put("msg","修改成功");
        return map;
    }
    @ResponseBody
    @RequestMapping("deleteById")
    public Map deleteById(@RequestParam(value = "id",required = false) int id){
        Map map = new HashMap();
        majorService.deleteById(id);
        map.put("msg","删除成功");
        return map;
    }

}
