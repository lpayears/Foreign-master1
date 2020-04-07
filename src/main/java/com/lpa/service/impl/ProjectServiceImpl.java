package com.lpa.service.impl;

import com.lpa.dao.*;
import com.lpa.dao.CurrencyDao;
import com.lpa.entity.*;
import com.lpa.service.ProjectService;
import com.lpa.utils.MyPo;
import com.lpa.utils.Response;
import com.lpa.utils.SubUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectDao projectDao;
    @Autowired
    private CompanyDao companyDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private CountryDao countryDao;
    @Autowired
    private CurrencyDao currencyDao;

    @Override
    public Project getProjectById(int id){
        return projectDao.getProjectById(id);
    }

    @Override
    public void addProject(Project project){
        project.setStatus(0);//默认为未核查
        Company company = companyDao.getCompanyById(project.getCompany_id().getId());
        User user = userDao.getUserById(project.getUser_id().getId());
        Country country = countryDao.getCountryById(project.getCountry_code().getId());
        Currency currency = currencyDao.getCurrencyById(project.getCurrency_code().getId());
        String order_no = SubUtils.createNumber(projectDao.getMaxProject().getOrder_no());
        project.setCompany_id(company);
        project.setUser_id(user);
        project.setCountry_code(country);
        project.setCurrency_code(currency);
        project.setOrder_no(order_no);
        projectDao.addProject(project);

    }

    @Override
    public boolean updateProject(Project project){
        return projectDao.updateProject(project);
    }

    @Override
    public boolean updateCheck(Project project){
        return projectDao.updateCheck(project);
    }
    @Override
    public Response delProject(int id){
        projectDao.delProject(id);
        return new Response(1,"删除成功",null);
    }

    @Override
    public List<Project> getAllProject(){
        return projectDao.getAllProject();
    }

    @Override
    public List<Project> getProjectList(Integer pn, Map<String,Long> map, MyPo po){
        return projectDao.getProjectList(pn,map,po);
    }
    @Override
    public List<List<String>> exportProject(List<Project> projects){
        List<List<String>> excelDate = new ArrayList<>();
        List<String> head = Arrays.asList("id","业务时间","业务序号","业务编号","汇款公司","汇款币种","收款人国别","金额","承诺到期日期","经办人","联系方式","邮寄地址","销账时间","项目状态");
        excelDate.add(head);
        if (projects!=null){
            for (int i = 0;i<projects.size();i++){
                List<String> data = new ArrayList<>();
                if (projects.get(i).getId()==null)
                    data.add("");
                else
                    data.add(String.valueOf(projects.get(i).getId()));
                if (projects.get(i).getYw_time()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getYw_time().toString());
                if (projects.get(i).getOrder_no()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getOrder_no());
                if (projects.get(i).getNum()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getNum());
                if (projects.get(i).getCompany_id()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getCompany_id().getCompany_name());
                if (projects.get(i).getCurrency_code()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getCurrency_code().getC_name());
                if (projects.get(i).getCountry_code()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getCountry_code().getC_name());
                if (projects.get(i).getMoney()==null)
                    data.add("");
                else
                    data.add(String.valueOf(projects.get(i).getMoney()));
                if (projects.get(i).getBook_time()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getBook_time().toString());
                if (projects.get(i).getUser_id()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getUser_id().getName());
                if (projects.get(i).getCellphone()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getCellphone());
                if (projects.get(i).getAddress()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getAddress());
                if (projects.get(i).getCheck_time()==null)
                    data.add("");
                else
                    data.add(projects.get(i).getCheck_time().toString());
                if (projects.get(i).getStatus()==0)
                    data.add("未核查");
                if (projects.get(i).getStatus()==1)
                    data.add("已核查");
                if (projects.get(i).getStatus()==2)
                    data.add("已销账");
                excelDate.add(data);
            }
        }
        return excelDate;
    }

}
