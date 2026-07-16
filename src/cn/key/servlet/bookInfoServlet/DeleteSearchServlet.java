package cn.key.servlet.bookInfoServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.SearchBookDAO;


public class DeleteSearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("sbId"));
		SearchBookDAO dao = new SearchBookDAO();
		String path = "/Error.jsp";
		String returnPath = "/FindInfoByCustomerServlet";
		if (dao.delete(id)) {
			path = "/Success.jsp";
		}
		request.setAttribute("title","…æ≥˝—∞ È–≈œ¢");
		request.setAttribute("returnPath",returnPath);
		request.getRequestDispatcher("/background"+ path).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
