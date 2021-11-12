package com.sist.mapper;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;
public interface ShopMapper {
	@Select("SELECT id,name,address,open,close,tel,optn,adit,hday,la,lo,num "
			+ "FROM (SELECT id,name,address,open,close,tel,optn,adit,hday,la,lo,rownum as num "
			+ "FROM (SELECT id,name,addr as address,open,close,tel,optn,adit,hday,la,lo "
			+ "FROM book_store)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ShopVO> shopListData(Map map);
	
	@Select("SELECT id,name,addr as address,open,close,tel,optn,adit,hday,la,lo FROM book_store where id=#{id}")
	public ShopVO shopDetailData(String id);
	
	@Select("SELECT id,name,address,open,close,tel,optn,adit,hday,la,lo,num "
			+ "FROM (SELECT id,name,address,open,close,tel,optn,adit,hday,la,lo,rownum as num "
			+ "FROM (SELECT id,name,addr as address,open,close,tel,optn,adit,hday,la,lo "
			+ "FROM book_store WHERE (name||addr) like '%'||#{ss}||'%')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ShopVO> searchListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM book_store")
	public int shopTotalpage();
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM book_store WHERE (name||addr) like '%'||#{ss}||'%'")
	public int searchTotalpage(Map map);
	
	@Select("SELECT COUNT(*) FROM book_store WHERE (name||addr) like '%'||#{ss}||'%'")
	public int searchTotal(Map map);
	
	@Select("SELECT COUNT(*) FROM book_store")
	public int shopTotal();
}
