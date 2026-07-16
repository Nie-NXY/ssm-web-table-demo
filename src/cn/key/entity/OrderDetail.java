package cn.key.entity;

public class OrderDetail {
	private int did;
	private String oid;
	private int bookId;
	private String bookName;
	private float ygcprice;
	private int Num;
	public OrderDetail() {
		super();
	}
	public OrderDetail(int bookId, String bookName, float ygcprice, int num) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.ygcprice = ygcprice;
		Num = num;
	}
	public OrderDetail(String oid, int bookId, String bookName, float ygcprice,
			int num) {
		super();
		this.oid = oid;
		this.bookId = bookId;
		this.bookName = bookName;
		this.ygcprice = ygcprice;
		Num = num;
	}

	public OrderDetail(int did, String oid, int bookId, String bookName,
			float ygcprice, int num) {
		super();
		this.did = did;
		this.oid = oid;
		this.bookId = bookId;
		this.bookName = bookName;
		this.ygcprice = ygcprice;
		Num = num;
	}

	
	@Override
	public String toString() {
		return "OrderDetail [Num=" + Num + ", bookId=" + bookId + ", bookName="
				+ bookName + ", did=" + did + ", oid=" + oid + ", ygcprice="
				+ ygcprice + "]";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Num;
		result = prime * result + bookId;
		result = prime * result
				+ ((bookName == null) ? 0 : bookName.hashCode());
		result = prime * result + did;
		result = prime * result + ((oid == null) ? 0 : oid.hashCode());
		result = prime * result + Float.floatToIntBits(ygcprice);
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
		OrderDetail other = (OrderDetail) obj;
		if (Num != other.Num)
			return false;
		if (bookId != other.bookId)
			return false;
		if (bookName == null) {
			if (other.bookName != null)
				return false;
		} else if (!bookName.equals(other.bookName))
			return false;
		if (did != other.did)
			return false;
		if (oid == null) {
			if (other.oid != null)
				return false;
		} else if (!oid.equals(other.oid))
			return false;
		if (Float.floatToIntBits(ygcprice) != Float
				.floatToIntBits(other.ygcprice))
			return false;
		return true;
	}
	
	public float getYgcprice() {
		return ygcprice;
	}
	public void setYgcprice(float ygcprice) {
		this.ygcprice = ygcprice;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getNum() {
		return Num;
	}
	public void setNum(int num) {
		Num = num;
	}
}
