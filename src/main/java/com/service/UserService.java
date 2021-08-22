package com.service;

import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {

    public User login(User user);

    public boolean register(User user);
    public User queryUserById(int id);

    public List<User> queryAll();

    public void updateUser(User user);

    public void deleteUserById(int id);

    public List<User> queryUserByMohu(@Param("mohu") String mohu);
}
