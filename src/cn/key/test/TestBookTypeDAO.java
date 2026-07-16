package cn.key.test;

import java.util.List;
import java.util.Vector;
import cn.key.dao.BookTypeDAO;
import cn.key.entity.BookType;

public class TestBookTypeDAO {
	BookTypeDAO dao = new BookTypeDAO();
	public void testSave() {
		BookType bookType = new BookType(1, "搜神记", "树下野狐出品");
		System.out.println(dao.save(bookType));
	}
	public void testUpdata() {
		BookType bookType = new BookType(1, 1, "搜神记", "树下野狐出品");
		System.out.println(dao.updata(bookType));
	}
	public void testFindAll() {
		List<BookType> list = new Vector<BookType>();
		list = dao.findAll(3);
		for (BookType bookType : list) {
			System.out.println(bookType);
		}
	}
	public void testDeUpdata(){
		System.out.println(dao.upDelete(3,2));
	}
	public void testDelete() {
		System.out.println(dao.delete(4));
	}
	public void testFindById() {
		BookType book = new BookType();
		book = dao.findById(1);
		System.out.println(book);
	}
	
	public static void main(String[] args) {
		TestBookTypeDAO test = new TestBookTypeDAO();
//		test.testSave();
//		test.testDeUpdata();
//		test.testUpdata();
//		test.testDelete();
		test.testFindById();
//		test.testFindAll();
	}
}
