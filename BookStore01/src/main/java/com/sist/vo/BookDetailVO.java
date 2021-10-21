package com.sist.vo;
/*
 * 
 create table books (
    bnum NUMBER,
    title VARCHAR2(100)
);

 * 
 */

public class BookDetailVO {
	int bnum;
	String title;
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	

}
