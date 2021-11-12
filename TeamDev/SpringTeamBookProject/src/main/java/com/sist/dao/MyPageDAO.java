package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.MemberVO;
import com.sist.vo.OrderFormVO;

@Repository
public class MyPageDAO {
	@Autowired
	private MyPageMapper mapper;
	
	public List<MemberVO> memberList(String id)
	{
		return mapper.memberList(id);
	}
	public MemberVO memberInfoData(String id)
	{
		return mapper.memberInfoData(id);
	}
	
	public List<OrderFormVO> orderList(String id)
	{
		return mapper.orderList(id);
	}
	public OrderFormVO orderInfoData(String id)
	{
		return mapper.orderInfoData(id);
	}
}
