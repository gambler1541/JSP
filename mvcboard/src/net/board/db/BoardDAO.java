package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	public int getListCount(String cond) {
		int x = 0;

		String sql = "select count(*) from board_2";
		if(cond != null && !cond.equals("")) {
			sql = sql + " where " + cond;
		} 
		try {
			con =ds.getConnection();
			System.out.println("getConnection()");

			// pstmt = con.preparedStatement("select count(*) from board_2");
			// for debug
			System.out.println("getListCount(): " + sql);

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount() 에러: " + e);
			System.out.println("getListCount() 에러 : " + sql);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return x;
	}
	// 3. 글 목록 보기

	public List<BoardBean> getBoardList(int page, int limit, String cond) {
		String board_list_sql = "select * from " 
				+ "(select rownum rnum, board_num, board_name, board_subject, "
				+ "board_content, board_file, board_re_ref, board_re_lev, "
				+ "board_re_seq, board_readcount, board_date "
				+ " from (select * from board_2 order by board_re_ref desc, board_re_seq asc))"
				+ " where rnum >= ? and rnum <= ? ";

		String board_list_sql_fmt = "select * from "
				+ "(select rownum rnum, board_num, board_name, board_subject, "
				+ "board_content, board_file, board_re_ref, board_re_lev, "
				+ "board_re_seq, board_readcount, board_date "
				+ " from (select * from board_2 where %s order by board_re_ref desc, board_re_seq asc))"
				+ " where rnum >= ? and rnum <= ? ";
	
		if(cond != null && !cond.equals("")) {
			board_list_sql = String.format(board_list_sql_fmt, cond);
		}
		List<BoardBean> list = new ArrayList<BoardBean>();
		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호
		int endrow = startrow + limit -1 ; // 읽을 마지막 row 번호

		try {
			con = ds.getConnection();

			// for debug
			System.out.println("getBoardList() : " + board_list_sql);

			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				BoardBean board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				list.add(board);
			}
			return list;
		}catch (Exception e) {
			System.out.println("getBoardList() 에러 : " + e);
			System.out.println("getBoardList() 에러 : " + board_list_sql);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	//4
	public BoardBean getDetail(int num) {
		BoardBean board = null;
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement("select * from board_2 where board_num = ?");
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
			return board;
		} catch (Exception e) {
			System.out.println("getDetail() 에러 : " + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}



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
	public int boardReply(BoardBean boarddata) {
		String board_max_sql = "select max(board_num) from board_2";
		String sql = "";
		int num = 0;
		int result = 0;
		
		int re_ref = boarddata.getBOARD_RE_REF();
		int re_lev = boarddata.getBOARD_RE_LEV();
		int re_seq = boarddata.getBOARD_RE_SEQ();
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			
			sql = "update board_2 set board_re_seq = board_re_seq + 1 where board_re_ref = ? "
					+ " and board_re_seq > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);	//re_ref : 관련 글 번호, re_lev : 답글 레벨,re_seq : 관련글 출력 순서
			pstmt.setInt(2, re_seq);
			result = pstmt.executeUpdate();
			
			re_seq = re_seq + 1;
			re_lev = re_lev + 1;
			
			sql = "insert into board_2 (board_num, board_name, board_pass, board_subject, "
					+ "board_content, board_file, board_re_ref, board_re_lev, "
					+ " board_re_seq, board_readcount, board_date) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, boarddata.getBOARD_NAME());
			pstmt.setString(3, boarddata.getBOARD_PASS());
			pstmt.setString(4, boarddata.getBOARD_SUBJECT());
			pstmt.setString(5, boarddata.getBOARD_CONTENT());
			pstmt.setString(6, ""); // 답장에는 파일을 업로드 하지 않음
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq); 
			pstmt.setInt(10, 0);
			
			pstmt.executeUpdate();
			
			return num;
		} catch (Exception e) {
			System.out.println("boardReply() 에러 : "+ e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return 0;
	}

	// 7. 글 수정
	public boolean boardModify(BoardBean modifyBoard) {
		String sql = "update board_2 set board_subject=?, board_content=? where board_num=?";
		try {
			
			con =ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyBoard.getBOARD_SUBJECT());
			pstmt.setString(2, modifyBoard.getBOARD_CONTENT());
			pstmt.setInt(3, modifyBoard.getBOARD_NUM());
			pstmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			
			System.out.println("boardModify() 에러 : " + e);
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	// 8. 글 삭제
	public boolean boardDelete(int num) {
		String sql_delete_sql = "delete from board_2 where board_num = ?";
		int result = 0;
		
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			if(result == 0 ) 
				return false;
			return true;
		}catch (Exception e) {
			System.out.println("boardDelete() 에러 : " + e);
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}


	// 9. 조회수  업데이트
	public void setReadCountUpdate(int num) {
		String sql = "update board_2 set board_readcount = board_readcount + 1 where board_num = ?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("setReadCount() 에러 : " + e);
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	// 10. 글쓴이인지 확인

	public boolean isBoardWriter(int num, String pass) {
		String sql = "select board_pass from board_2 where board_num=?";
		
		try {
			con =ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();
			
			if(pass.equals(rs.getString("board_pass"))) {
				return true;
			}
		}
		
		catch (Exception e) {
			System.out.println("isBoardWriter() 에러 : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) rs.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}


}

