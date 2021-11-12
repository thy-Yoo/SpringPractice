package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;
import com.sist.vo.OrderDetailVO;
import com.sist.vo.OrderFormVO;
import com.sist.vo.OrderVO;
@Repository
public class OrderDAO {
	@Autowired
	private OrderMapper mapper;
	
	public void orderPayInsert(OrderFormVO vo)
	{
		mapper.orderPayInsert(vo);
	}
	
	public List<OrderFormVO> orderPayListData(String user_id)
	{
		OrderFormVO vo=new OrderFormVO();
		Date deliver_date=vo.getDeliver_date();
		return mapper.orderPayListData(user_id);
	}
	
	public void orderSaleUpdate(int order_no)
	{
		mapper.orderSaleUpdate(order_no);
	}
	public void orderSaleDelete(int order_no)
	{
		mapper.orderSaleDelete(order_no);
	}
	
	public void orderInsert(CartVO vo)
	{
		mapper.orderInsert(vo);
	}
	
	public List<CartVO> orderListData(String userId)
	{
		return mapper.orderListData(userId);
	}
	
	public void orderDelete(int cartId)
	{
		mapper.orderDelete(cartId);
	}
	
	public int orderCount(CartVO vo)
	{
		return mapper.orderCount(vo);
	}
	public void orderCountUpdate(CartVO vo)
	{
		mapper.orderCountUpdate(vo);
	}
	
	public List<MemberVO> userData(String userId)
	{
		return mapper.userData(userId);
	}
	public int orderSumAmount(String userId)
	{
		return mapper.orderSumAmount(userId);
	}
	public int orderSumPrice(String userId)
	{
		return mapper.orderSumPrice(userId);
	}
/*
	public List<OrderFormVO> orderListData(String user_id)
	{
		return mapper.orderListData(user_id);
	}
	*/
}
