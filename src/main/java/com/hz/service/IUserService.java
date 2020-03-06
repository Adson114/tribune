package com.hz.service;

import com.hz.bean.User;


import java.util.List;

public interface IUserService {
    List<String>queryUserName();

    Integer intoRegister(User user);

    List<User> doLogin(String userName,String password);

    List<User> toChangeInfo(Integer userId);

    Integer upLoad(User user);

    Integer queryUserId(String userName);

    List<User>queryUserInfo(String userName);

    Integer updateUser(User user);

    String queryUser(String name);

    List<User> doLoginAdmin(String userName,String password ,Integer type);

    List<User>adminQueryUser();

    Integer delUser(User user);

    Integer updateDec(User user);
}
