package cn.key.servlet.frontgroundServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.dao.CustomerInfoDAO;
import cn.key.entity.CustomerInfo;

public class CustomerRegister extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customerName = request.getParameter("username");
		String pwd = request.getParameter("password");
		String email = request.getParameter("email");
		CustomerInfoDAO dao = new CustomerInfoDAO();
		CustomerInfo customer = new CustomerInfo(customerName, pwd, email);
		HttpSession session = request.getSession();
		String path = "/Error.jsp";
		String returnPath = "/egou/register.jsp";
		if(dao.save(customer)) {
			CustomerInfo info = dao.findByNamePwd(customerName, pwd);
			session.setAttribute("customer", info);
			path = "/Success.jsp";
			returnPath = "/FindBookTypeServlet";
		}
		request.setAttribute("title","зЂВс");
		request.setAttribute("returnPath",returnPath);
		request.getRequestDispatcher("/background"+ path).forward(request, response);
	}

}
