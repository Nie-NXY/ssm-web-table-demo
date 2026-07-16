package cn.key.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.BookStock;
import cn.key.mapping.BookStockMapping;

public class BookStockDAO {
	private JdbcTemplate template = new JdbcTemplate();
	public boolean save(BookStock book) {
		int row = 0;
		String sql = "insert into bookStock(bookId,bookCount,minNum) " +
						" values(?,?,?)";
		Object[] values = new Object[]{book.getBookId(), book.getBookCount(), book.getMinNum()};
		try {
			row = template.updata(sql, values);
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	
	public boolean updata(BookStock book) {
		
		String sql = "update bookStock " +
						" set bookId=?,bookCount=?,minNum=? " +
						" where stockId=?";
		int row = 0;
		Object[] values = new Object[]{book.getBookId(), book.getBookCount(), book.getMinNum(), book.getStockId()};
		try {
			row = template.updata(sql, values);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
//	public boolean upDelete(int type,int id) {
//		String sql = "update bookInfo" +
//						" set bookStates=" + type +
//						" where bookId=" + id;
//		int row = 0;
//		try {
//			row = template.updata(sql);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}
//		return (row == 1);
//	}
	public boolean delete(int id) {
		String sql = "delete bookStock from bookStock where stockId=" + id;
		int row = 0;
		try {
			row = template.updata(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	public BookStock findById(int id) {
		String sql = "select stockId,bookId,bookCount,minNum " +
						" from bookStock " +
						" where stockId=" + id;
		List<BookStock> list = new Vector<BookStock>();
		try {
			list = template.selete(sql, new BookStockMapping());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list.get(0);
	}
	public List<BookStock> findAll() {
		String sql = "select stockId,bookId,bookCount,minNum " +
						" from bookStock";
		
		List<BookStock> list = new Vector<BookStock>();
		try {
			list = template.selete(sql, new BookStockMapping());
			System.out.println(list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
