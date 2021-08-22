package com.service.impl;

import com.dao.UserDao;
import com.pojo.Menu;
import com.pojo.User;
import com.service.UserService;
import com.util.MyBatisUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    private UserDao userDao= MyBatisUtil.getSqlSession().getMapper(UserDao.class);

    @Override
    public User login(User user) {
        return userDao.queryByUser(user);
    }

    @Override
    public boolean register(User user) {
        User user1=userDao.queryByUsername(user.getUsername());
        if(user1==null){
            //用户不存在,注册新用户
            userDao.insertUser(user);
            return true;
        }else{
            //用户已存在
            return false;
        }
    }

    @Override
    public User queryUserById(int id) {
        User user=userDao.queryUserById(id);
        return user;
    }

    @Override
    public List<User> queryAll() {
        return userDao.queryAll();
    }


    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public void deleteUserById(int id) {
        userDao.deleteUserById(id);
    }

    @Override
    public List<User> queryUserByMohu(String mohu) {
        return userDao.queryUserByMohu(mohu);
    }
}
