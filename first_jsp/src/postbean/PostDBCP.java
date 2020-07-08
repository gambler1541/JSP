package postbean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PostDBCP {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public PostDBCP() {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void connect() {
		try {
			conn = ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean is_passwd(int id, String passwd) {
		connect();
		boolean success = false;
		String SQL = "SELECT * FROM posts WHERE id=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			String pass = rs.getString("passwd");
			
			if(passwd.equals(pass)) success = true;
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return success;
		
	}
	
	public void disconnect() {
		try {
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<PostBean> getList(){
		connect();
		String SQL = "SELECT * FROM posts";
		ArrayList<PostBean> list = new ArrayList<PostBean>();
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PostBean post = new PostBean();
				
				post.setId(rs.getInt("id"));
				post.setName(rs.getString("name"));
				post.setPasswd(rs.getString("passwd"));
				post.setTitle(rs.getNString("title"));
				post.setEmail(rs.getNString("email"));
				post.setRegdate(rs.getDate("regdate"));
				post.setContent(rs.getString("content"));
				post.setAddr(rs.getString("addr"));
				
				list.add(post);
			}
			pstmt.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return list;
	}
	
	public PostBean getPost(int id) {
		connect();
		String SQL = "SELECT * FROM posts WHERE id=?";
		PostBean post = new PostBean();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			post.setId(rs.getInt("id"));
			post.setName(rs.getString("name"));
			post.setPasswd(rs.getString("passwd"));
			post.setTitle(rs.getString("title"));
			post.setEmail(rs.getString("email"));
			post.setRegdate(rs.getDate("regdate"));
			post.setContent(rs.getString("content"));
			post.setAddr(rs.getString("addr"));
			
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return post;
	}
	
	public boolean deletePost(int id) {
		boolean success = false; 
		connect();
		String SQL = "DELETE FROM posts WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			success = true;
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return success;
	}
	
	public boolean editPost(PostBean post) {
		boolean success = false;
		connect();
		String SQL = "UPDATE posts set name=?, title=?, content=?, addr=? where id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, post.getName());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getContent());
			pstmt.setString(4, post.getAddr());
			pstmt.setInt(5, post.getId());
			
			if(pstmt.executeUpdate() == 1) {
				success = true;
			}
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return success;
	}
	
	public boolean createPost(PostBean post) {
		boolean success = false;
		connect();
		System.out.println(post.getName());
		System.out.println(post.getPasswd());
		System.out.println(post.getTitle());
		System.out.println(post.getEmail());
		System.out.println(post.getContent());
		System.out.println(post.getAddr());
		String SQL = "insert into posts values(posts_seq.nextval,?,?,?,?,sysdate,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, post.getName());
			pstmt.setString(2, post.getPasswd());
			pstmt.setString(3, post.getTitle());
			pstmt.setString(4, post.getEmail());
			pstmt.setString(5, post.getContent());
			pstmt.setString(6, post.getAddr());
			pstmt.executeUpdate();
			success = true;
			pstmt.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return success;
	}
	
}
