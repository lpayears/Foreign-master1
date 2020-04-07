package com.lpa.service;
import com.lpa.entity.Company;
import com.lpa.entity.User;
import com.lpa.utils.Response;

import java.util.List;
import java.util.Map;


public interface CompanyService {
    Company getCompanyById(int id);

    void addCompany(Company company);

    boolean updateCompany(Company company);

    Response delCompany(int id);

    List<Company> getAllCompany();

    List<Company> getCompanyList(Integer pn, Map<String, Long> map, Company company, User user);

    public List<List<String>> exportCompany(List<Company> companies);
}
