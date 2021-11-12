package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.vo.*;
import com.sist.mapper.*;
import java.util.*;

@Repository
public class NoticeDAO {
	@Autowired
	private NoticeMapper mapper;
	
	public List<NoticeVO> NoticeBoardList(Map map)
	{
		return mapper.NoticeBoardList(map);
	}
	
	public int NoticeTotalPage()
	{
		return mapper.NoticeTotalPage();
	}
	
	public void NoticeBoardInsert(NoticeVO vo)
	{
		mapper.NoticeBoardInsert(vo);
	}
	
	public NoticeVO NoticeDetailData(int no)
	{
		mapper.NoticeBoardHitIncrement(no);
		return mapper.NoticeDetailData(no);
	}
	
	public NoticeVO NoticeBoardUpdateData(int no)
	{
		return mapper.NoticeDetailData(no);
	}
	
	public void NoticeBoardUpdate(NoticeVO vo)
	{
		mapper.NoticeBoardUpdate(vo);
	}
	
	public void NoticeBoardDelete(int no)
	{
		mapper.NoticeBoardDelete(no);
	}
	
	public List<NoticeVO> NoticeFindData(Map map)
	{
		return mapper.NoticeFindData(map);
	}
}
