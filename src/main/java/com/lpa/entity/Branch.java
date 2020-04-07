package com.lpa.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "branch")
//网点数据表
public class Branch {



//    private int admin_id;//负责人
//    private List<User> userList = new ArrayList<User>();


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

    @Column(name = "code",length = 6)
    private String code;//196451网点代码
    public String getCode(){ return code; }

    public void setCode(String code){ this.code = code; }

    @Column(name="name")
    private String name;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")

    //拥有的员工集合

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
    **/
    @Column(name = "cellphone")
    private String cellphone;

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    /**
    @OneToMany(mappedBy = "id")
    private Set<User> user = new HashSet<User>();

    public Set<User> getUser() {
        return user;
    }

    public void setUser(Set<User> user) {
        this.user = user;
    }
    **/

}
