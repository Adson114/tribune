package com.hz.dao;


import com.hz.bean.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface IUserDao {

    List<String> queryUserName();

    Integer intoRegister(User user);

    List<User> doLogin(@Param(value="userName")String userName,@Param(value="password")String password);

    List<User> toChangeInfo(@Param(value="userId")Integer userId);

    Integer upLoad(User user);

    Integer queryUserId(@Param(value="userName")String userName);

    List<User>queryUserInfo(@Param(value="userName")String userName);

    Integer updateUser(User user);

    String queryUser(@Param(value="userName")String userName);

    List<User>doLoginAdmin(@Param(value="userName")String userName,@Param(value="password")String password,@Param(value = "type") Integer type);

    List<User>adminQueryUser();

    Integer delUser(User user);

    Integer updateDec(User user);

}
