package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.vo.BookCommentVO;
import com.sist.vo.BookVO;
import com.sist.dao.BookDAO;

@Controller
public class BookController {

	
	@Autowired
	private BookDAO dao;
	
	// 베스트 셀러 목록 출력
	@RequestMapping("book/list.do")
	public String book_list(String page, Model model, HttpServletRequest request)
	{
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		map.put("start", start);
		map.put("end", end);
		List<BookVO> list=dao.bookBestListData(map);
		// 총페이지 
		    map.put("table_name", "book_data");
			int totalpage=dao.bookTotalPage(map);
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../book/list.jsp");				
		return "main/main";
		
	}
	// 베스트셀러 상세페이지.
	@RequestMapping("book/detail.do")
	public String book_detail(int bno, Model model) {

		//상세 데이터 출력
		BookVO vo = dao.bookDetailData(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("bno", bno);	
		model.addAttribute("main_jsp", "../book/detail.jsp");
		return "main/main";
	}
	
	
	
	
	
			// 신간 목록 출력
			@RequestMapping("book/newlist.do")
			public String book_newlist(String page, Model model)
			{
				
				if(page==null)
					page="1";
				int curpage=Integer.parseInt(page);
				Map map=new HashMap();
				int rowSize=12;
				int start=(rowSize*curpage)-(rowSize-1);
				int end=(rowSize*curpage);
				map.put("start", start);
				map.put("end", end);
				List<BookVO> list=dao.bookNewListData(map);
				// 총페이지 
				    map.put("table_name", "book_data");
					int totalpage=dao.bookTotalPage(map);
				final int BLOCK=10;
				int startPage=((curpage-1)/BLOCK*BLOCK)+1;
				int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
				if(endPage>totalpage)
					endPage=totalpage;
				
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage",totalpage);
				model.addAttribute("BLOCK", BLOCK);
				model.addAttribute("startPage",startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("list", list);
				model.addAttribute("main_jsp", "../book/newlist.jsp");				
				return "main/main";
				
			}
			
			/* 카테고리 선택 - 목록출력*/
			
			@RequestMapping("book/newlistSelectCate.do")
			 public String book_menu_category(String page, Model model, int select) {
				HashMap<String, Object> map=new HashMap<String, Object>();
				
				//카테고리 선택
				int whatCate = select;	
				//System.out.println("whatCate에 들어간 값은"+whatCate+"입니다.");
				if(whatCate==1) {
					System.out.println("카테고리는 소설입니다.");
					map.put("cate", "소설");
				}
				else if(whatCate==2){
					System.out.println("카테고리는 시/에세이입니다.");
					map.put("cate", "시/에세이");
				}
				else if(whatCate==3){
					System.out.println("카테고리는 인문입니다.");
					map.put("cate", "인문");
				}
				else if(whatCate==4){
					System.out.println("카테고리는 사회과학입니다.");
					map.put("cate", "사회과학");
				}
				else if(whatCate==5){
					System.out.println("카테고리는 예술/대중문화입니다.");
					map.put("cate", "예술/대중문화");
				}
				else if(whatCate==6){
					System.out.println("카테고리는 가정과 생활입니다.");
					map.put("cate", "가정과 생활");
				}
				else if(whatCate==7){
					System.out.println("카테고리는 유아입니다.");
					map.put("cate", "유아");
				}
				else if(whatCate==8){
					System.out.println("카테고리는 국어/외국어/사전입니다.");
					map.put("cate", "국어/외국어/사전");
				}
				else if(whatCate==9){
					System.out.println("카테고리는 자기계발입니다.");
					map.put("cate", "자기계발");
				}			
				else {
					System.out.println("select에 들어간 값은"+select+"입니다.");
					//System.out.println("데이터형은"+select.getClass().getName()+"입니다.");
				}
				
				if(page==null)
					page="1";
				int curpage=Integer.parseInt(page);
				
				int rowSize=12;
				int start=(rowSize*curpage)-(rowSize-1);
				int end=(rowSize*curpage);
				map.put("start", start);
				map.put("end", end);
				List<BookVO> list=dao.bookNewListData_SelectCate(map);
				// 총페이지 
				map.put("table_name", "book_data");
				int totalpage=dao.bookNewTotalPage(map);
				final int BLOCK=10;
				int startPage=((curpage-1)/BLOCK*BLOCK)+1;
				int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
				if(endPage>totalpage)
					endPage=totalpage;
				
				
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage",totalpage);
				model.addAttribute("BLOCK", BLOCK);
				model.addAttribute("startPage",startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("list", list);
				model.addAttribute("main_jsp", "../book/newlist.jsp");				
				return "main/main";
				
				 
			 }
			
			
			
			
			// 신간 도서 상세 페이지
			@RequestMapping("book/newdetail.do")
			public String book_newdetail(int bno, Model model) {

				//상세 데이터 출력
				BookVO vo = dao.bookNewDetailData(bno);
				model.addAttribute("vo", vo);
				model.addAttribute("bno", bno);		
				
				//관련 데이터 리스트 출력
				String genre = vo.getGenre();			
				//System.out.println("해당책의 장르는 "+genre+"입니다."); //확인용.
				List<BookVO> list = dao.bookNewRelationListData(genre);
				model.addAttribute("list", list);
				int point = vo.getIntprice() / 100 * 5; //5퍼센트 기본 적립.
				model.addAttribute("point",point);
				
				//리뷰 입력
				//BookCommentVO cvo = dao.bookCommentData();
				
				//리뷰 데이터 리스트 출력			
				System.out.println("bno는 "+bno+"입니다.");			
				List<BookCommentVO> clist = dao.bookCommentListData(bno);//bno를 가져와서 bno==dc_bno인 데이터를 출력.
				model.addAttribute("clist",clist);
				
				
				
				model.addAttribute("main_jsp", "../book/newdetail.jsp");
				return "main/main";
			}
		
		

}
