package cn.key.servlet.frontgroundServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookInfoDAO;
import cn.key.entity.BookInfo;

public class FindBookInfoByIndexServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageCount = 0;
		int nowPage = 1;
		int pageSize = 3;
		String bookName = request.getParameter("bookName").trim();
		String author = request.getParameter("author").trim();
		String strNowPage = request.getParameter("nowPage").trim();
		if(strNowPage != null) {
			nowPage = Integer.parseInt(strNowPage);
		}
		BookInfoDAO dao = new BookInfoDAO();
		pageCount = dao.getPageCountByIndex(bookName, author, pageSize, 2);
		List<BookInfo> books = dao.getNowPageByAuthorBookName(bookName, author, nowPage, pageSize, 2);
		int size = dao.findByAuthorBookName(bookName, author).size();
		if (books.size() == 0) {
			request.setAttribute("title","查询不到相关书籍,请在【寻书公告】中填写信息");
			request.setAttribute("returnPath", "/FindBookTypeServlet");
			request.getRequestDispatcher("/background/Error.jsp").forward(request, response);
		}else {
			request.setAttribute("bookName", bookName);
			request.setAttribute("author", author);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("size", size);
			request.setAttribute("bookInfos", books);
			request.getRequestDispatcher("findView.jsp").forward(request, response);
		}
	}
}
