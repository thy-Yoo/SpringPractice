package com.sist.web;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.vo.BookCommentVO;
import com.sist.vo.BookVO;
import com.sist.vo.MemberVO;
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
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("cate", "");
				if(page==null)
					page="1";
				int curpage=Integer.parseInt(page);
				//Map map=new HashMap();
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
				
				List<BookVO> saleslist2=dao.bookNewListData_SalesRandom(map);//상단부, 판매중인 도서.
				
				
				
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage",totalpage);
				model.addAttribute("BLOCK", BLOCK);
				model.addAttribute("startPage",startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("list", list);
				model.addAttribute("saleslist", saleslist2);
				model.addAttribute("main_jsp", "../book/newlist.jsp");				
				return "main/main";
				
			}
			
			/* 카테고리 선택 - 목록출력*/			
			@RequestMapping("book/newlistSelectCate.do")
			 public String book_menu_category(String page, Model model, Integer select, HttpSession session, HttpServletRequest request) {
				HashMap<String, Object> map=new HashMap<String, Object>();
				
				//가격 선택
		
				//카테고리 선택
				if(select==null) {
					select=999;
					System.out.println("선택된 카테고리가 없습니다.");
				}
				
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
					map.put("cate", "");
				}
				
				if(page==null)
					page="1";
				int curpage=Integer.parseInt(page);
				
				int rowSize=12;
				int start=(rowSize*curpage)-(rowSize-1);
				int end=(rowSize*curpage);
				map.put("start", start);
				map.put("end", end);
				
				List<BookVO> list=dao.bookNewListData_SelectCate(map); //하단부, 카테고리 선택시 출력. 페이징처리가 필요한 데이터.
				List<BookVO> saleslist=dao.bookNewListData_SalesRandom(map);//상단부, 판매중인 도서.
				
				//추천 도서 - 로그인 세션 데이터 활용.				
				String usergenre = "소설,시/에세이,인문,사회과학,예술/대중문화,가정과 생활,유아,국어/외국어/사전,자기계발";
				String myid = (String)session.getAttribute("id");
				if(myid==null) {
					System.out.println("로그아웃 상태입니다.");					
				}
				else {
					System.out.println("user_id는"+myid+"입니다.");
					MemberVO userdata = dao.bookNewMemberGenre(myid);
					usergenre = userdata.getGenre();
				}				
				System.out.println("usergenre는"+usergenre+"입니다.");
				map.put("usergenre", usergenre);
				List<BookVO> recommendlist=dao.bookNewRecommendData(map);
				List<BookVO> recommendlist2=dao.bookNewRecommendData(map);
				List<BookVO> recommendlist3=dao.bookNewRecommendData(map);
				
				
				// 총페이지 
				map.put("table_name", "book_data");
				int totalpage=dao.bookNewTotalPage(map);
				final int BLOCK=10;
				int startPage=((curpage-1)/BLOCK*BLOCK)+1;
				int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
				if(endPage>totalpage)
					endPage=totalpage;
				
				model.addAttribute("whatCate",whatCate);
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage",totalpage);
				model.addAttribute("BLOCK", BLOCK);
				model.addAttribute("startPage",startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("list", list);
				model.addAttribute("saleslist", saleslist);
				model.addAttribute("rlist",recommendlist);
				model.addAttribute("r2list",recommendlist2);
				model.addAttribute("r3list",recommendlist3);
				model.addAttribute("main_jsp", "../book/newlist.jsp");				
				return "main/main";
				
				 
			 }
			
			
			
			
			// 신간 도서 상세 페이지
			@RequestMapping("book/newdetail.do")
			public String book_newdetail(int bno, Model model) {
				HashMap<String, Object> map=new HashMap<String, Object>();
				
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
				
				//리뷰 데이터 리스트 출력			
				System.out.println("bno는 "+bno+"입니다.");	
				map.put("bno", bno);
				List<BookCommentVO> clist = dao.bookCommentListData(map);//bno를 가져와서 bno==dc_bno인 데이터를 출력.
				
				//리뷰 데이터 개수 입력
				BookCommentVO ccvo = dao.bookNewCommentCount(bno);
				//별점을 통해 평점 출력
				BookCommentVO starvo = dao.bookCommentStarData(map);
				//System.out.println("starvo.avgs는:"+starvo.getAvgs()+"입니다.");
				double aaa = 0.0;
				if(starvo==null) {
					System.out.println("값이 없습니다.");
				}
				else{
					aaa = starvo.getAvgs();
					System.out.println("avgs는:"+aaa+"입니다.");
				}
				
				
				model.addAttribute("starvo",starvo);
				model.addAttribute("ccvo",ccvo);				
				model.addAttribute("clist",clist);				
				
				model.addAttribute("main_jsp", "../book/newdetail.jsp");
				return "main/main";
			}
		
			
			
			//3-1. 리뷰 입력
			@RequestMapping("book/newdetail_commentInput.do")
			public String book_newdetail_commentInput(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
				
				
				/*bno,제목,리뷰내용 얻기*/
				int bno = Integer.parseInt(request.getParameter("bno"));
				String title = request.getParameter("title");
				String comments = request.getParameter("comments");
				String writer = request.getParameter("writer");
				
				System.out.println("bno는?"+bno+"입니다.");
				System.out.println("title은?"+title+"입니다.");
				
				/*넣어야할것 : dc_bno, title, comments,writedate*/
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("bno", bno);
				map.put("title",title);
				map.put("comments", comments);
				map.put("writer",writer);
				// 평점 옵션
				int stars=0;//입력폼으로 받은 값.
				if(request.getParameter("rating")==null) {
					stars=0;
				}
				else {
					stars = Integer.parseInt(request.getParameter("rating"));
				}
				System.out.println("rating은:"+stars+"입니다.");//확인한 후.
				map.put("rating",stars); //#{rating}에서 쓰기 위해 넣음.
				
				
				dao.bookCommentInputData(map); //데이터 넣고  
				
				
				
				String reurl = "redirect:../book/newdetail.do?bno="+Integer.toString(bno); 
				return reurl;
			}
			
		
}
