package com.oracle.shubook.biz;

import com.oracle.shubook.model.Admin;

public interface AdminBiz {
    boolean findByNameAndPwd(Admin admin);
}
