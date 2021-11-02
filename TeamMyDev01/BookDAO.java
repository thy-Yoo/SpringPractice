package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BookMapper;
import com.sist.vo.BookCommentVO;
import com.sist.vo.BookVO;

@Repository
public class BookDAO {
	
	@Autowired
	private BookMapper mapper;
	
	//1. 베스트 셀러 도서 출력 기능
	public List<BookVO> bookBestListData(Map map)
	{
		return mapper.bookBestListData(map);
	}
	 public int bookTotalPage(Map map)
	 {
		 return mapper.bookTotalPage(map);
	 }
	 
		
		// 2. 신간 - 도서 출력 기능
		public List<BookVO> bookNewListData(Map map) {
			return mapper.bookNewListData(map);
		}
		// 3. 신간 - 도서 상세보기 기능
		public BookVO bookNewDetailData(int bno) {
			return mapper.bookNewDetailData(bno);
		}				
		//4. 신간 - 관련 도서 출력 기능
		public List<BookVO> bookNewRelationListData(String genre){
			return mapper.bookNewRelationListData(genre);
		}
		
		//5. 리뷰 입력 기능
		//public BookCommentVO bookCommentData() {
		//	return mapper.bookCommentData();
		//}
				
		//6.  리뷰 출력 기능
		public List<BookCommentVO> bookCommentListData(int bno){
			return mapper.bookCommentListData(bno);
		}
		
		
		
		
}
