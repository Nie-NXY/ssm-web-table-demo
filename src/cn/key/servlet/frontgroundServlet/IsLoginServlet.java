package cn.key.servlet.frontgroundServlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.dao.CustomerDetailInfoDAO;
import cn.key.entity.CustomerDetailInfo;
import cn.key.entity.CustomerInfo;

public class IsLoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		CustomerInfo customer = (CustomerInfo) session.getAttribute("customer");
		String path = "/background/Error.jsp";
		String returnPath = "/egou/login.jsp";
		String title = "Äú»¹Ã»ÓÐµÇÂ¼£¬ÇëÄúÏÈµÇÂ¼";
		if(customer != null) {
			CustomerDetailInfoDAO dao = new CustomerDetailInfoDAO();
			CustomerDetailInfo detailInfo = dao.findById(customer.getCustomerId());
			request.setAttribute("customerDetail", detailInfo);
			path = "/orderForm.jsp";
		}
		request.setAttribute("title",title);
		request.setAttribute("returnPath",returnPath);
		request.getRequestDispatcher(path).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
