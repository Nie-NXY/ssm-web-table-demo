package cn.key.servlet.sysAdminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.SysAdminDAO;
import cn.key.entity.SysAdmin;

public class FindByIdSysAdminServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("adminId"));
		SysAdmin admin = new SysAdmin();
		SysAdminDAO dao = new SysAdminDAO();
		admin = dao.findById(id);
		request.setAttribute("admin", admin);
		request.getRequestDispatcher("/background/sysAdmin/upSysAdminStates.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}