package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class FreeBoardDAO {
	@Autowired
	private FreeBoardMapper mapper;
	
	public List<FreeBoardVO> freeBoardList(Map map)
	{
		return mapper.freeBoardList(map);
	}
	
	public int freeBoardTotalPage()
	{
		return mapper.freeBoardTotalPage();
	}
	
	public void freeBoardInsert(FreeBoardVO vo)
	{
		mapper.freeBoardInsert(vo);
	}
	
	public FreeBoardVO freeBoardDetail(int no)
	{
		mapper.freeBoardHitIncrement(no);
		return mapper.freeBoardDetail(no);
	}
	
	public void freeBoardUpdate(FreeBoardVO vo)
	{
		mapper.freeBoardUpdate(vo);
	}
	
	public void freeBoardDelete(int no)
	{
		mapper.freeBoardDelete(no);
	}
	
	public List<FreeBoardVO> freeBoardFind(Map map)
	{
		return mapper.freeBoardFind(map);
	}
	
	
	// reply 
	public void freeBoardReplyInsert(FreeBoardReplyVO vo)
	{
		mapper.freeBoardReplyInsert(vo);
	}
	public List<FreeBoardReplyVO> freeBoardReplyListData(int bno)
	{
		return mapper.freeBoardReplyListData(bno);
	}
	public void freeBoardReplyUpdate(FreeBoardReplyVO vo)
	{
		mapper.freeBoardReplyUpdate(vo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void freeBoardReplyTransactionInsert(int pno, FreeBoardReplyVO vo)
	{
		FreeBoardReplyVO pvo=mapper.freeBoardReplyInfoData(pno);
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step()+1);
		vo.setGroup_tab(pvo.getGroup_tab()+1);
		vo.setRoot(pno);
		mapper.freeBoardReplyStepIncrement(pvo);
		mapper.freeBoardReplyTransactionInsert(vo);
		mapper.freeBoardReplyDepthIncrement(pno);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor=Exception.class)
	public void freeBoardReplyDelete(int no)
	{
		FreeBoardReplyVO vo=mapper.freeBoardReplyDepthInfoData(no);
		if(vo.getDepth()==0)
		{
			mapper.freeBoardDelete(no);
		}
		else
		{
			mapper.freeBoardReplyMsgUpdate(no);
		}
		mapper.freeBoardReplyDepthDecrement(vo.getRoot());
	}
	
	public int freeBoardReplyCount(int bno)
	{
		return mapper.freeBoardReplyCount(bno);
	}
}
