package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import java.util.*;
import com.sist.vo.*;

import javax.servlet.http.HttpSession;
@Controller
public class MyPageController {
	@Autowired 
	private CartDAO cdao;
	
	@Autowired 
	private OrderDAO odao;
	
	@Autowired
	private MyPageDAO dao;
/*	
	@RequestMapping("mypage/mypage")
	public String mypage_mypage(String user_id,Model model)
	{

		Map map=new HashMap();
		List<String> list=dao.memberListData(map);
		MemberVO mvo=dao.memberInfoData(user_id);
		OrderFormVO ovo=dao.orderInfoData(user_id);
		
		
		model.addAttribute("list", list);
		model.addAttribute("mvo", mvo);
		model.addAttribute("ovo", ovo);
		model.addAttribute("main_jsp", "../mypage/mypage.jsp");
		return "main/main";
	}
*/	
	@GetMapping("mypage/mypage.do")
	public String mypage_mypage(HttpSession session,Model model)
	{
		String id=(String)session.getAttribute("id");
		
		List<MemberVO> list=dao.memberList(id);
		//MemberVO vo=dao.memberInfoData(id);
		
		List<OrderFormVO> olist=dao.orderList(id);
		//OrderFormVO ovo=dao.orderInfoData(id);
		
		//model.addAttribute("ovo", ovo);
		//model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("olist", olist);
		model.addAttribute("main_jsp", "../mypage/mypage.jsp");
		return "main/main";
	}

}
