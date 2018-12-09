package com.oracle.shubook.model;

import java.io.Serializable;
import java.util.Date;

public class Book implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private double price;
	private String author;
	private String cbs;
	private Date  cbDate;
	private String desctri;
	private int sid;
	private String photo;
	
	public Book() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCbs() {
		return cbs;
	}

	public void setCbs(String cbs) {
		this.cbs = cbs;
	}

	public Date getCbDate() {
		return cbDate;
	}

	public void setCbDate(Date cbDate) {
		this.cbDate = cbDate;
	}

	public String getDesctri() {
		return desctri;
	}

	public void setDesctri(String desctri) {
		this.desctri = desctri;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", price=" + price + ", author=" + author + ", cbs=" + cbs
				+ ", cbDate=" + cbDate + ", desctri=" + desctri + ", sid=" + sid + ", photo=" + photo + "]";
	}

}
