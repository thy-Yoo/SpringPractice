package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
@RequestMapping("member/")
public class MemberController {
	// dao불러오기
	@Autowired
	private MemberDAO dao;
	
	// 회원가입 화면이동
	@GetMapping("join.do")
	public String member_join(Model model)
	{
		model.addAttribute("main_jsp","../member/join.jsp");
		return "main/main";
	}
	
	// 아이디 중복체크
	@GetMapping("idcheck.do")
	@ResponseBody
	public String member_idcheck(String id)
	{
		String msg="";
		int count=dao.memberIdCheck(id);
		msg=String.valueOf(count);
		return msg;
	}
	
	// 회원가입폼 전송
	@PostMapping("join_ok.do")
	public String member_join_ok(MemberVO vo)
	{
		dao.memberInsert(vo);
		return "redirect:../main/main.do";
	}
	
	// 로그인화면 이동
	@GetMapping("login.do")
	public String member_login_ok(Model model)
	{
		model.addAttribute("main_jsp","../member/login.jsp");
		return "main/main";
	}
	
	// 로그인처리
	@PostMapping("login_ok.do")
	@ResponseBody
	public String member_login_ok(String id,String pwd,HttpSession session)
	{
		String msg="";
		MemberVO vo=dao.isLogin(id, pwd);
		if(vo.getMsg().equals("OK"))
		{
			session.setAttribute("id", vo.getUser_id());
			session.setAttribute("name", vo.getName());
			session.setAttribute("membership", vo.getMembership());
			session.setAttribute("admin", vo.getAdmin());
		}
		msg=vo.getMsg();
		return msg;
	}
	
	// 로그아웃처리
	@GetMapping("logout.do")
	public String member_logout(HttpSession session)
	{
		  session.invalidate();
		  return "redirect:../main/main.do";
	}

	// 아이디,비밀번호 찾기 화면이동
	@GetMapping("idpwd_find.do")
	public String member_idfind(Model model)
	{
		model.addAttribute("main_jsp", "../member/idpwd_find.jsp");
		return "main/main";
	}
	
	// 아이디 찾기 검색
	@PostMapping("idfind_ok.do")
	@ResponseBody
	public String member_idfind_ok(String tel)
	{
		String msg="";
		msg=dao.memberIdFindData(tel);
		return msg;
	}
	
	// 비밀번호 찾기 검색
	@PostMapping("pwdfind_ok.do")
	@ResponseBody
	public String member_pwdfind_ok(String id)
	{
		String msg="";
		msg=dao.memberPwdFindData(id);
		return msg;
	}
	
	// 회원정보 수정
	@GetMapping("join_update.do")
	public String member_join_update(HttpSession session,Model model)
	{
		String id=(String)session.getAttribute("id");
		
		MemberVO vo=dao.memberUpdateData(id);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../member/join_update.jsp");
		return "main/main";
	}
	
	@PostMapping("join_update_ok.do")
	public String member_join_update_ok(MemberVO vo,HttpSession session,Model model)
	{
		boolean bCheck=dao.memberJoinUpdate(vo);
		if(bCheck==true)
		{
			session.setAttribute("name", vo.getName());
		}
		model.addAttribute("bCheck", bCheck);
		return "member/join_update_ok";
	}
	
	// 회원탈퇴 화면이동
	@GetMapping("join_delete.do")
	public String member_join_delete(HttpSession session,Model model)
	{
		model.addAttribute("main_jsp", "../member/join_delete.jsp");
		return "main/main";
	}
	
	// 회원탈퇴
	@PostMapping("join_delete_ok.do")
	public String member_join_delete_ok(MemberVO vo,HttpSession session,Model model)
	{
		//System.out.println(vo.getPwd());
		String id=(String)session.getAttribute("id");
		vo.setUser_id(id);
		boolean bCheck=dao.memberJoinDelete(vo);
		if(bCheck==true)
		{
			session.invalidate();
		}
		model.addAttribute("bCheck", bCheck);
		return "member/join_delete_ok";
	}

	
}
