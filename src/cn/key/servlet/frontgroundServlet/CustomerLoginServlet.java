package cn.key.servlet.frontgroundServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.dao.CustomerInfoDAO;
import cn.key.entity.CustomerInfo;

public class CustomerLoginServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customerName = request.getParameter("username").trim();
		String pwd = request.getParameter("password").trim();
		CustomerInfoDAO dao = new CustomerInfoDAO();
		CustomerInfo customer = dao.findByNamePwd(customerName, pwd);
		HttpSession session = request.getSession();
		if(customer == null) {
			session.setAttribute("fgTishi", "”√ªß√˚√‹¬Î¥ÌŒÛ£°");
			response.sendRedirect(request.getContextPath() + "/egou/login.jsp");
		}else {
			session.setAttribute("customer", customer);
			response.sendRedirect(request.getContextPath() + "/FindBookTypeServlet");
		}
	}

}
