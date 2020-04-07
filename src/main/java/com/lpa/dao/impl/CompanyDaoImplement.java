package com.lpa.dao.impl;

import com.lpa.dao.CompanyDao;
import com.lpa.entity.Company;
import com.lpa.entity.User;
import com.lpa.utils.BaseDao;
import com.lpa.utils.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Repository
public class CompanyDaoImplement extends BaseDao implements CompanyDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Company getCompanyById(int id){
        String hql = "from Company where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return (Company)query.uniqueResult();
    }

    @Override
    public void addCompany(Company company){

        sessionFactory.getCurrentSession().save(company);
    }

    @Override
    public boolean updateCompany(Company company){
        String hql="update Company set company_name=?,account=?,limit_money=?,manage_location=?,business_scope=?,register_place=?,register_time=?,start_time=?,status=?,type=?,branch_id.id=?,user_id.id=? where id=?";
        Query query= sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,company.getCompany_name());
        query.setParameter(1,company.getAccount());
        query.setParameter(2,company.getLimit_money());
        query.setParameter(3,company.getManage_location());
        query.setParameter(4,company.getBusiness_scope());
        query.setParameter(5,company.getRegister_place());
        query.setParameter(6,company.getRegister_time());
        query.setParameter(7,company.getStart_time());
        query.setParameter(8,company.getStatus());
        query.setParameter(9,company.getType());
        query.setParameter(10,company.getBranch_id().getId());
        query.setParameter(11,company.getUser_id().getId());
        query.setParameter(12,company.getId());
        return query.executeUpdate()>0;
    }

    @Override
    public boolean delCompany(int id){
        String hql = "delete Company where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return query.executeUpdate() >0;
    }
    @Override
    public List<Company> getAllCompany(){
        String hql = "from Company";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }

    @Override
    public List<Company> getCompanyList(Integer pn, Map<String,Long> map, Company company, User user){
        String hql = "from Company where 1=1";
        if (StringUtils.isNotBlank(company.getAccount())){
            hql+="and account like '%"+company.getAccount()+"%'";
        }
        if (StringUtils.isNotBlank(company.getCompany_name())){
            hql+="and company_name like '%" + company.getCompany_name()+"%'";
        }
        if (company.getStatus()!=null){
            hql+="and status = '"+company.getStatus()+"'";
        }
        if(company.getType()!=null){
            if (company.getType()==1001){//查询新增
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String sdate = simpleDateFormat.format(company.getStart_time());
                String edate = simpleDateFormat.format(company.getEnd_time());
                hql+="and start_time between'"+sdate+"'and '"+edate+"'";
            }
            else if (company.getType()==1002){//查询久悬不动户
                hql+="and status = 1";
            }
            else if (company.getType()==1003){//查询销户
                hql+="and status = 3";
            }
            else if (company.getType()==1004){//查询要核查
                hql+="and (type = 0 or type = 3) and (status = 0)";
            }
            else  hql+="and type = '"+company.getType()+"'";
        }
        if (company.getUser_id()!=null){
            if(company.getUser_id().getId()!=null){
                hql+="and user_id.id = '"+company.getUser_id().getId()+"'";
            }
        }
        if (user.getBranch_id().getId()!=1) {
            hql += "and branch_id.id = '" + user.getBranch_id().getId() + "'";
        }
        if (company.getBranch_id()!=null){
            if (company.getBranch_id().getId()!=null){
                hql+="and branch_id.id = '" + company.getBranch_id().getId() + "'";
            }
        }

        if(company.getFlag()!=null){
            hql+="and flag= '"+company.getFlag()+"'";
        }
        if (pn==null){
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            return query.list();
        }

       // System.out.println("-------------------------------"+hql);
        return super.executeQuery2(hql,pn,map);
    }
}
