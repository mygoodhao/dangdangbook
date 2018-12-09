package com.oracle.shubook.model;

import java.io.Serializable;

public class SmallType implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private int bid;
	
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

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public SmallType() {
	}

}
