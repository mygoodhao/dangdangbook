package com.oracle.shubook.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.shubook.biz.SmallTypeBiz;
import com.oracle.shubook.biz.impl.SmallTypeBizImpl;
import com.oracle.shubook.model.SmallType;
import com.oracle.shubook.util.MyBeanUtils;

@WebServlet(value="/smallTypeAdd")
public class SmallTypeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SmallTypeAddServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SmallType  smallType= new SmallType();
		MyBeanUtils.populate(smallType, request.getParameterMap());
		
		SmallTypeBiz smallTypeBiz = new SmallTypeBizImpl();
		boolean ret = smallTypeBiz.save(smallType);
		
		if (ret) {
			response.sendRedirect("main.jsp");
		}else {
			request.setAttribute("smallType", smallType);
			request.getRequestDispatcher("/smallTypeAdd.jsp").forward(request, response);
		}
	}

}










































