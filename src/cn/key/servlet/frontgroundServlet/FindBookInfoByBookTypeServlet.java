package cn.key.servlet.frontgroundServlet;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookInfoDAO;
import cn.key.dao.BookTypeDAO;
import cn.key.entity.BookInfo;
import cn.key.entity.BookType;

public class FindBookInfoByBookTypeServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookTypeId = Integer.parseInt(request.getParameter("bookTypeId"));
		int nowPage = 1;
		int pageCount = 0;
		int pageSize = 3;
		final int bookStates = 2;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage").trim());
		}
		
		BookInfoDAO dao = new BookInfoDAO();
		List<BookInfo> bookInfos = new Vector<BookInfo>();
		pageCount = dao.getForPageCount(pageSize, bookStates, bookTypeId);
		bookInfos = dao.findNowPageDataByTypeId(pageSize, nowPage, bookStates, bookTypeId);
		int size = dao.findByTypeId(bookTypeId).size();
		
		BookTypeDAO typeDao = new BookTypeDAO();
		BookType type = typeDao.findById(bookTypeId);
		
		request.setAttribute("bookInfos", bookInfos);
		request.setAttribute("booktype", type);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("size", size);
		request.setAttribute("bookTypeId", bookTypeId);
		request.getRequestDispatcher("/showTitleTwo.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
