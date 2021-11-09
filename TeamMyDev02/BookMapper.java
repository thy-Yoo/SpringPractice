package com.sist.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.BookCommentVO;
import com.sist.vo.BookVO;

public interface BookMapper {
	
	//1. 베스트 셀러 도서 출력 기능
	@Select("SELECT bno,title,image,sale,num "
			+"FROM (SELECT bno,title,image,sale,rownum as num "
			+"FROM (SELECT bno,title,image,sale "
			+"FROM book_data WHERE SALE>0 AND RANK IS NOT NULL ORDER BY sale DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookBestListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM ${table_name}")
	public int bookTotalPage(Map map);
	//1. 베스트 셀러 상세 출력
	@Select("SELECT bno,title,image,sale,pubdate,introduce,contents,price,TO_NUMBER(REPLACE(REPLACE(price,','),'원')) intprice,genre,publisher,writer "
			 +"FROM book_data WHERE bno IS NOT NULL "
			 +"AND bno=#{bno}")
	public BookVO bookDetailData(int bbno);
	
	
	
	
	
	
		//2-0. 신간 - 도서 목록 출력 기능.
		@Select("SELECT bno,title,image,sale,pubdate,num "
				+"FROM (SELECT bno,title,image,sale,pubdate,rownum as num "
				+"FROM (SELECT bno,title,image,sale,pubdate "
				+"FROM book_data WHERE pubdate IS NOT NULL AND RANK IS NOT NULL ORDER BY pubdate DESC)) "
				+ "WHERE num BETWEEN #{start} AND #{end}")
		public List<BookVO> bookNewListData(Map map);
		
		//2-1. 신간 - 페이징
		@Select("SELECT CEIL(COUNT(*)/12.0) FROM ${table_name} WHERE pubdate IS NOT NULL AND cno2 IS NOT NULL")
		public int bookNewTotalPage(Map map);
		
		//2-2. 신간 - 도서 목록 출력 기능. + 카테고리 선택 기능.
		@Select("SELECT bno,title,image,sale,pubdate,genre,cno2,num "
				+"FROM (SELECT bno,title,image,sale,pubdate,genre,cno2,rownum as num "
				+"FROM (SELECT bno,title,image,sale,pubdate,genre,cno2 "
				+"FROM book_data "
				+ "WHERE pubdate IS NOT NULL AND cno2 IS NOT NULL AND genre LIKE '%'||#{cate}||'%' "
				+ "ORDER BY pubdate DESC)) "
				+ "WHERE num BETWEEN #{start} AND #{end}")
		public List<BookVO> bookNewListData_SelectCate(HashMap<String,Object> map);
		/* cno2 IS NOT NULL: DB내 중복 제거. 
		 * pubdate IS NOT NULL: 신간 도서 페이지 이기 때문에 출판일 정보 없는 책은 제외.
		 * #cate: jsp에서 사용자가 메뉴를 클릭하여 전송한 값을 받아오는 변수.
		 * genre LIKE '%#{cate}%' genre LIKE '%'||#{cate,jdbcType=VARCHAR}||'%'
		 */
		
		//2-3. 신간 - 도서 상세보기.
		@Select("SELECT bno,title,image,sale,pubdate,introduce,contents,price,TO_NUMBER(REPLACE(REPLACE(price,','),'원')) intprice,genre,publisher,writer "
				 +"FROM book_data WHERE bno IS NOT NULL "
				 +"AND bno=#{bno}")
		public BookVO bookNewDetailData(int bno);
		
		//2-4. 신간 - 관련 도서 출력 기능. (장르가 같은 데이터를 랜덤으로 네개 출력)
		@Select("SELECT bno,title,image,sale,pubdate,genre,price,num "
				+"FROM (SELECT bno,title,image,sale,pubdate,genre,price,rownum as num "
				+"FROM (SELECT bno,title,image,sale,pubdate,genre,price "
				+"FROM book_data WHERE genre IS NOT NULL AND genre=#{genre} ORDER BY DBMS_RANDOM.RANDOM)) "
				+ "WHERE num<=4")
		public List<BookVO> bookNewRelationListData(String genre);		
		//REPLACE(REPLACE(price,','),'원') price
		
		
		
		
		
		//3-1. 리뷰 입력 기능
		//@Select("SELECT * FROM book_detail_comment")
		//public BookCommentVO bookCommentData();
		
		//3-2. 리뷰 출력 기능
		@Select("SELECT dc_num,writer,userid,title,comments,stars,writedate,dc_bno "
				+ "FROM book_detail_comment WHERE dc_bno=#{bno}")
		public List<BookCommentVO> bookCommentListData(int bno);
		
		
	
	
	
}
