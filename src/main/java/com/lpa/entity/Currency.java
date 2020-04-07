package com.lpa.entity;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "currency")
public class Currency {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment") //设置主键自增
    @GeneratedValue(generator = "generator")

    @Column(name="id")
    private Integer id;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "code" , length = 3)
    private String code;

    @Column(name = "d_name")
    private String d_name;

    @Column(name = "c_name")
    private String c_name;


    public String getCode(){
        return code;
    }
    public void setCode(String code){
        this.code = code;
    }
    public String getD_name(){
        return d_name;
    }
    public void setD_name(String d_name){
        this.d_name = d_name;
    }
    public String getC_name(){
        return c_name;
    }
    public void setC_name(String c_name){
        this.c_name = c_name;
    }

    public Currency(){}

    @Override
    public String toString(){
        return "Currency{" +
                "code=" + code +
                ",d_name='" + d_name +'\'' +
                ",c_name='" + c_name +
                '}';
    }
}
