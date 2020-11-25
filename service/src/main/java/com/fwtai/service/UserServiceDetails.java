package com.fwtai.service;

import com.fwtai.bean.JwtUser;
import com.fwtai.bean.SysUser;
import com.fwtai.service.core.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 登录处理,实现登录认证及权限鉴权,主要职责就是认证用户名和密码是否和该用户的权限角色集合
*/
@Service
public class UserServiceDetails implements UserDetailsService{

    @Autowired
    private UserService userService;

    @Resource
    private AsyncService asyncService;

    /**
     * 通过账号查找用户信息,用于登录,它会走认证失败的回调,即方法 unsuccessfulAuthentication(),但是不走啦,已经在 com.fwtai.auth.LoginAuthFilter处理了
     * @param username
     * @return
     * @throws UsernameNotFoundException
    */
    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException{//登录认证,若登录失败,即找不到用户信息时它会走认证失败的回调,即方法 unsuccessfulAuthentication()
        final SysUser user = userService.getUserByUserName(username);
        if(user == null) throw new UsernameNotFoundException("账号或密码有误");//其实不走这个的,因为已在com.fwtai.auth.LoginAuthFilter处理了
        final Integer enabled = user.getEnabled();
        if(enabled == 0){
            asyncService.updateLogin(username);
        }
        return new JwtUser(user.getKid(),user.getUserName(),user.getUserPassword(),enabled);
    }

    /**
     * 鉴权,通过userId动态获取用户的全部角色和权限的信息
     * @param
     * @作者 田应平
     * @QQ 444141300
     * @创建时间 2020/5/1 0:49
    */
    public UserDetails getUserById(final String userId,final String url){
        final SysUser user = userService.getUserById(userId);
        if(user != null){
            final List<String> roles =  userService.getRolePermissions(userId,url);
            final List<SimpleGrantedAuthority> authorities = new ArrayList<>();
            for (final String role : roles){
                authorities.add(new SimpleGrantedAuthority(role));
            }
            // todo 将 userId 把 authentication 存入 redis ，方便后续获取用户信息
            return new JwtUser(user.getKid(),user.getUserName(),user.getEnabled(),authorities);
        }
        throw new RuntimeException("账号信息不存在");
    }
}