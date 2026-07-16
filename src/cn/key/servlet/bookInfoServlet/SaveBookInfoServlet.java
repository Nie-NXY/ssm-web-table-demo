package cn.key.servlet.bookInfoServlet;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.Tools.DataTool;
import cn.key.dao.BookInfoDAO;
import cn.key.entity.BookInfo;

public class SaveBookInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookName = request.getParameter("bookName");
		String pbdate = request.getParameter("pbdate");
		String pbName = request.getParameter("pbName");
		String author = request.getParameter("author");
		String context = request.getParameter("context");
		String smallImg = request.getParameter("smallImg");
		String bigImg = request.getParameter("bigImg");
		int booktypeId = Integer.parseInt(request.getParameter("booktypeId"));
		int bookStates = Integer.parseInt(request.getParameter("bookStates"));
		float price = Float.parseFloat(request.getParameter("price"));
		float ygcprice = Float.parseFloat(request.getParameter("ygcprice"));
		BookInfoDAO dao = new BookInfoDAO();
		
		Date date = null;
		try {
			date = DataTool.stringtoDate(pbdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		BookInfo book = new BookInfo(bookName, booktypeId, pbName, author, context, smallImg, bigImg, price, date, bookStates, ygcprice);
		String path = "/Error.jsp";
		String returnPath = "/background/bookInfo/SaveBookInfo.jsp";
		if (dao.save(book)) {
			path = "/Success.jsp";
			returnPath = "/FindAllBookInfoServlet";
		}
		request.setAttribute("title","ÐÂÔö");
		request.setAttribute("returnPath",returnPath);
		RequestDispatcher rd =  request.getRequestDispatcher("/background"+ path);
		rd.forward(request, response);
		
		
	}

}
