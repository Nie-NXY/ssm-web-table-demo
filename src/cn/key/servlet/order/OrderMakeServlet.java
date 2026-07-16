package cn.key.servlet.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.OrderMainDAO;
import cn.key.entity.OrderMain;

public class OrderMakeServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OrderMainDAO dao = new OrderMainDAO();
		List<OrderMain> mains = dao.findAll();
		request.setAttribute("mains", mains);
		request.getRequestDispatcher("/background/orderMake.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
