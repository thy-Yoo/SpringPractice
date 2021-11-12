package com.sist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BookMapper;
import com.sist.vo.BookCommentVO;
import com.sist.vo.BookVO;
import com.sist.vo.MemberVO;

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
	//1-2. 베스트셀러 - 도서 상세보기 
	public BookVO bookDetailData(int bno) 
	{
		return mapper.bookDetailData(bno);
	}

	
	// 2. 신간 - 도서 출력 기능
	public List<BookVO> bookNewListData(HashMap<String,Object> map) {
		return mapper.bookNewListData(map);
	}
	// 2-1. 신간 - 페이징 
	public int bookNewTotalPage(HashMap<String,Object> map) {
		return mapper.bookNewTotalPage(map);
	}
	// 2-2. 신간 - 도서 출력 기능 + 카테고리 선택 기능
	public List<BookVO> bookNewListData_SelectCate(HashMap<String, Object> map) {
		return mapper.bookNewListData_SelectCate(map);
	}
	// 2-3. 신간 - 도서 상세보기 기능
	public BookVO bookNewDetailData(int bno) {
		return mapper.bookNewDetailData(bno);
	}
	public BookCommentVO bookNewCommentCount(int bno) {
		return mapper.bookNewCommentCount(bno);
	}
	
	// 2-4. 신간 - 관련 도서 출력 기능
	public List<BookVO> bookNewRelationListData(String genre) {
		return mapper.bookNewRelationListData(genre);
	}
	//2-5. 신간 - 판매 도서 출력 기능. (최상단, 랜덤)
	public List<BookVO> bookNewListData_SalesRandom(HashMap<String, Object> map){
		return mapper.bookNewListData_SalesRandom(map);
	}
	//2-6. 신간 - 추천 도서 출력 기능. (회원정보의 장르 이용)
	public List<BookVO> bookNewRecommendData(HashMap<String,Object> map){
		return mapper.bookNewRecommendData(map);
	}
	//2-6-2. 로그인 상태의 회원 id값을 이용해서 선호 장르를 얻는 부분.
	public MemberVO bookNewMemberGenre(String myid) {
		return mapper.bookNewMemberGenre(myid);
	}
	
	//3-1. 리뷰 입력 기능
	public void bookCommentInputData(HashMap<String, Object> map) throws Exception{
		mapper.bookCommentInputData(map);
	}

	// 3-2. 리뷰 출력 기능
	public List<BookCommentVO> bookCommentListData(HashMap<String,Object> map){
		return mapper.bookCommentListData(map);
	}
	//3-3. 별점 평점 출력 기능
	public BookCommentVO bookCommentStarData(HashMap<String,Object> map) {
		return mapper.bookCommentStarData(map);
	}


}
