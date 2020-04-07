package com.lpa.controller;

import com.lpa.entity.Country;
import com.lpa.service.CountryService;
import com.lpa.utils.Message;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class CountryController {
    @Resource
    CountryService countryService;

    @RequestMapping(value = "/getCountries",method = RequestMethod.GET)
    @ResponseBody
    public Message getCountries(){
        List<Country> countries = countryService.getAllCountry();
        return Message.success().add("countries",countries);
    }
}
