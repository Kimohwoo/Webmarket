<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('a#navbarDropdown').click(function(){
			$('div.dropdown-menu').show();
		});
	});
	
	function search(){
		
	}
</script>
<style>
	nav > a:hover{
		background: gray;
	}
	nav > div > ul > li:hover > a{
		color: red; 
		background: gray;
	}
	nav > div > ul > li > div > a:hover{
		color: white; 
		background: black;
	}
	nav > div > ul > li > div.dropdown-menu:hover{
		background: gray;
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
        <a class="nav-link" href="welcome.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <c:choose>
	  	<c:when test="${empty sessionId }">   	
	      <li class="nav-item">
	        <a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link disabled" href="<c:out value="/member/addMember.jsp"/>">회원가입</a>
	      </li>
	  	</c:when>
	  	<c:otherwise>
	  		<li class="nav-item">
	        <a class="nav-link" href="<c:out value="/member/logoutMember.jsp"/>">로그아웃</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link disabled" href="<c:out value="/member/updateMember.jsp"/>">[<%=sessionId %>]님</a>
	      </li>
	  	</c:otherwise>
      </c:choose>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          카테고리
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">이달의 상품</a>
          <a class="dropdown-item" href="#">회원가입</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">장바구니</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onclick='javascript:search();'>검색</button>
    </form>
  </div>
</nav>