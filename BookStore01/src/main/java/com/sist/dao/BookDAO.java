package com.sist.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BookMapper;
import com.sist.vo.BookVO;

@Repository
public class BookDAO {
	
	
	@Autowired
	private BookMapper mapper;
	
	/* 크롤링한 데이터 DB에 넣는 파트 */
	public void bookDataInsert(BookVO vo) {
		//mapper.bookDataInsert(vo);
	}

}
