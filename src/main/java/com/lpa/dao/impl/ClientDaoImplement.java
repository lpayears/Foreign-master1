package com.lpa.dao.impl;

import com.lpa.dao.ClientDao;
import com.lpa.entity.Client;
import com.lpa.utils.BaseDao;
import com.lpa.utils.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Repository
public class ClientDaoImplement extends BaseDao implements ClientDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Client getClientById(int id){
        String hql = "from Client where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return (Client) query.uniqueResult();
    }

    @Override
    public void addClient(Client client){
        sessionFactory.getCurrentSession().save(client);
    }

    @Override
    public boolean delClient(int id){
        String hql = "delete Client where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateClient(Client client){
        String hql = "update Client set address=?,cellphone=?,id_code=?,id_type=?,name=?,country_code.id=? where id=?";
        Query query =sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,client.getAddress());
        query.setParameter(1,client.getCellphone());
        query.setParameter(2,client.getId_code());
        query.setParameter(3,client.getId_type());
        query.setParameter(4,client.getName());
        query.setParameter(5,client.getCountry_code().getId());
        //query.setParameter(6,client.getStatus());
        query.setParameter(6,client.getId());
        return query.executeUpdate() > 0;
    }

    @Override
    public List<Client> getAllClient(){
        String hql = "from Client";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }

    @Override
    public List<Client> getClientList(Integer pn, Map<String,Long> map, Client client){
        String hql = "from Client where 1=1";
        if (StringUtils.isNotBlank(client.getName())){
            hql+="and name like '%" + client.getName() +"%'";
        }
        if (StringUtils.isNotBlank(client.getId_code())){
            hql+="and id_code like '%" + client.getId_code() +"%'";
        }
        if (StringUtils.isNotBlank(client.getCellphone())){
            hql+="and cellphone like '%" + client.getCellphone() +"%'";
        }
        return super.executeQuery2(hql,pn,map);
    }
}
