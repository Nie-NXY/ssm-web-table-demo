package cn.key.dbManager;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface IResultSetMapping {
	public Object mapping(ResultSet rs) throws SQLException ;
}
