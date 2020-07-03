package studentbean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StudentDatabaseCp {

	// 데이터베이스 연결관련 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	// 등록한 DBCP 데이터소스 찾아 저장하는 생성자
	public StudentDatabaseCp() {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 데이터소스를 통해 데이터베이스에 연결, Connection 객체에 저장하는 메소드
	void connect() {
		try {
			con = ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public ArrayList<StudentEntity> getStudentList(){
		connect();
		
		ArrayList<StudentEntity> list = new ArrayList<StudentEntity>();
		
		String SQL = "select * from student";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
				while (rs.next()) {
					// 한 행의 학생정보를 저장할 학생을 위한 빈즈 객체 생성
					StudentEntity stu = new StudentEntity();
					
					// 한 행의 학생정보를 자바 빈즈 객체에 저장
					stu.setId(rs.getString("id"));
					stu.setPasswd(rs.getString("passwd"));
					stu.setName(rs.getString("name"));
					stu.setYear(rs.getInt("year"));
					stu.setSnum(rs.getString("snum"));
					stu.setDepart(rs.getString("depart"));
					stu.setMobile1(rs.getString("mobile1"));
					stu.setMobile2(rs.getString("mobile2"));
					stu.setAddress(rs.getString("address"));
					stu.setEmail(rs.getString("email"));
					// 리스트에 추가
					list.add(stu);
				}
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return list;
	}
	
}
