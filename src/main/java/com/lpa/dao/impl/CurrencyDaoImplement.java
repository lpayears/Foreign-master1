package com.lpa.dao.impl;

import com.lpa.dao.CurrencyDao;
import com.lpa.entity.Currency;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class CurrencyDaoImplement implements CurrencyDao {
    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Currency getCurrencyByCode(String code){
        String hql = "from Currency where code=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,code);
        return (Currency)query.uniqueResult();
    }

    @Override
    public Currency getCurrencyById(int id){
        String hql = "from Currency where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return (Currency)query.uniqueResult();
    }

    @Override
    public List<Currency> getAllCurrency(){
        String hql = "from Currency";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }
}
