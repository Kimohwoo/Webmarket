<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mvc.model.BookDTO" %>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}

	BookDTO book = new BookDTO();
	
	if (book == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<BookDTO> cartList = (ArrayList<BookDTO>) session.getAttribute("cartlist");
	BookDTO goodsQnt = new BookDTO();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
