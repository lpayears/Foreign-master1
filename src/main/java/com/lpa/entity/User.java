package com.lpa.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment") //设置主键自增
    @GeneratedValue(generator = "generator")

    @Column(name="id")
    private Integer id;//id
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name="name",length = 30)
    private String name;//用户名
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "id_code",length = 18)
    private String id_code;//身份证
    public String getId_code(){ return id_code; }

    public void setId_code(String id_code){ this.id_code = id_code; }

    @ManyToOne
    @JoinColumn(name="branch_id")
    private Branch branch_id;//网点id 外键
    public Branch getBranch_id() {
        return branch_id;
    }

    public void setBranch_id(Branch branch_id) {
        this.branch_id = branch_id;
    }

    @Column(name="cellphone",length = 11)
    private String cellphone;//手机号

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    @Column(name = "role_id")
    private Integer role_id;//角色id
    public Integer getRole_id(){ return role_id; }

    public void setRole_id(Integer role_id){ this.role_id = role_id; }

    @Column(name = "status")
    private Integer status;//状态，0为启用，1为未启用

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name = "password")
    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
