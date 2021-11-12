package com.sist.dao;
import java.util.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*; 
  
@Repository
public class CartDAO { 
	@Autowired
	private CartMapper mapper;
	
	public CartVO findCartGoods(int productId, String userId)
	{
		CartVO vo=new CartVO();
		CartVO vo1=new CartVO();
		vo1.setProductId(productId);
		vo1.setUserId(userId);
		String check=mapper.findCartGoods(vo1);
		if(Boolean.parseBoolean(check)==true)
		{
			vo.setMsg("already_existed");
		}
		else
		{
			vo.setMsg("add_success");
			vo.setProductId(productId);
			vo.setUserId(userId);
		} 
		return vo;
	}
	
	public void cartInsert(CartVO vo)
	{
		mapper.cartInsert(vo);
	}
	
	public List<CartVO> cartListData(String userId)
	{
		return mapper.cartListData(userId);
	}
	
	public int cartSumCount(String userId)
	{
		return mapper.cartSumCount(userId);
	}
	
	public void cartUpdate(CartVO vo)
	{
		mapper.cartUpdate(vo);
	}
	
	public void cartDelete(int cartId)
	{
		mapper.cartDelete(cartId);
	}
	
	public int cartCount(CartVO vo)
	{
		return mapper.cartCount(vo);
	}
	public void cartCountUpdate(CartVO vo)
	{
		mapper.cartCountUpdate(vo);
	}
}
