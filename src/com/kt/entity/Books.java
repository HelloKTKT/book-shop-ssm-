package com.kt.entity;

public class Books {
	
	private int BookID;
	private String Name;
	private String Author;
	private String Publisher;
	private Double Prive;
	private String intro;
	private String pic;
	
	public int getBookID() {
		return BookID;
	}
	public void setBookID(int bookID) {
		BookID = bookID;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public String getPublisher() {
		return Publisher;
	}
	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	public Double getPrive() {
		return Prive;
	}
	public void setPrive(Double prive) {
		Prive = prive;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}

	
	

}
