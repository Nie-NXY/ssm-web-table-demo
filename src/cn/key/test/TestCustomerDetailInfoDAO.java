package cn.key.test;

import java.util.List;
import java.util.Vector;
import cn.key.dao.CustomerDetailInfoDAO;
import cn.key.entity.CustomerDetailInfo;

public class TestCustomerDetailInfoDAO {
	CustomerDetailInfoDAO dao = new CustomerDetailInfoDAO();
	public void testSave() {
		CustomerDetailInfo info = new CustomerDetailInfo();
		System.out.println(dao.save(info));
	}
	public void testFindAll() {
		List<CustomerDetailInfo> list = new Vector<CustomerDetailInfo>();
		list = dao.findAll();
		for (CustomerDetailInfo info : list) {
			System.out.println(info);
		}
	}
//	public void testDeUpdata(){
//		System.out.println(dao.upDelete(1,4));
//		
//	}
	
	
	public static void main(String[] args) {
		TestCustomerDetailInfoDAO test = new TestCustomerDetailInfoDAO();
//		test.testSave();
		test.testFindAll();
//		test.testDeUpdata();
	}
}