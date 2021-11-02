package com.sist.vo;
/*

create table BOOK_DETAIL_COMMENT(
    dc_num NUMBER PRIMARY KEY, --댓글번호
    writer VARCHAR2(100), --글쓴이
    userid VARCHAR2(100), --유저아이디   
    title VARCHAR2(100), --리뷰 타이틀
     comments CLOB, --리뷰 내용
    stars NUMBER, --평점
    dc_bno NUMBER, --Book bno관련인데 혹시 몰라서 만들어둠. 
    writedate DATE --글 작성 시간.
);

 * */
public class BookCommentVO {
	
	int dc_num;//detailComment
	String writer, userid, title, comments;
	double stars;
	int dc_bno;
	String writedate;
	
	public int getDc_num() {
		return dc_num;
	}
	public void setDc_num(int dc_num) {
		this.dc_num = dc_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public double getStars() {
		return stars;
	}
	public void setStars(double stars) {
		this.stars = stars;
	}
	public int getDc_bno() {
		return dc_bno;
	}
	public void setDc_bno(int dc_bno) {
		this.dc_bno = dc_bno;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	
	

}
