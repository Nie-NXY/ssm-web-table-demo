package cn.key.servlet.discuss;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookDiscussDAO;
import cn.key.entity.BookDiscuss;

public class ShowDiscussServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookDiscussDAO dao = new BookDiscussDAO();
		List<BookDiscuss> discusses = dao.findAll();
		request.setAttribute("discusses", discusses);
		request.getRequestDispatcher("background/discuss/showDiscuss.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
