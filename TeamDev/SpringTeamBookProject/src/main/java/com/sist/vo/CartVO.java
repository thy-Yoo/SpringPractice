package com.sist.vo;

import java.util.*;

/*
 *	CARTID    NOT NULL NUMBER(10)    
	USERID             VARCHAR2(500) 
	PRODUCTID          NUMBER        
	CART_QTY           NUMBER        
	REGDATE            DATE    
 */
public class CartVO {
	private String userId, msg, image, title, price, regday;
	private int cartId, productId, cart_qty, intprice;
	private Date regdate;
	
	public String getRegday() {
		return regday;
	}
	public void setRegday(String regday) {
		this.regday = regday;
	}
	public int getIntprice() {
		return intprice;
	}
	public void setIntprice(int intprice) {
		this.intprice = intprice;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
