package com.lpa.service;

import com.lpa.entity.Branch;
import com.lpa.utils.PageBean;
import com.lpa.utils.Response;

import java.util.List;
import java.util.Map;

public interface BranchService {

    public Branch getBranchById(int id);

    public Branch getBranchByCode(String code);

    public void addBranch(Branch branch);

    Response delBranch(int id);

    boolean updateBranch(Branch branch);

    List<Branch> getAllBranch();


    List<Branch> getBranchList(Integer pn, Map<String, Long> map, Branch branch);
}
