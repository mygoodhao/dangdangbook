package com.oracle.shubook.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.shubook.biz.BigTypeBiz;
import com.oracle.shubook.biz.impl.BigTypeBizImpl;

@WebServlet(value="/bigTypeAdd")
public class BigTypeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BigTypeAddServlet() {
    	super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String name = request.getParameter("name");
		
		BigTypeBiz bigTypeBiz = new BigTypeBizImpl();			
		boolean ret = bigTypeBiz.save(name);
		
		if (ret) {
			response.sendRedirect("main.jsp");
		}else {
			request.setAttribute("name", name);
			request.getRequestDispatcher("/bigTypeAdd.jsp").forward(request, response);
		}
	}

}
