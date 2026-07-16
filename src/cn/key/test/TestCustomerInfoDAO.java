package cn.key.test;


import java.util.List;
import java.util.Vector;

import cn.key.dao.CustomerInfoDAO;
import cn.key.entity.BookDiscuss;
import cn.key.entity.CustomerInfo;

public class TestCustomerInfoDAO {
	public void testFindAll() {
		CustomerInfoDAO dao = new CustomerInfoDAO();
		List<CustomerInfo> customerInfos = new Vector<CustomerInfo>();
		customerInfos = dao.findAll();
		for (CustomerInfo customerInfo : customerInfos) {
			System.out.println(customerInfo);
		}
	}
	public static void main(String[] args) {
		TestCustomerInfoDAO test = new TestCustomerInfoDAO();
		test.testFindAll();
	}
}
