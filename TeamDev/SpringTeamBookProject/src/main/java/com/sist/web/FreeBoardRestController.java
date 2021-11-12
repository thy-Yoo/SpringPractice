package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

@RestController
public class FreeBoardRestController {
	@Autowired
	private FreeBoardDAO dao;
	

	
	/*
	@RequestMapping(value="freeboard/rest_find.do", produces = "text/plain;charset=UTF-8")
	public String find_rest(String ss,String[] fsArr)
	{
		String json="";
		try
		{	
			Map map=new HashMap();
			map.put("fsArr", fsArr);
			map.put("ss", ss);
			List<FreeBoardVO> list=dao.freeBoardFind(map);
	
			JSONArray arr=new JSONArray();
			for(FreeBoardVO vo:list)
			{
				JSONObject obj=new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("subject", vo.getSubject());
				obj.put("user_id", vo.getUser_id());
				obj.put("regdate", vo.getRegdate());
				obj.put("hit", vo.getHit());		
				arr.add(obj);
			}
			json=arr.toJSONString();
		}catch (Exception e) {}
		return json;
	}
	*/
}
