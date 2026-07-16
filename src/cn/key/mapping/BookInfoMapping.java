package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.BookInfo;

public class BookInfoMapping implements IResultSetMapping{

	@Override
	public Object mapping(ResultSet rs) throws SQLException {
		int i = 1;
		BookInfo book = new BookInfo(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), 
									rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getFloat(i++), rs.getDate(i++),
									rs.getInt(i++), rs.getFloat(i++));
		return book;
	}
	
}
