package com.lpa.service.impl;

import com.lpa.dao.BranchDao;
import com.lpa.dao.ClientDao;
import com.lpa.dao.CompanyDao;
import com.lpa.dao.UserDao;
import com.lpa.entity.Branch;
import com.lpa.entity.Client;
import com.lpa.entity.Company;
import com.lpa.entity.User;
import com.lpa.service.CompanyService;
import com.lpa.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDao companyDao;

    @Autowired
    private ClientDao clientDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private BranchDao branchDao;

    @Override
    public Company getCompanyById(int id){

        return companyDao.getCompanyById(id);
    }

    @Override
    public  void addCompany(Company company){
        company.setStatus(0);//创建默认为正常
        Branch branch = branchDao.getBranchById(company.getBranch_id().getId());
        User user = userDao.getUserById(company.getUser_id().getId());
        Client client = clientDao.getClientById(company.getClient().getId());

        company.setBranch_id(branch);
        company.setUser_id(user);
        company.setClient(client);
        Calendar calendar = Calendar.getInstance();
        company.setFinal_check_time(calendar.getTime());
        companyDao.addCompany(company);
    }

    @Override
    public boolean updateCompany(Company company){

        if (company.getStatus()== 2)//若是调为销户状态
            company.setEnd_time(Calendar.getInstance().getTime());
        return companyDao.updateCompany(company);
    }

    @Override
    public Response delCompany(int id){
        companyDao.delCompany(id);
        return new Response(1,"删除成功",null);
    }

    @Override
    public List<Company> getAllCompany(){
        return companyDao.getAllCompany();
    }

    @Override
    public List<Company> getCompanyList(Integer pn, Map<String,Long> map,Company company,User user){
        return companyDao.getCompanyList(pn,map,company,user);
    }

    @Override
    public List<List<String>> exportCompany(List<Company> companies){
        List<List<String>> excelDate = new ArrayList<>();
        List<String> head = Arrays.asList("id","公司账号","公司名称","开户日期","账户类型","经营范围","经营场所","注册地点","注册时间","最终检查日期","年度结汇金额","账户状态","法人信息","股东信息","所属网点","客户经理");
        excelDate.add(head);
        if (companies!=null){
            for (int i = 0;i<companies.size();i++){
                List<String> data = new ArrayList<>();
                Company company = companies.get(i);
                if (company.getId()!=null)
                    data.add(String.valueOf(company.getId()));
                else
                    data.add("");
                if (company.getAccount()!=null)
                    data.add(company.getAccount());
                else
                    data.add("");
                if (company.getCompany_name()!=null)
                    data.add(company.getCompany_name());
                else
                    data.add("");
                if (company.getStart_time()!=null)
                    data.add(company.getStart_time().toString());
                else
                    data.add("");
                if (company.getType()!=null){
                    if (company.getType()==0){
                        data.add("NRA账户");
                    }
                    else if (company.getType()==1){
                        data.add("全行个人外汇结算账户");
                    }
                    else if (company.getType()==2){
                        data.add("全行一般贸易企业外汇结算账户");
                    }
                    else
                        data.add("代理公司");
                }
                else
                    data.add("");
                if (company.getBusiness_scope()!=null)
                    data.add(company.getBusiness_scope());
                else
                    data.add("");
                if (company.getManage_location()!=null)
                    data.add(company.getManage_location());
                else
                    data.add("");
                if (company.getRegister_place()!=null)
                    data.add(company.getRegister_place());
                else
                    data.add("");
                if (company.getRegister_time()!=null)
                    data.add(company.getRegister_time().toString());
                else
                    data.add("");
                if (company.getFinal_check_time()!=null)
                    data.add(company.getFinal_check_time().toString());
                else
                    data.add("");
                if (company.getLimit_money()!=null)
                    data.add(company.getLimit_money());
                else
                    data.add("");
                if (company.getStatus()!=null){
                    if (company.getStatus()==0)
                        data.add("正常");
                    if (company.getStatus()==1)
                        data.add("久悬不动户");
                    if (company.getStatus()==2)
                        data.add("禁用");
                    if(company.getStatus()==3)
                        data.add("已销户");
                }
                else
                    data.add("");
                if (company.getClient()!=null)
                    data.add("姓名："+company.getClient().getName()+",证件号码："+company.getClient().getId_code()+",联系方式："+company.getClient().getCellphone()+",联系地址："+company.getClient().getAddress());
                else
                    data.add("");
                if (company.getClients()!=null){
                    List<Client> list = new ArrayList<Client>(company.getClients());
                    String clients = new String();
                    for (int j=0;j<list.size();j++){
                        Client client =  list.get(j);
                        clients += "姓名："+client.getName()+",证件号码："+client.getId_code()+",联系方式："+client.getCellphone()+",联系地址："+client.getAddress();
                    }
                    data.add(clients);
                }
                else
                    data.add("");
                if (company.getBranch_id()!=null)
                    data.add(company.getBranch_id().getName());
                else
                    data.add("");
                if (company.getUser_id()!=null)
                    data.add(company.getUser_id().getName());
                else
                    data.add("");

                excelDate.add(data);

            }
        }
        return excelDate;
    }
}
