package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.BookStock;

public class BookStockMapping implements IResultSetMapping{

	@Override
	public Object mapping(ResultSet rs) throws SQLException {
		int i = 1;
		BookStock bookStock = new BookStock(rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++));
		return bookStock;
	}
	
}
