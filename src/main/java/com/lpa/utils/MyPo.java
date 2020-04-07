package com.lpa.utils;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class MyPo {

    private Integer status;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    private Integer  type;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }


    private String num;

    public String getNum(){
        return num;
    }
    public void setNum(String num){
        this.num = num;
    }

    private Integer export;

    public Integer getExport() {
        return export;
    }

    public void setExport(Integer export) {
        this.export = export;
    }
}
