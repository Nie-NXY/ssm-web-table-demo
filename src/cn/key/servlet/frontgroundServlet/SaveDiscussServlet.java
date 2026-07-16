package cn.key.servlet.frontgroundServlet;


import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.Tools.DataTool;
import cn.key.dao.BookDiscussDAO;
import cn.key.entity.BookDiscuss;
import cn.key.entity.CustomerInfo;

public class SaveDiscussServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String context = request.getParameter("context");
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		String bookName = request.getParameter("bookName");
		Date writeData = null;
		try {
			writeData = DataTool.allStringtoDate(DataTool.allDatetoString(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		CustomerInfo customer = (CustomerInfo) session.getAttribute("customer");
		BookDiscuss discuss = new BookDiscuss(bookId, customer.getCustomerId(), context, writeData, 1);
		BookDiscussDAO dao = new BookDiscussDAO();
		String title = "∑¢±Ì∆¿¬€ ß∞‹£°";
		String path = "/background/Error.jsp";
		String returnPath = "/WriteDiscussServlet?bookId=" + bookId + "&bookName=" + bookName;
		if(dao.save(discuss)) {
			path = "/ShowBookInfoByIdServlet?bookId=" + bookId;
		}
		request.setAttribute("title",title);
		request.setAttribute("returnPath",returnPath);
		request.getRequestDispatcher(path).forward(request, response);
	}

}
