package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.OrderMain;

public class OrderMianMapping implements IResultSetMapping{

	@Override
	public Object mapping(ResultSet rs) throws SQLException {
		int i = 1;
		OrderMain main = new OrderMain(rs.getString(i++), rs.getInt(i++), rs.getFloat(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++));
		return main;
	}

}
