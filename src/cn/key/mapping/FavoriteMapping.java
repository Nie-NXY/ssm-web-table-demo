package cn.key.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.key.dbManager.IResultSetMapping;
import cn.key.entity.Favorite;

public class FavoriteMapping implements IResultSetMapping{

	@Override
	public Object mapping(ResultSet rs) throws SQLException {
		int i = 1;
		Favorite favorite = new Favorite(rs.getInt(i++), rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getDate(i++), rs.getString(i++));
		return favorite;
	}

}
