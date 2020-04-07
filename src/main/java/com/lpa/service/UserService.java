package com.lpa.service;

import com.lpa.entity.User;
import com.lpa.utils.Response;

import java.util.List;
import java.util.Map;

public interface UserService {
    User getUserById(int id);

    User getUserByCode(String code);

    void addUser(User user);

    Response delUser(int id);

    boolean updateUser(User user);

    List<User> getAllUser();

    List<User> getUserList(Integer pn, Map<String, Long> map, User user);
}
