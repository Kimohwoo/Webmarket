<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String sessionId = (String)session.getAttribute("sessionId");
	if(!(sessionId.equals("admin"))){
		response.sendRedirect("./member/loginMember.jsp");
	}
		
%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<script type ="text/javascript" src ="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message" > 
	<jsp:include page="menu.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title" /></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right"> 
			<a href="?language=ko" >Korean</a>|<a href="?language=en" >English</a>
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>   
		</div>	
		<form name="newBook" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype ="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bookId" /></label>
				<div class="col-sm-3">
					<input type="text" id ="bookId" name="bookId" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bname" /></label>
				<div class="col-sm-3">
					<input type="text" id ="bname" name="bname" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="author"/></label>
				<div class="col-sm-3">
					<input type="text" id ="author" name="author" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="publisher" /></label>
				<div class="col-sm-5">
					<input type="text" id ="publisher" name="publiser" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="publisher_date"/></label>
				<div class="col-sm-3">
					<input type="text" id="publisher_date" name="publisher_date" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-3">
					<textarea name="description" rows="2" cols="50" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bookPrice" /></label>
				<div class="col-sm-3">
					<input type="text" id ="bookPrice" name="bookPrice" class="form-control" >
				</div>
			</div>
			<div class ="form-group row">
			<label class ="col-sm-2"><fmt:message key="bookImage" /></label>
				<div class ="col-sm-5">
 					<input type="file" name="bookImage" class="form-control">
 				</div>
 			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type ="button" class="btn btn-primary" value="<fmt:message key="button" />" onclick ="CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
	</fmt:bundle>
</body>
</html>
