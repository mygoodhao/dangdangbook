package com.oracle.shubook.biz.impl;

import com.oracle.shubook.biz.AdminBiz;
import com.oracle.shubook.dao.AdminDao;
import com.oracle.shubook.dao.impl.AdminDaoJdbcImpl;
import com.oracle.shubook.model.Admin;

public class AdminBizImpl implements AdminBiz {
    @Override
    public boolean findByNameAndPwd(Admin admin) {
        AdminDao adminDao = new AdminDaoJdbcImpl();
        return adminDao.findAdmin(admin);
    }
}
