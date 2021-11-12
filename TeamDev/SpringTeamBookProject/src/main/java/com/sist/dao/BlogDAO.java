package com.sist.dao;
import com.sist.mapper.*;
import com.sist.vo.BlogReplyVO;
import com.sist.vo.BlogVO;
import com.sist.vo.BookVO;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlogDAO {
	@Autowired
	private BlogMapper mapper;
	
	public List<BlogVO> BlogList(Map map)
	{
		return mapper.BlogList(map);
	}
	public List<BlogVO> BlogCList(Map map)
	{
		return mapper.BlogCList(map);
	}
	
	public int BlogTotalPage()
	{
		return mapper.BlogTotalPage();
	}
	public int BlogCTotalPage(Map map)
	{
		return mapper.BlogCTotalPage(map);
	}
	
	public void BlogInsert(BlogVO vo)
	{
		mapper.BlogInsert(vo);
	}
	
	public BlogVO BlogDetailData(int no)
	{
		return mapper.BlogDetailData(no);
	}
	
	public void BlogUpdate(BlogVO vo)
	{
		mapper.BlogUpdate(vo);
	}
	
	public void BlogDelete(int no)
	{
		mapper.BlogDelete(no);
	}
	
	public List<BlogReplyVO> BlogReplyListData(int bno)
	{
		return mapper.BlogReplyListData(bno);
	}
	
	public void BlogReplyUpdate(BlogReplyVO vo)
	{
		mapper.BlogReplyUpdate(vo);
	}
	
	public void BlogReplyDelete(int no)
	{
		mapper.BlogReplyDelete(no);
	}
	
	public void BlogReplyInsert(BlogReplyVO vo)
	{
		mapper.BlogReplyInsert(vo);
	}
	
	public void BlogReplyDelete2(int bno)
	{
		mapper.BlogReplyDelete2(bno);
	}
	
	public void BlogReplyCountIncrement(int no)
	{
		mapper.BlogReplyCountIncrement(no);
	}
	
	public void BlogReplyCountDecrement(int no)
	{
		mapper.BlogReplyCountDecrement(no);
	}
	public List<String> tagList(){
		return mapper.tagList();
	}
	public BookVO bookList(String ss){
		return mapper.bookList(ss);
	}


}
