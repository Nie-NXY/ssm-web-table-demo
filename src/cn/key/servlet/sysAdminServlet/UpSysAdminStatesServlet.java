package cn.key.servlet.sysAdminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.key.dao.SysAdminDAO;

public class UpSysAdminStatesServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("adminId"));
		int states = Integer.parseInt(request.getParameter("states"));
		SysAdminDAO dao = new SysAdminDAO();
		String path = "/Error.jsp";
		String returnPath = "/ShowSysAdminServlet";
		if(dao.updata(id, states)) {
			path = "/Success.jsp";
		}
		request.setAttribute("title","管理员权限设置");
		request.setAttribute("returnPath",returnPath);
		request.getRequestDispatcher("/background"+ path).forward(request, response);
	}
		
		
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
