package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.BookVO;
@Repository
public class SearchDAO {
	@Autowired
	private SearchMapper mapper;
	
	public List<BookVO> bookAllSearchData(Map map)
	{
		return mapper.bookAllSearchData(map);
	}
	// title
	public List<BookVO> bookTitleData(String title)
	{
		return mapper.bookTitleData(title);
	}
	
	public List<BookVO> bookTitleSearchData(Map map)
	{
		return mapper.bookTitleSearchData(map);
	}
	
	public int bookTitleTotalPage(String title)
	{
		return mapper.bookTitleTotalPage(title);
	}
	
	// writer
	public List<BookVO> bookWriterData(String writer)
	{
		return mapper.bookWriterData(writer);
	}
	
	public List<BookVO> bookWriterSearchData(Map map)
	{
		return mapper.bookWriterSearchData(map);
	}
	
	public int bookWrtierTotalPage(String writer)
	{
		return mapper.bookWrtierTotalPage(writer);
	}
	
	// translator
	public List<BookVO> bookTranslatorData(String translator)
	{
		return mapper.bookTranslatorData(translator);
	}
	
	public List<BookVO> bookTranslatorSearchData(Map map)
	{
		return mapper.bookTranslatorSearchData(map);
	}
	
	public int bookTranslatorTotalPage(String translator)
	{
		return mapper.bookTranslatorTotalPage(translator);
	}
}