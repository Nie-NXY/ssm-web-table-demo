package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.CustomerInfo;

public class CustomerInfoMapping implements IResultSetMapping{

	@Override
	public Object mapping(ResultSet rs) throws SQLException {
		int i = 1;
		CustomerInfo customerInfo = new CustomerInfo(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++));
		return customerInfo;
	}

}
