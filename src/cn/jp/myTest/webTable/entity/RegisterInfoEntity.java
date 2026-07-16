package cn.jp.myTest.webTable.entity;

public class RegisterInfoEntity {
	private String username;
	private String email;
	private String password;
	private String age;
	private String birthday;
	private String delFig = "0";
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getDelFig() {
		return delFig;
	}
	public void setDelFig(String delFig) {
		this.delFig = delFig;
	}
	public RegisterInfoEntity(String username, String email, String password,
			String age, String birthday, String delFig) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.age = age;
		this.birthday = birthday;
		this.delFig = delFig;
	}
	public RegisterInfoEntity() {
		super();
	}
	
	@Override
	public String toString() {
	    return "RegisterInfoEntity{" +
	            "username=" + username + 
	            ", email=" + email + 
	            ", password=" + password + 
	            ", age=" + age +
	            ", birthday=" + birthday + 
	            ", delFig=" + delFig +
	            '}';
	}
}
