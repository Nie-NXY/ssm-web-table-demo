package cn.key.servlet.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.OrderMainDAO;

public class UpOrderStatesServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oid = request.getParameter("oid");
		int states = Integer.parseInt(request.getParameter("states"));
		OrderMainDAO dao = new OrderMainDAO();
		String path = "/Error.jsp";
		String returnPath = "/OrderMakeServlet";
		if (dao.update(oid, states)) {
			path = "/Success.jsp";
		}
		request.setAttribute("title","∂©µ•¥¶¿Ì");
		request.setAttribute("returnPath",returnPath);
		request.getRequestDispatcher("/background"+ path).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
