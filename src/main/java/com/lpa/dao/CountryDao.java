package com.lpa.dao;

import com.lpa.entity.Country;

import java.util.List;

public interface CountryDao {
    public Country getCountryById(int id);

    public Country getCountryByCode(String Code);

    public List<Country> getAllCountry();
}
