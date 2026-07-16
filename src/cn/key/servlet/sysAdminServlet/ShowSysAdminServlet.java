package cn.key.servlet.sysAdminServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.SysAdminDAO;
import cn.key.entity.SysAdmin;


public class ShowSysAdminServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		SysAdminDAO dao = new SysAdminDAO();
		List<SysAdmin> list = dao.findAll();	
		request.setAttribute("sysAdmins", list);
		RequestDispatcher rd = request.getRequestDispatcher("/background/sysAdmin/findSysAdminList.jsp");
		rd.forward(request, response);
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		this.doGet(request, response);
	}
	
}
