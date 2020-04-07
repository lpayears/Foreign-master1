package com.lpa.dao;

import com.lpa.entity.Check;

import java.util.List;

public interface CheckDao {
    public void addCheck(Check check);

    List<Check> getCheckByCompany(int id);
}
