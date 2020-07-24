package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
