package cn.key.servlet.bookInfoServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.SearchBookDAO;
import cn.key.entity.SearchBook;

public class FindInfoByCustomerServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SearchBookDAO dao = new SearchBookDAO();
		List<SearchBook> searchBooks = dao.findAll();
		request.setAttribute("searchBooks", searchBooks);
		request.getRequestDispatcher("background/search.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
