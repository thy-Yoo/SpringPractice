package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
import java.util.*;
public interface MyPageMapper {

	
	@Select("SELECT memNum,user_id,name,birthday,genre,membership,regdate,point "
			+"FROM book_member "
			+"WHERE user_id=#{id} "
			+"ORDER BY memNum ASC")
	public List<MemberVO> memberList(String id);
	
	@Select("SELECT * FROM book_member WHERE user_id=#{id}")
	public MemberVO memberInfoData(String id);
	
	@Select("SELECT order_no,user_id,name,orderdate "
			+"FROM book_order "
			+"WHERE user_id=#{id} "
			+"ORDER BY order_no ASC")
	public List<OrderFormVO> orderList(String id);
	
	@Select("SELECT * FROM book_order "
			+"WHERE user_id=#{id}")
	public OrderFormVO orderInfoData(String id);
	
}
