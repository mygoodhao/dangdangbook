package com.oracle.shubook.web;

import com.oracle.shubook.biz.AdminBiz;
import com.oracle.shubook.biz.impl.AdminBizImpl;
import com.oracle.shubook.model.Admin;
import com.oracle.shubook.util.MyBeanUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.*;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、获取参数值
		Admin admin = new Admin();
		MyBeanUtils.populate(admin, request.getParameterMap());
//		System.out.println(admin.getName()+"   "+admin.getPwd());
		//验证验证码是否正确
		String vcode = request.getParameter("vcode");
		String serverVcode = (String)request.getSession().getAttribute("validateCode");
		/*if(!serverVcode.equalsIgnoreCase(vcode)){
			request.setAttribute("admin",admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		//验证账号，密码是否符合设置的规范
		ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
		Validator validator = validatorFactory.getValidator();

		Set<ConstraintViolation<Admin>> constraintViolations =
				validator.validate(admin);
		if (constraintViolations.size()>0) {
			Map<String, String> map = new HashMap<>();
			for (ConstraintViolation<Admin> cv :
					constraintViolations) {
//			System.out.println(cv+"1111111111111111111");
			map.put(cv.getPropertyPath().toString(), cv.getMessage());
			}
			request.setAttribute("map",map);
			request.setAttribute("admin",admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}*/
		Map<String, String> map = new HashMap<>();
		if(!serverVcode.equalsIgnoreCase(vcode)){
			map.put("vcode","验证码错误");
		}
		//验证账号，密码是否符合设置的规范
		ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
		Validator validator = validatorFactory.getValidator();

		Set<ConstraintViolation<Admin>> constraintViolations =validator.validate(admin);
		if (constraintViolations.size()>0) {
			for (ConstraintViolation<Admin> cv :constraintViolations) {
//			System.out.println(cv+"1111111111111111111");
				map.put(cv.getPropertyPath().toString(), cv.getMessage());
			}
		}
		if(map.size()>0){
			request.setAttribute("map",map);
			request.setAttribute("admin",admin);
//			System.out.println("-----"+map.size());
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		//2、到数据库比对
		AdminBiz adminBiz  =new AdminBizImpl();
//		System.out.println(admin.toString());
		boolean ret = adminBiz.findByNameAndPwd(admin);
		if (ret) {
			request.getSession().setAttribute("halogin",true);
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}else {
			request.setAttribute("admin",admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}











