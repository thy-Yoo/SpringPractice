package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class AdminController {
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("admin/main.do")
	public String main(Model model){
		model.addAttribute("main_jsp", "../admin/main.jsp");
		return "main/main";
	}
	
	@RequestMapping("admin/memberList.do")
	public String member_list(Model model)
	{
		Map map=new HashMap();
		List<MemberVO> list=dao.memberListData(map);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../admin/memberList.jsp");
		return "main/main";
	}
	
	@GetMapping("admin/orderList.do")
	public String orderList(Model model)
	{
		List<OrderFormVO> list=dao.orderAdminListData();
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../admin/orderList.jsp");
		return "main/main";
	}
	
	@GetMapping("admin/goodsAdminYes.do")
	public String goodsAdminYes(int no)
	{
		dao.goodsAdminYes(no);
		return "redirect:../admin/orderList.do";
	}
}
