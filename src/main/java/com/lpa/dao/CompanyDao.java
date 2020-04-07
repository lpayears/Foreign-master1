package com.lpa.dao;

import com.lpa.entity.Company;
import com.lpa.entity.User;

import java.util.List;
import java.util.Map;

public interface CompanyDao {
    public Company getCompanyById(int id);

    public void addCompany(Company company);

    public boolean updateCompany(Company company);

    public boolean delCompany(int id);

    public List<Company> getAllCompany();

    List<Company> getCompanyList(Integer pn, Map<String, Long> map, Company company, User user);
}
