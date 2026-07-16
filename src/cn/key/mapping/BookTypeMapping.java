package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.BookType;

public class BookTypeMapping implements IResultSetMapping{

	@Override
	public BookType mapping(ResultSet rs) throws SQLException {
		int i = 1;
		BookType bookType = new BookType(rs.getInt(i++), rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++));
		return bookType;
	}
}
