package cn.key.test;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import cn.key.Tools.DataTool;
import cn.key.dao.BookInfoDAO;
import cn.key.entity.BookInfo;


public class TestBookInfoDAO {
	BookInfoDAO dao = new BookInfoDAO();
	public void testSave() {
		Date date = null;
		try {
			date = DataTool.stringtoDate("2011-1-1");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		BookInfo book = new BookInfo("跟旺旺老师学java",8,"云工厂出版社","旺旺老师","不错","saf","saf",50,date,2 ,30);
		System.out.println(dao.save(book));
	}
	public void testUpdata() {
		Date date = null;
		try {
			date = DataTool.stringtoDate("2011-1-1");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		BookInfo book = new BookInfo("跟旺旺老师学java",8,"云工厂出版社","旺旺老师","不错","a","f",50,date,2,30);
		System.out.println(dao.save(book));
	}
	
	public void testFindAll() {
		List<BookInfo> list = new Vector<BookInfo>();
		list = dao.findAll(1);
		for (BookInfo bookInfo : list) {
			System.out.println(bookInfo);
		}
	}
	public void testFindById() {
		BookInfo book = new BookInfo();
		book = dao.findById(1);
		System.out.println(book);
	}
	public void testDelete() {
		System.out.println(dao.delete(4));
	}
	public void testDeUpdata(){
		System.out.println(dao.upDelete(3,2));
	}
	
	public static void main(String[] args) {
		TestBookInfoDAO test = new TestBookInfoDAO();
//		test.testSave();
		test.testUpdata();
		test.testFindAll();
		
	}
}
