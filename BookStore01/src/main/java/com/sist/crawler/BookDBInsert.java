package com.sist.crawler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.sist.vo.BookVO;

public class BookDBInsert {

	/* 크롤링한 데이터 DB에 넣는 파트 */

	private Connection conn; // 오라클 연결 객체
	private PreparedStatement ps; // SQL문장 전송 객체
	private final String URL = "jdbc:oracle:thin:@litlyoo:1521:XE"; // 오라클 서버 주소
	
	public BookDBInsert() { //1.드라이버 등록
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}	
	public void getConnection() {//2. 오라클 연결
		try {
			conn = DriverManager.getConnection(URL, "ouo", "litl");

		} catch (Exception ex) {
		}
	}
	public void disConnection() {//3. 오라클 해제
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
