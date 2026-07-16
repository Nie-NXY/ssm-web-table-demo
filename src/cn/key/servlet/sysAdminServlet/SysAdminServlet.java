package cn.key.servlet.sysAdminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.dao.SysAdminDAO;
import cn.key.entity.SysAdmin;

public class SysAdminServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		SysAdminDAO dao = new SysAdminDAO();
		SysAdmin admin = dao.findByNameAndPwd(name, pwd);
		System.out.println(admin);
		HttpSession session = request.getSession();
		if (admin != null) {
			session.setAttribute("sysAdmin", admin);
		}
		response.sendRedirect(request.getContextPath() + "/background/index.jsp");
	}
}
