package com.sist.crawler;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;

public class Book {
	
	
    BookDAO dao = new BookDAO();
	
	public void bookAllDataCrawling()
	{
		int k = 1;
		try { 
			for (int i = 1; i <= 5; i++) {
				/* 예스 24 크롤링 불가 -> 소스는 보이나 긁어지지 않음. 막혀있음.
				 * 인터파크 불가 -> 주소가 숨겨져 있음.
				 * 네이버 open api -> 스프링을 더 공부해야함.
				*/
				/* 알라딘 URL 
				 * doc = 국내도서 > 소설/시/희곡 > 한국소설
				 * */
				Document doc = Jsoup.connect("https://www.aladin.co.kr/shop/wbrowse.aspx?"
						+ "BrowseTarget=List&ViewRowsCount=25&ViewType=Detail&PublishMonth=0&SortOrder=2&page="
						+ i 
						+ "&Stockstatus=1&PublishDay=84&CID=50917&SearchOption=")
						.get();
				Elements title = doc.select("tr > td > div > ul > li:nth-child(2) > a:nth-child(1) > b:nth-child(1)");
				Elements writer = doc.select("tr > td > div > ul > li:nth-child(3) > a:nth-child(1)");
				Elements publisher = doc.select("tr > td > div > ul > li:nth-child(3) > a:nth-child(2)");
				Elements price = doc.select("tr > td > div > ul > li:nth-child(4) > span:nth-child(1)");				
				//Elements pubDate = doc.select("");
				//System.out.println("title.size()="+title.size()); //확인용.
				
				//위까지는 일반페이지에서의 데이터크롤링, 아래는 상세페이지에서의 데이터 크롤링
				Elements poster_a = doc.select("div > table > tbody > tr:nth-child(1) > td:nth-child(2) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > a:nth-child(1)");
				String poster_aLink=null;
				
				
				
				for (int j = 0; j < title.size() ; j++) {
					try {
						BookVO vo = new BookVO();
						//일반 페이지에서 크롤링
						vo.setBnum(k);
						vo.setCate1("국내도서");
						vo.setCate2("소설/시/희곡");
						vo.setCate3("한국소설");
						vo.setTitle(title.get(j).text());
						vo.setWriter(writer.get(j).text());
						vo.setPublisher(publisher.get(j).text());
						vo.setPrice(price.get(j).text());
						//상세페이지에서 크롤링 관련
						poster_aLink=poster_a.get(j).getElementsByAttribute("href").attr("href");
						Document doc_detail = Jsoup.connect(poster_aLink).get();
						//boodetail은 양장본인지, 몇쪽인지, 책의 크기, 무게, 상품분류코드 를 적어둔 정보.
						//여기서 필요한 정보를 추출하여 쓰자.
						Elements bookdetail = doc_detail.select("div.conts_info_list1 > ul:nth-child(1)");
						//System.out.println(bookdetail.get(0).text()); //중간 확인용.
						/* 쪽수 데이터 나누기. */
						//eachText()를 사용하기 위해 반환 타입에 맞는 변수 선언.
						ArrayList<String> bookdetail_list = (ArrayList<String>) bookdetail.eachText();
						//"쪽"이라는 글자가 나오는 위치를 집어넣을 변수.
						int pageIndex = 0;
						//"쪽"이라는 글자가 나오는 위치 알아내는 구문.						
						for(int t=0; t<bookdetail_list.get(0).length(); t++) {
							if( bookdetail_list.get(0).charAt(t)=='쪽') {	
								pageIndex=t;									
								//System.out.println("쪽위치:"+pageIndex);
							}
						}
						//"쪽"을 기준으로 3칸앞의 글자부터 Get!!
						String pageno = null;
						pageno = (String) bookdetail_list.get(0).subSequence(pageIndex-3,pageIndex+1);
						System.out.println(pageno);
						
						vo.setPageno(pageno);
						
						//크롤링 잘 되었는지 확인
						System.out.println("Bnum:" + k);
						//System.out.println("Cates:" + vo.getCate1() + " > "  + vo.getCate2() + " > " + vo.getCate3());
						System.out.println("Title:" + title.get(j).text());
						System.out.println("Writer:" + writer.get(j).text());
						System.out.println("Publisher:" + publisher.get(j).text());
						System.out.println("Price:" + price.get(j).text());
						System.out.println(poster_aLink);
						System.out.println(bookdetail.get(0).text());
						System.out.println("Pageno:"+ pageno);
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




