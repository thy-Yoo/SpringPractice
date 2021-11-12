package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface MemberMapper {

	
	// 1. 회원가입 처리
	// ID 존재여부 확인
	@Select("SELECT COUNT(*) FROM book_member "
			+"WHERE user_id=#{id}")
	public int memberIdCount(String id);
	
	// regdate 컬럼
	@Insert("INSERT INTO book_member VALUES("
			+"#{user_id},#{pwd},#{name},#{sex},#{birthday},#{tel},#{addr1},#{addr2},'n',#{email},#{genre},'family',SYSDATE,#{post},1000,book_member_memNum_seq.nextval)")
	public void memberInsert(MemberVO vo);
	
	// 2. 로그인 처리
	// ID 존재여부 확인 (memberIdCount 재사용)
	// 비밀번호 체크
	@Select("SELECT pwd,name,admin,membership FROM book_member "
			+"WHERE user_id=#{user_id}")
	public MemberVO memberGetPassword(String user_id);
	
	// 3-1. 아이디찾기
	@Select("SELECT COUNT(*) FROM book_member WHERE tel=#{tel}")
	public int memberIdFind(String tel);
	@Select("SELECT RPAD(SUBSTR(user_id,1,1),LENGTH(user_id),'*') FROM book_member WHERE tel=#{tel}")
	public String memberIdFindData(String tel);
	
	// 3-2. 비밀번호찾기
	// memberIdCount 재사용
	@Select("SELECT RPAD(SUBSTR(pwd,1,1),LENGTH(pwd),'*') FROM book_member WHERE user_id=#{id}")
	public String memberPwdFindData(String id);
	
	// 회원정보 수정
	@Select("SELECT * FROM book_member WHERE user_id=#{id}")
	public MemberVO memberUpdateData(String id);
	@Update("UPDATE book_member SET "
			+"name=#{name},sex=#{sex},birthday=#{birthday},tel=#{tel},"
			+ "addr1=#{addr1},addr2=#{addr2},email=#{email},genre=#{genre},post=#{post} "
			+"WHERE user_id=#{user_id}")
	public void memberJoinUpdate(MemberVO vo);
	
	//회원탈퇴
	@Delete("DELETE FROM book_member WHERE user_id=#{user_id}")
	public void memberDelete(String user_id);
	
	/*
	@Delete("DELETE FROM book_freeboard WHERE writer=#{writer}")
	public void freeboardWriterDelete(String writer);
	*/
}
