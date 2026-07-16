package cn.key.servlet.frontgroundServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.dao.BookInfoDAO;
import cn.key.entity.BookInfo;
import cn.key.gwc.Gwc;
import cn.key.gwc.GwcItem;

public class GwcServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		if ("add".equals(type)) {
			this.add(request, response);
		} else if ("delete".equals(type)) {
			this.delete(request, response);
		} else if ("updateNum".equals(type)) {
			this.updateNum(request, response);
		} else if ("clear".equals(type)) {
			this.clear(request, response);
		}
		response.sendRedirect(request.getContextPath() + "/gwc.jsp");
	}

	private void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		BookInfoDAO dao = new BookInfoDAO();
		BookInfo book = dao.findById(id);

		GwcItem item = new GwcItem(id, book.getBookName(), book.getPrice(),
				book.getYgcprice());
		item.setNum(1);
		HttpSession session = request.getSession();
		Gwc gwc = null;
		if (session.getAttribute("gwc") == null) {
			gwc = new Gwc();
		} else {
			gwc = (Gwc) session.getAttribute("gwc");
		}
		gwc.addBook(item);
		session.setAttribute("gwc", gwc);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Gwc gwc = (Gwc) session.getAttribute("gwc");
		gwc.delete(id);
		session.setAttribute("gwc", gwc);
	}

	private void updateNum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		Gwc gwc = (Gwc) session.getAttribute("gwc");
		gwc.updateNum(id, num);
		session.setAttribute("gwc", gwc);
	}

	private void clear(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Gwc gwc = (Gwc) session.getAttribute("gwc");
		gwc.clear();
		session.setAttribute("gwc", gwc);
	}
}
