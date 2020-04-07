package com.lpa.service.impl;

import com.lpa.dao.CheckDao;
import com.lpa.entity.Check;
import com.lpa.service.CheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckServiceImpl implements CheckService {
    @Autowired
    CheckDao checkDao;

    @Override
    public  void addCheck(Check check){
        checkDao.addCheck(check);
    }

    @Override
    public List<Check> getCheckByCompany(int id){
        return checkDao.getCheckByCompany(id);
    }
}
