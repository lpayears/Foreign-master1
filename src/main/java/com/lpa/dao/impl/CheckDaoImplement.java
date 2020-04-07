package com.lpa.dao.impl;

import com.lpa.dao.CheckDao;
import com.lpa.entity.Check;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class CheckDaoImplement implements CheckDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public void addCheck(Check check){
        sessionFactory.getCurrentSession().save(check);
    }

    @Override
    public List<Check> getCheckByCompany(int id) {
        String hql = "from Check where company.id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return query.list();
    }
}
