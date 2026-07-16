package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.CustomerDetailInfo;

public class CustomerDetailInfoMapping implements IResultSetMapping{

	@Override
	public Object mapping(ResultSet rs) throws SQLException {
		int i = 1;
		CustomerDetailInfo info = new CustomerDetailInfo(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getFloat(i++), rs.getInt(i++));
		return info;
	}

}
