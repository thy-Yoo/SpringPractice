package com.sist.vo;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;
/*
 * no NUMBER,
    user_id VARCHAR2(20) CONSTRAINT bb_userid_nn NOT NULL,
    subject VARCHAR2(1000) CONSTRAINT bb_subject_nn NOT NULL,
    image VARCHAR2(1000),
    content CLOB CONSTRAINT bb_content_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    hit NUMBER DEFAULT 0,
    category VARCHAR2(500) CONSTRAINT bb_category_nn NOT NULL,
    tag VARCHAR(500) CONSTRAINT bb_tag_nn NOT NULL,
    CONSTRAINT bb_no_pk PRIMARY KEY(no)
 */
public class BlogVO {
	private int no,replycount;
	private String user_id,subject,image,content,category,tag,dbday,membership,name,book_title;
	private Date regdate;
	private List<MultipartFile> files;
	
	
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public String getMembership() {
		return membership;
	}
	public void setMembership(String membership) {
		this.membership = membership;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
