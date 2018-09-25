package com.esen.demo.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.annotation.Order;

import com.esen.demo.agora.entity.User;

/** 
* @author luog
* @version 2018年9月18日,下午2:27:36
* @类说明：
*/
@Order(1)
//重点
@WebFilter(filterName = "loginFilter", urlPatterns = "/*",
	initParams = {
        @WebInitParam(name = "excludeUrls", value = "/login,/dologin")
    })
public class LoginFilter implements Filter{

	private List<String> excludedUrlList;
	 
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)arg0;
		HttpServletResponse res = (HttpServletResponse)arg1;
		HttpSession session = req.getSession();
		Object obj = session.getAttribute("loginInfo");
		String url = req.getRequestURI();
        if (excludedUrlList.contains(url)|| url.endsWith(".css") || url.endsWith(".js") ||url.endsWith(".jpg")
        		|| url.endsWith(".png") || url.endsWith(".gif")) {
            chain.doFilter(req, res);
            return;
        }
		if(obj!=null && User.class.isInstance(obj)) {
			User user = (User)obj;
			chain.doFilter(arg0, arg1);
			return;
		}else {
			((HttpServletResponse)arg1).sendRedirect("/login");
			return;
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		 String excludedUrls = filterConfig.getInitParameter("excludeUrls");
		 String[] excludeUrlArray = excludedUrls.split(",");
		 excludedUrlList = Arrays.asList(excludeUrlArray);
	}

}
