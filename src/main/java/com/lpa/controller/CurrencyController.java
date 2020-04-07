package com.lpa.controller;

import com.lpa.entity.Currency;
import com.lpa.service.CurrencyService;
import com.lpa.utils.Message;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class CurrencyController {
    @Resource
    CurrencyService currencyService;

    @RequestMapping(value = "/getCurrencies",method = RequestMethod.GET)
    @ResponseBody
    public Message getCurrencies(){
        List<Currency> currencies = currencyService.getAllCurrency();
        return Message.success().add("currencies",currencies);
    }
}
