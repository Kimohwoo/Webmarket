<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>도서 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" align="center">도서 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="./db/dbconn.jsp" %>
			<%
				request.setCharacterEncoding("UTF-8");
			
				String bname = (request.getParameter("bname")==null) ? "" : request.getParameter("bname");
			
				String sql = " SELECT * FROM book WHERE b_name LIKE '%'||?||'%' ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bname);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					
				
			%>
			<div class="col-md-3">
				<img src="./upload2/<%= rs.getString("b_fileName") %>" style="width: 100%" align="center">
				<h3><%= rs.getString("b_name") %></h3>
				<p><%= rs.getString("b_author") %> 저</p>
				<p><%= rs.getString("b_price")%>원</p>
				<p>
					<a href="./product.jsp?id=<%= rs.getString("b_id") %>" class="btn btn-secondary" role="button">상세 정보</a>
			</div>
			
			<%
				}
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>