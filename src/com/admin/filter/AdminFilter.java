package com.admin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 管理员操作 filter
 * 没有登录不能操作
 * @author THINK
 *
 */
public class AdminFilter implements Filter{
	
	@Override
	public void destroy() {
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		//没有登录 不放行
		if(request.getSession().getAttribute("reuser") == null){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			//登录就放行
			chain.doFilter(request, response);
		}
		
	}
	
	@Override
	public void init(FilterConfig fc) throws ServletException {
		
	}

}
