 /**
  * 首先在web.xml配置文件中，让所有的请求都会经过BackServletFilte
  */package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.bean.User;

public class BackServletFilter implements Filter {

	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("过滤，进入：com.filter.BackServletFilter");
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		String contextPath=request.getContextPath();
		String uri = request.getRequestURI();
		uri =StringUtils.remove(uri, contextPath);
		if(uri.startsWith("/admin_")){
			User user =(User) request.getSession().getAttribute("user");
			if(null==user){
				response.sendRedirect("login.jsp");
			return;}
			String servletPath = StringUtils.substringBetween(uri,"_", "_") + "Servlet";
			String method = StringUtils.substringAfterLast(uri,"_" );
			request.setAttribute("method", method);
			req.getRequestDispatcher("/" + servletPath).forward(request, response);
			return;
		}
		chain.doFilter(request, response);
	}


	public void init(FilterConfig arg0) throws ServletException {
	
	}
}
