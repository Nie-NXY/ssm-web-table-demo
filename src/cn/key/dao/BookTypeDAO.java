package cn.key.dao;


import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.BookType;
import cn.key.mapping.BookTypeMapping;

public class BookTypeDAO {
	private JdbcTemplate template = new JdbcTemplate();
	public boolean save(BookType bookType) {
		int row = 0;
		String sql = "insert  into  bookType(parentId, bookTypeName, context) values(?,?,?)";
		Object[] values = new Object[]{bookType.getParentId(), bookType.getBookTypeName(), bookType.getContext()};
		try {
			row = template.updata(sql, values);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	
	public boolean updata(BookType bookType) {
		String sql = "update bookType" +
						" set parentId=?,bookTypeName=?,context=?, isDelete=? " +
						" where bookTypeId=?";
		int row = 0;
		Object[] values = new Object[]{bookType.getParentId(), bookType.getBookTypeName(), bookType.getContext(), bookType.getIsDelete(), bookType.getBookTypeId()};
		try {
			row = template.updata(sql, values);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	public boolean upDelete(int id,int type) {
		String sql = "update bookType" +
						" set isDelete=?" +
						" where bookTypeId=" + id;
		int row = 0;
		Object[] valuse = new Object[]{type};
		try {
			row = template.updata(sql,valuse);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	public boolean delete(int id) {
		String sql = "delete bookType where bookTypeId=" + id;
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
	public BookType findById(int id) {
		String sql = "select bookTypeId,parentId,bookTypeName,isDelete,context from bookType where bookTypeId=" + id;
		List<BookType> list = new Vector<BookType>();
		try {
			list = template.selete(sql, new BookTypeMapping());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list.get(0);
	}
	
	public List<BookType> findByParentId(int id) {
		String sql = "select bookTypeId,parentId,bookTypeName,isDelete,context from bookType where parentId=" + id;
		List<BookType> list = new Vector<BookType>();
		try {
			list = template.selete(sql, new BookTypeMapping());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<BookType> findAll(int isDelete) {
		String sql = "select bookTypeId,parentId,bookTypeName,isDelete,context from booktype " +
						" where isDelete ";
		StringBuffer sb = new StringBuffer(sql);
		switch (isDelete) {
		case 1:
			sb.append(" =1 ");
			break;
		case 2:
			sb.append(" =2 ");
			break;
		default:
			sb.append(" <>3 ");
			break;
		}
		List<BookType> list = new Vector<BookType>();
		try {
			list = template.selete(sb.toString(), new BookTypeMapping());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
