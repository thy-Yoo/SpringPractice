package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.BookVO;

public interface BookMapper {
	
	/* 책 목록 출력하는 함수 */
	@Select("SELECT bnum, title, cate1, cate2, cate3 FROM books")
	public List<BookVO> bookListData();
	
	/* 크롤링한 책 데이터를 DB에 넣는 함수 */
	//@Insert("INSERT INTO books(bnum, title, cate1, cate2, cate3, writer, publisher, price)")
	//public void bookDataInsert(BookVO vo);

}
