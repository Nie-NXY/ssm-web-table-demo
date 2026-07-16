package cn.key.servlet.favorite;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.FavoriteDAO;

public class ClearFavoriteServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		FavoriteDAO favoriteDAO = new FavoriteDAO();
		String title = "«Âø’ ’≤ÿº–";
		String path = "/background/Error.jsp";
		String returnPath = "/ShowMyFavoriteServlet";
		if(favoriteDAO.deleteAll(id)) {
			response.sendRedirect(request.getContextPath() + "/ShowMyFavoriteServlet");
		}else {
			request.setAttribute("title",title);
			request.setAttribute("returnPath",returnPath);
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}