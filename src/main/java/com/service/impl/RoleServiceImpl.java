package com.service.impl;

import com.dao.RoleDao;
import com.pojo.Role;
import com.service.RoleService;
import com.util.MyBatisUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    private RoleDao roleDao= MyBatisUtil.getSqlSession().getMapper(RoleDao.class);
    @Override
    public Role getRoleByUserId(int uid) {
        return roleDao.getRoleByUserId(uid);
    }
}
