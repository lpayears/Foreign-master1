package com.lpa.dao.impl;

import com.lpa.dao.CountryDao;
import com.lpa.entity.Country;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class CountryDaoImplement implements CountryDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Country getCountryById(int id){
        String hql= "from Country where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return (Country)query.uniqueResult();
    }
    @Override
    public Country getCountryByCode(String code){
        String hql = "from Country where code=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,code);
        return (Country)query.uniqueResult();
    }

    @Override
    public List<Country> getAllCountry(){
        String hql = "from Country";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }
}
