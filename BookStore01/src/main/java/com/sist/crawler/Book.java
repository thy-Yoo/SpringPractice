package com.sist.crawler;

import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;

public class Book {
	
	BookDAO dao=new BookDAO();
	public void bookAllDataCrawling()
	{
		int k = 1;
		try { 
			for (int i = 1; i <= 20; i++) {
				Document doc = Jsoup.connect("=accuracy&page=" + i)
						.get();
				Elements title = doc.select("");
				Elements cate1 = doc.select("");//img[src*=/recipe/]
				Elements cate2 = doc.select("");
				Elements cate3 = doc.select("");

				for (int j = 0; j < title.size(); j++) {
					try {
						BookVO vo = new BookVO();
						vo.setBnum(k);
						vo.setTitle(title.get(j).text());
						vo.setCate1(cate1.get(j).text());
						vo.setCate2(cate2.get(j).text());
						vo.setCate3(cate3.get(j).text());
						
						//크롤링 잘 되었는지 확인
						System.out.println("Bnum:" + k);
						System.out.println("Title:" + vo.getTitle());
						System.out.println("Cate1:" + vo.getCate1());
						System.out.println("Cate2:" + vo.getCate2());
						System.out.println("Cate3:" + vo.getCate3());
						System.out.println("k=" + k);
						
						//dao에 데이터 넣기
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
