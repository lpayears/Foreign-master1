package com.lpa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    //注册界面
    @RequestMapping(value = "/main")
    public String main(){
        return "main";
    }

    //@RequestMapping(value = "/login")
    //public String login(){ return "/login";}

    @RequestMapping(value = "/branch-management")
    public String branch() {
        return "branch-management";
    }

    @RequestMapping(value = "/admin-management")
    public String admin(){
        return "admin-management";
    }

    @RequestMapping(value = "/client-management")
    public String client(){return "client-management";}

    @RequestMapping(value = "/add-company")
    public String addCompany(){return "account/add-company";}

    @RequestMapping(value = "/company-management")
    public String company(){return "account/company-management";}

    @RequestMapping(value = "/company-export")
    public String company_export(){return "account/company-export";}

    @RequestMapping(value = "/add-project")
    public String addProject(){return "project/add-project";}

    @RequestMapping(value = "/project-management")
    public String project_management(){return "project/project-management";}

    @RequestMapping(value = "/project-warn")
    public String project_warn(){return "project/project-warn";}

    @RequestMapping(value = "/project-export")
    public String project_export(){return "project/project-export";}

    @RequestMapping(value = "/company-check")
    public String company_check(){return "account/company-check";}

    @RequestMapping(value = "/company-dispose")
    public String company_dispose(){return "account/company-dispose";}

}
