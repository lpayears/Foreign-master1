package com.lpa.dao.impl;

import com.lpa.dao.BranchDao;
import com.lpa.entity.Branch;
import com.lpa.utils.BaseDao;
import com.lpa.utils.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BranchDaoImplement extends BaseDao implements BranchDao{

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Branch getBranchById(int id){
        String hql = "from Branch where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return (Branch)query.uniqueResult();
    }

    @Override
    public Branch getBranchByCode(String code){
        String hql = "from Branch where code=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,code);
        return (Branch)query.uniqueResult();
    }

    @Override
    public void addBranch(Branch branch){
        sessionFactory.getCurrentSession().save(branch);
    }

    @Override
    public boolean updateBranch(Branch branch){
        String hql = "update Branch set code=?,name=?,cellphone=? where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,branch.getCode());
        query.setParameter(1,branch.getName());
        query.setParameter(2,branch.getCellphone());
        //query.setParameter(3,branch.getUser());
        query.setParameter(3,branch.getId());
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean delBranch(int id){
        String hql = "delete Branch where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return query.executeUpdate() > 0;
    }

    @Override
    public List<Branch> getAllBranch(){
        String hql = "from Branch";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }


    @Override
    public List<Branch> getBranchList(Integer pn,Map<String,Long> map,Branch branch){
        String hql = "from Branch where 1=1";
        //Map<String,Object> hmap = new HashMap<String, Object>();
        if (StringUtils.isNotBlank(branch.getCode())){
            hql+=" and code like '%"+branch.getCode()+"%'";
            //hmap.put("code","%"+branch.getCode()+"%");

        }
        if (StringUtils.isNotBlank(branch.getName())){
            hql+=" and name like '%"+branch.getName()+"%'";
            //hmap.put("name","%"+branch.getName()+"%");
        }
        return super.executeQuery2(hql,pn,map);
    }
}
