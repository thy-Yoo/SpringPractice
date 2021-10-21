package com.sist.mapper;

//import org.apache.ibatis.
import com.sist.vo.*; 

public interface BookDetailMapper {
	
	@Select("SELECT bnum, title FROM books")
	public BookDetailVO bookDetailData(int no);

}
