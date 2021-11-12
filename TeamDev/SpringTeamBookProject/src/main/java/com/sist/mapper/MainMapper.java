package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface MainMapper {
	@Select("SELECT bno,title,image,sale,num "
			+"FROM (SELECT bno,title,image,sale,rownum as num "
			+"FROM (SELECT bno,title,image,sale "
			+"FROM book_data WHERE SALE>0 AND RANK IS NOT NULL ORDER BY SALE DESC)) WHERE num<=5")
	public List<BookVO> MainTopListData();
	
	@Select("SELECT * "
			+"FROM (SELECT bno,title,genre,price,image,TO_DATE(pubdate,'YYYY\"년\" MM\"월\" DD\"일\"') AS recentd FROM book_data ORDER BY recentd DESC) " 
			+"WHERE rownum BETWEEN 1 AND 8 AND title IS NOT NULL")
	public List<BookVO> MainMiddleListData();
	
	@Select("SELECT * FROM (SELECT bno,title,price,genre,image,sale,pubdate FROM book_data "
			+"WHERE title IS NOT NULL AND RANK IS NOT NULL ORDER BY SALE DESC) "
			+"WHERE TO_CHAR(TO_DATE(pubdate,'YYYY\"년\" MM\"월\" DD\"일\"'),'YYYYMMDD')>'20210815' AND rownum BETWEEN 1 AND 6")
	public List<BookVO> MainBotNewListData();
	
	@Select("SELECT bno,rank,title,price,genre,image,sale " + 
			"FROM (SELECT bno,rank,title,price,genre,image,sale " + 
			"FROM (SELECT bno,rank,title,price,genre,image,sale " + 
			"FROM book_data ORDER BY RANK ASC)) " + 
			"WHERE title IS NOT NULL AND RANK IS NOT NULL AND rownum <=6")
	public List<BookVO> MainBotBestListData();
	
	@Select("SELECT bno,rank,score,title,price,genre,image,sale "+ 
			"FROM (SELECT bno,rank,score,title,price,genre,image,sale "+ 
			"FROM (SELECT bno,rank,score,title,price,genre,image,sale "+ 
			"FROM book_data ORDER BY score DESC)) "+ 
			"WHERE title IS NOT NULL AND RANK IS NOT NULL AND rownum <=6")
	public List<BookVO> MainBotRecListData();
}
