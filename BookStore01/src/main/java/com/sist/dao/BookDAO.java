package com.sist.dao;



//import org.jsoup.Connection; 이걸 적으면 형변환을 해달라네..?
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BookMapper;



@Repository
public class BookDAO {
		
	@Autowired
	private BookMapper mapper;
	
	
}
