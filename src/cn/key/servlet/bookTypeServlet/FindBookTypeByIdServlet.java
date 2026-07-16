package cn.key.servlet.bookTypeServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookTypeDAO;
import cn.key.entity.BookType;

public class FindBookTypeByIdServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookTypeId = Integer.parseInt(request.getParameter("bookTypeId"));
		BookTypeDAO dao = new BookTypeDAO();
		BookType bookType = new BookType();
		bookType = dao.findById(bookTypeId);
		
		
		request.setAttribute("bookType", bookType);
		RequestDispatcher rd = request.getRequestDispatcher("/background/bookType/UpdataBookType.jsp");
		rd.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		this.doGet(request, response);
	}

}
