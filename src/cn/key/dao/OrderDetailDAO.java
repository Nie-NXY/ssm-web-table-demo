package cn.key.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.OrderDetail;
import cn.key.mapping.OrderDetailMapping;

public class OrderDetailDAO {
	JdbcTemplate template = new JdbcTemplate();
	public boolean save(Connection connection, List<OrderDetail> details){
		boolean row = true;
		Connection con = connection;
		PreparedStatement sta = null;
		String sql = "insert into orderDetail(oid,bookId,bookName,ygcprice,Num) " +
					"	values(?,?,?,?,?)";
		try {
			sta = con.prepareStatement(sql);
			for (OrderDetail detail : details) {
				int i = 1;
				sta.setString(i++,detail.getOid());
				sta.setInt(i++,detail.getBookId());
				sta.setString(i++,detail.getBookName());
				sta.setFloat(i++, detail.getYgcprice());
				sta.setInt(i++,detail.getNum());
				sta.addBatch();
			}
			sta.executeBatch();
		} catch (SQLException e) {
			row = false;
			e.printStackTrace();
		}
		return row;
	}
	
	
	
	public boolean update() {
		return false;
	}
	public boolean delete() {
		return false;
	}
	public List<OrderDetail> findById(String id) {
		String sql = "select * from orderDetail" +
					"	where oid=?";
		List<OrderDetail> list = null;
		try {
			list = template.selete(sql, new OrderDetailMapping(), id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<OrderDetail> findAll() {
		String sql = "select * from orderDetail";
		List<OrderDetail> list = null;
		try {
		list = template.selete(sql, new OrderDetailMapping());
		} catch (SQLException e) {
		e.printStackTrace();
		}
		return list;
	}
}