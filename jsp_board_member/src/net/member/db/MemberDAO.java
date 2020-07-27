package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch (Exception e) {
			System.out.println("DB 연결 실패" + e);
			return;
		}
	}

	// 멤버가 맞는지 확인하는 메서드
	public int isMember(MemberBean member) {
		String sql = "SELECT MEMBER_PW FROM MEMBER2 WHERE MEMBER_ID=?";
		int result =1;

		try {
			con = ds.getConnection();
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, member.getMEMBER_ID());
			rs = pstmt.executeQuery();

			if(rs.next()) {
				if(rs.getString("MEMBER_PW").equals(member.getMEMBER_PW())) {
					result = 1; // 일치
				}else{
					result = 0; // 불일치
				}
			}else {
				result = -1; // 아이디가 존재 하지않음
			}
		}catch (Exception e) {
			System.out.println("isMember 에러 : " + e);
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 회원가입
	public boolean joinMember(MemberBean member) {
		String sql = "INSERT INTO member2 VALUES(?,?,?,?,?,?)";
		int result = 0;

		try {

			con = ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getMEMBER_ID());
			pstmt.setString(2, member.getMEMBER_PW());
			pstmt.setString(3, member.getMEMBER_NAME());
			pstmt.setInt(4, member.getMEMBER_AGE());
			pstmt.setString(5, member.getMEMBER_GENDER());
			pstmt.setString(6, member.getMEMBER_EMAIL());
			result= pstmt.executeUpdate();

			if(result !=0 ) {
				return true;
			}
		}catch (Exception e) {
			System.out.println("joinMember 에러 : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();				
			}
		}
		return false;
	}

	public List<MemberBean> getMemberList() {
		String sql = "select distinct member_id, member_pw, membeR_name, member_age, member_gender, member_email"
				+ " from MEMBERBOARD m2, MEMBER2 mm "
				+ "WHERE mm.MEMBER_ID = m2.BOARD_ID ";
		List<MemberBean> memberlist = new ArrayList<MemberBean>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				MemberBean member = new MemberBean();
				member.setMEMBER_ID(rs.getString("MEMBER_ID"));
				member.setMEMBER_PW(rs.getString("MEMBER_PW"));
				member.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				member.setMEMBER_AGE(rs.getInt("MEMBER_AGE"));
				member.setMEMBER_GENDER(rs.getString("MEMBER_GENDER"));
				member.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));

				memberlist.add(member);
			}
			return memberlist;
		}catch (Exception e) {
			e.printStackTrace();
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

	public MemberBean getDetailMember(String viewId) {

		String sql = "select * from member2 where MEMBER_ID = ?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, viewId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("유저 조회 성공");
				MemberBean member = new MemberBean();
				member.setMEMBER_ID(rs.getString("MEMBER_ID"));
				member.setMEMBER_PW(rs.getString("MEMBER_PW"));
				member.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				member.setMEMBER_AGE(rs.getInt("MEMBER_AGE"));
				member.setMEMBER_GENDER(rs.getString("MEMBER_GENDER"));
				member.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));

				return member;
			}

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	public boolean deleteMember(String id) {

		String sql1 = "DELETE FROM MEMBERBOARD WHERE BOARD_ID=?";
		String sql2 = "DELETE FROM MEMBER2 WHERE MEMBER_ID=?";

		boolean isSuccess = false;
		int result1 = 0;
		int result2 = 0;

		boolean result = false;
		System.out.println("deleteId = " + id);

		try {

			con = ds.getConnection();
			con.setAutoCommit(false);

			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, id);
			result1 = pstmt.executeUpdate();

			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, id);
			result2 = pstmt.executeUpdate();

			if(result1 > 0 && result2 > 0) result = true;

			isSuccess = true;

		} catch (Exception e) {
			System.out.println("deleteMember 에러 : " + e);
		}finally {
			try {
				if(isSuccess) { con.commit(); }
				else { con.rollback();}
			}catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null)pstmt.close();
				if(con != null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
