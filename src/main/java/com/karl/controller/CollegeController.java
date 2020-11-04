package com.karl.controller;

import com.github.pagehelper.PageInfo;
import com.karl.entity.College;
import com.karl.entity.Major;
import com.karl.entity.Relation;
import com.karl.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;

import java.io.File;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CollegeController {
    @Autowired
    private CollegeService collegeService;
    @Autowired
    private ServletContext servletContext;
    @ResponseBody
    @RequestMapping("colleges")
    public Map findAll(){
     Map map = new HashMap();
        List<College> all = collegeService.findAll();
        map.put("list",all);
        map.put("msg","增加成功");
        return map;
    }
    @ResponseBody
    @RequestMapping("allColleges")
    public Map list( @RequestParam(value = "page",required = false,defaultValue = "1") Integer page, @RequestParam(value = "pageSize",required = false,defaultValue = "4")Integer pageSize){
       College college =new College();
        PageInfo<College> colleges = collegeService.findAllColleges(page, pageSize,college);
        Map map = new HashMap();
        map.put("msg","null");
        map.put("code",0);
        map.put("count",colleges.getTotal());
        map.put("data",colleges.getList());
        return map;
    }

    @RequestMapping(value = "upload" , method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object>  upload(@RequestParam("file") MultipartFile file,College college)throws Exception {
        String path = servletContext.getRealPath("/upload");
        File dir = new File(path);
        if (!dir.exists()){
            dir.mkdir();
        }
        String fileName = System.currentTimeMillis()+file.getOriginalFilename();
        String realPath = dir+"//"+fileName;
        System.out.println(realPath);
            file.transferTo(new File(realPath));
            Map<String, Object> res = new HashMap<>();
            //返回的是一个url对象
            res.put("url", fileName);
            return res;
        }
    @RequestMapping(value = "uploadOne" , method = RequestMethod.POST)
    @ResponseBody
    public Map uploadOne(College college)throws Exception {
        Map<String, Object> res = new HashMap<>();
        collegeService.insert(college);
        res.put("msg","上传成功");
        return res;
    }

    @RequestMapping(value = "showTree" , method = RequestMethod.POST)
    @ResponseBody
    public Map showTree() {
        Map<String, Object> res = new HashMap<>();
        List<Relation> relations = collegeService.selectTree();
        res.put("data",relations);
        return res;
    }




}




