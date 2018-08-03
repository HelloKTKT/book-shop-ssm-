package com.kt.entity;

public class CartBooks {
	private int cid;
	private String ID;
	private String oid;
	private int BookID;
	private String name;
	private int number;
	private double allPrice;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getBookID() {
		return BookID;
	}
	public void setBookID(int bookID) {
		BookID = bookID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public double getAllPrice() {
		return allPrice;
	}
	public void setAllPrice(double allPrice) {
		this.allPrice = allPrice;
	}
	
}
