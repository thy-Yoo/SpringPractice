package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
/*
	private String user_id,subject,image,content,category,tag;
	private Date regdate;
	
	NO       NOT NULL NUMBER         
USER_ID  NOT NULL VARCHAR2(20)   
SUBJECT  NOT NULL VARCHAR2(1000) 
IMAGE             VARCHAR2(1000) 
CONTENT  NOT NULL CLOB           
REGDATE           DATE           
CATEGORY NOT NULL VARCHAR2(500)  
TAG      NOT NULL VARCHAR2(500)
 */
public interface BlogMapper {
	@Select("SELECT no,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,image,name,num,replycount "
			+"FROM (SELECT no,subject,content,regdate,image,name,replycount,rownum as num "
			+"FROM (SELECT no,subject,content,regdate,image,name,replycount "
			+"FROM book_blog ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<BlogVO> BlogList(Map map);
	
	@Select("SELECT no,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,image,name,num,replycount "
			+"FROM (SELECT no,subject,content,regdate,image,name,replycount,rownum as num "
			+"FROM (SELECT no,subject,content,regdate,image,name,replycount "
			+"FROM book_blog WHERE ${col}=#{val} ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<BlogVO> BlogCList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM book_blog")
	public int BlogTotalPage();
	
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM book_blog WHERE ${col}=#{val}")
	public int BlogCTotalPage(Map map);
	
	@SelectKey(keyProperty="no", resultType=int.class , before=true,
		     statement="SELECT NVL(MAX(no)+1,1) as no FROM book_blog")
	
	@Insert("INSERT INTO book_blog VALUES("
		  +"#{no},#{user_id},#{subject},#{image},#{content},SYSDATE,#{category},#{tag},#{membership},#{name},0)")
	public void BlogInsert(BlogVO vo);
	
	
	@Select("SELECT no,user_id,subject,content,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,image,category,tag,membership,name,replycount "
			+"FROM book_blog WHERE no=#{no}")
	public BlogVO BlogDetailData(int no);
	
	@Delete("DELETE FROM book_blog WHERE no=#{no}")
	public void BlogDelete(int no);
	
	@Update("UPDATE book_blog SET "
			+"user_id=#{user_id},subject=#{subject},content=#{content} WHERE no=#{no}")
	public void BlogUpdate(BlogVO vo);
	
	
	@SelectKey(keyProperty="no", resultType=int.class , before=true,
		     statement="SELECT NVL(MAX(no)+1,1) as no FROM book_blogreply")
	@Insert("INSERT INTO book_blogreply(no,user_id,bno,name,msg) VALUES("
			 +"#{no},#{user_id},#{bno},#{name},#{msg})")
	public void BlogReplyInsert(BlogReplyVO vo);
	  
	
	
	@Select("SELECT no,user_id,bno,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday "
			 +"FROM book_blogreply "
			 +"WHERE bno=#{bno}"  
			 +"ORDER BY no DESC") 
	public List<BlogReplyVO> BlogReplyListData(int bno);
	  
	  
	@Update("UPDATE book_blogreply SET "
			 +"msg=#{msg} "
			 +"WHERE no=#{no}")
	public void BlogReplyUpdate(BlogReplyVO vo);
	
	@Delete("DELETE FROM book_blogreply "
			 +"WHERE no=#{no}")
	public void BlogReplyDelete(int no);
	
	@Delete("DELETE FROM book_blogreply "
			 +"WHERE bno=#{bno}")
	public void BlogReplyDelete2(int bno);
	
	@Update("UPDATE book_blog SET replycount=replycount+1 WHERE no=#{no}")
	public void BlogReplyCountIncrement(int no);
	
	@Update("UPDATE book_blog SET replycount=replycount-1 WHERE no=#{no}")
	public void BlogReplyCountDecrement(int no);
	
	@Select("SELECT tag FROM (SELECT tag ,COUNT(*) as cnt FROM book_blog group by tag order by cnt desc) WHERE rownum<=4")
	public List<String> tagList();
	
	@Select("SELECT DISTINCT title,url,image FROM book_data WHERE title Like '%'||#{ss}||'%' AND rownum<=1")
	public BookVO bookList(String ss);

}
