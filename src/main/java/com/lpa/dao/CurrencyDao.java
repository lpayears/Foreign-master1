package com.lpa.dao;

import com.lpa.entity.Currency;

import java.util.List;

public interface CurrencyDao {

    public Currency getCurrencyByCode(String code);

    public Currency getCurrencyById(int id);

    public List<Currency> getAllCurrency();
}
