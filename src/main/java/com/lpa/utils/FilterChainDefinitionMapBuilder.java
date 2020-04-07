package com.lpa.utils;

import java.util.LinkedHashMap;

public class FilterChainDefinitionMapBuilder {

    /**
     * 工厂方法，生成FilterChainDefinitionMap，使用LinkedHashMap因为访问权限需要依次授权
     */
    public LinkedHashMap<String, String> bulidFilterChainDefinitionMap() {
        LinkedHashMap<String, String> map = new LinkedHashMap<>();
        //map.put("/adminLogin", "anon");
        map.put("/login.jsp", "anon");
        map.put("/main","authc");
        map.put("/admin-management", "authc,roles[0]");
        map.put("/branch-management", "authc,roles[0]");
        map.put("/getBranches", "authc");


        return map;
    }
}
