package com.lpa.service.impl;

import com.lpa.dao.CurrencyDao;
import com.lpa.entity.Currency;
import com.lpa.service.CurrencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CurrencyServiceImpl implements CurrencyService {
    @Autowired
    private CurrencyDao currencyDao;

    @Override
    public List<Currency> getAllCurrency(){
        return currencyDao.getAllCurrency();
    }
}
