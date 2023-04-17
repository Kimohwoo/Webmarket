<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">

		<%@ include file="./db/dbconn.jsp"%>
		<%
			String sql = "SELECT * FROM book";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
			<div class="col-md-3">
				<img src="./upload2/<%=rs.getString("b_fileName")%>" style="width: 100%">
				<h3><%=rs.getString("b_name")%></h3>
				<p><%=rs.getString("b_description")%></p>
				<p><%=rs.getString("b_price")%>원</p>
				<p>
					<a href="./product.jsp?id=<%=rs.getString("b_id")%>"
						class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
				</p>
			</div>
			<%
				}
			
			if (rs != null)
				rs.close();
 			if (pstmt != null)
 				pstmt.close();
 			if (conn != null)
				conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
