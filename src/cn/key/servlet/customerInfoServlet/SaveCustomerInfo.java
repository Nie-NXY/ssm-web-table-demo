package cn.key.servlet.customerInfoServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.CustomerInfoDAO;
import cn.key.entity.CustomerInfo;

public class SaveCustomerInfo extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		String customerName = request.getParameter("customerName");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		request.setAttribute("customerName", customerName);
		CustomerInfoDAO dao = new CustomerInfoDAO();
		CustomerInfo info = new CustomerInfo(customerName, pwd, email);
		String title = "зЂВс";
		String path = "background/Error.jsp";
		String returnPath = "";
		if(dao.save(info)) {
			request.getRequestDispatcher("");
			path = "Success.jsp";
		}
		
		
		
	}

}
