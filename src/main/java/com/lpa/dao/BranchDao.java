package com.lpa.dao;

import com.lpa.entity.Branch;


import java.util.List;
import java.util.Map;

public interface BranchDao {
    public Branch getBranchById(int id);

    public Branch getBranchByCode(String code);

    public void addBranch(Branch branch);

    public boolean updateBranch(Branch branch);

    public boolean delBranch(int id);

    public List<Branch> getAllBranch();

    public List<Branch> getBranchList(Integer pn, Map<String, Long> map, Branch branch);
}
