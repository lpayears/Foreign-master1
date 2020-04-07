package com.lpa.controller;

import com.lpa.entity.Branch;
import com.lpa.service.BranchService;
import com.lpa.utils.Message;
import com.lpa.utils.PageInfo;
import com.lpa.utils.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BranchController {

    @Resource
    BranchService   branchService;

    /**
     @RequestMapping(value = "/addBranch",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addBranch(String code, String name, String cellphone, User user){
        System.out.println("添加网点"+name);
        String result = "fail";
        Branch branch = new Branch();
        branch.setCode(code);
        branch.setName(name);
        branch.setCellphone(cellphone);
        branch.setUser(user);
        branchService.addBranch(branch);
        result = "success";
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    **/
    @RequestMapping(value = "/addBranch",method = RequestMethod.POST)
    public Message addBranch(Branch branch){
        branchService.addBranch(branch);
        return Message.success();
    }
    /**
    @RequestMapping(value = "/updateBranch",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updateBranch(Integer id,String code, String name, String cellphone, User user){
        String result = "fail";
        Branch branch = branchService.getBranchById(id);
        branch.setCode(code);
        branch.setName(name);
        branch.setCellphone(cellphone);
        branch.setUser(user);
        branchService.updateBranch(branch);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }
    **/
    //获取信息
    @RequestMapping(value = "/getBranch/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Message getBranchById(@PathVariable("id")int id){
        Branch branch = branchService.getBranchById(id);
        return Message.success().add("branch",branch);
    }
    //更新
    @RequestMapping(value = "/updateBranch/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Message updateBranch(Branch branch){
        branchService.updateBranch(branch);
        return Message.success();
    }
    //删除
    @RequestMapping(value = "/delBranch/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Response delBranch(@PathVariable("id") int id){
        return branchService.delBranch(id);
    }

    //获取所有网点信息
    @RequestMapping(value = "/getBranches",method = RequestMethod.GET)
    @ResponseBody
    public Message getBranches(){
        List<Branch> branches = branchService.getAllBranch();
       // System.out.println(branches);
        return Message.success().add("branches",branches);
    }


    //获取所有网点信息并且分页
    @RequestMapping(value = "/getBranchesList",method = RequestMethod.GET)
    @ResponseBody
    public Message getBranchesList(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Branch branch){
        Map<String,Long> map = new HashMap<String, Long>();
        List<Branch> branches = branchService.getBranchList(pn,map,branch);
        Long total= Long.valueOf(map.get("total").intValue());
        PageInfo<?> pageInfo =new PageInfo<>(branches,5,total,5,pn) ;
        return Message.success().add("pageInfo", pageInfo);
    }


}
