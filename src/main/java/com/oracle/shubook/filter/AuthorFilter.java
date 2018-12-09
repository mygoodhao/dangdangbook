package com.oracle.shubook.filter;

import com.sun.deploy.net.HttpRequest;
import com.sun.deploy.net.HttpResponse;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AuthorFilter",urlPatterns = "/*")
public class AuthorFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        //放行以login.jsp结尾的，/bower_components中包含的/，login结尾的
        if (request.getRequestURI().endsWith("login.jsp")||request.getRequestURI().contains("/bower_components/")||request.getRequestURI().endsWith("login")||request.getRequestURI().endsWith("vcode.png")) {
            chain.doFilter(req,resp);
            return;
        }
        //如果登录认证信息为null或者没有登录认证信息，强制跳转到登录界面
        if(request.getSession().getAttribute("halogin")==null||!(boolean) request.getSession().getAttribute("halogin")){
               response.sendRedirect("login.jsp");
               return;
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
