package com.lpa.dao.impl;

import com.lpa.dao.UserDao;
import com.lpa.entity.User;
import com.lpa.utils.BaseDao;
import com.lpa.utils.StringUtils;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Repository
public class UserDaoImplement extends BaseDao implements UserDao {
    @Resource
    private SessionFactory sessionFactory;

    @Override
    public User getUserById(int id) {
        String hql = "from User where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return (User)query.uniqueResult();
    }

    @Override
    public User getUserByCode(String id_code){
        String hql="from User where id_code=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id_code);
        return (User)query.uniqueResult();
    }

    @Override
    public void addUser(User user){
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public boolean updateUser(User user){
        String hql = "update User set name=?,id_code=?,branch_id.id=?,cellphone=?,role_id=?,status=? where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,user.getName());
        query.setParameter(1,user.getId_code());
        query.setParameter(2,user.getBranch_id().getId());
        query.setParameter(3,user.getCellphone());
        query.setParameter(4,user.getRole_id());
        query.setParameter(5,user.getStatus());
        query.setParameter(6,user.getId());
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean delUser(int id){
        String hql = "delete User where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,id);
        return query.executeUpdate() > 0;
    }

    @Override
    public List<User> getAllUser(){
        String hql = "from User";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }

    @Override
    public List<User> getUserList(Integer pn, Map<String,Long> map,User user){
        String hql = "from User where 1=1";
        if (StringUtils.isNotBlank(user.getName())){
            hql+="and name like '%"+user.getName()+"%'";
        }
        if (user.getBranch_id()!=null){
            if (user.getBranch_id().getId()!=null)
            hql+= "and branch_id = '"+user.getBranch_id().getId()+"'";
        }
        return super.executeQuery2(hql,pn,map);
    }
}
