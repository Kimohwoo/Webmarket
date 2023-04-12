<%@ page contentType="text/html; charset=utf-8"%>
<%-- <%@ page import="java.util.ArrayList"%> --%>
<%-- <%@ page import="dto.Product"%> --%>
<%-- <%@ page import="dao.ProductRepository"%> --%>
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
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
<%-- 	<% --%>
<!--  		ProductRepository dao = ProductRepository.getInstance(); -->
<!--  		ArrayList<Product> listOfProducts = dao.getAllProducts(); -->
<%-- 	%> --%>

	<div class="container">
		<div class="row" align="center">
<%-- 			<% --%>
<!--  				for (int i = 0; i < listOfProducts.size(); i++) { -->
<!--  					Product product = listOfProducts.get(i); -->
<%-- 			%> --%>

		<%@ include file="dbconn.jsp"%>
		<%
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
<!-- 			<div class="col-md-4"> -->
<%-- 				<img src ="./upload2/<%=product.getFilename()%>" style ="width: 100%"> --%>
<%-- 				<h3><%=product.getPname()%></h3> --%>
<%-- 				<p><%=product.getDescription()%> --%>
<%-- 				<p><%=product.getUnitPrice()%>원 --%>
<%-- 				<p><a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a> --%>
<!-- 			</div> -->
			<div class="col-md-3">
				<img src="./upload2/<%=rs.getString("p_fileName")%>" style="width: 100%">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_UnitPrice")%>원
				<p>
					<a href="./product.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
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
