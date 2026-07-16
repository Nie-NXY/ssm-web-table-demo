package cn.key.servlet.sysAdminServlet;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.key.dao.SysAdminDAO;
import cn.key.entity.SysAdmin;


public class SaveSysAdminServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminName = request.getParameter("adminName");
		String pwd = request.getParameter("pwd");
		int states = Integer.parseInt(request.getParameter("states"));
		SysAdminDAO dao = new SysAdminDAO();
		SysAdmin admin = new SysAdmin(adminName, pwd, states);
		String path = "/Error.jsp";
		String returnPath = "/background/sysAdmin/saveSysAdmin.jsp";
		if (dao.save(admin)) {
			path = "/Success.jsp";
			returnPath = "/ShowSysAdminServlet";
		}
		request.setAttribute("title","ÐÂÔö");
		request.setAttribute("returnPath",returnPath);
		RequestDispatcher rd =  request.getRequestDispatcher("/background"+ path);
		rd.forward(request, response);
		
		
	}
}
