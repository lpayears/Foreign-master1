package com.lpa.dao;

import com.lpa.entity.User;

import java.util.List;
import java.util.Map;

public interface UserDao {

    public User getUserById(int id);

    public User getUserByCode(String id_code);

    public void addUser(User user);

    public boolean updateUser(User user);

    public boolean delUser(int id);

    public List<User> getAllUser();

    List<User> getUserList(Integer pn, Map<String, Long> map, User user);

}
