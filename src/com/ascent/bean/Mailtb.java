package com.ascent.bean;

public class Mailtb implements java.io.Serializable{  // 声明可序列化
	private Integer id; // id自增
	
	private String fromaddress; // 发件人地址
	
	private String frompassword;
	
	private String toaddress;
	
	public Mailtb(){}

	public Mailtb( String fromaddress, String frompassword,
			String toaddress) {
		this.fromaddress = fromaddress;
		this.frompassword = frompassword;
		this.toaddress = toaddress;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFromaddress() {
		return fromaddress;
	}

	public void setFromaddress(String fromaddress) {
		this.fromaddress = fromaddress;
	}

	public String getFrompassword() {
		return frompassword;
	}

	public void setFrompassword(String frompassword) {
		this.frompassword = frompassword;
	}

	public String getToaddress() {
		return toaddress;
	}

	public void setToaddress(String toaddress) {
		this.toaddress = toaddress;
	}
	
	
}
