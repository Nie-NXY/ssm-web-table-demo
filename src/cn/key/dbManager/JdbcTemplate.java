package cn.key.dbManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;


public class JdbcTemplate {
	public int updata(String sql, Object... values) throws SQLException, ClassNotFoundException {
		System.out.println(sql);
		int row = 0;
		PreparedStatement sta = null;
		try {
			Connection connection = DBManager.getConnection();
			sta = connection.prepareStatement(sql);
			for (int i = 0; i < values.length; i++) {
				sta.setObject(i + 1, values[i]);
			}
			row = sta.executeUpdate();
		} finally {
			if (sta != null) {
				sta.close();
				sta = null;
			}
		}
		return row;
	}

	
	@SuppressWarnings("rawtypes")
	public List selete(String sql, IResultSetMapping mapping, Object... values) throws SQLException {
		System.out.println(sql);
		List<Object> list = new Vector<Object>();
		PreparedStatement sta = null;
		ResultSet rs = null;
		
		try {
			Connection connection = DBManager.getConnection();
			sta = connection.prepareStatement(sql);
			for (int i = 0; i < values.length; i++) {
				sta.setObject(i + 1, values[i]);
			}
			rs = sta.executeQuery();
			while(rs.next()) {
				list.add(mapping.mapping(rs));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (sta != null) {
				sta.close();
				sta = null;
			}
			
		}
		return list;
	}
	
	
	public int select(String sql) throws SQLException {
		int rows = 0;
		PreparedStatement sta = null;
		ResultSet rs = null;
		
		try {
			Connection connection = DBManager.getConnection();
			sta = connection.prepareStatement(sql);
			rs = sta.executeQuery();
			if(rs.next()) {
				rows = rs.getInt(1);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (sta != null) {
				sta.close();
				sta = null;
			}
		}
		return rows;
	}
}
