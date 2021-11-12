package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface OrderMapper {


	// 주문하기 폼에서 -> 구매 버튼 누를시 서버로 데이터 전송
	@SelectKey(keyProperty="order_no", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(order_no)+1, 1) as order_no FROM book_order")
	@Insert("INSERT INTO book_order VALUES("
			+"#{order_no}, SYSDATE,"
			+ "#{name}, #{addr1}, #{addr2}, #{tel}, #{email}, #{msg}, #{post},#{price},#{amount},#{user_id},#{title}, "
			+ "0, 0)")
	public void orderPayInsert(OrderFormVO vo);
	
	// 주문 전체 수량
	@Select("SELECT SUM(cart_qty) FROM book_cart WHERE userId=#{userId} "
			+ "AND regdate>=SYSDATE-3 AND regdate<=SYSDATE")
	public int orderSumAmount(String userId);

	// 주문 전체 금액
	@Select("SELECT NVL(SUM((SELECT REPLACE(REPLACE(price, '원', ''),',','') "
			+ "FROM book_data WHERE book_data.bno=book_cart.productId)*cart_qty),0) as money "
			+ "FROM book_cart "
			+ "WHERE userId=#{userId} "
			+ "AND regdate>=SYSDATE-3 AND regdate<=SYSDATE")
	public int orderSumPrice(String userId);
	
	// 구매완료폼출력
	@Select("SELECT /*+ INDEX_DESC(book_order bo_orderno_pk)*/order_no, user_id, amount, price, title, "
			+ "name, addr1, addr2, tel, msg, orderdate, issale, ischeck "
			+ "FROM book_order "
			+ "WHERE user_id=#{user_id} "
			+ "AND orderdate>=SYSDATE-3 AND orderdate<=SYSDATE")
	public List<OrderFormVO> orderPayListData(String user_id);
	
	// 구매 요청
	@Update("UPDATE book_order SET "
			+ "issale=1 "
			+ "WHERE order_no=#{order_no}")
	public void orderSaleUpdate(int order_no);
	
	// 구매 취소
	@Delete("DELETE FROM book_order "
			+ "WHERE order_no=#{order_no}")
	public void orderSaleDelete(int order_no);
	
	// 주문 추가
	@SelectKey(keyProperty="cartId", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(cartId)+1, 1) as cartId FROM book_cart")
	@Insert("INSERT INTO book_cart (cartId, userId, productId, cart_qty) "
			+ "VALUES(#{cartId}, #{userId}, #{productId}, #{cart_qty})")
	public void orderInsert(CartVO vo);
	
	// 주문 목록
	@Select("SELECT /*+ INDEX_DESC(book_cart bc_cartId_pk)*/cartId, userId, cart_qty, TO_CHAR(regdate,'MM-DD') as regday, " 
			+ "(SELECT title FROM book_data WHERE book_data.bno=book_cart.productId) as title, " 
			+ "(SELECT image FROM book_data WHERE book_data.bno=book_cart.productId) as image, "
			+ "(SELECT REPLACE(REPLACE(price, '원', ''),',','') "
			+ "FROM book_data WHERE book_data.bno=book_cart.productId) as price "
			+ "FROM book_cart "
			+ "WHERE userId=#{userId} "
			+ "AND regdate>=SYSDATE-3 AND regdate<=SYSDATE")
	public List<CartVO> orderListData(String userId);
	
	// 주문 삭제
	@Delete("DELETE FROM book_cart WHERE cartId=#{cartId}")
	public void orderDelete(int cartId);
	
	// 동일한 상품 레코드 확인
	@Select("SELECT COUNT(*) FROM book_cart "
			+ "WHERE userId=#{userId} AND productId=#{productId}")
	public int orderCount(CartVO vo);
	
	// 동일한 상품이 존재하면 수정
	@Update("UPDATE book_cart SET cart_qty=cart_qty+#{cart_qty} "
			+ "WHERE userId=#{userId} AND productId=#{productId}")
	public void orderCountUpdate(CartVO vo);
	
	@Select("SELECT user_id, name, addr1, addr2, tel, email "
			+ "FROM book_member "
			+ "WHERE user_id=#{userId}")
	public List<MemberVO> userData(String userId);
	
//	@Select("SELECT /*+ INDEX_DESC(book_order bo_orderno_pk)*/ order_no,user_id,amount,"
//			+"(SELECT title FROM book_data WHERE book_data.bno=book_order.book_no) as title,"
//			+"(SELECT image FROM book_data WHERE book_data.bno=book_order.book_no) as image,"
//			+"(SELECT price FROM book_data WHERE book_data.bno=book_order.book_no) as image,"
//			+"(SELECT name FROM book_member WHERE book_member.user_id=book.order.user_id) as name,"
//			+"(SELECT addr1 FROM book_member WHERE book_member.user_id=book.order.user_id) as addr1,"
//			+"(SELECT addr2 FROM book_member WHERE book_member.user_id=book.order.user_id) as addr2,"
//			+"(SELECT tel FROM book_member WHERE book_member.user_id=book.order.user_id) as tel,"
//			+"(SELECT email FROM book_member WHERE book_member.user_id=book.order.user_id) as email "
//			+"FROM book_order "
//			+"WHERE user_id=#{user_id} "
//			+"AND orderdate>=SYSDATE-3 AND orderdate<=SYSDATE")
//	public List<OrderFormVO> orderListData(String user_id);
	
}
