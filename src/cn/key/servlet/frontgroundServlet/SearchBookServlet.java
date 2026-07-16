package cn.key.servlet.frontgroundServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.SearchBookDAO;
import cn.key.entity.SearchBook;

public class SearchBookServlet extends HttpServlet {

		public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String bookName = request.getParameter("bookName");
			String author = request.getParameter("author");
			String pbName = request.getParameter("pbName");
			String email = request.getParameter("email");
			String context = request.getParameter("context");
			SearchBook book = new SearchBook(bookName, author, pbName, email, context);
			System.out.println(book);
			SearchBookDAO dao = new SearchBookDAO();
			String path = "/Error.jsp";
			String title = "请您填写正确的图书信息！";
			if(dao.save(book)) {
				path = "/Success.jsp";
				title = "您提交的信息我们已经收到，请您耐心等待，关注我们的新增图书信息！";
			}
			request.setAttribute("title",title);
			request.setAttribute("returnPath","/FindBookTypeServlet");
			RequestDispatcher rd =  request.getRequestDispatcher(request.getContextPath() + "/background"+ path);
			rd.forward(request, response);
			
		}

}
