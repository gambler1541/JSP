package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	// 1. database 연결
	public BoardDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch (Exception e) {
			System.out.println("DB 연결 실패 : " +  e);
			return;
		}
	}
	
	// 2. 글의 갯수 구하기
	
	// 3. 글 목록 보기
	
	// 4. 글 내용 보기
	
	// 5. 글 등록
	public boolean boardInsert(BoardBean board) {
		
		int num = 0;
		String sql = "";
		int result = 0;
		
		try {
			con = ds.getConnection();
			pstmt=con.prepareStatement("select max(board_num) from board_2");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}else {
				num = 1;
			}
		
			sql = "insert into board_2 (board_num, board_name, board_pass, board_subject,"
					+ "board_content, board_file, board_re_ref, board_re_lev, "
					+ "board_re_seq, board_readcount, board_date) "
					+ "values(? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,sysdate)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2,board.getBOARD_NAME());
			pstmt.setString(3,board.getBOARD_PASS());
			pstmt.setString(4,board.getBOARD_SUBJECT());
			pstmt.setString(5,board.getBOARD_CONTENT());
			pstmt.setString(6,board.getBOARD_FILE());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
		
			result = pstmt.executeUpdate();
			if(result ==0)
				return false;
			return true;
		} catch (Exception e) {
			System.out.println("boardInsert() 에러" + e);
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(con!=null)
					con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	// 6. 글 답변
	
	// 7. 글 수정
	
	// 8. 글 삭제
	
	// 9. 조회수  업데이트
	
	// 10. 글쓴이인지 확인
	
	
}

