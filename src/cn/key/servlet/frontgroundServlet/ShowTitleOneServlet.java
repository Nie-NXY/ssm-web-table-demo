package cn.key.servlet.frontgroundServlet;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookTypeDAO;
import cn.key.entity.BookType;

public class ShowTitleOneServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookTypeId = Integer.parseInt(request.getParameter("bookTypeId").trim());
		String typeOne = request.getParameter("typeOne").toString();
		System.out.println(typeOne);
		BookTypeDAO dao = new BookTypeDAO();
		List<BookType> types = new Vector<BookType>();
		types = dao.findByParentId(bookTypeId);
		System.out.println("types.size = " + types.size());
		request.setAttribute("typeOne", typeOne);
		request.setAttribute("bookTypes", types);
		request.getRequestDispatcher("showTitleOne.jsp").forward(request, response);
	}

}
