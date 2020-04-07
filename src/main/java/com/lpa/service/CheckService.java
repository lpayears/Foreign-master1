package com.lpa.service;

import com.lpa.entity.Check;

import java.util.List;

public interface CheckService {

    void addCheck(Check check);

    List<Check> getCheckByCompany(int id);
}
