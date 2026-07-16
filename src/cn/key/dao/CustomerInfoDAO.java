package cn.key.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import cn.key.dbManager.JdbcTemplate;
import cn.key.entity.CustomerInfo;
import cn.key.mapping.CustomerInfoMapping;

public class CustomerInfoDAO {
	private JdbcTemplate template = new JdbcTemplate();
	public boolean save(CustomerInfo info) {
		int row = 0;
		String sql = "insert into customerInfo(customerName,pwd,email) " +
						" values(?,?,?)";
		Object[] values = new Object[]{info.getCustomerName(), info.getPwd(), info.getEmail()};
		try {
			row = template.updata(sql, values);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (row == 1);
	}
	
	
	public boolean updata(CustomerInfo info) {
		String sql = "update customerInfo " +
						" set customerName=?,pwd=?,email=? " +
						" where customerId=?";
		Object[] values = new Object[]{info.getCustomerName(), info.getPwd(), info.getEmail(), info.getCustomerId()};
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
		String sql = "delete customerInfo where customerId=" + id;
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
	public CustomerInfo findById(int id) {
		String sql = "select customerId,customerName,pwd,email " +
						" from customerInfo " +
						" where customerId=" + id;
		List<CustomerInfo> list = new Vector<CustomerInfo>();
		try {
			list = template.selete(sql, new CustomerInfoMapping());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list.get(0);
	}
	public List<CustomerInfo> findAll() {
		String sql = "select * " +
						" from customerInfo";
		List<CustomerInfo> list = new Vector<CustomerInfo>();
		try {
			list = template.selete(sql, new CustomerInfoMapping());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public CustomerInfo findByNamePwd(String name, String pwd) {
		CustomerInfo info = null;
		String sql = "select customerId,customerName,pwd,email " +
						" from customerInfo " +
						" where customerName=? and pwd=? ";
		List<CustomerInfo> list = new Vector<CustomerInfo>();
		try {
			list = template.selete(sql, new CustomerInfoMapping(), name, pwd);
			if(list.size() != 0) {
				info = list.get(0);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return info;
	}

}
