package com.lpa.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "client")
public class Client {

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

    @Column(name="name")
    private String name;//用户名
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "id_type",length = 6)
    private String id_type;//证件类型
    public String getId_type(){ return id_type; }

    public  void setId_type(String id_type){ this.id_type = id_type; }

    @Column(name = "id_code")
    private String id_code;//证件号码
    public String getId_code(){ return id_code; }

    public void setId_code(String id_code){ this.id_code = id_code; }

    @OneToOne
    @JoinColumn(name = "country_code")
    private Country country_code;//国别
    public Country getCountry_code(){ return country_code; }

    public void setCountry_code(Country country_code){ this.country_code = country_code; }

    @Column(name = "address")
    private String address;//地址
    public String getAddress(){ return address; }

    public void setAddress(String address){ this.address = address; }

    @Column(name = "cellphone",length = 11)
    private String cellphone;//手机号码
    public String getCellphone(){ return cellphone; }

    public void setCellphone(String cellphone){ this.cellphone = cellphone; }

    /**
    @Column(name = "status",length = 1)
    private int status;//状态用来判断是否为法人 初始默认值为0，法人为1

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @ManyToMany(mappedBy = "clients")
    private Set<Company> companies;

    public Set<Company> getCompanies() {
        return companies;
    }

    public void setCompanies(Set<Company> companies) {
        this.companies = companies;
    }
**/
}
