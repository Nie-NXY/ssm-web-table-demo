package cn.key.servlet.bookTypeServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookTypeDAO;
import cn.key.entity.BookType;

public class UpdataBookTypeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		int bookTypeId = Integer.parseInt(request.getParameter("bookTypeId"));
		int parentId = Integer.parseInt(request.getParameter("parentId"));
		int isDelete = Integer.parseInt(request.getParameter("isDelete"));
		String bookTypeName = request.getParameter("bookTypeName");
		String context = request.getParameter("context");
		BookTypeDAO dao = new BookTypeDAO();
		BookType bookType = new BookType(bookTypeId, parentId, bookTypeName, isDelete, context);		
		
		
		String path = "/Error.jsp";
		String returnPath = "/FindBookTypeByIdServlet?bookTypeId=" + bookTypeId;
		if (dao.updata(bookType)) {
			path = "/Success.jsp";
			returnPath = "/FindAllBookTypeServlet";
		}
		request.setAttribute("title","¸üÐÂ");
		request.setAttribute("returnPath",returnPath);
		RequestDispatcher rd =  request.getRequestDispatcher("/background"+ path);
		rd.forward(request, response);
	}
}
