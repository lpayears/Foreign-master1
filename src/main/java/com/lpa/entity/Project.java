package com.lpa.entity;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "project")
public class Project {


    @Id
    @GenericGenerator(name = "generator", strategy = "increment") //设置主键自增
    @GeneratedValue(generator = "generator")
    @Column(name = "id")
    private Integer id;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id){ this.id = id; }


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "yw_time")
    private Date yw_time;//业务创立时间

    public Date getYw_time() {
        return yw_time;
    }

    public void setYw_time(Date yw_time) {
        this.yw_time = yw_time;
    }

    @Column(name = "order_no",length = 8)
    private String order_no;//序号 自动生成
    public String getOrder_no(){ return order_no; }

    public void setOrder_no(String order_no){ this.order_no = order_no; }


    @Column(name = "num",length = 18)
    private String num;//业务编号 18位
    public String getNum(){
        return num;
    }

    public void setNum(String num){
        this.num = num;
    }

    @OneToOne
    @JoinColumn(name = "company_id")
    private Company company_id;//汇款公司

    public Company getCompany_id() {
        return company_id;
    }

    public void setCompany_id(Company company_id) {
        this.company_id = company_id;
    }

    @OneToOne
    @JoinColumn(name = "currency_code")
    private Currency currency_code;//币种

    public Currency getCurrency_code() {
        return currency_code;
    }

    public void setCurrency_code(Currency currency_code) {
        this.currency_code = currency_code;
    }

    @OneToOne
    @JoinColumn(name = "country_code")
    private Country country_code;//国家

    public Country getCountry_code() {
        return country_code;
    }

    public void setCountry_code(Country country_code) {
        this.country_code = country_code;
    }

    @Column(name = "money")
    private Double money;//金额

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "book_time")
    private Date book_time;//承诺到期日期

    public Date getBook_time() {
        return book_time;
    }

    public void setBook_time(Date book_time) {
        this.book_time = book_time;
    }

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user_id;//经办人

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    @Column(name = "cellphone",length = 11)
    private String cellphone;//联系方式

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    @Column(name = "address")
    private String address;//邮寄地址

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "check_time")
    private Date check_time;//检查核查时间

    public Date getCheck_time() {
        return check_time;
    }

    public void setCheck_time(Date check_time) {
        this.check_time = check_time;
    }

    @Column(name = "status",length = 1)
    private Integer status;//项目状态,0为未核查，默认状态，1为已核查，2为已销账

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
