package com.sist.dao;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {
	@Autowired
	private MainMapper mapper;
	
	public List<BookVO> MainTopListData()
	{
		return mapper.MainTopListData();
	}
	
	public List<BookVO> MainMiddleListData()
	{
		return mapper.MainMiddleListData();
	}
	
	public List<BookVO> MainBotNewListData()
	{
		return mapper.MainBotNewListData();
	}
	
	public List<BookVO> MainBotBestListData()
	{
		return mapper.MainBotBestListData();
	}
	
	public List<BookVO> MainBotRecListData()
	{
		return mapper.MainBotRecListData();
	}
}
