package com.sist.dao;

import java.util.List;//List
import java.util.Map;//Map map

import org.springframework.beans.factory.annotation.Autowired;//@Autowired
import org.springframework.stereotype.Repository;//@Repository

import com.sist.vo.BookDetailVO;

@Repository
public class BookDetailDAO {
	
	@Autowired
	private BookDetailMapper mapper;
	 
	
	// 상세보기 
	public BookDetailVO bookDetailData(int no) {
		return mapper.bookDetailData(no);
	}

}
