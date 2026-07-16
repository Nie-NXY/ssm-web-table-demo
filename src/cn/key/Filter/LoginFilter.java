package cn.key.Filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter extends FilterAdapter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpResquest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String path = httpResquest.getServletPath();
		System.out.println(path);
		if (!("/bgLogin.jsp".equals(path) || "/SysAdminServlet".equals(path))) {
			HttpSession session = httpResquest.getSession();
			if (session.getAttribute("sysAdmin") == null) {
				session.setAttribute("tishi", "error");
				httpResponse.sendRedirect(httpResquest.getContextPath() + "/bgLogin.jsp");
				return;
			}
		}
		chain.doFilter(request, response);
	}
}
