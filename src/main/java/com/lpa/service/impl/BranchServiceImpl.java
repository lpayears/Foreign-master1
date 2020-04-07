package com.lpa.service.impl;

import com.lpa.dao.BranchDao;
import com.lpa.dao.UserDao;
import com.lpa.entity.Branch;
import com.lpa.service.BranchService;
import com.lpa.utils.PageBean;
import com.lpa.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Service
public class BranchServiceImpl implements BranchService {
    @Autowired
    private BranchDao branchDao;
    @Autowired
    private UserDao userDao;

    @Override
    public Branch getBranchById(int id){
        return branchDao.getBranchById(id);
    }

    @Override
    public Branch getBranchByCode(String code){
        return branchDao.getBranchByCode(code);
    }

    @Override
    public void addBranch(Branch branch){
        branchDao.addBranch(branch);
    }

    @Override
    @Transactional
    public Response delBranch(int id){
            if (branchDao.delBranch(id) == true)
            return new Response(1, "删除成功", null);
            else
                return new Response(0, "删除失败", "网点下仍有员工，请先处理！");

    }

    @Override
    public boolean updateBranch(Branch branch){
        return branchDao.updateBranch(branch);
    }

    @Override
    public List<Branch> getAllBranch(){
        return branchDao.getAllBranch();
    }

    @Override
    public List<Branch> getBranchList(Integer pn, Map<String,Long> map,Branch branch){
        return branchDao.getBranchList(pn,map,branch);
    }
}
