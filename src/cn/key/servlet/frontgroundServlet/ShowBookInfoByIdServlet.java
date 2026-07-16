package cn.key.servlet.frontgroundServlet;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookDiscussDAO;
import cn.key.dao.BookInfoDAO;
import cn.key.entity.BookDiscuss;
import cn.key.entity.BookInfo;

public class ShowBookInfoByIdServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		BookInfo book = new BookInfo();
		BookInfoDAO dao = new BookInfoDAO();
		book = dao.findById(bookId);
		
		List<BookDiscuss> dis = new Vector<BookDiscuss>();
		BookDiscussDAO disDAO = new BookDiscussDAO();
		dis = disDAO.findByCusBookId(bookId);
		
		request.setAttribute("book", book);
		request.setAttribute("bookDiscuss", dis);
		RequestDispatcher rd = request.getRequestDispatcher("/bookInfomation.jsp");
		rd.forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		this.doGet(request, response);
	}

}
