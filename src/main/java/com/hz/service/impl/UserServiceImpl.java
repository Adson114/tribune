package com.hz.service.impl;

import com.hz.bean.User;

import com.hz.dao.IUserDao;
import com.hz.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public List<String> queryUserName(){
        return userDao.queryUserName();
    }

    @Override
    public Integer intoRegister(User user) {
        return userDao.intoRegister(user);
    }

    @Override
    public List<User> doLogin(String userName, String password) {
        return userDao.doLogin(userName,password);
    }

    @Override
    public List<User> toChangeInfo(Integer userId) {
        return userDao.toChangeInfo(userId);
    }

    @Override
    public Integer upLoad(User user) {
        return userDao.upLoad(user);
    }

    @Override
    public Integer queryUserId(String userName) {
        return userDao.queryUserId(userName);
    }

    @Override
    public List<User> queryUserInfo(String userName) {
        return userDao.queryUserInfo(userName);
    }

    @Override
    public Integer updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public String queryUser(String name) {
        return userDao.queryUser(name);
    }

    @Override
    public List<User> doLoginAdmin(String userName, String password, Integer type) {
        return userDao.doLoginAdmin(userName,password,type);
    }

    @Override
    public List<User> adminQueryUser() {
        return userDao.adminQueryUser();
    }

    @Override
    public Integer delUser(User user) {
        return userDao.delUser(user);
    }

    @Override
    public Integer updateDec(User user) {
        return userDao.updateDec(user);
    }


}
