<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>

	<%@ include file="./db/dbconn.jsp"%>
	<%
		String sessionId = (String)session.getAttribute("sessionId");	
	
		String bid = request.getParameter("id");

		String sql = " SELECT * FROM book WHERE b_id = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bid);
		
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
	%>
	<div class="container">
		<div class="row">
			<div class ="col-md-5">
				<img src="./upload2/<%=rs.getString("b_filename")%>" style="width: 50%" />
			</div>
			<div class="col-md-6">

				<h3><%=rs.getString("b_name")%></h3>
				<p><%=rs.getString("b_description")%></p>
				<p><b>도서 코드 : </b><span class="badge badge-danger"> <%=rs.getString("b_id")%></span>
				<p><b>저 자 : </b><%=rs.getString("b_author")%>
				<p><b>출 판 사 : </b><%=rs.getString("b_publisher") %> &rarr; <%=rs.getString("b_reg") %>
				<p><b>가 격 : </b><%=rs.getString("b_price") %>원</p>
				<p>
				<c:choose>
					<c:when test="${sessionId eq 'admin'}">
						<form name="addForm" action="./addCart.jsp?id=<%=rs.getString("b_id")%>" method="post">
							<a href="./updateProduct.jsp?id=<%=rs.getString("b_id")%>" class="btn btn-danger">상품 수정 &raquo;</a>
							<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
						</c:when>
						<c:otherwise>
							<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
							<a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a> 
							<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr>
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
	<jsp:include page="footer.jsp" />
</body>
</html>
