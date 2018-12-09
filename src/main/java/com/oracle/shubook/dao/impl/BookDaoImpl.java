package com.oracle.shubook.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oracle.shubook.dao.BookDao;
import com.oracle.shubook.model.Book;
import com.oracle.shubook.util.DBUtil;
import com.oracle.shubook.util.PageConstant;

public class BookDaoImpl implements BookDao {

	@Override
	public boolean save(Book book) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.prepareStatement("insert into t_book values(default,?,?,?,?,?,?,?,?)");
			stmt.setString(1,book.getName());
			stmt.setDouble(2, book.getPrice());
			stmt.setString(3, book.getAuthor());
			stmt.setString(4, book.getCbs());
			stmt.setDate(5, new Date(book.getCbDate().getTime()));
			stmt.setString(6, book.getDesctri());
			stmt.setInt(7, book.getSid());
			stmt.setString(8, book.getPhoto());
			int ret=stmt.executeUpdate();
			if(ret>0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(stmt, conn);
		}
		return false;
	}

	@Override
	public List<Book> findAll(int currentPage ,String name,int sid) {
		Connection conn = null;
		Statement stmt =null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			stmt =conn.createStatement();
			/*String sql="select * from t_book order by id desc ";
			//四种情况讨论
			//4.1啥都不限定
			if ((name==null||name.equals(""))&&sid==-1) {
			}
			//4.2限定name,不限定sid
			if ((name!=null&&!name.equals(""))&&sid==-1) {
				sql+=" where name like '%"+name+"%'";
			}
			//4.3不限定name,限定sid
			if ((name==null||name.equals(""))&&sid!=-1) {
				sql+=" where sid="+sid;
			}
			//4.4限定name,限定sid
			if ((name!=null&&!name.equals(""))&&sid!=-1) {
				sql+=" where name like '%"+name+"%' and sid="+sid;
			}*/
			String sql ="select * from t_book  where 1=1";
			if (name!=null&&!name.equals("")) {
				sql+=" and name like '%"+name+"%'";
			}
			if (sid!=-1) {
				sql+=" and sid="+sid;
			}
			sql+=" order by id desc limit  "+((currentPage-1)*PageConstant.PAGE_SIZE+1-1) + ","+PageConstant.PAGE_SIZE;
			rs=stmt.executeQuery(sql);
			List<Book> ls = new ArrayList<>();
			while (rs.next()) {
				Book book = new Book();
				book.setId(rs.getInt("id"));
				book.setName(rs.getString("name"));
				book.setPrice(rs.getDouble("price"));
				book.setAuthor(rs.getString("author"));
				book.setCbs(rs.getString("cbs"));
                book.setCbDate(rs.getDate("cbDate"));	
                book.setDesctri(rs.getString("descri"));
                book.setSid(rs.getInt("sid"));
                book.setPhoto(rs.getString("photo"));
				ls.add(book);
//				System.out.println(book.toString());
			}
			return ls;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public int total(String name,int sid) {
		Connection conn = null;
		Statement stmt =null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			stmt =conn.createStatement();
			String sql ="select count(*) from t_book  where 1=1";
			if (name!=null&&!name.equals("")) {
				sql+=" and name like '%"+name+"%'";
			}
			if (sid!=-1) {
				sql+=" and sid="+sid;
			}
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
			return rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);
		}
		return 0;
	}

	@Override
	public int delById(int id) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.prepareStatement("delete from t_book where id="+id);
			int ret=stmt.executeUpdate();
			return ret;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(stmt, conn);
		}
		return 0;
	}

	@Override
	public Book find(int id) {
		Connection conn = null;
		Statement stmt =null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			stmt =conn.createStatement();

			String sql ="select * from t_book  where id="+id;
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				Book book = new Book();
				book.setId(rs.getInt("id"));
				book.setName(rs.getString("name"));
				book.setPrice(rs.getDouble("price"));
				book.setAuthor(rs.getString("author"));
				book.setCbs(rs.getString("cbs"));
				book.setCbDate(rs.getDate("cbDate"));
				book.setDesctri(rs.getString("descri"));
				book.setSid(rs.getInt("sid"));
				book.setPhoto(rs.getString("photo"));
				return book;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public boolean update(Book book) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn=DBUtil.getConnection();
			//如果用户没有选文件，表示他不想修改原文件
			if(book.getPhoto()==null){
				stmt=conn.prepareStatement("UPDATE t_book1 SET name=?,price=?,author=?,cbs=?,cbDate=?,descri=?,sid=? WHERE id=?");
				System.out.println(book.getPhoto());
				stmt.setString(1,book.getName());
				stmt.setDouble(2, book.getPrice());
				stmt.setString(3, book.getAuthor());
				stmt.setString(4, book.getCbs());
				stmt.setDate(5, new Date(book.getCbDate().getTime()));
				stmt.setString(6, book.getDesctri());
				stmt.setInt(7, book.getSid());
				stmt.setInt(8,book.getId());
			}else{//否则，就换成修改后的
				stmt=conn.prepareStatement("UPDATE t_book1 SET name=?,price=?,author=?,cbs=?,cbDate=?,descri=?,sid=?,photo=? WHERE id=?");
				stmt.setString(1,book.getName());
				stmt.setDouble(2, book.getPrice());
				stmt.setString(3, book.getAuthor());
				stmt.setString(4, book.getCbs());
				stmt.setDate(5, new Date(book.getCbDate().getTime()));
				stmt.setString(6, book.getDesctri());
				stmt.setInt(7, book.getSid());
				stmt.setString(8, book.getPhoto());
				stmt.setInt(9,book.getId());
			}
			int ret=stmt.executeUpdate();
			if(ret>0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(stmt, conn);
		}
		return false;
	}


}
