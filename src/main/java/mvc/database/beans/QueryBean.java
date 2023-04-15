package mvc.database.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class QueryBean {

	Connection conn;
	Statement st;
	ResultSet rs;
	
	public QueryBean() {
		conn = null;
		st = null;
		rs = null;
	}
	
	public void getConnection() {
		
		try {
			conn = DBConnection.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			st = conn.createStatement();
		} catch(Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	public void closeConnection() throws Exception {
		if(st != null) {
			st.close();
		}
		if(rs != null) {
			rs.close();
		}
		if(conn != null) {
			conn.close();
		}
	}
	
	public ArrayList selectSearchingData(String user_id) throws Exception {
		
		StringBuffer sb = new StringBuffer();
		
		sb.append(" SELECT ");
		sb.append(" * ");
		sb.append(" FROM ");
		sb.append(" searchingdata ");
		sb.append(" WHERE ");
		sb.append(" id LIKE '"+ user_id +"'");
		sb.append(" ORDER BY ");
		sb.append(" regdate ");
		
		rs = st.executeQuery(sb.toString());
		
		ArrayList res = new ArrayList();
		while(rs.next()) {
			
			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));
			
		}
		System.out.println(sb.toString());
		
		return res;
	}
	
	public int insertSearchingData(String user_id, String context) {
		
		String query = "";
		PreparedStatement ps = null;
		
		int result = 0;
		
		query += " INSERT INTO ";
		query += " searchingdata ";
		query += " VALUES ";
		query += " (?, ?, sysdate) ";
		
		System.out.println(query);
		
		try {
			
			ps = conn.prepareStatement(query);
			
			ps.clearParameters();
			ps.setString(1, user_id);
			ps.setString(2, context);
			
			result = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch(Exception e1) {
				e1.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int deleteSearchingdata(String user_id, String context) {
		
		StringBuffer query1 = new StringBuffer();
		
		PreparedStatement ps = null;
		
		int result = 0;
		
		query1.append(" DELETE ");
		query1.append(" FROM ");
		query1.append(" searchingdata ");
		query1.append(" WHERE ");
		query1.append(" id = ? AND context = ? ");
		
		System.out.println(query1);
		
		try {
		ps = conn.prepareStatement(query1.toString());
		
		ps.clearParameters();
		ps.setString(1, user_id);
		ps.setString(2, context);
		
		result = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}






























