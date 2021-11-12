package com.sist.vo;
/*
NO        NOT NULL NUMBER         
writer   NOT NULL VARCHAR2(100)  
SUBJECT   NOT NULL VARCHAR2(100)  
CONTENT   NOT NULL CLOB           
REGDATE            DATE           
HIT                NUMBER         
FILESIZE           VARCHAR2(4000) 
FILENAME           VARCHAR2(4000) 
FILECOUNT          NUMBER         
 */
import java.util.*;
import org.springframework.web.multipart.MultipartFile;

public class FreeBoardVO {
	private int no, filecount, hit;
	private String writer, subject, content, filename, filesize;
	private Date regdate;
	private List<MultipartFile> files;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getFilecount() {
		return filecount;
	}
	public void setFilecount(int filecount) {
		this.filecount = filecount;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getwriter() {
		return writer;
	}
	public void setwriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	

}
