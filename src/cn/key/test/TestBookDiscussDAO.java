package cn.key.test;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import cn.key.Tools.DataTool;
import cn.key.dao.BookDiscussDAO;
import cn.key.entity.BookDiscuss;


public class TestBookDiscussDAO {
	BookDiscussDAO dao = new BookDiscussDAO();
	public void testSave() {
		Date date = null;
		try {
			date = DataTool.stringtoDate("2011-1-1");
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		BookDiscuss bookDiscuss = new BookDiscuss("跟旺旺老师学java",8,"云工厂出版社","旺旺老师","不错","saf","saf",50,date,2 ,30);
//		System.out.println(dao.save(book));
	}
	public void testUpdata() {
		Date date = null;
		try {
			date = DataTool.stringtoDate("2011-1-1");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		BookDiscuss book = new BookDiscuss();
//		System.out.println(dao.save(book));
	}
	
	public void testFindAll() {
		List<BookDiscuss> list = new Vector<BookDiscuss>();
		list = dao.findAll();
		for (BookDiscuss bookDiscuss : list) {
			System.out.println(bookDiscuss);
		}
	}
	public void testFindById() {
		BookDiscuss book = new BookDiscuss();
//		book = dao.findById(1);
		System.out.println(book);
	}
	public void testDelete() {
		System.out.println(dao.delete(4));
	}
	public void testDeUpdata(){
//		System.out.println(dao.upDelete(3,2));
	}
	
	public static void main(String[] args) {
		TestBookDiscussDAO test = new TestBookDiscussDAO();
//		test.testSave();
//		test.testUpdata();
		test.testFindAll();
		
	}
}
