package cn.key.entity;

public class OrderMain {
	private String oid;
	private int customerId;
	private float moneyCount;
	private int sates; //1 为还未处理， 2 为正在处理  3 为已经处理
	private String shouName;
	private String shouTel;
	private String shouAddress;
	public OrderMain() {
		super();
	}
	public OrderMain(String oid, int customerId, float moneyCount, int sates,
			String shouName, String shouTel, String shouAddress) {
		super();
		this.oid = oid;
		this.customerId = customerId;
		this.moneyCount = moneyCount;
		this.sates = sates;
		this.shouName = shouName;
		this.shouTel = shouTel;
		this.shouAddress = shouAddress;
	}
	public OrderMain(int customerId, float moneyCount, int sates,
			String shouName, String shouTel, String shouAddress) {
		super();
		this.customerId = customerId;
		this.moneyCount = moneyCount;
		this.sates = sates;
		this.shouName = shouName;
		this.shouTel = shouTel;
		this.shouAddress = shouAddress;
	}
	public OrderMain(int customerId, float moneyCount, String shouName,
			String shouTel, String shouAddress) {
		super();
		this.customerId = customerId;
		this.moneyCount = moneyCount;
		this.shouName = shouName;
		this.shouTel = shouTel;
		this.shouAddress = shouAddress;
	}
	@Override
	public String toString() {
		return "OrderMain [customerId=" + customerId + ", moneyCount="
				+ moneyCount + ", oid=" + oid + ", sates=" + sates
				+ ", shouAddress=" + shouAddress + ", shouName=" + shouName
				+ ", shouTel=" + shouTel + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + customerId;
		result = prime * result + Float.floatToIntBits(moneyCount);
		result = prime * result + ((oid == null) ? 0 : oid.hashCode());
		result = prime * result + sates;
		result = prime * result
				+ ((shouAddress == null) ? 0 : shouAddress.hashCode());
		result = prime * result
				+ ((shouName == null) ? 0 : shouName.hashCode());
		result = prime * result + ((shouTel == null) ? 0 : shouTel.hashCode());
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
		OrderMain other = (OrderMain) obj;
		if (customerId != other.customerId)
			return false;
		if (Float.floatToIntBits(moneyCount) != Float
				.floatToIntBits(other.moneyCount))
			return false;
		if (oid == null) {
			if (other.oid != null)
				return false;
		} else if (!oid.equals(other.oid))
			return false;
		if (sates != other.sates)
			return false;
		if (shouAddress == null) {
			if (other.shouAddress != null)
				return false;
		} else if (!shouAddress.equals(other.shouAddress))
			return false;
		if (shouName == null) {
			if (other.shouName != null)
				return false;
		} else if (!shouName.equals(other.shouName))
			return false;
		if (shouTel == null) {
			if (other.shouTel != null)
				return false;
		} else if (!shouTel.equals(other.shouTel))
			return false;
		return true;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public float getMoneyCount() {
		return moneyCount;
	}
	public void setMoneyCount(float moneyCount) {
		this.moneyCount = moneyCount;
	}
	public int getSates() {
		return sates;
	}
	public void setSates(int sates) {
		this.sates = sates;
	}
	public String getShouName() {
		return shouName;
	}
	public void setShouName(String shouName) {
		this.shouName = shouName;
	}
	public String getShouTel() {
		return shouTel;
	}
	public void setShouTel(String shouTel) {
		this.shouTel = shouTel;
	}
	public String getShouAddress() {
		return shouAddress;
	}
	public void setShouAddress(String shouAddress) {
		this.shouAddress = shouAddress;
	}
}
