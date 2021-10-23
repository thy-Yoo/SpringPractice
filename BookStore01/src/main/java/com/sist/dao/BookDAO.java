package com.sist.dao;

import java.sql.*;

//import org.jsoup.Connection; 이걸 적으면 형변환을 해달라네..?
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BookMapper;
import com.sist.vo.BookVO;


@Repository
public class BookDAO {
		
	@Autowired
	private BookMapper mapper;
	
	/* 크롤링한 데이터 DB에 넣는 파트 */
	// 오라클 연결 객체 
		private Connection conn;
		// SQL문장 전송 객체
		private PreparedStatement ps;
		// 오라클 서버 주소
		private final String URL = "jdbc:oracle:thin:@litlyoo:1521:XE";
		// 1. 드라이버 등록
		public BookDAO() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		// 2. 오라클 연결
		public void getConnection() {
			try {
				conn = DriverManager.getConnection(URL, "ouo", "litl");

			} catch (Exception ex) {
			}
		}

		// 3. 오라클 해제 => JDBC => DBCP => ORM(MyBatis,JPA,Hibernate...)
		public void disConnection() {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}
		}

		public void bookDataInsert(BookVO vo) {

			try {

				getConnection();
				String sql = "INSERT INTO books VALUES(?,?,?,?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, vo.getBnum());
				// ps.setString(2, vo.getPoster());
				ps.setString(2, vo.getTitle());
				ps.setString(3, vo.getCate1());
				ps.setString(4, vo.getCate2());
				ps.setString(5, vo.getCate3());
				ps.setString(6, vo.getCate4());
				ps.setString(7, vo.getWriter());
				ps.setString(8, vo.getPublisher());
				ps.setString(9, vo.getPrice());
				ps.setString(10, vo.getPageno());

				ps.executeUpdate();

			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				disConnection();
			}
		}
}
