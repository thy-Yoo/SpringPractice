package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;
import com.sist.vo.OrderFormVO;
@Repository
public class AdminDAO {
	@Autowired
	private AdminMapper mapper;
	
	public List<MemberVO> memberListData(Map map)
	{
		return mapper.memberListData(map);
	}
	
	public List<OrderFormVO> orderAdminListData()
	{
		return mapper.orderAdminListData();
	}
	
	public void goodsAdminYes(int order_id)
	{
		mapper.goodsAdminYes(order_id);
	}
}
