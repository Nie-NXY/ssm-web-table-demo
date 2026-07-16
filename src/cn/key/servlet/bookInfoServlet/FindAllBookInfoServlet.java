package cn.key.servlet.bookInfoServlet;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookInfoDAO;
import cn.key.entity.BookInfo;

public class FindAllBookInfoServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageCount = 0;
		int nowPage = 1;
		int bookStates = 5;
		int pageSize = 4;
		if (request.getParameter("bookStates") != null) {
			bookStates = Integer.parseInt(request.getParameter("bookStates"));
		}
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		List<BookInfo> list = new Vector<BookInfo>();
		BookInfoDAO dao = new BookInfoDAO();
		pageCount = dao.getPageCount(pageSize, bookStates);
		list = dao.findNowPageData(pageSize, nowPage, bookStates);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("bookStates", bookStates);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("bookInfo", list);
		RequestDispatcher rd = request.getRequestDispatcher("/background/bookInfo/FindAllBookInfoList.jsp");
		rd.forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
