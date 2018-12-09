package com.oracle.shubook.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.oracle.shubook.biz.BigTypeBiz;
import com.oracle.shubook.biz.impl.BigTypeBizImpl;
import com.oracle.shubook.model.BigType;
@WebServlet(value="/findAllBigType")
public class FindAllBigTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindAllBigTypeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String callBack =request.getParameter("callback");
		
		BigTypeBiz bigTypeBiz = new BigTypeBizImpl();
		List <BigType> list = bigTypeBiz.findAllBigType();
		
		response.setContentType("text/javascript;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		JSONArray jsonArray =new JSONArray(list);
		pw.println(callBack+"("+jsonArray.toString() +")");
		pw.flush();
	}

	

}
