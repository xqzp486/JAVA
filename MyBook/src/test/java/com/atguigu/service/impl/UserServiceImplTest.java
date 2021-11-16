package com.atguigu.service.impl;

import com.atguigu.pojo.User;
import com.atguigu.service.UserService;
import junit.framework.TestCase;

public class UserServiceImplTest extends TestCase {
    UserService userService = new UserServiceImpl();

    public void testRegistUser() {
        userService.registUser(new User(null, "bbj168", "666666", "bbj168@qq.com"));
        userService.registUser(new User(null, "abc168", "666666", "abc168@qq.com"));
    }

    public void testLogin() {
        System.out.println(userService.login(new User(null, "wzg168", "123456", null)));
    }

    public void testExistsUsername() {
        if (userService.existsUsername("wzg168")) {
            System.out.println("用户名已存在");
        } else {
            System.out.println("用户名可用");
        }
    }
}