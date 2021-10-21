package com.sist.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;

public interface BookListMapper {

	@Select("SELECT bnum, title, cate1, cate2, cate3 FROM books")
	public List<BookVO> bookListData(); //책 목록 출력을 위한 함수.
}
