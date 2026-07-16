package cn.key.servlet.bookTypeServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.key.dao.BookTypeDAO;

public class DeUpdateIsDeleteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookTypeId = Integer.parseInt(request.getParameter("bookTypeId"));
		BookTypeDAO dao = new BookTypeDAO();
		
		String path = "/Error.jsp";
		String returnPath = "/FindAllBookTypeServlet";
		if(dao.upDelete(bookTypeId, 2)) {
			path = "/Success.jsp";
		}
		request.setAttribute("title","设置不可用");
		request.setAttribute("returnPath",returnPath);
		RequestDispatcher rd =  request.getRequestDispatcher("/background"+ path);
		rd.forward(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		this.doGet(request, response);
	}

}
