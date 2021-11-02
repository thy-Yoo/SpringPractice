package com.sist.vo;
/*
 * RANK                NUMBER         
BNO        NOT NULL NUMBER         
URL        NOT NULL VARCHAR2(300)  
TITLE               VARCHAR2(300)  
SUBTITLE            VARCHAR2(400)  
IMAGE               VARCHAR2(1000) 
WRITER              VARCHAR2(500)  
TRANSLATOR          VARCHAR2(500)  
PUBLISHER           VARCHAR2(500)  
PAGENO              NUMBER         
PUBDATE             VARCHAR2(200)  
PRICE               VARCHAR2(200)  
INTRODUCE           CLOB           
CONTENTS            CLOB           
SALE                NUMBER         
SCORE               NUMBER(4,2)    
GENRE               VARCHAR2(50)   
DIV                 NUMBER         
CNO2                VARCHAR2(20)
 */
public class BookVO {
	private int bno,pageno,sale,div;
	private String url,title,subtitle,image,writer,translator,
					publisher,pubdate,price,
					introduce,contents,genre,cno2;
	private double score;
	private int intprice;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getPageno() {
		return pageno;
	}
	public void setPageno(int pageno) {
		this.pageno = pageno;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public int getDiv() {
		return div;
	}
	public void setDiv(int div) {
		this.div = div;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCno2() {
		return cno2;
	}
	public void setCno2(String cno2) {
		this.cno2 = cno2;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public int getIntprice() {
		return intprice;
	}
	public void setIntprice(int intprice) {
		this.intprice = intprice;
	}
	
	
	
}
