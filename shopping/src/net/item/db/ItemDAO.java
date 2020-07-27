package net.item.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.item.action.ItemList;

public class ItemDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public ItemDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch (Exception e) {
			System.out.println("Item DB 연결 실패 " + e);
		}
	}

	// 메인(아이템 리스트를 보여줌)
	public List<ItemBean> getitemlist() {
		List<ItemBean> list = new ArrayList<ItemBean>();
		String sql = "select * from item";
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemBean item = new ItemBean();
				
				item.setItem_num(rs.getInt("item_num"));
				item.setItem_name(rs.getString("item_name"));
				item.setItem_category(rs.getString("item_category"));
				item.setItem_price(rs.getInt("item_price"));
				item.setItem_img(rs.getString("item_img"));
				item.setItem_date(rs.getDate("item_date"));
				list.add(item);
			}
			return list;
		}catch (Exception e) {
			System.out.println("리스트 출력 실패 : " + e);
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
}
