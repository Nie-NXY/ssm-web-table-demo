package cn.key.dao;

import java.sql.SQLException;
import java.util.List;

import cn.key.Tools.DataTool;
import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.Favorite;
import cn.key.mapping.FavoriteMapping;

public class FavoriteDAO {
	JdbcTemplate template = new JdbcTemplate();
	public boolean save(Favorite favorite) {
		int row = 0;
		String sql = " insert into favorite(bookId,bookName,customerId,date,context)" +
					"   values(?,?,?,?,?)";
		String strDate = DataTool.datetoString(favorite.getDate()); 
		Object[] values = {favorite.getBookId(), favorite.getBookName(), favorite.getCustomerId(), strDate, favorite.getContext()};
		try {
			row = template.updata(sql, values);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	public boolean delete(int id) {
		int row = 0;
		String sql = "delete favorite from favorite where favoriteId=?";
		try {
			row = template.updata(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	public boolean deleteAll(int id) {
		int row = 0;
		String sql = "delete favorite from favorite where customerId=?";
		try {
			row = template.updata(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	public Favorite findByBookId(int bookId, int customerId) {
		List<Favorite> lists = null;
		Favorite favorite = null;
		String sql = "select * from favorite where bookId=? and customerId=?";
		try {
			lists = template.selete(sql, new FavoriteMapping(), bookId,customerId);
			if(lists.size() != 0) {
				favorite = lists.get(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return favorite;
	}
	
	public List<Favorite> findByCustomerId(int customerId) {
		List<Favorite> lists = null;
		String sql = "select * from favorite where customerId=?";
		try {
			lists = template.selete(sql, new FavoriteMapping(), customerId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
}
