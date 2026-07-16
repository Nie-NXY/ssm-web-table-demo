package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.BookDiscuss;

public class BookDiscussMapping implements IResultSetMapping{

	@Override
	public BookDiscuss mapping(ResultSet rs) throws SQLException {
		int i = 1;
		BookDiscuss bookDiscuss = new BookDiscuss(rs.getInt(i++),rs.getInt(i++), rs.getInt(i++), rs.getString(i++), rs.getDate(i++), rs.getInt(i++));
		return bookDiscuss;
	}
}
