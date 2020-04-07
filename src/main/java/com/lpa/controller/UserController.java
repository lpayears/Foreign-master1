package com.lpa.controller;

import com.lpa.entity.User;
import com.lpa.service.BranchService;
import com.lpa.service.UserService;
import com.lpa.utils.Message;
import com.lpa.utils.PageInfo;
import com.lpa.utils.Response;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Resource
    UserService userService;

    @Resource
    BranchService branchService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam("sfz")String code){
      //  String ncode= "111";
        Subject currentUser = SecurityUtils.getSubject();
        if (code!=null){
            String password = "123456";
            UsernamePasswordToken token = new UsernamePasswordToken(code,password);
            //token.setRememberMe(false);
            currentUser.login(token);
        }

        return "/main";
    }

    //新增用户
    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public Message addUser(User user){
            userService.addUser(user);
        return Message.success();
    }

    //获取单个用户信息
    @RequestMapping(value = "/getUser/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Message getUserById(@PathVariable("id")int id){
        User user = userService.getUserById(id);
        return Message.success().add("user",user);
    }

    //更新用户
    @RequestMapping(value = "/updateUser/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Message updateUser(User user){
        userService.updateUser(user);
        return Message.success();
    }
    //删除
    @RequestMapping(value = "/delUser/{id}",method = RequestMethod.DELETE)
    public Response delUser(@PathVariable("id")int id){
        return userService.delUser(id);
    }

    @RequestMapping(value = "/getAllUser",method = RequestMethod.GET)
    @ResponseBody
    public Message getAllUser(){
        List<User> users = userService.getAllUser();
        return Message.success().add("users",users);
    }

    //获取所有用户信息并且分页
    @RequestMapping(value = "/getUserList",method = RequestMethod.GET)
    @ResponseBody
    public Message getUserList(@RequestParam(value = "pn",defaultValue = "1")Integer pn,User user){
        Map<String,Long> map = new HashMap<String, Long>();
        List<User> users = userService.getUserList(pn,map,user);
        Long total = (long) map.get("total").intValue();
        PageInfo<?> pageInfo = new PageInfo<>(users,5,total,5,pn);
        return Message.success().add("pageInfo",pageInfo);
    }
}
