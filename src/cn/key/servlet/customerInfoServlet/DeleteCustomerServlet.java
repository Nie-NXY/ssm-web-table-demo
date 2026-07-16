package cn.key.servlet.customerInfoServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.CustomerInfoDAO;

public class DeleteCustomerServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		CustomerInfoDAO dao = new CustomerInfoDAO();
		String path = "/Error.jsp";
		String returnPath = "/FindAllCustomerInfoServlet";
		if(dao.delete(customerId)) {
			path = "/Success.jsp";
		}
		request.setAttribute("title","É¾³ý¿Í»§");
		request.setAttribute("returnPath",returnPath);
		request.getRequestDispatcher("/background"+ path).forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
