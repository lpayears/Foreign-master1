package com.lpa.realm;

import com.lpa.entity.User;
import com.lpa.service.UserService;
import com.lpa.utils.MD5Util;
import com.lpa.utils.MyUtil;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

public class AdminRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    /**
     * 授权会被Shiro回调的方法
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // 1. 从 PrincipalCollection 中来获取登录用户的信息
        String principal = (String) principals.getPrimaryPrincipal();
        // String principal = (String)principals.getPrimaryPrincipal();
        // 2. 利用登录的用户的信息来用户当前用户的角色或权限
        User user = userService.getUserByCode(principal);

        // 3.遍历设置用户的权限
        // String role = user.getRole();
        // String[] split = role.split(",");
        // Set<String> roles = new HashSet<>();
        // for (String string : split) {
        // roles.add(string);
        // }

        // 4. 创建 SimpleAuthorizationInfo, 并设置其 roles 属性.
        // SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
        // return info;
        Set<String> roles = new HashSet<>();
        if (user.getRole_id() == 0) {

            roles.add("0");

        }
        else if(user.getRole_id() == 1){
            roles.add("1");
        }
        else if(user.getRole_id() == 2){
            roles.add("2");
        }
        else
            roles.add("3");

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
        return info;
    }

    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 1. 把 AuthenticationToken 转换为 UsernamePasswordToken
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        //AuthenticationToken upToken = (AuthenticationToken) token;
        // 2.从UsernamePasswordToken获取usertoken
        String id_code = upToken.getUsername();
        //转化密码
        // char [] chars = (char[])upToken.getCredentials();
        // 3.调用service层方法，获取username对应的用户记录
        User user = userService.getUserByCode(id_code);

        // 4.若用户不存在，抛出UnknownAccountException 异常
        if (MyUtil.ObjectNull(user)) {
            throw new UnknownAccountException("用户没有权限！");
        }

        // 5. 根据用户信息的情况, 决定是否需要抛出其他的 AuthenticationException 异常.
        if (user.getStatus() == 1) {
            throw new LockedAccountException("用户被锁定，请联系管理员");
        }

        // 6.获取认证信息，即加密的密码,继而跟数据库的密码进行比较
        //String pwd = new String(upToken.getPassword());
        //String param = admin.getSalt();
        //String credentials = MD5Util.getPassword(param, pwd);
        //String password = admin.getPassword();
        // if (!credentials.equals(password)) {
        //     throw new UnknownAccountException("用户名或密码错误");
        // }

      //  String password = new String(upToken.getPassword());
        String salt = "6baa68";
        String passwordMD5 = MD5Util.getPassword("6baa68", "123456");
        //System.out.println(passwordMD5);
        String userPassword = user.getPassword();
        if (!passwordMD5.equals(userPassword)) {
            throw new UnknownAccountException("用户名或密码错误");
        }

        ByteSource credentialsSalt = ByteSource.Util.bytes(salt);
        String realmName = getName();
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(id_code, passwordMD5, credentialsSalt, realmName);
        return info;

        //ByteSource credentialsSalt = ByteSource.Util.bytes(param);
        //SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(realmName);
        /*
         * // 6. 根据用户的情况, 来构建 AuthenticationInfo 对象并返回. 通常使用的实现类为:
         * SimpleAuthenticationInfo // 以下信息是从数据库中获取的. // 1). principal: 认证的实体信息. 可以是
         * username, 也可以是数据表对应的用户的实体类对象. Object principal = username; // 2).
         * credentials: 密码. Object credentials = null; // 3). realmName: 当前 realm 对象的
         * name. 调用父类的 getName() 方法即可 String realmName = getName(); // 4). 盐值.
         * ByteSource credentialsSalt = ByteSource.Util.bytes(username);
         * SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal,
         * credentials, credentialsSalt, realmName);
         */
    }
}
