package cn.key.entity;

import java.util.Date;

public class BookDiscuss {
	private int disId;
	private int bookId;
	private int customerId;
	private String context;
	private Date writeData;
	private int states;
	
	public BookDiscuss() {
		super();
	}

	public BookDiscuss(int bookId, int customerId, String context,
			Date writeData, int states) {
		super();
		this.bookId = bookId;
		this.customerId = customerId;
		this.context = context;
		this.writeData = writeData;
		this.states = states;
	}



	public BookDiscuss(int disId, int bookId, int customerId, String context,
			Date writeData, int states) {
		super();
		this.disId = disId;
		this.bookId = bookId;
		this.customerId = customerId;
		this.context = context;
		this.writeData = writeData;
		this.states = states;
	}


	
	public Date getWriteData() {
		return writeData;
	}

	public void setWriteData(Date writeData) {
		this.writeData = writeData;
	}

	public int getDisId() {
		return disId;
	}

	public void setDisId(int disId) {
		this.disId = disId;
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

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getStates() {
		return states;
	}

	public void setStates(int states) {
		this.states = states;
	}
	
}
