package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.OrderDetail;

public class OrderDetailMapping implements IResultSetMapping{

	@Override
	public Object mapping(ResultSet rs) throws SQLException {
		int i = 1;
		OrderDetail detail = new OrderDetail(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getFloat(i++), rs.getInt(i++));
		return detail;
	}
	
}
