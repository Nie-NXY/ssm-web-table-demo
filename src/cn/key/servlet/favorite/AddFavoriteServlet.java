package cn.key.servlet.favorite;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.Tools.DataTool;
import cn.key.dao.BookDiscussDAO;
import cn.key.dao.BookInfoDAO;
import cn.key.dao.CustomerInfoDAO;
import cn.key.dao.FavoriteDAO;
import cn.key.entity.BookInfo;
import cn.key.entity.CustomerInfo;
import cn.key.entity.Favorite;

public class AddFavoriteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		int customerId = 0;
		HttpSession session = request.getSession();
		CustomerInfo customer = (CustomerInfo) session.getAttribute("customer");
		String path = "/background/Error.jsp";
		String returnPath = "/egou/login.jsp";
		String title = "您还没有登录，请您先登录";
		FavoriteDAO favoriteDAO = new FavoriteDAO();
		if(customer != null) {
			if (favoriteDAO.findByBookId(bookId,customer.getCustomerId()) != null) {
				title = "收藏夹中已存在本条数目";
				returnPath = "/FindBookTypeServlet";
			}else {
				customerId = customer.getCustomerId();
				BookInfoDAO dao = new BookInfoDAO();
				BookInfo book = dao.findById(bookId);
				Date date = null;
				try {
					date = DataTool.allStringtoDate(DataTool.allDatetoString(new Date()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				Favorite favorite = new Favorite(book.getBookId(), book.getBookName(), customer.getCustomerId(), date, book.getContext());
				if(favoriteDAO.save(favorite)) {
					List<Favorite> favorites = favoriteDAO.findByCustomerId(customerId);
					request.setAttribute("favorites", favorites);
					path = "favorite.jsp";
				}else {
					title = "收藏书籍";
					returnPath = "/FindBookTypeServlet";
				}
			}
		}
		request.setAttribute("title",title);
		request.setAttribute("returnPath",returnPath);
		request.getRequestDispatcher(path).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
