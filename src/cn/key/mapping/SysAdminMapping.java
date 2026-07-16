package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.SysAdmin;

public class SysAdminMapping implements IResultSetMapping{

	@Override
	public Object mapping(ResultSet rs) throws SQLException {
		int i = 1;
		SysAdmin admin = new SysAdmin(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++));
		return admin;
	}

}
