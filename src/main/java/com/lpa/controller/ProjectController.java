package com.lpa.controller;

import com.lpa.entity.Project;
import com.lpa.service.ProjectService;
import com.lpa.utils.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProjectController {
    @Resource
    ProjectService projectService;

    @RequestMapping(value = "/addProject",method = RequestMethod.POST)
    public Message addProject(Project project){
        projectService.addProject(project);
        return Message.success();
    }

    @RequestMapping(value = "/updateProject/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Message updateProject(Project project){
        projectService.updateProject(project);
        return Message.success();
    }

    @RequestMapping(value = "/updateCheck/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Message updateCheck(Project project){
        projectService.updateCheck(project);
        return  Message.success();
    }

    @RequestMapping(value = "/updateStatus/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Message updateStatus(@PathVariable("id")int id){
        Project project = projectService.getProjectById(id);
        project.setStatus(3);
        projectService.updateProject(project);
        return Message.success();
    }



    @RequestMapping(value = "/getProject/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Message getProject(@PathVariable("id")int id){
        Project project = projectService.getProjectById(id);
        return Message.success().add("project",project);
    }

    @RequestMapping(value = "/delProject/{id}",method = RequestMethod.DELETE)
    public Response delProject(@PathVariable("id")int id){
        return projectService.delProject(id);
    }

    @RequestMapping(value = "/getProjectList",method = RequestMethod.GET)
    @ResponseBody
    public Message getProjectList(@RequestParam(value = "pn",defaultValue = "1")Integer pn, MyPo po){
        Map<String,Long> map = new HashMap<String, Long>();
        List<Project> projects = projectService.getProjectList(pn,map,po);
        Long total = (long) map.get("total").intValue();
        PageInfo<?> pageInfo  = new PageInfo<>(projects,5,total,5,pn);
        return Message.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/warnProject",method = RequestMethod.GET)
    @ResponseBody
    public Message getWarnProject(@RequestParam(value = "pn",defaultValue = "1")Integer pn,MyPo po){
        Map<String,Long> map = new HashMap<String, Long>();
        po.setStatus(0);
        po.setType(0);
        List<Project> projects = projectService.getProjectList(pn,map,po);
        Long total = (long) map.get("total").intValue();
        PageInfo<?> pageInfo  = new PageInfo<>(projects,5,total,5,pn);
        return Message.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/exportProject",method = RequestMethod.GET)
    @ResponseBody
    public void exportProject(HttpServletResponse response, MyPo po)throws IOException {
        Calendar calendar =Calendar.getInstance();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String fileName = URLEncoder.encode(simpleDateFormat.format(calendar.getTime())+"预付报表", "UTF-8");
        po.setExport(1);
        List<Project> projects = projectService.getProjectList(null,null,po);
        List<List<String>> excelDate = projectService.exportProject(projects);
        ExcelUtil.exportExcel(response,excelDate,"预付货款",fileName,20);
    }

    @RequestMapping(value = "/exportWarn",method = RequestMethod.GET)
    @ResponseBody
    public void exportWarn(HttpServletResponse response,MyPo po)throws IOException{
        Calendar calendar =Calendar.getInstance();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        po.setStatus(0);
        po.setType(0);
        po.setExport(1);
        String fileName = URLEncoder.encode(simpleDateFormat.format(calendar.getTime())+"今日预警", "UTF-8");
        List<Project> projects = projectService.getProjectList(null,null,po);
        List<List<String>> excelDate = projectService.exportProject(projects);
        ExcelUtil.exportExcel(response,excelDate,"预付货款",fileName,20);
    }
}
