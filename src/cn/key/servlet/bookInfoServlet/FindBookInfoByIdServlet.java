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
import cn.key.dao.BookTypeDAO;
import cn.key.entity.BookInfo;
import cn.key.entity.BookType;

public class FindBookInfoByIdServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		BookInfo book = new BookInfo();
		BookInfoDAO dao = new BookInfoDAO();
		book = dao.findById(bookId);
		
		BookTypeDAO typeDAO = new BookTypeDAO();
		List<BookType> bookType1s = new Vector<BookType>();
		List<BookType> bookType2s = new Vector<BookType>();
		List<BookType> bookTypes = new Vector<BookType>();
		bookType1s = typeDAO.findByParentId(0);
		for (BookType bookType : bookType1s) {
			bookType2s = typeDAO.findByParentId(bookType.getBookTypeId());
			for (BookType type : bookType2s) {
				bookTypes.add(type);
			}
		}
		
		request.setAttribute("bookTypes", bookTypes);
		request.setAttribute("book", book);
		RequestDispatcher rd = request.getRequestDispatcher("/background/bookInfo/UpdataBookInfo.jsp");
		rd.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
