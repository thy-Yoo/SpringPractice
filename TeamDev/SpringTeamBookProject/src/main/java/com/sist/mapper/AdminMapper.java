package com.sist.mapper;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
public interface AdminMapper {
	@Select("SELECT * FROM book_member WHERE user_id NOT IN ('admin') ORDER BY regdate DESC")
	public List<MemberVO> memberListData(Map map);
	
	// 어드민 페이지에서 결재
	@Select("SELECT /*+ INDEX_DESC(book_order bo_orderno_pk)*/order_no, user_id, amount, ischeck, issale, " 
			+ "title, price "
			+ "FROM book_order "
			+ "WHERE issale=1") // 구매를 요청한 데이터만 읽어온다
	public List<OrderFormVO> orderAdminListData();
	
	@Update("UPDATE book_order SET "
			+ "ischeck=1 "
			+ "WHERE order_no=#{order_no}")
	public void goodsAdminYes(int order_no);
}
