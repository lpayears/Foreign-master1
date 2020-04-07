package com.lpa.entity;


import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "company")
public class Company  {


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


    @Column(name = "company_name")
    private String company_name;//公司名称

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    @Column(name = "type",length = 1)
    private Integer type;//公司类型，0为nra账户，1为外汇结算账户，2为代理公司

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "start_time")
    private Date start_time;//开户日期

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "end_time")
    private Date end_time;//开户日期

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    @Column(name = "account")
    private String account;//账户

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    @Column(name = "manage_location")
    private String manage_location;//经营场所

    public String getManage_location() {
        return manage_location;
    }

    public void setManage_location(String manage_location) {
        this.manage_location = manage_location;
    }

    @Column(name = "business_scope")
    private String business_scope;//经营范围
    public String getBusiness_scope() {
        return business_scope;
    }

    public void setBusiness_scope(String business_scope) {
        this.business_scope = business_scope;
    }

    @Column(name = "register_place")
    private String register_place;//注册地

    public String getRegister_place() {
        return register_place;
    }

    public void setRegister_place(String register_place) {
        this.register_place = register_place;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "register_time")
    private Date register_time;//注册日期

    public Date getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Date register_time) {
        this.register_time = register_time;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "final_check_time")
    private Date final_check_time;//最后年检时间

    public Date getFinal_check_time() {
        return final_check_time;
    }

    public void setFinal_check_time(Date final_check_time) {
        this.final_check_time = final_check_time;
    }

    /**
    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name = "clients")
    private Set<Client> clients = new HashSet<Client>();

    public Set<Client> getClients() {
        return clients;
    }

    public void setClients(Set<Client> clients) {
        this.clients = clients;
    }

    @OneToOne
    @JoinColumn(name = "branch_clients")
    private Company_Clients company_clients;

    public Company_Clients getCompany_clients() {
        return company_clients;
    }

    public void setCompany_clients(Company_Clients company_clients) {
        this.company_clients = company_clients;
    }
     **/
    @ManyToMany//股东们
    @JoinTable(name = "company_client",joinColumns = {@JoinColumn(name = "company_id")},inverseJoinColumns = {@JoinColumn(name = "client_id")})
    private Set<Client> clients = new HashSet<Client>();

    public Set<Client> getClients() {
        return clients;
    }

    public void setClients(Set<Client> clients) {
        this.clients = clients;
    }

    @OneToOne
    @JoinColumn(name = "legal_id")
    private Client client;

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }


    @OneToOne
    @JoinColumn(name = "branch_id")
    private Branch branch_id;//分行网点

    public Branch getBranch_id() {
        return branch_id;
    }

    public void setBranch_id(Branch branch_id) {
        this.branch_id = branch_id;
    }

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user_id;//管理员

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    @Column(name = "limit_money")
    private String limit_money;//额度限制，统一为美元

    public String getLimit_money() {
        return limit_money;
    }

    public void setLimit_money(String limit_money) {
        this.limit_money = limit_money;
    }

    @Column(name = "status")
    private Integer status;//账户状态 0正常 1久悬不动户 3销户 2禁用

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


    @Column(name = "flag")
    private Integer flag;//判定是否核查

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}
