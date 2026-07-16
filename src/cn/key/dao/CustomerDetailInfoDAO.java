package cn.key.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.CustomerDetailInfo;
import cn.key.mapping.CustomerDetailInfoMapping;


public class CustomerDetailInfoDAO {
	private JdbcTemplate template = new JdbcTemplate();
	public boolean save(CustomerDetailInfo info) {
		int row = 0;
		String sql = "insert into customerDetailInfo(customerId,realname,tel,address,countManey,qq)" +
					"	values(?,?,?,?,?,?)";
		Object[] values = new Object[]{info.getCustomerId(), info.getRealname(), info.getTel(), info.getAddress(), info.getCountManey(), info.getQq()};
		try {
			row = template.updata(sql, values);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	
	public boolean updata(CustomerDetailInfo info) {
		String sql = "update customerDetailInfo " +
						" set realname=?,tel=?,address=?,countManey=?,qq=?" +
						" where customerId=?";
		int row = 0;
		Object[] values = new Object[]{info.getRealname(), info.getTel(), info.getAddress(), info.getCountManey(), info.getQq(), info.getCustomerId()};
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
		String sql = "delete customerDetailInfo " +
						" from customerDetailInfo " +
						" where customerId=" + id;
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
	public CustomerDetailInfo findById(int id) {
		String sql = "select * from customerDetailInfo where customerId=" + id;
		CustomerDetailInfo detailInfo = null;
		try {
			List<CustomerDetailInfo> list = template.selete(sql, new CustomerDetailInfoMapping());
			if (list.size() != 0) {
				detailInfo = list.get(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return detailInfo;
	}
	public List<CustomerDetailInfo> findAll() {
		String sql = "select * from customerDetailInfo";
		List<CustomerDetailInfo> list = new Vector<CustomerDetailInfo>();
		try {
			list = template.selete(sql, new CustomerDetailInfoMapping());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
