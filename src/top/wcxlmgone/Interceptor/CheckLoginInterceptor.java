package top.wcxlmgone.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//一个类继承了HandlerInterceptorAdapter类或是实现了HandlerInterceptor接口就成为了一个拦截器
public class CheckLoginInterceptor extends HandlerInterceptorAdapter{
	public boolean  preHandle(HttpServletRequest request,HttpServletResponse response,Object handler,HttpSession session) throws Exception{
		//判断当前用户是否登录,已登录则放行,没登录则不放行,并且回到登录界面
		//session中无对象表示未登录
		System.out.println("我拦截了");
		if (session.getAttribute("doctor_session") == null) {
			//没有登录则不放行,并且回到登录界面
			response.sendRedirect("${pageContext.request.contextPath }/jsp/login.jsp");
			return false;
		}
		else if (session.getAttribute("admin_session") == null) {
			//没有登录则不放行,并且回到登录界面
			response.sendRedirect("${pageContext.request.contextPath }/jsp/login.jsp");
			return false;
		}
		return true; //已登录则放行
	}
}