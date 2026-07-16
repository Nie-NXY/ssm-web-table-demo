package cn.key.servlet.order;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.key.dao.CustomerDetailInfoDAO;
import cn.key.dao.OrderDetailDAO;
import cn.key.dao.OrderMainDAO;
import cn.key.dbManager.DBManager;
import cn.key.entity.CustomerDetailInfo;
import cn.key.entity.CustomerInfo;
import cn.key.entity.OrderDetail;
import cn.key.entity.OrderMain;
import cn.key.gwc.Gwc;
import cn.key.gwc.GwcItem;

public class OrderServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name").trim();
		String tel = request.getParameter("tel").trim();
		String address = request.getParameter("address").trim();
		int qq = 0;
		if (!("".equals(request.getParameter("qq").trim()))) {
			qq = Integer.parseInt(request.getParameter("qq").trim());
		}
		
		
		HttpSession session = request.getSession();
		Gwc gwc = (Gwc) session.getAttribute("gwc");
		float countMoney = gwc.getSum()[1];
		
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String oid = df.format(new Date());
		CustomerInfo customer = (CustomerInfo) session.getAttribute("customer");
		
		CustomerDetailInfoDAO infoDAO = new CustomerDetailInfoDAO();
		OrderMainDAO mainDAO = new OrderMainDAO();
		OrderDetailDAO detailDAO = new OrderDetailDAO();
		Collection<GwcItem> gwcItems = gwc.getItems();
		
		CustomerDetailInfo detailInfo = infoDAO.findById(customer.getCustomerId());
		if (detailInfo == null) {
			detailInfo = new CustomerDetailInfo(customer.getCustomerId(), name, tel, address, countMoney, qq);
			infoDAO.save(detailInfo);
		}
		
		OrderMain main = new OrderMain(oid, customer.getCustomerId(), countMoney, 1, name, tel, address);
		List<OrderDetail> details = new Vector<OrderDetail>();
		for (GwcItem item : gwcItems) {
			OrderDetail detail = new OrderDetail(oid, item.getBookId(), item.getBookName(), item.getYgcPrice(), item.getNum());
			details.add(detail);
		}
		Connection con = null;
		try {
			con = DBManager.getConnection();
			try {
				con.setAutoCommit(false);
				System.out.println(mainDAO.save(con,main));
				System.out.println(detailDAO.save(con,details));
				con.commit();
				request.setAttribute("title", "祝您购物愉快！您的订单已在处理中，请注意查收货物！");
				request.setAttribute("returnPath", "/FindBookTypeServlet");
				request.getRequestDispatcher("/background/Success.jsp").forward(request, response);
				session.removeAttribute("gwc");
			}  catch (SQLException e) {
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e2) {
			e2.printStackTrace();
		} catch (SQLException e2) {
			e2.printStackTrace();
		} 
	}
}
