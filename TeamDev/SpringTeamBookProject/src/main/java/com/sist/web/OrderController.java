package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {
	@Autowired
	private OrderDAO dao;
	
	@GetMapping("mypage/order_list.do")
	public String order_list(Model model,HttpSession session)
	{
		String user_id=(String)session.getAttribute("id");
		List<OrderFormVO> list=dao.orderPayListData(user_id);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
		return "main/main";
	}
	
	@GetMapping("mypage/order_form.do")
	public String order_form_list(Model model, HttpSession session)
	{
		String userId=(String)session.getAttribute("id");
		List<CartVO> list=dao.orderListData(userId);
		List<MemberVO> mlist=dao.userData(userId);
		int totalAmount=dao.orderSumAmount(userId);
		int totalPrice=dao.orderSumPrice(userId);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("list", list);
		model.addAttribute("mlist", mlist);
		model.addAttribute("main_jsp", "../mypage/order_form.jsp");
		return "main/main";
	}
	 
	
	@RequestMapping("mypage/order_form_ok.do")
	public String order_form_insert_ok(int book_no, int amount, HttpSession session)
	{
		CartVO vo=new CartVO();
		String userId=(String)session.getAttribute("id");
		vo.setUserId(userId);
		vo.setProductId(book_no);
		vo.setCart_qty(amount);
		Map map=new HashMap();
		map.put("productId", book_no);
		map.put("userId", userId);
		// 기존 상품 검사
		int count=dao.orderCount(vo);
		if(count==0) {
			dao.orderInsert(vo);
		}
		else
		{
			dao.orderCountUpdate(vo);
		}
		return "redirect:../mypage/order_form.do";
	}
	
	@GetMapping("mypage/order_delete.do")
	public String order_delete(int no)
	{
		dao.orderDelete(no);
		return "redirect:../mypage/order_form.do";
	}
	
	@RequestMapping("mypage/pay_order_ok.do")
	public String pay_order_ok(OrderFormVO vo)
	{
//		System.out.println(vo.getUser_id());
//		System.out.println(vo.getName());
//		System.out.println(vo.getPost());
//		System.out.println(vo.getAddr1());
//		System.out.println(vo.getAddr2());
//		System.out.println(vo.getEmail());
//		System.out.println(vo.getTel());
//		System.out.println(vo.getMsg());
//		System.out.println(vo.getBook_no());
//		System.out.println(vo.getAmount());
		dao.orderPayInsert(vo);
		return "mypage/pay_order_ok";
	}
	
	// 결제확인요청
	@GetMapping("mypage/goodsYes.do")
	public String page_goodsYes(int no)
	{
		dao.orderSaleUpdate(no);
		return "redirect:../mypage/order_list.do";
	}
	
	@GetMapping("mypage/goodsNo.do")
	public String page_goodsNo(int no)
	{
		dao.orderSaleDelete(no);
		return "redirect:../mypage/order_list.do";
	}
	
}
