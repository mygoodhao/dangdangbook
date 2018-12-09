package com.oracle.shubook.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oracle.shubook.biz.BookBiz;
import com.oracle.shubook.biz.impl.BookBizImpl;
import com.oracle.shubook.model.Book;
import com.oracle.shubook.util.MyBeanUtils;
import com.oracle.shubook.util.StringEscapeUtil;

@WebServlet(value="/bookAdd")
@MultipartConfig
public class BookTypeaddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookTypeaddServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Book book = new Book();
		MyBeanUtils.populate(book, request.getParameterMap(),"yyyy-MM-dd");
		String file = "";
		Part part = request.getPart("photo");
		if (part.getHeader("Content-Disposition").contains("; filename=")) {
		if (part.getSubmittedFileName() !=null && !part.getSubmittedFileName().equals("")) {
			//先判断文件名是否为空，再判断文件名是否为空字符串，不为空就继续执行，为空就不再执行if中的代码
			String st = part.getSubmittedFileName().substring(part.getSubmittedFileName().indexOf(".")+1);
			//从文件名中的最后一个点开始截取，保留后缀名
			
			 file = UUID.randomUUID()+"."+st;
			//用UUID.randomUUID()方法生成的随机名加上截取到的后缀名，代替原来的名字
			
			part.write(request.getServletContext().getRealPath("/upload/" + file));
		}
		}
		book.setPhoto(file);
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			book.setCbDate(sf.parse(request.getParameter("cdDate")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		book.setDesctri(request.getParameter("descri"));
//		System.out.println(book.toString());
		book.setDesctri(StringEscapeUtil.htmlEncode(book.getDesctri()));
		BookBiz bookBiz = new BookBizImpl();
		boolean ret = bookBiz.save(book);
		if (ret) {
			response.sendRedirect("bookList");
		}else {
			request.setAttribute("book", book);
			request.getRequestDispatcher("bookAdd.jsp").forward(request, response);
		}
	}
}
