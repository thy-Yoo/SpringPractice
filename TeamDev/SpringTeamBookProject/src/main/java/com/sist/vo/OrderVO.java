package com.sist.vo;
import java.util.*;
public class OrderVO {
	private String user_id,name,addr1,addr2,tel,email;
	private int order_no;
	private Date orderdate,deliver_date;
	private String deliver_situ,deliver_msg;
	private int amount;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public Date getDeliver_date() {
		return deliver_date;
	}
	public void setDeliver_date(Date deliver_date) {
		this.deliver_date = deliver_date;
	}
	public String getDeliver_situ() {
		return deliver_situ;
	}
	public void setDeliver_situ(String deliver_situ) {
		this.deliver_situ = deliver_situ;
	}
	public String getDeliver_msg() {
		return deliver_msg;
	}
	public void setDeliver_msg(String deliver_msg) {
		this.deliver_msg = deliver_msg;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
