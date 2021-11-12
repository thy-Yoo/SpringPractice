package com.sist.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.BookCommentVO;
import com.sist.vo.BookVO;
import com.sist.vo.MemberVO;

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
		public List<BookVO> bookNewListData(HashMap<String,Object> map);
		
		//2-1. 신간 - 페이징
		@Select("SELECT CEIL(COUNT(*)/12.0) FROM ${table_name} "
				+ "WHERE pubdate IS NOT NULL AND cno2 IS NOT NULL "
				+ "AND genre IS NOT NULL AND genre LIKE '%'||#{cate}||'%'")
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
		@Select("SELECT bno,title,image,sale,pubdate,introduce,contents,price,score,"
				+ "TO_NUMBER(REPLACE(REPLACE(price,','),'원')) intprice,"
				+ "genre,publisher,writer "
				 +"FROM book_data WHERE bno IS NOT NULL "
				 +"AND bno=#{bno}")
		public BookVO bookNewDetailData(int bno);
		//2-3.1 신간 - 도서 상세보기 - 리뷰 카운트.
		@Select("SELECT MAX(ccno) cnt "
				+ "FROM book_detail_comment WHERE dc_bno=#{bno}")
		public BookCommentVO bookNewCommentCount(int bno);
		
		//2-4. 신간 - 관련 도서 출력 기능. (장르가 같은 데이터를 랜덤으로 네개 출력)
		@Select("SELECT bno,title,image,sale,pubdate,genre,price,num "
				+"FROM (SELECT bno,title,image,sale,pubdate,genre,price,rownum as num "
				+"FROM (SELECT bno,title,image,sale,pubdate,genre,price "
				+"FROM book_data WHERE genre IS NOT NULL AND genre=#{genre} ORDER BY DBMS_RANDOM.RANDOM)) "
				+ "WHERE num<=4")
		public List<BookVO> bookNewRelationListData(String genre);		
		//REPLACE(REPLACE(price,','),'원') price
		
		//2-5. 신간 - 판매 도서 출력 기능. (최상단, 랜덤)
		@Select("SELECT bno,title,image,writer,sale,pubdate,price,intprice,genre,cno2,saleprice,num "
				+"FROM (SELECT bno,title,image,writer,sale,pubdate,price,intprice,genre,cno2,intprice*0.8 AS saleprice,rownum as num "
				+"FROM (SELECT bno,title,image,sale,writer,pubdate,price,TO_NUMBER(REPLACE(REPLACE(price,','),'원')) intprice,genre,cno2 "
				+"FROM book_data "
				+ "WHERE pubdate IS NOT NULL AND cno2 IS NOT NULL AND genre LIKE '%'||#{cate}||'%' "
				+ "ORDER BY DBMS_RANDOM.RANDOM)) "
				+ "WHERE num<=10")
		public List<BookVO> bookNewListData_SalesRandom(HashMap<String,Object> map);
		// intprice*0.8 AS saleprice
		
		//2-6. 신간 - 추천 도서 출력 기능 (회원 선호 도서 장르)
		@Select("SELECT bno,title,image,sale,pubdate,genre,price,num "
				+"FROM (SELECT bno,title,image,sale,pubdate,genre,price,rownum as num "
				+"FROM (SELECT bno,title,image,sale,pubdate,genre,price "
				+"FROM book_data WHERE genre IS NOT NULL AND "
				+ "#{usergenre} LIKE '%'||genre||'%' OR genre LIKE '%'||#{usergenre}||'%' "
				+ "ORDER BY DBMS_RANDOM.RANDOM)) "
				+ "WHERE num<=4")
		public List<BookVO> bookNewRecommendData(HashMap<String, Object> map);
		
		@Select("SELECT user_id,genre FROM book_member WHERE user_id=#{myid}")
		public MemberVO bookNewMemberGenre(String myid);
		
		//INSTR(STR, ' ')
		
		//3-1. 리뷰 입력 기능
		@Insert("INSERT INTO book_detail_comment(dc_bno,title,stars,comments,writer,writedate,ccno) "
				+ "VALUES(#{bno},#{title},#{rating},#{comments},#{writer},SYSDATE,"
				+ "(SELECT NVL(MAX(ccno),0)+1 FROM book_detail_comment WHERE dc_bno=#{bno})"
				+ ")")
		public void bookCommentInputData(HashMap<String, Object> map) throws Exception;
		
		//3-2. 리뷰 출력 기능
		@Select("SELECT writer,userid,title,comments,stars,writedate,dc_bno "
				+ "FROM book_detail_comment "
				+ "WHERE dc_bno=#{bno} "
				+ "ORDER BY writedate DESC")
		public List<BookCommentVO> bookCommentListData(HashMap<String,Object> map);
		
		//3-3. 평점 출력 기능
		@Select("SELECT AVG(NVL(stars,0)) AS avgs "
				+ "FROM book_detail_comment WHERE dc_bno=#{bno}")
		public BookCommentVO bookCommentStarData(HashMap<String,Object> map);
		
		
		
	
	
}
