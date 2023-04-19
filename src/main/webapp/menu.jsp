<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>

<%-- <script src="<c:url value="/resources/js/popper.min.js"/>"></script> --%>
<%-- <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script> --%>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
<!-- <script> -->
<%-- // // 	window.jQuery || document.write('<script src="<c:url value="/resources/js/jquery-slim.min.js"/>"><\/script>') --%>
<!-- <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script> -->

<script type="text/javascript">
	$(function(){
		$('.dropdown-menu').hide();
		$('#navbarDropdown').on('click',function(){
			$('.dropdown-menu').toggle();
		});
		$('.dropdown-menu').mouseleave(function(){
			$(this).hide();
		});
	});

// 	let ajax1;
	
// 	function selectData(){
// 		let form_name = "searchForm";
<%-- 		let user_id = <%=sessionId%>; --%>
		
// 		let url = "./db/db_select.jsp";
		
// 		let reqparam = "user_id=" + user_id;
// 		ajax1.onreadystatechange = resSelectData;
// 		ajax1.open("Post", url, "true");
// 		ajax1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
// 		ajax1.send(reqparam);
		
		
// 	}
// 	function resSelectData(){
// 		if(ajax1.readyState == 4){
// 			if(ajax1.status == 200){
				
// 				let result = ajax1.responseText;
				
// 				let objRes = eval("("+result+")");
				
// 				let num = objRes.datas.length;
// 				let res = "<table class='table table-hover'>";
// 				let resDiv = document.getElementById("div_res");
				
// 				if(num < 1){
// 					res += "<tr><td align = 'center' style='font-size: 20;'>검색 결과가 없습니다.</td></tr>";
// 				} else {
// 					for(let i = 0; i < num; i++){
// 						let user_id = objRes.datas[i].ID;
// 						let context = objRes.datas[i].context;
// 						let regdate = objRes.datas[i].regdate;
						
// 						res += "<tr class='table-active'>";
// 						res += "<td>" + context + "</td>";
// 						res += "</tr>";
// 					}
// 				}	
// 				res += "</table>";
				
// 				resDiv.innerHTML = res;
// 			}
// 		}
// 	}
	
</script>
<style>
	nav > a:hover{
		background: gray;
		display: block;
	}
	nav > div > ul > li:hover > a{
		color: red; 
		background: gray;
		display: block;
	}
	nav > div > ul > li > div > a:hover{
		color: white; 
		background: black;
		display: block;
	}
	nav > div > ul > li > div.dropdown-menu{
		background: gray;
		display: block;
	}
</style>

<nav class="navbar navbar-expand  navbar-dark bg-dark">
  <a class="navbar-brand" href="#">메뉴</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<c:url value="/welcome.jsp"/>">Home <span class="sr-only">(current)</span></a>
      </li>
      <c:choose>
	  	<c:when test="${empty sessionId }">   	
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link disabled" href="<c:url value="/member/addMember.jsp"/>">회원가입</a>
	      </li>
	  	</c:when>
	  	<c:otherwise>
			<li class="nav-item">
				<a class="nav-link disabled" href="<c:url value="/member/updateMember.jsp"/>">[<%=sessionId %>]님</a>
		    </li>
		    <li>
		    	<c:choose>
	    			<c:when test="${sessionId eq 'admin'}">
		    			<a class="nav-link disabled" href="<c:url value="/memberUpdate.jsp"/>">회원 관리</a>
	    			</c:when>
	    			<c:otherwise>
	    				<a class="nav-link disabled" href="<c:url value="/member/updateMember.jsp"/>">회원 수정</a>
	    			</c:otherwise>
    			</c:choose>
		    </li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
			</li>
	  	</c:otherwise>
      </c:choose>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    카테고리
			</a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-item" href="#">이달의 상품</a>
				<a class="dropdown-item" href="<c:url value="/products.jsp"/>">도서 목록</a>
				<c:if test="${sessionId eq 'admin'}">
				<a class="dropdown-item" href="<c:url value="/addProduct.jsp"/>">도서등록</a>
				<a class="dropdown-item" href="<c:url value="/editProduct.jsp?edit=update"/>">도서수정</a>
				<a class="dropdown-item" href="<c:url value="/editProduct.jsp?edit=delete"/>">도서삭제</a>
				</c:if>
				<a class="dropdown-item" href="<c:url value="/BoardListAction.do"/>">게시판</a>
				
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="<c:url value="/cart.jsp"/>">장바구니</a>
				<a class="dropdown-item" href="<c:url value=""/>">결제 내역</a>
			</div>
		</li>
	</ul>
    <form class="form-inline my-2 my-lg-0" name = "searchForm" action="<c:url value="/search_processProduct.jsp" />" method="Post">
		<input class="form-control mr-sm-2" type="search" placeholder="도서 검색" aria-label="Search" name = "bname" onclick='javascript:selectData();'>
			<div id="div_res">
			
			</div>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onclick='javascript:insertData();'>검색</button>
<!-- 			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button> -->
    </form>
  </div>
</nav>