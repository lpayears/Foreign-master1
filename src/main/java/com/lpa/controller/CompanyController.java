package com.lpa.controller;

import com.jcraft.jsch.SftpException;
import com.lpa.entity.*;
import com.lpa.service.*;
import com.lpa.utils.*;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class CompanyController {
    @Resource
    CompanyService companyService;
    @Resource
    ClientService clientService;
    @Resource
    UserService userService;
    @Resource
    BranchService branchService;
    @Resource
    CheckService checkService;

    //新增用户
    @RequestMapping(value = "/addCompany",method = RequestMethod.POST)
    public Message addCompany(CompanyParam companyParam) throws SftpException,IOException {
       Company company = companyParam.getCompany();
       //material.replace("\\\\","/");
       if (companyParam.getIds()!=null){
           int[] ids = companyParam.getIds();
           // String[] clients = ids.split(",");
           Set<Client> clientSet =  new HashSet<Client>();
           for(int i=0;i < ids.length ; i++){
               //int id = Integer.parseInt(ids[i]);
               Client client =  clientService.getClientById(ids[i]);
               clientSet.add(client);
           }

           company.setClients(clientSet);
       }
        companyService.addCompany(company);
        return Message.success();
    }

    @RequestMapping(value = "/upload_company",method = RequestMethod.POST)
    @ResponseBody
    public Message upload_company(@RequestParam("directory")String directory,@RequestParam("sftpFileName")String sftpFileName,@RequestParam("company")MultipartFile file){
        String basePath = "/data";
        //String material = directory+"start";
        try{
            //开户文件上传
            String name = "yiwu";
            String password = "YWnh#123";
            SFTPUtil sftpUtil = new SFTPUtil(name,password,"10.120.7.77",9222);
            sftpUtil.login();
            InputStream inputStream =file.getInputStream();
            System.out.println("--------"+directory+"---------------"+sftpFileName);
            sftpUtil.upload(basePath,directory,sftpFileName,inputStream);
            sftpUtil.logout();
        }
        catch (Exception e){
            System.out.println("-------------------------上传失败");
            return null;
        }
        return Message.success();
    }

    @RequestMapping(value = "/addCheck/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Message addCheck(@PathVariable("id")int id, Check check){
        User user =userService.getUserById(check.getUser_id().getId());
        check.setUser_id(user);
        Company company = companyService.getCompanyById(id);
        company.setFlag(1);//设定为已核查
        check.setCompany(company);
        checkService.addCheck(check);
        return Message.success();
    }

    @RequestMapping(value = "/getCheck/{id}",method = RequestMethod.GET)
    @ResponseBody
    public  Message getCheck(@PathVariable("id")int id){
        List<Check> checks = checkService.getCheckByCompany(id);
        return Message.success().add("checks",checks);
    }

    @RequestMapping(value = "/download_company",method = RequestMethod.GET)
    @ResponseBody
    public Message download_company(@RequestParam("company")String directory,@RequestParam("sftpFileName")String sftpFileName,HttpServletResponse response) {
        try{
            String name = "yiwu";
            String password = "YWnh#123";
            SFTPUtil sftpUtil = new SFTPUtil(name,password,"10.120.7.77",9222);
            sftpUtil.login();
            response.reset();
            System.out.println("--------"+directory+"---------------"+sftpFileName);
            byte[] fileDate = sftpUtil.download(directory,sftpFileName);
            if (fileDate!=null){
                response.setContentType("application/octet-stream;charset=UTF-8");
                response.setHeader("Content-Disposition","attachment;filename="+sftpFileName+".zip");
                OutputStream outputStream = response.getOutputStream();

                outputStream.write(fileDate);
                System.out.println("----------------------------下载成功");
                sftpUtil.logout();
            }
            else {
                System.out.println("----------------------------下载失败");
                return Message.fail();
            }

        } catch (SftpException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Message.success();
    }

    @RequestMapping(value = "/updateCompany/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Message updateCompany(Company company){
        companyService.updateCompany(company);
        return Message.success();
    }

    @RequestMapping(value = "/updateCUsers",method = RequestMethod.POST)
    @ResponseBody
    public Message updateCompany(CompanyParam companyParam){
        Branch branch = branchService.getBranchById(companyParam.getCompany().getBranch_id().getId());
        User user = userService.getUserById(companyParam.getCompany().getUser_id().getId());
        int[] ids = companyParam.getIds();
        for (int i = 0 ;i< ids.length;i++ ){
            Company company = companyService.getCompanyById(ids[i]);
            company.setUser_id(user);
            company.setBranch_id(branch);
            companyService.updateCompany(company);
        }
        return Message.success();
    }


    @RequestMapping(value = "/getCompany/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Message getCompany(@PathVariable("id")int id){
        Company company = companyService.getCompanyById(id);
        //System.out.println(company.getClients());
        return Message.success().add("company",company);
    }

    @RequestMapping(value = "/delCompany/{id}",method = RequestMethod.DELETE)
    public Response delCompany(@PathVariable("id")int id){

        return companyService.delCompany(id);
    }

    @RequestMapping(value = "/getAllCompany",method = RequestMethod.GET)
    @ResponseBody
    public Message getAllCompany(){
        List<Company> companies = companyService.getAllCompany();
        return Message.success().add("companies",companies);
    }

    @RequestMapping(value = "/getCompanyList",method = RequestMethod.GET)
    @ResponseBody
    public Message getCompanyList(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Company company){
        String id_code = (String) SecurityUtils.getSubject().getPrincipal();
        //System.out.println(id_code);
        User user = userService.getUserByCode(id_code);
        Map<String,Long> map = new HashMap<String, Long>();
        List<Company> companies = companyService.getCompanyList(pn,map,company,user);
        Long total = (long) map.get("total").intValue();
        PageInfo<?> pageInfo = new PageInfo<>(companies,5,total,5,pn);
        return Message.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/setCheck",method = RequestMethod.POST)
    @ResponseBody
    public Message setCheck(){
        String id_code = (String) SecurityUtils.getSubject().getPrincipal();
        //System.out.println(id_code);
        User user = userService.getUserByCode(id_code);
        Company company = new Company();
        company.setType(1004);
        List<Company> companies = companyService.getCompanyList(null,null,company,user);
        for (int i =0;i<companies.size();i++){
            companies.get(i).setFlag(0);
        }
        return Message.success();
    }

    @RequestMapping(value = "/exportCompany",method = RequestMethod.GET)
    @ResponseBody
    public void exportCompany(HttpServletResponse response,Company company) throws IOException {
        Calendar calendar =Calendar.getInstance();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String fileName = URLEncoder.encode(simpleDateFormat.format(calendar.getTime())+"外汇账户", "UTF-8");
        String id_code = (String) SecurityUtils.getSubject().getPrincipal();
        //System.out.println(id_code);
        User user = userService.getUserByCode(id_code);
        List<Company> companies = companyService.getCompanyList(null,null,company,user);
        List<List<String>> excelDate = companyService.exportCompany(companies);
        ExcelUtil.exportExcel(response,excelDate,"外汇账户",fileName,20);
    }

}
