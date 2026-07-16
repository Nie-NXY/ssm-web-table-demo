package cn.key.servlet.customerInfoServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.CustomerInfoDAO;
import cn.key.entity.CustomerInfo;

public class FindAllCustomerInfoServlet extends HttpServlet {


	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CustomerInfoDAO dao = new CustomerInfoDAO();
		List<CustomerInfo> list = dao.findAll();	
		request.setAttribute("CustomerInfo", list);
		RequestDispatcher rd = request.getRequestDispatcher("/background/customerInfo/findCustomerInfoList.jsp");
		rd.forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		this.doGet(request, response);
	}

}
