package cn.key.servlet.bookTypeServlet;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookTypeDAO;
import cn.key.entity.BookType;

public class FindAllBookTypeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int isDelete = 1;
		if(request.getParameter("isDelete") != null) {
			isDelete = Integer.parseInt(request.getParameter("isDelete"));
		}
		BookTypeDAO dao = new BookTypeDAO();
		List<BookType> list = new Vector<BookType>();
		list = dao.findAll(isDelete);
		request.setAttribute("bookType", list);
		RequestDispatcher rd = request.getRequestDispatcher("/background/bookType/BookTypeList.jsp");
		rd.forward(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		this.doGet(request, response);
	}

}
