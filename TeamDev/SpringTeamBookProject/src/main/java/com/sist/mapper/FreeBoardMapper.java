package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import com.sist.vo.FreeBoardVO;
import com.sist.vo.FreeBoardReplyVO;
public interface FreeBoardMapper {

	// List
	@Select("SELECT no,subject,writer,regdate,hit, num "
			+"FROM(SELECT no,subject,writer,regdate,hit, rownum as num "
			+"FROM(SELECT /*+ INDEX_DESC(book_freeBoard fb_no_pk) */ no,subject,writer,regdate,hit "
			+"FROM book_freeBoard)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<FreeBoardVO> freeBoardList(Map map);
	
	
	// TotalPage
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM book_freeBoard")
	public int freeBoardTotalPage();
	
	
	// Insert
	@SelectKey(keyProperty="no", resultType=int.class , before=true, statement="SELECT NVL(MAX(no)+1,1) as no FROM book_freeBoard")
	@Insert("INSERT INTO book_freeBoard VALUES(#{no},#{writer},#{subject},#{content},SYSDATE,0,#{filesize},#{filename},#{filecount})")	
	public void freeBoardInsert(FreeBoardVO vo);
	
	
	// Detail + Hit
	@Update("UPDATE book_freeBoard SET "
			+"hit=hit+1 "
			+"WHERE no=#{no}")
	public void freeBoardHitIncrement(int no);
	@Select("SELECT no,subject,writer,content,regdate,hit,fileName,fileSize,fileCount "
			+"FROM book_freeBoard "
			+"WHERE no=#{no}")
	public FreeBoardVO freeBoardDetail(int no);
	
	
	// Update
	@Update("UPDATE book_freeBoard SET writer=#{writer}, subject=#{subject}, content=#{content} "
			+"WHERE no=#{no} ")
	public void freeBoardUpdate(FreeBoardVO vo);
	
	
	// Delete
	@Delete("DELETE FROM book_freeBoard WHERE no=#{no} ")
	public void freeBoardDelete(int no);
	
	
	// Find
	@Select({
			"<script>"
			+"SELECT no,subject,writer,regdate,hit "
			+"FROM book_freeBoard "
			+"WHERE "
			+"<trim prefix=\"(\" suffix=\")\" prefixOverrides=\"OR\"> "
			+"<foreach collection=\"fs\" item=\"fd\">"
			+"<trim prefix=\"OR\">"
			+"<choose>"
			+"<when test=\"fd=='N'.toString()\">"
			+"writer LIKE '%'||#{ss}||'%'"
			+"</when>"
			+"<when test=\"fd=='S'.toString()\">"
			+"subject LIKE '%'||#{ss}||'%'"
			+"</when>"
			+"<when test=\"fd=='C'.toString()\">"
			+"content LIKE '%'||#{ss}||'%'"
			+"</when>"
			+"</choose>"
			+"</trim>"
			+"</foreach>"
			+"</trim>"
			+ "</script>"
	})
	public List<FreeBoardVO> freeBoardFind(Map map);
	
	// Comments
	// 댓글 작성
	@Insert("INSERT INTO book_freeBoardReply(no,bno,reply_id,msg,group_id) VALUES( "
			+"book_reply_seq.nextval,#{bno},#{reply_id},#{msg},"
			+"(SELECT NVL(MAX(group_id)+1,1) FROM book_freeBoardReply))")
	public void freeBoardReplyInsert(FreeBoardReplyVO vo);
	
	// 댓글 출력
	@Select("SELECT no,bno,reply_id,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday, group_tab "
			+"FROM book_freeBoardReply "
			+"WHERE bno=#{bno}" 
			+"ORDER BY group_id DESC, group_step ASC")
	public List<FreeBoardReplyVO> freeBoardReplyListData(int bno);
	
	// 댓글 수정
	@Update("UPDATE book_freeBoardReply SET "
			+"msg=#{msg} "
			+"WHERE no=#{no}")
	public void freeBoardReplyUpdate(FreeBoardReplyVO vo);
	
	// 1. 댓글 정보 읽기
	@Select("SELECT group_id,group_step,group_tab "
			+"FROM book_freeBoardReply "
			+"WHERE no=#{no}")
	public FreeBoardReplyVO freeBoardReplyInfoData(int no);
	
	// 2. Step 증가
	@Update("UPDATE book_freeBoardReply SET "
			+"group_step=group_step+1 "
			+"WHERE group_id=#{group_id} AND group_step>#{group_step}")
	public void freeBoardReplyStepIncrement(FreeBoardReplyVO vo);
	
	// 3. 댓글 작성 Transaction
	@Insert("INSERT INTO book_freeBoardReply(no,bno,reply_id,msg,group_id,group_step, group_tab,root) "
			+"VALUES(book_reply_seq.nextval,#{bno},#{reply_id},#{msg},"
			+"#{group_id},#{group_step},#{group_tab},#{root})")
	public void freeBoardReplyTransactionInsert(FreeBoardReplyVO vo);
	
	// 4. depth 증가
	@Update("UPDATE book_freeBoardReply SET "
			+"depth=depth+1 "
			+"WHERE no=#{no}")
	public void freeBoardReplyDepthIncrement(int no);
	
	// 댓글 삭제
	// 1. depth, root 읽기
	@Select("SELECT depth,root "
			+"FROM book_freeBoardReply "
			+"WHERE no=#{no}")
	public FreeBoardReplyVO freeBoardReplyDepthInfoData(int no);
	// 2. 댓글 삭제
	@Delete("DELETE FROM book_freeBoardReply "
			+"WHERE no=#{no}")
	public void freeBoardReplyDelete(int no);
	@Update("UPDATE book_freeBoardReply SET "
			+"msg='삭제된 댓글입니다.' "
			+"WHERE no=#{no}")
	public void freeBoardReplyMsgUpdate(int no);
	@Update("UPDATE book_freeBoardReply SET "
			+"depth=depth-1 "
			+"WHERE no=#{no}")
	public void freeBoardReplyDepthDecrement(int no);
	
	
	// 댓글 갯수 집계
	@Select("select COUNT(*) FROM book_freeBoardReply WHERE bno=#{bno}")
	public int freeBoardReplyCount(int no);
		
}
