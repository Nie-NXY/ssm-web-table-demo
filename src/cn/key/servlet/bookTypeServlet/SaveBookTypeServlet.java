package cn.key.servlet.bookTypeServlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.BookTypeDAO;
import cn.key.entity.BookType;

public class SaveBookTypeServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		int parentId = Integer.parseInt(request.getParameter("parentId"));
		int isDelete = Integer.parseInt(request.getParameter("isDelete"));
		String bookTypeName = request.getParameter("bookTypeName");
		String context = request.getParameter("context");
		BookTypeDAO dao = new BookTypeDAO();
		BookType bookType = new BookType(parentId, bookTypeName, isDelete, context);
		
		String path = "/Error.jsp";
		String returnPath = "/background/bookType/SaveBookType.jsp";
		if (dao.save(bookType)) {
			path = "/Success.jsp";
			returnPath = "/FindAllBookTypeServlet";
		}
		request.setAttribute("title","ÐÂÔö");
		request.setAttribute("returnPath",returnPath);
		RequestDispatcher rd =  request.getRequestDispatcher("/background"+ path);
		rd.forward(request, response);
	}

}
