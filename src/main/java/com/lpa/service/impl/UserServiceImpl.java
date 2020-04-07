package com.lpa.service.impl;

import com.lpa.dao.BranchDao;
import com.lpa.dao.UserDao;
import com.lpa.entity.Branch;
import com.lpa.entity.User;
import com.lpa.service.UserService;
import com.lpa.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Autowired
    private BranchDao branchDao;

    @Override
    public User getUserById(int id){
        return userDao.getUserById(id);
    }

    @Override
    public User getUserByCode(String code){
        return userDao.getUserByCode(code);
    }

    @Override
    public void addUser(User user){
        user.setStatus(0);//初始默认用户状态为启用0
        user.setPassword("7d249950b84b4c5ad5767f72a0941b0b");
        Branch branch = branchDao.getBranchById(user.getBranch_id().getId());
        user.setBranch_id(branch);
        userDao.addUser(user);
    }

    @Override
    public Response delUser(int id){
        userDao.delUser(id);
        return new Response(1,"删除成功",null);
    }

    @Override
    public boolean updateUser(User user){
        return userDao.updateUser(user);
    }

    @Override
    public List<User> getAllUser(){
        return userDao.getAllUser();
    }

    @Override
    public List<User> getUserList(Integer pn, Map<String,Long> map,User user){

        return userDao.getUserList(pn, map, user);
    }

}
