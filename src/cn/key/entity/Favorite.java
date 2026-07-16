package cn.key.entity;

import java.util.Date;

public class Favorite {
	private int favoriteId;
	private int bookId;
	private String bookName;
	private int customerId;
	private Date date;
	private String context;
	public Favorite() {
	}
	public Favorite(int favoriteId, int bookId, String bookName,
			int customerId, Date date, String context) {
		super();
		this.favoriteId = favoriteId;
		this.bookId = bookId;
		this.bookName = bookName;
		this.customerId = customerId;
		this.date = date;
		this.context = context;
	}
	public Favorite(int bookId, String bookName, int customerId, Date date,
			String context) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.customerId = customerId;
		this.date = date;
		this.context = context;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getFavoriteId() {
		return favoriteId;
	}
	public void setFavoriteId(int favoriteId) {
		this.favoriteId = favoriteId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	
}
