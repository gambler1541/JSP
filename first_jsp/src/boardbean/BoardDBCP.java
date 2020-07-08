package boardbean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

// DBCP를 이용한  테이블 board_1 처리 데이터베이스 연동 자바빈즈 프로그램
public class BoardDBCP {
	
	// 데이터베이스 연결관련 변수 선언
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	//JDBC 드라이버 로드 메소드
	public BoardDBCP(){
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	// 데이터 베이스 연결 메소드
	public void connect() {
		try {
			conn = ds.getConnection(); 
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	// 게시판의 모든 레코드를 반환 메서드
	public ArrayList<BoardEntity> getBoardList() {
		
		connect();
		ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();
		String SQL = "SELECT * FROM board_1";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardEntity brd = new BoardEntity();
				
				brd.setId(rs.getInt("id"));
				brd.setName(rs.getString("name"));
				brd.setPasswd(rs.getString("passwd"));
				brd.setTitle(rs.getString("title"));
				brd.setEmail(rs.getString("email"));
				brd.setRegdate(rs.getTimestamp("regdate"));
				brd.setContent(rs.getString("content"));
				brd.setAddr(rs.getString("addr"));
				// 리스트에 추가
				list.add(brd);
			}
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return list;
	}
	
	public BoardEntity getBoard(int id) {
		connect();
		
		String SQL = "select * from board_1 where id =?";
		BoardEntity brd = new BoardEntity();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			brd.setId(rs.getInt("id"));
			brd.setName(rs.getString("name"));
			brd.setPasswd(rs.getString("passwd"));
			brd.setTitle(rs.getString("title"));
			brd.setEmail(rs.getString("email"));
			brd.setRegdate(rs.getTimestamp("regdate"));
			brd.setContent(rs.getString("content"));
			brd.setAddr(rs.getString("addr"));
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return brd;
	}
	
	// 게시물 등록 메서드
	public boolean insertDB(BoardEntity board) {
		
		boolean success = false;
		connect();
		String SQL = "INSERT INTO board_1 values(board_1_seq.nextval,?,?,?,?,sysdate,?,?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getPasswd());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getEmail());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getAddr());
			pstmt.executeUpdate();
			success = true;
		}  catch (SQLException e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		}
		return success;
	}
	
	
	public boolean updateDB(BoardEntity board) {
		
		boolean success = false;
		connect();
		
		String SQL = "update board_1 set name=?, title=?, email=?, content=?, addr=? where id=?";
		
		try {
			
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,  board.getName());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getId());
			pstmt.setString(6, board.getAddr());
			
			int rowUdt = pstmt.executeUpdate();
			// System.out.println(rowUdt);
			if(rowUdt == 1 ) success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}finally {
			disconnect();
		}
		return success;
	}
	
	public boolean isPasswd(int id, String passwd) {
		boolean success = false;
		
		connect();
		
		String SQL = "SELECT passwd FROM board_1 WHERE id=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			String orgPasswd = rs.getString(1);
			
			if(passwd.equals(orgPasswd)) success = true;
			System.out.println("비밀번호 : " + success);
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		}
		return success;
	}
	
	public boolean deleteDB(int id) {

		boolean success = false;
		connect();
		String SQL = "DELETE FROM board_1 WHERE id=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			success = true;
		}
		catch (SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return success;
	}
}
