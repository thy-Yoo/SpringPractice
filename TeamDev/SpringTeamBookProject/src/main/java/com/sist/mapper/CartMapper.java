package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface CartMapper {
	// 장바구니 검색
	@Select("SELECT DECODE(COUNT(*), 0, 'false', 'true') FROM book_cart "
			+ "WHERE productId=#{productId} "
			+ "AND userId=#{userId}")
	public String findCartGoods(CartVO vo);
	
	// 장바구니 추가
	@SelectKey(keyProperty="cartId", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(cartId)+1, 1) as cartId FROM book_cart")
	@Insert("INSERT INTO book_cart (cartId, userId, productId, cart_qty) "
			+ "VALUES(#{cartId}, #{userId}, #{productId}, #{cart_qty})")
	public void cartInsert(CartVO vo);
	
	// 장바구니 목록
	@Select("SELECT /*+ INDEX_DESC(book_cart bc_cartId_pk)*/cartId, userId, cart_qty, regdate, " 
			+ "(SELECT title FROM book_data WHERE book_data.bno=book_cart.productId) as title, " 
			+ "(SELECT image FROM book_data WHERE book_data.bno=book_cart.productId) as image, "
			+ "(SELECT REPLACE(REPLACE(price, '원', ''),',','') "
			+ "FROM book_data WHERE book_data.bno=book_cart.productId) as price "
			+ "FROM book_cart "
			+ "WHERE userId=#{userId} "
			+ "AND regdate>=SYSDATE-3 AND regdate<=SYSDATE")
	public List<CartVO> cartListData(String userId);
	
	// 장바구니 전체 금액
	@Select("SELECT NVL(SUM((SELECT REPLACE(REPLACE(price, '원', ''),',','') "
			+ "FROM book_data WHERE book_data.bno=book_cart.productId)*cart_qty),0) as money "
			+ "FROM book_cart "
			+ "WHERE userId=#{userId}")
	public int cartSumCount(String userId);
	
	// 장바구니 수정
	@Update("UPDATE book_cart SET cart_qty=#{cart_qty} "
			+ "WHERE userId=#{userId} AND productId=#{productId}")
	public void cartUpdate(CartVO vo);
	
	// 장바구니 삭제
	@Delete("DELETE FROM book_cart WHERE cartId=#{cartId}")
	public void cartDelete(int cartId);
	
	// 장바구니에 동일한 상품 레코드 확인
	@Select("SELECT COUNT(*) FROM book_cart "
			+ "WHERE userId=#{userId} AND productId=#{productId}")
	public int cartCount(CartVO vo);
	
	// 장바구니에 동일한 상품이 존재하면 수정
	@Update("UPDATE book_cart SET cart_qty=cart_qty+#{cart_qty} "
			+ "WHERE userId=#{userId} AND productId=#{productId}")
	public void cartCountUpdate(CartVO vo);
}
