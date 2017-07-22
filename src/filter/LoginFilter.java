package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dqwr.entity.YH;

public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 获得在下面代码中要用的request,response,session对象
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();

		// 获得用户请求的URI
		String path = servletRequest.getRequestURI();
		// System.out.println(path);

		// 从session里取员工工号信息
		YH user = (YH) session.getAttribute("user");

		/*
		 * 创建类Constants.java，里面写的是无需过滤的页面 for (int i = 0; i <
		 * Constants.NoFilter_Pages.length; i++) {
		 * 
		 * if (path.indexOf(Constants.NoFilter_Pages[i]) > -1) {
		 * chain.doFilter(servletRequest, servletResponse); return; } }
		 */

		// 登陆页面无需过滤
		if (path.indexOf("login") > -1 || path.indexOf("/images") > -1
				|| path.indexOf("/js") > -1 || path.indexOf("/qt") > -1
				|| path.indexOf("/attached") > -1
				|| path.indexOf("/qtlogin") > -1
				|| path.indexOf("/Ajaxresponse") > -1
				|| path.indexOf("/ybc") > -1 || path.indexOf("ZcDetailed") > -1
				|| path.indexOf("ZCLookServlet") > -1
				|| path.indexOf("IndexServlet") > -1
				|| path.indexOf("GetSeachMsg") > -1
				|| path.indexOf("checkwbuser") > -1
				|| path.indexOf("zhuce") > -1 || path.indexOf("qtlogin") > -1
				|| path.indexOf("zcjd") > -1
				|| path.indexOf("YjfkServlet") > -1 || path.indexOf("css") > -1
				|| path.indexOf("GetKeys") > -1
				|| path.indexOf("PhraseQueryServlet") > -1
				|| path.indexOf("DownloadServlet") > -1
				|| path.indexOf("full_text_search") > -1
				|| path.indexOf("zcztServlet") > -1

		) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}

		// 判断如果没有取到员工信息,就跳转到登陆页面
		if (user == null) {
			// 跳转到登陆页面
			servletResponse.sendRedirect("login.html");
		} else {
			// 已经登陆,继续此次请求
			chain.doFilter(request, response);
		}

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}