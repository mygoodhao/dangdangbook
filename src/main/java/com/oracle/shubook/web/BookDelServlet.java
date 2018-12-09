package com.oracle.shubook.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.shubook.biz.BookBiz;
import com.oracle.shubook.biz.impl.BookBizImpl;

@WebServlet(value="/bookDel")
public class BookDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookDelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1
		String strId = request.getParameter("id");
		int id = Integer.parseInt(strId);
		//2
		BookBiz bookBiz = new BookBizImpl();
		int ret = bookBiz.delById(id);
		//3
		response.sendRedirect("bookList");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
