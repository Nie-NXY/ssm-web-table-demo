package cn.key.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import cn.key.Tools.DataTool;
import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.BookDiscuss;
import cn.key.mapping.BookDiscussMapping;

public class BookDiscussDAO {
	private JdbcTemplate template = new JdbcTemplate();
	public boolean save(BookDiscuss info) {
		int row = 0;
		String sql = "insert into bookDiscuss(bookId,customerId,context,writeData,states) " +
						" values(?,?,?,?,?)";
		String strData = DataTool.allDatetoString(info.getWriteData());
		Object[] values = new Object[]{info.getBookId(), info.getCustomerId(), info.getContext(), strData, info.getStates()};
		try {
			row = template.updata(sql, values);
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	
	public boolean updata(BookDiscuss info) {
		String sql = "update bookDiscuss " +
						" set bookId=?,customerId=?,context=?,states=? " +
						" where disId=?";
		Object[] values = new Object[]{info.getBookId(), info.getCustomerId(), info.getContext(), info.getStates(), info.getDisId()};
		int row = 0;
		try {
			row = template.updata(sql, values);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	public boolean updata(int id ,int states) {
		String sql = "update bookDiscuss " +
						" set states=? " +
						" where disId=?";
		int row = 0;
		try {
			row = template.updata(sql, states, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
//	public boolean upDelete(int type,int id) {
//		String sql = "update userInfo set userType=" + type + " where userId=" + id;
//		int row = 0;
//		
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
		String sql = "delete bookDiscuss from bookDiscuss where disId=?";
		int row = 0;
		try {
			row = template.updata(sql, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	public BookDiscuss findById(int id) {
		String sql = "select * " +
						" from bookDiscuss " +
						" where disId=" + id;
		List<BookDiscuss> list = new Vector<BookDiscuss>();
		BookDiscuss dis = null;
		try {
			list = template.selete(sql, new BookDiscussMapping());
			if (list.size() != 0) {
				dis = list.get(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dis;
	}
	
	//type 1 按顾客Id查找评论    2 按书号 查找评论
 	public List<BookDiscuss> findByCusBookId(int bookId) {
		String sql = "select * " +
						" from bookDiscuss " +
						" where states=1 and bookId=? " +
						" order by disId desc ";
		StringBuffer sb = new StringBuffer(sql);
		/*switch (type) {
		case 1:
			sb.append(" customerId=" + id);
			break;
		case 2:
			sb.append(" bookId=" + id);
			break;
		default:
			break;
		}*/
		List<BookDiscuss> list = new Vector<BookDiscuss>();
		try {
			list = template.selete(sb.toString(), new BookDiscussMapping(),bookId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDiscuss> findAll() {
		String sql = "select * " +
						" from bookDiscuss ";
		List<BookDiscuss> list = new Vector<BookDiscuss>();
		try {
			list = template.selete(sql, new BookDiscussMapping());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
