package com.dao;

import com.pojo.Menu;
import com.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    public User queryByUser(User user);

    public User queryUserById(int id);

    public User queryByUsername(String username);

    public List<User> queryAll();

    public int insertUser(User user);

    public int updateUser(User user);

    public int deleteUserById(int id);

    public List<User> queryUserByMohu(@Param("mohu") String mohu);
}
