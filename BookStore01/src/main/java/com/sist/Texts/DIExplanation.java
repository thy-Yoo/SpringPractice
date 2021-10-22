package com.sist.Texts;

public class DIExplanation {

}

/*
 * DI란?
 * Dependency Injection, 의존 주입
 * "객체간의 의존"
 * 
 * [예시] 회원가입을 처리하는 기능을 구현 할 때,
 *	public class MemberRegisterService {
 * 		private MemberDAO memberDAO = new MemberDAO();
 * 		//이메일을 이용하여 멤버를 조회하기 위해
 * 		Member member = memberDAO.selectByEmail(req.getEmail());
 *		//만약 
 *	}
 */
