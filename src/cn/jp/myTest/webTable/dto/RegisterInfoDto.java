package cn.jp.myTest.webTable.dto;

public class RegisterInfoDto {
	private String username;
	private String email;
	private String password;
	private Integer age;
	private String birthday;
	
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
	public Integer getAge() {
		return age;
	}
	public void Integer(Integer age) {
		this.age = age;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public RegisterInfoDto(String username, String email, String password,
			Integer age, String birthday) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.age = age;
		this.birthday = birthday;
	}
	public RegisterInfoDto() {
		super();
	}

}
