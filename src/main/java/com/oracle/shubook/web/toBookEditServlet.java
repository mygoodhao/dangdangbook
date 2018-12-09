package com.oracle.shubook.web;

import com.oracle.shubook.biz.BookBiz;
import com.oracle.shubook.biz.SmallTypeBiz;
import com.oracle.shubook.biz.impl.BookBizImpl;
import com.oracle.shubook.biz.impl.SmallTypeBizImpl;
import com.oracle.shubook.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "toBookEditServlet", value="/toBookEdit")
public class toBookEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1、获取参数
        String srtId = request.getParameter("id");
        int id = Integer.parseInt(srtId);


        //2、调用业务层
        BookBiz bookBiz = new BookBizImpl();
        Book book = bookBiz.findBookById(id);
        SmallTypeBiz smallTypeBiz =new SmallTypeBizImpl();
        int bid =smallTypeBiz.findBidById(book.getSid());
        //3
        request.setAttribute("book",book);
        request.setAttribute("bid",bid);
        request.getRequestDispatcher("/bookEdit.jsp").forward(request,response);
    }
}
