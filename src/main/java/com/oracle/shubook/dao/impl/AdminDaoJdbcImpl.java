package com.oracle.shubook.dao.impl;

import com.oracle.shubook.dao.AdminDao;
import com.oracle.shubook.model.Admin;
import com.oracle.shubook.model.BigType;
import com.oracle.shubook.util.DBUtil;
import com.oracle.shubook.util.MD5Util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoJdbcImpl implements AdminDao {
    @Override
    public boolean findAdmin(Admin admin) {
        Connection conn = null;
        PreparedStatement stmt =null;
        ResultSet rs = null;
        try {
//           conn = DBUtil.getConnection();
//            String sql="select * from t_admin where name=? and pwd=?";
//            stmt =conn.prepareStatement(sql);
//            stmt.setString(1,admin.getName());
//            stmt.setString(2, admin.getPwd());
//            rs=stmt.executeQuery();
            conn= DBUtil.getConnection();
            String sql="select pwd from t_admin where name=?";
            stmt =conn.prepareStatement(sql);
            stmt.setString(1,admin.getName());
            rs=stmt.executeQuery();
           if (rs.next()) {
            String passwd = rs.getString(1);//获取到数据库存的密码存到passwd中
//               System.out.println(passwd);
               try {
                   return MD5Util.validPasswd(admin.getPwd(),passwd);//用MD5Util中验证的方法，验证用户输入的和数据库的是否一致
               } catch (NoSuchAlgorithmException e) {
                   e.printStackTrace();
               } catch (UnsupportedEncodingException e) {
                   e.printStackTrace();
               }
           }
        } catch (SQLException e) {

            e.printStackTrace();
        }finally {
            DBUtil.free(rs, stmt, conn);
        }
        return false;
    }
}
