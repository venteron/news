package com.service.impl;

import com.dao.MenuDao;
import com.pojo.Menu;
import com.service.MenuService;
import com.util.MyBatisUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    private MenuDao menuDao= MyBatisUtil.getSqlSession().getMapper(MenuDao.class);

    /**
     * 根据角色Id查询对应权限
     */
    @Override
    public List<Menu> queryMenusByRoleId(int roleId) {
        return menuDao.queryMenusByRoleId(roleId);
    }
}
