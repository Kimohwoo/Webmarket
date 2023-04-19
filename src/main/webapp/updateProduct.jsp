<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 수정</title>
<script type="text/javascript">
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니다!!")== true){
			location.href="./deleteProduct.jsp?id=" + id;
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 수정</h1>
		</div>
	</div>
	<%@ include file="./db/dbconn.jsp"%>
	<%
		String bId = request.getParameter("id");

		String sql = "SELECT * FROM book WHERE b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./upload2/<%=rs.getString("b_filename")%>" alt="image"
					style="width: 50%" />
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">도서 코드</label>
						<div class="col-sm-3">
							<input type="text" id="bookId" name="bookId"
								class="form-control" value='<%=rs.getString("b_id")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서명</label>
						<div class="col-sm-3">
							<input type="text" id="bname" name="bname" class="form-control"
								value="<%=rs.getString("b_name")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">저자</label>
						<div class="col-sm-3">
							<input type="text" id="author" name="author"
								class="form-control" value="<%=rs.getString("b_author")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판사</label>
						<div class="col-sm-3">
							<input type="text" id="publisher" name="publisher"
								class="form-control" value="<%=rs.getString("b_publisher") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">출판일</label>
						<div class="col-sm-5">
							<input type="text" id="publisher_date" name="publisher_date"
								class="form-control" value="<%=rs.getString("b_reg") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상세설명</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
								class="form-control"><%=rs.getString("b_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="bookImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">도서 가격</label>
						<div class="col-sm-3">
							<input type="text" id ="bookPrice" name="bookPrice" 
							class="form-control" value="<%=rs.getInt("b_price")%>">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="수정">
							<a href="#" onclick="deleteConfirm('<%=rs.getString("b_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
						</div>
					</div>
				</form>
			</div>
		</div>
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
</body>
</html>
