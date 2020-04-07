package com.lpa.entity;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "user_role")
//用户角色表
public class User_role {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment") //设置主键自增
    @GeneratedValue(generator = "generator")

    @Column(name="id")
    private int id;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "role_name",length = 50)
    private String role_name;
    public String getRole_name(){ return role_name; }

    public void setRole_name(String role_name){ this.role_name = role_name; }

}
