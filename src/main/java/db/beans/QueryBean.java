package db.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class QueryBean 
{

	Connection conn;
	Statement stmt;
	ResultSet rs;

	public QueryBean() {

		conn = null;
		stmt = null;
		rs = null;

	}

	public void getConnection() {

		try {

			conn = DBConnection.getConnection();

		} catch (Exception e1) {

			e1.printStackTrace();
		}

		try {

			stmt = conn.createStatement();

		} catch (Exception e) {

			e.printStackTrace();

		}
	}

	public void closeConnection() 
	{
		if (stmt != null) {

			try {

				stmt.close();

			} catch (Exception e) {

				e.printStackTrace();
			}
		}

		if (conn != null) {

			try {
				conn.close();

			} catch (Exception e) {

				e.printStackTrace();
			}
		}
	}

	//1.select
	public ArrayList selectMemberInfo(String memberId) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append(" SELECT ");
		sb.append(" id, password, name, gender, birth, mail, phone, address, regist_day ");
		sb.append(" FROM ");
		sb.append(" member ");
		sb.append(" WHERE ");
		sb.append(" id LIKE '%"+memberId+"%' ");
		sb.append(" ORDER BY");
		sb.append(" regist_day ");
		
		System.out.println("쿼리 확인용 : " + sb.toString());
		
		rs = stmt.executeQuery(sb.toString());

		ArrayList res = new ArrayList();
		while (rs.next()) {

			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));
			res.add(rs.getString(4));
			res.add(rs.getString(5));
			res.add(rs.getString(6));
			res.add(rs.getString(7));
			res.add(rs.getString(8));
			res.add(rs.getString(9));
			
		}
		System.out.println(sb.toString());
		return res;
	}
	
//	//2.insert
//	public int insertMemberInfo(String memberId, String memberName, String memberPhone, String user_grade)//시간빼고 다 받아옴, db시간을 쓰기위해서
//	{
//		String query = "";
//		PreparedStatement pstmt = null;
//		
//		int result = 0;//1:성공, 0:실패
//		
//		query  = " insert into ";
//		query += "            member (U_ID, U_NAME, U_PHONE, U_GRADE, WRITE_TIME) ";
//		query += " values ";
////		query += "        ('"+ user_id +"','"+ user_name +"','"+user_phone+"', '"+user_grade+"', sysdate) ";
//		query += "        (?, ?, ?, ?, sysdate) ";
//		
//		System.out.println(query);
//		
//		try 
//		{
//			pstmt = conn.prepareStatement(query);
//			
//			pstmt.clearParameters();
//			pstmt.setString(1, user_id);
//			pstmt.setString(2, user_name);
//			pstmt.setString(3, user_phone);
//			pstmt.setString(4, user_grade);
//			
//			
//			result = pstmt.executeUpdate();//쿼리를 db에 날린다 최종적으로!
//			//executeUpdate()함수는 insert, update, delete에만 쓴다! select에는 안쓴다!
//			//왜 그러냐면, 반환값이 다르다~! int이다~! cf)select는 ResultSet으로 반환한다.
//		} 
//		catch (SQLException e1) 
//		{
//			e1.printStackTrace();
//		}
//		finally
//		{
//			try 
//			{
//				pstmt.close();
//			} 
//			catch (SQLException e) 
//			{
//				e.printStackTrace();
//			}	
//		}
//		return result;
//	}
	
//	//3.update
//	public int updateUserInfo(String user_id, String user_name, String user_phone, String user_grade)//시간빼고 다 받아옴, db시간을 쓰기위해서
//	{
//		StringBuffer query1 = new StringBuffer();
//		
//		//String query = "";
//		PreparedStatement pstmt = null;
//		
//		int result = 0;//1:성공, 0:실패
//		
//		query1.append(" update ");
//		query1.append("        USER_INFO_SAMPLE ");
//		query1.append(" set ");
////		query1.append("        U_NAME = '"+user_name+"', U_PHONE = '"+user_phone+"', U_GRADE = "+user_grade+", WRITE_TIME = sysdate ");
//		query1.append("        U_NAME = ?, U_PHONE = ?, U_GRADE = ?, WRITE_TIME = SYSDATE ");
//		query1.append(" where ");
////		query1.append("        U_ID = '"+user_id+"' ");
//		query1.append("        U_ID = ? ");
//		
//		
//		System.out.println(query1.toString());
//		
//		try 
//		{
//			pstmt = conn.prepareStatement(query1.toString());
//			
//			pstmt.clearParameters();
//			
//			pstmt.setString(1, user_name);
//			pstmt.setString(2, user_phone);
//			pstmt.setString(3, user_grade);
//			pstmt.setString(4, user_id);
//			
//			result = pstmt.executeUpdate();//쿼리를 db에 날린다 최종적으로!
//			//executeUpdate()함수는 insert, update, delete에만 쓴다! select에는 안쓴다!
//			//왜 그러냐면, 반환값이 다르다~! int이다~! cf)select는 ResultSet으로 반환한다.
//		} 
//		catch (SQLException e1) 
//		{
//			e1.printStackTrace();
//		}
//		finally
//		{
//			try 
//			{
//				pstmt.close();
//			} 
//			catch (SQLException e) 
//			{
//				e.printStackTrace();
//			}	
//		}
//		return result;
//	}
	
	
	//4.delete
	public int deleteUserInfo(String memberId)//시간빼고 다 받아옴, db시간을 쓰기위해서
	{
		StringBuffer query1 = new StringBuffer();
		
		//String query = "";
		PreparedStatement pstmt = null;
		
		int result = 0;//1:성공, 0:실패
		
		query1.append(" DELETE ");
		query1.append(" FROM ");
		query1.append(" member ");
		query1.append(" WHERE ");
		query1.append(" id = ?");
		
		
		System.out.println(query1.toString());
		
		try 
		{
			pstmt = conn.prepareStatement(query1.toString());
			
			pstmt.clearParameters();
			
			pstmt.setString(1, memberId);
			
			
			System.out.println("쿼리문 확인 : " + query1);
			result = pstmt.executeUpdate();//쿼리를 db에 날린다 최종적으로!
			//executeUpdate()함수는 insert, update, delete에만 쓴다! select에는 안쓴다!
			//왜 그러냐면, 반환값이 다르다~! int이다~! cf)select는 ResultSet으로 반환한다.
		} 
		catch (SQLException e1) 
		{
			e1.printStackTrace();
		}
		finally
		{
			try 
			{
				pstmt.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}	
		}
		return result;
	}
	

}







