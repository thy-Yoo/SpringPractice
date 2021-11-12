package com.sist.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ShopMapper;
import com.sist.vo.*;
import java.util.*;
@Repository
public class ShopDAO {
	@Autowired
	private ShopMapper mapper;
	
	public List<ShopVO> shopListData(Map map){
		return mapper.shopListData(map);
	}
	
	public ShopVO shopDetailData(String id) {
		return mapper.shopDetailData(id);
	}
	public List<ShopVO> searchListData(Map map){
		return mapper.searchListData(map);
	}
	public int shopTotalpage() {
		return mapper.shopTotalpage();
	}
	public int searchTotalpage(Map map) {
		return mapper.searchTotalpage(map);
	}
	
	public int searchTotal(Map map) {
		return mapper.searchTotal(map);
	}
	
	public int shopTotal() {
		return mapper.shopTotal();
	}
}
