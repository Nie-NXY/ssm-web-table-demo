package cn.key.servlet.frontgroundServlet;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookDiscussDAO;
import cn.key.dao.CustomerInfoDAO;
import cn.key.entity.BookDiscuss;
import cn.key.entity.CustomerInfo;

public class ShowAllDiscussServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookName = request.getParameter("bookName");
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		BookDiscussDAO dao = new BookDiscussDAO();
		List<String> authors = new Vector<String>();
		List<BookDiscuss> discusses = dao.findByCusBookId(bookId);
		CustomerInfoDAO customerInfoDAO = new CustomerInfoDAO();
		for (BookDiscuss dis : discusses) {
			CustomerInfo info = customerInfoDAO.findById(dis.getCustomerId());
			authors.add(info.getCustomerName());
		}
		request.setAttribute("bookId", bookId);
		request.setAttribute("authors", authors);
		request.setAttribute("discusses", discusses);
		request.setAttribute("bookName", bookName);
		request.getRequestDispatcher("allDiscuss.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
