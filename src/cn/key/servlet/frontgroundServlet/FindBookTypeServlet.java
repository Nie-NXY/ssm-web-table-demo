package cn.key.servlet.frontgroundServlet;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.dao.BookInfoDAO;
import cn.key.dao.BookTypeDAO;
import cn.key.entity.BookInfo;
import cn.key.entity.BookType;

public class FindBookTypeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookTypeDAO dao = new BookTypeDAO();
		List<BookType> bookTypes = new Vector<BookType>();
		bookTypes = dao.findByParentId(0);
		
		BookInfoDAO infoDAO = new BookInfoDAO();
		List<BookInfo> bookInfos = new Vector<BookInfo>();
		bookInfos = infoDAO.findAll(2);
		
		HttpSession session = request.getSession();
		session.setAttribute("bookTypes", bookTypes);
		request.setAttribute("bookInfos", bookInfos);
		request.getRequestDispatcher("index.jsp").forward(request, response);
//		request.getRequestDispatcher("fgLeft.jsp").forward(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		this.doGet(request, response);
	}

}
