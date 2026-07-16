package cn.key.servlet.discuss;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookDiscussDAO;

public class UpDissStatesServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("disId"));
		int states = Integer.parseInt(request.getParameter("states"));
		BookDiscussDAO dao = new BookDiscussDAO();
		String path = "/Error.jsp";
		String returnPath = "/ShowDiscussServlet";
		if (dao.updata(id, states)) {
			path = "/Success.jsp";
		}
		request.setAttribute("title","书评设置不通过");
		request.setAttribute("returnPath",returnPath);
		request.getRequestDispatcher("/background"+ path).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
