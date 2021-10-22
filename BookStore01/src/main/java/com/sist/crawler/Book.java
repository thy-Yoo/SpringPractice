package com.sist.crawler;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;

public class Book {
	
	BookDAO dao=new BookDAO();
	public void bookAllDataCrawling()
	{
		int k = 1;
		try { 
			for (int i = 1; i <= 5; i++) {
				/* 예스 24 크롤링 불가 -> 소스는 보이나 긁어지지 않음. 막혀있음.
				 * 인터파크 불가 -> 주소가 숨겨져 있음.
				 * 네이버 open api -> 스프링을 더 공부해야함.
				*/
				/* 알라딘 URL */
				Document doc = Jsoup.connect("https://www.aladin.co.kr/shop/wbrowse.aspx?"
						+ "BrowseTarget=List&ViewRowsCount=25&ViewType=Detail&PublishMonth=0&SortOrder=2&page="
						+ i 
						+ "&Stockstatus=1&PublishDay=84&CID=50917&SearchOption=")
						.get();
				Elements title = doc.select("tr > td > table > tbody > tr > td > div > ul > li > a:nth-child(1) > b:nth-child(1)");
				//Elements cate1 = doc.select("tr > td > table > tbody > tr > td > div > ul > li > a:nth-child(1) > b:nth-child(1)");//img[src*=/recipe/]
				//Elements cate2 = doc.select("tr > td > table > tbody > tr > td > div > ul > li > a:nth-child(1) > b:nth-child(1)");
				//Elements cate3 = doc.select("tr > td > table > tbody > tr > td > div > ul > li > a:nth-child(1) > b:nth-child(1)");
				//#book_title_14 > a:nth-child(1) 직지 html body div#wrap div#container.type3 div#content div#category_section.category_section.category_section2 ol.basic.top100 li dl dt#book_title_14 a.N=a:bta.title
				//System.out.println("title.size()="+title.size()); //확인용.
				for (int j = 0; j < title.size() ; j++) {
					try {
						BookVO vo = new BookVO();
						vo.setBnum(k);
						vo.setTitle(title.get(j).text());
						vo.setCate1("국내도서");
						vo.setCate2("소설/시/희곡");
						vo.setCate3("한국소설");
						
						//크롤링 잘 되었는지 확인
						System.out.println("Bnum:" + k);
						System.out.println("Title:" + vo.getTitle());
						System.out.println("Cates:" + vo.getCate1() + " > "  + vo.getCate2() + " > " + vo.getCate3());
						System.out.println("k=" + k);
						
						//dao에 데이터 넣기
						//dao.bookDataInsert(vo);
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
