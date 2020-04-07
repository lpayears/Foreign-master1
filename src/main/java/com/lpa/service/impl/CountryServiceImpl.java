package com.lpa.service.impl;

import com.lpa.dao.CountryDao;
import com.lpa.entity.Country;
import com.lpa.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryServiceImpl implements CountryService {
    @Autowired
    private CountryDao countryDao;

    @Override
    public List<Country> getAllCountry(){
        return countryDao.getAllCountry();
    }
}
