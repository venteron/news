package com.dao;

import com.pojo.Menu;

import java.util.List;

public interface MenuDao {
    public List<Menu> queryMenusByRoleId(int roleId);
}
