package cn.key.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.OrderMain;
import cn.key.mapping.OrderMianMapping;

public class OrderMainDAO {
	JdbcTemplate template = new JdbcTemplate();
	public boolean save(Connection connection, OrderMain main) {
		Connection con = connection;
		PreparedStatement sta = null;
		int row = 0;
		String sql = "insert into orderMain(oid,customerId,moneyCount,sates,shouName,shouTel,shouAddress) " +
					"	values(?,?,?,?,?,?,?)";
		Object[] values = {main.getOid(), main.getCustomerId(), main.getMoneyCount(), main.getSates(), main.getShouName(), main.getShouTel(), main.getShouAddress()};
		try {
			sta = con.prepareStatement(sql);
			for (int i = 0; i < values.length; i++) {
				sta.setObject(i + 1, values[i]);
			}
			row = sta.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	public boolean update(String oid, int states) {
		int row = 0;
		String sql = "update orderMain " +
					"	set sates=? " +
					"	where oid=? ";
		try {
			row = template.updata(sql, states, oid);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	public boolean delete() {
		return false;
	}
	public List<OrderMain> findById(int id) {
		String sql = "select * from orderMain" +
					"	where customerId=?";
		List<OrderMain> list = null;
		try {
			list = template.selete(sql, new OrderMianMapping(), id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<OrderMain> findAll() {
		String sql = "select * from orderMain";
		List<OrderMain> list = null;
		try {
		list = template.selete(sql, new OrderMianMapping());
		} catch (SQLException e) {
		e.printStackTrace();
		}
		return list;
	}
}
