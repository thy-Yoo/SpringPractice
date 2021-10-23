package com.sist.crawler;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;

public class BookCrawler_ala {

	 BookDAO dao = new BookDAO();
		
		public void bookCrawling01() /* 소설/시/희곡 */
		{
			int k = 1;
			try { 
				
				
				
				for (int i = 1; i <= 10; i++) {
					
					
					Document doc = Jsoup.connect("https://www.aladin.co.kr/shop/wbrowse.aspx?BrowseTarget=List"
							+ "&ViewRowsCount=25&ViewType=Detail&PublishMonth=0&SortOrder=2&page="
							+ i 
							+ "&Stockstatus=1&PublishDay=84&CID=1&SearchOption=")
							.get();
					Elements title = doc.select("tr > td > div > ul > li:nth-child(2) > a:nth-child(1) > b:nth-child(1)");
					Elements writer = doc.select("tr > td > table > tbody > tr > td > div > ul > li:nth-child(3) > a:nth-child(1)");
					Elements publisher = doc.select("tr > td > table > tbody > tr > td > div > ul > li:nth-child(3) > a:nth-child(2)");
					Elements price = doc.select("tr > td > div > ul > li:nth-child(4) > span:nth-child(1)");
					
					//Elements pubDate = doc.select("");
					//System.out.println("title.size()="+title.size()); //확인용.
					
					//위까지는 일반페이지에서의 데이터크롤링, 아래는 상세페이지에서의 데이터 크롤링
					Elements poster_a = doc.select("div > table > tbody > tr > td > table > tbody > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > a:nth-child(1)");
					String poster_aLink=null;
					
					
					
					for (int j = 0; j < title.size() ; j++) {
						try {
							BookVO vo = new BookVO();
							//일반 페이지에서 크롤링
							vo.setBnum(k);
							vo.setCate1("국내도서");
							vo.setCate2("소설/시/희곡");
							//vo.setCate3("");
							vo.setTitle(title.get(j).text());
							vo.setWriter(writer.get(j).text());
							vo.setPublisher(publisher.get(j).text());
							vo.setPrice(price.get(j).text());
							//상세페이지에서 크롤링 관련
							poster_aLink=poster_a.get(j).getElementsByAttribute("href").attr("href");
							Document doc_detail = Jsoup.connect(poster_aLink).get();
							//세부 카테고리 (소설/시/희곡 다음의 카테고리)
							Elements cate3 = null;
							Elements cate4 = null;
							if(doc_detail.select("#ulCategory > li:nth-child(1) > a:nth-child(3)").hasText()==false) {
								vo.setCate3("세부 장르 없음");
								//첫번째 태그 정보가 없으면 "장르 없음"
							}
							else if(doc_detail.select("#ulCategory > li:nth-child(2) > a:nth-child(3)").hasText()==false) {
								cate3 = doc_detail.select("#ulCategory > li:nth-child(1) > a:nth-child(3)");
								vo.setCate3(cate3.get(0).text());
								//첫번째 태그 정보는 있는데 두번째가 없으면 첫번째 정보를 넣음.
							}
							else {
								//첫번째 태그 정보는 있고, 두번째도 있으면 각각에 정보를 넣음.
								cate3 = doc_detail.select("#ulCategory > li:nth-child(1) > a:nth-child(3)");
								vo.setCate3(cate3.get(0).text());
								cate4 = doc_detail.select("#ulCategory > li:nth-child(2) > a:nth-child(3)");
								vo.setCate4(cate4.get(0).text());
							}					
							
							
							//#ulCategory > li:nth-child(1) > a:nth-child(3)
							//boodetail은 양장본인지, 몇쪽인지, 책의 크기, 무게, 상품분류코드 를 적어둔 정보.
							//여기서 필요한 정보를 추출하여 쓰자.
							Elements bookdetail = doc_detail.select("div.conts_info_list1 > ul:nth-child(1)");
			
							//System.out.println(bookdetail.get(0).text()); //중간 확인용.
							/* 쪽수 데이터 나누기. */
							//eachText()를 사용하기 위해 반환 타입에 맞는 변수 선언.
							ArrayList<String> bookdetail_list = (ArrayList<String>) bookdetail.eachText();
							//"쪽"이라는 글자가 나오는 위치를 집어넣을 변수.
							int pageIndex = 0;
							String pageno = null;
							//"쪽"이라는 글자가 나오는 위치 알아내는 구문.
							if(doc_detail.select("div.conts_info_list1 > ul:nth-child(1)").isEmpty()==true) {
								pageno ="정보없음"; //태그가 없을 경우 예외처리.
							}
							else {
								for(int t=0; t<bookdetail_list.get(0).length(); t++) {
									if( bookdetail_list.get(0).charAt(t)=='쪽') {	
										pageIndex=t;									
										System.out.println("쪽위치:"+pageIndex);
									}
								}
								//"쪽"을 기준으로 3칸앞의 글자부터 Get!!
								if(pageIndex-3>=0) {
									pageno = (String) bookdetail_list.get(0).subSequence(pageIndex-3,pageIndex);
								}
								else {
									pageno = (String) bookdetail_list.get(0).subSequence(0,pageIndex);
								}
							}
							
							
							
							//System.out.println(pageno);
							
							vo.setPageno(pageno);
							//vo.setCate3(cate3.get(j).text());
							//크롤링 잘 되었는지 확인
							System.out.println("Bnum:" + k);
							//System.out.println("Cates:" + vo.getCate1() + " > "  + vo.getCate2() + " > " + vo.getCate3());
							System.out.println("Title:" + vo.getTitle());
							System.out.println("Writer:" + vo.getWriter());
							System.out.println("Publisher:" + vo.getPublisher());
							System.out.println("Price:" + vo.getPrice());
							//System.out.println(poster_aLink); //세부주소 확인용.
							//System.out.println(bookdetail.get(0).text());
							System.out.println("Pageno:"+ vo.getPageno());
							System.out.println("Cate3:"+vo.getCate3());
							System.out.println("Cate4:"+vo.getCate4());
							System.out.println("============================================");
							
						
							//dao에 데이터  넣기
							dao.bookDataInsert(vo);
							//recipeDetailData(vo.getLink(), k);
							k++;

						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			
					System.out.println("End...");
				} catch (Exception ex) {
					ex.printStackTrace();
				}

		}

		
		
	
}
