package cn.key.entity;

public class SearchBook {
	private int sbId;
	private String bookName;
	private String author;
	private String pbName;
	private String email;
	private String context;
	public SearchBook() {
		super();
	}
	
	public SearchBook(String bookName, String author, String pbName,
			String email, String context) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.pbName = pbName;
		this.email = email;
		this.context = context;
	}

	public SearchBook(int sbId, String bookName, String author, String pbName,
			String email, String context) {
		super();
		this.sbId = sbId;
		this.bookName = bookName;
		this.author = author;
		this.pbName = pbName;
		this.email = email;
		this.context = context;
	}

	@Override
	public String toString() {
		return "SearchBook [author=" + author + ", bookName=" + bookName
				+ ", context=" + context + ", email=" + email + ", pbName="
				+ pbName + ", sbId=" + sbId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result
				+ ((bookName == null) ? 0 : bookName.hashCode());
		result = prime * result + ((context == null) ? 0 : context.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((pbName == null) ? 0 : pbName.hashCode());
		result = prime * result + sbId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SearchBook other = (SearchBook) obj;
		if (author == null) {
			if (other.author != null)
				return false;
		} else if (!author.equals(other.author))
			return false;
		if (bookName == null) {
			if (other.bookName != null)
				return false;
		} else if (!bookName.equals(other.bookName))
			return false;
		if (context == null) {
			if (other.context != null)
				return false;
		} else if (!context.equals(other.context))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (pbName == null) {
			if (other.pbName != null)
				return false;
		} else if (!pbName.equals(other.pbName))
			return false;
		if (sbId != other.sbId)
			return false;
		return true;
	}

	public int getSbId() {
		return sbId;
	}

	public void setSbId(int sbId) {
		this.sbId = sbId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPbName() {
		return pbName;
	}

	public void setPbName(String pbName) {
		this.pbName = pbName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
}
