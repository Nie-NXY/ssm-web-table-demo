package cn.key.servlet.favorite;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.dao.FavoriteDAO;
import cn.key.entity.CustomerInfo;
import cn.key.entity.Favorite;

public class ShowMyFavoriteServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		CustomerInfo customer = (CustomerInfo) session.getAttribute("customer");
		String path = "/background/Error.jsp";
		String returnPath = "/egou/login.jsp";
		String title = "Äú»¹Ã»ÓÐµÇÂ¼£¬ÇëÄúÏÈµÇÂ¼";
		FavoriteDAO favoriteDAO = new FavoriteDAO();
		if(customer != null) {
			List<Favorite> list = favoriteDAO.findByCustomerId(customer.getCustomerId());
			request.setAttribute("favorites", list);
			path = "favorite.jsp";
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
