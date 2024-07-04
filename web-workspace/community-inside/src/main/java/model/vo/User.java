package model.vo;

import java.sql.Date;

public class User {
	String id;
	String password;
	Date registerAt;
	String ip;
	String code;
	String name;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String id, String password, Date registerAt, String ip, String code, String name) {
		this.id = id;
		this.password = password;
		this.registerAt = registerAt;
		this.ip = ip;
		this.code = code;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegisterAt() {
		return registerAt;
	}

	public void setRegisterAt(Date registerAt) {
		this.registerAt = registerAt;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
