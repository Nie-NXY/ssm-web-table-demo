package cn.key.dao;


import java.sql.SQLException;
import java.util.List;
import java.util.Vector;




import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.SearchBook;
import cn.key.mapping.SearchBookMapping;



public class SearchBookDAO{
	JdbcTemplate template = new JdbcTemplate();
	public boolean save(SearchBook book) {
		int row = 0;
		String sql = "insert into searchBook(bookName,author,pbName,email,context) " +
					"	values(?,?,?,?,?)";
		Object[] objects = {book.getBookName(), book.getAuthor(), book.getPbName(), book.getEmail(), book.getContext()};
		try {
			 row = template.updata(sql, objects);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	public boolean delete(int id) {
		int row = 0;
		String sql = "delete searchBook from searchBook where sbId=?";
		try {
			row = template.updata(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	public List<SearchBook> findAll() {
		String sql = "select * from searchBook ";
		List<SearchBook> list = new Vector<SearchBook>();
		try {
			list = template.selete(sql, new SearchBookMapping());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}

