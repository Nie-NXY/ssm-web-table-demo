package cn.key.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.SysAdmin;
import cn.key.mapping.SysAdminMapping;

public class SysAdminDAO {
	private JdbcTemplate template = new JdbcTemplate();
	public boolean save(SysAdmin admin) {
		int row = 0;
		String sql = "insert into sysAdmin(adminName,pwd,adminType) " +
					"	values(?,?,?) ";
		Object[] values = new Object[]{admin.getAdminName(), admin.getPwd(), admin.getAdminType()};
		try {
			row = template.updata(sql, values);
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	
	public boolean updata(int adminId, int type) {
		
		String sql = "update sysAdmin " +
					"	set adminType=? " +
					"	where adminId=? ";
		int row = 0;
		try {
			row = template.updata(sql, type, adminId);
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
		String sql = "delete sysAdmin from sysAdmin where adminId=? ";
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
	
	public SysAdmin findByNameAndPwd(String name, String pwd) {
		String sql = "select * from sysAdmin " +
					"	where adminName=? and pwd=?";
		SysAdmin admin = null;
		List<SysAdmin> list = new Vector<SysAdmin>();
		try {
			list = template.selete(sql, new SysAdminMapping(), name, pwd);
			if (list.size() != 0) {
				admin = list.get(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return admin;
	}
	
	public SysAdmin findById(int id) {
		String sql = "select * from sysAdmin where adminId=? ";
		List<SysAdmin> list = new Vector<SysAdmin>();
		try {
			list = template.selete(sql, new SysAdminMapping(), id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list.get(0);
	}
	public List<SysAdmin> findAll() {
		String sql = "select * from sysAdmin";
		
		List<SysAdmin> list = new Vector<SysAdmin>();
		try {
			list = template.selete(sql, new SysAdminMapping());
			System.out.println(list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
