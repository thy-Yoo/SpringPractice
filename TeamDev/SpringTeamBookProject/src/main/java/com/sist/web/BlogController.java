package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.NoticeVO;
import com.sist.vo.*;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("blog/")
public class BlogController {
	@Autowired
	private BlogDAO dao;
	
	@GetMapping("list.do")
	public String blog_list(String page,String category,String tag, Model model)
	{
		if(page==null)
			page="1";
		if(category==null)
			category="";
		if(tag==null)
			tag="";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=6;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		map.put("start", start);
		map.put("end", end);
		List<BlogVO> list=new ArrayList<BlogVO>();
		int totalpage=0;
		if(category==""&& tag=="") {
			list=dao.BlogList(map);
			totalpage=dao.BlogTotalPage();
		}
		else if(category!="") {
			map.put("col","category");
			map.put("val",category);
			list=dao.BlogCList(map);
			totalpage=dao.BlogCTotalPage(map);
		}
		else if(tag!="") {
			map.put("col","tag");
			map.put("val",tag);
			list=dao.BlogCList(map);
			totalpage=dao.BlogCTotalPage(map);
		}
		
		for(BlogVO vo:list)
		  {
			  String s=vo.getContent();
			  if(s.length()>50)
			  {
				  s=s.substring(0,50)+"...";
				  vo.setContent(s);
			  }
		  }
			
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		List<String> tagList=dao.tagList();
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("curpage", curpage);
		model.addAttribute("category", category);
		model.addAttribute("tag", tag);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		model.addAttribute("tagList", tagList);
		model.addAttribute("today", sdf.format(date));
		model.addAttribute("main_jsp", "../blog/list.jsp");
		return "main/main";
	}
	
	@GetMapping("insert.do")
	public String blog_insert(Model model,HttpSession session)
	{
				
		model.addAttribute("main_jsp", "../blog/insert.jsp");
		return "main/main";
	}
	
	@PostMapping("insert_ok.do")
	public String blog_insert_ok(BlogVO vo,HttpSession Session) throws Exception
	{
		String user_id=(String)Session.getAttribute("id");
		vo.setUser_id(user_id);
		String membership=(String)Session.getAttribute("membership");
		vo.setMembership(membership);
		String name=(String)Session.getAttribute("name");
		vo.setName(name);
		System.out.println(vo.getUser_id());
		System.out.println(vo.getName());
		System.out.println(vo.getBook_title());
		System.out.println(vo.getCategory());
		BookVO bvo=dao.bookList(vo.getBook_title());
		vo.setImage(bvo.getImage());
		String path="c:\\download\\";
		File dir=new File(path);
		
		if(!dir.exists())
		{
			dir.mkdir();
		}
		
		List<MultipartFile> list=vo.getFiles();
		
		String files="";
		String sizes="";
		String uuid = UUID.randomUUID().toString();
		if(list!=null && list.size()>0)
		{
			for(MultipartFile mf:list)
			{
				String fn=mf.getOriginalFilename();
				//File file=new File("c:\\download\\"+(uuid+"_"+fn));
				File file=new File(path+(uuid+"_"+fn));
				mf.transferTo(file);
				files+=((uuid+"_"+fn)+",");
				sizes+=file.length()+",";
			}
			//vo.setImage(files.substring(0,files.lastIndexOf(",")));

		}
		else
		{
			//vo.setImage("");
		}
		dao.BlogInsert(vo);
		return "redirect:../blog/list.do";
	}
	
	@GetMapping("detail.do")
	public String blog_detail(int no, int page, Model model,HttpSession session)
	{
		BlogVO vo=dao.BlogDetailData(no);
		List<BlogReplyVO> list=dao.BlogReplyListData(no);
		List<String> tagList=dao.tagList();

		
		model.addAttribute("tagList",tagList);
		model.addAttribute("list",list);
		model.addAttribute("vo", vo);
		model.addAttribute("curpage", page);
		model.addAttribute("main_jsp", "../blog/detail.jsp");
		return "main/main";
	}
	
	@GetMapping("update.do")
	public String blog_update(int no,int page,Model model)
	{
		model.addAttribute("no",no);
		model.addAttribute("page", page);
		BlogVO vo=dao.BlogDetailData(no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../blog/update.jsp");
		return "main/main";
	}
	
	@PostMapping("update_ok.do")
	public String blog_update_ok(int no,int page,BlogVO vo,Model model)
	{
		model.addAttribute("page", page);
		model.addAttribute("no", vo.getNo());
		
		dao.BlogUpdate(vo);
		return "redirect:../blog/detail.do";
	}
	
	@GetMapping("delete_ok.do")
	@ResponseBody
	public void blog_delete_ok(int no, BlogReplyVO vo)
	{
		dao.BlogDelete(no);
		int dno=no;
		// 게시글 삭제시 댓글도 같이 삭제
		dao.BlogReplyDelete2(dno);
	}
	
	@PostMapping("replyinsert.do")
    public String blogreply_insert(int page,BlogReplyVO vo,RedirectAttributes attr,HttpSession session)
    {
    	String id=(String)session.getAttribute("id");
    	String name=(String)session.getAttribute("name");
    	vo.setUser_id(id);
    	vo.setName(name);
    	dao.BlogReplyCountIncrement(vo.getBno());
    	dao.BlogReplyInsert(vo);
    	attr.addAttribute("no", vo.getBno());
    	attr.addAttribute("page", page);
    	return "redirect:../blog/detail.do"; 
    }
    @PostMapping("replyupdate.do")
    public String blogreply_update(BlogReplyVO vo,int page,RedirectAttributes attr)
    {
    	dao.BlogReplyUpdate(vo);
    	attr.addAttribute("no", vo.getBno());
    	attr.addAttribute("page", page);
    	return "redirect:../blog/detail.do";
    }
    @GetMapping("replydelete.do")
    public String blogreply_delete(int no,int bno,int page,BlogReplyVO vo,RedirectAttributes attr)
    {
    	dao.BlogReplyCountDecrement(vo.getBno());
    	dao.BlogReplyDelete(no);
    	attr.addAttribute("no", bno);
    	attr.addAttribute("page", page);
    	return "redirect:../blog/detail.do";
    }
}
