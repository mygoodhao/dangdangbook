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

import com.oracle.shubook.biz.SmallTypeBiz;
import com.oracle.shubook.biz.impl.SmallTypeBizImpl;
import com.oracle.shubook.model.SmallType;

@WebServlet(value="/findAllSmallType")
public class FindAllSmallTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindAllSmallTypeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String srtBid = request.getParameter("bid");
		int bid =Integer.parseInt(srtBid);
//		System.out.println(bid);
		String callBack =request.getParameter("callback");
		
		SmallTypeBiz smallTypeBiz = new SmallTypeBizImpl();
		List<SmallType> list= smallTypeBiz.findAllByBid(bid);
		response.setContentType("text/javascript;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		JSONArray jsonArray =new JSONArray(list);
		pw.println(callBack+"("+jsonArray.toString() +")");
		pw.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}


































