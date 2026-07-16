package cn.key.servlet.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.key.dao.OrderDetailDAO;
import cn.key.entity.OrderDetail;

public class ShowOrderDetailServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oid = request.getParameter("oid");
		OrderDetailDAO dao = new OrderDetailDAO();
		List<OrderDetail> details = dao.findById(oid);
		System.out.println(details.size());
		request.setAttribute("orderDetails", details);
		request.getRequestDispatcher("customerOrderDetailForm.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
