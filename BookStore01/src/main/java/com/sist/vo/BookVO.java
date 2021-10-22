package com.sist.vo;
/*
 * 
 create table books (
    bnum NUMBER,
    title VARCHAR2(100)
    cate1 VARCHAR2(20), --국내도서, 해외도서,
    cate2 VARCHAR2(20), --가정 살림, 건강 취미, 경제 경영, ...
    cate3 VARCHAR2(20) -- 임신, 태교
    
    테이블 수정해야함.
);

 * 
 */
public class BookVO {
	int bnum;
	String title;
	String cate1, cate2, cate3;
	String writer; //작가
	String publisher; //출판사
	String price; //가격
	String pubDate; //출간월
	String salesPoint; //세일즈포인트 (판매지수) 긁어오는것 아님. 장바구니 기능 구현 후 적용.
	
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
	public String getCate1() {
		return cate1;
	}
	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}
	public String getCate2() {
		return cate2;
	}
	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}
	public String getCate3() {
		return cate3;
	}
	public void setCate3(String cate3) {
		this.cate3 = cate3;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSalesPoint() {
		return salesPoint;
	}
	public void setSalesPoint(String salesPoint) {
		this.salesPoint = salesPoint;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	
	
}
