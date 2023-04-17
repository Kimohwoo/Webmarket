<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mvc.model.BookDTO" %>
<%@ include file="./db/dbconn.jsp"%>
<%
	String id = request.getParameter("id");
	
	String sql = "SELECT * FROM book WHERE b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	BookDTO goods = new BookDTO();
	
	if (rs.next()) {
		
		goods.setId("b_id");
		goods.setName(rs.getString("b_name"));
		goods.setAuthor(rs.getString("b_author"));
		goods.setPublisher(rs.getString("b_publisher"));
		goods.setReg(rs.getString("b_reg"));
		goods.setPrice(rs.getInt("b_price"));
		goods.setDescription(rs.getString("b_description"));
		goods.setFileName(rs.getString("b_filename"));
		
		
	} else
		out.println("일치하는 상품이 없습니다");
	
	ArrayList<BookDTO> list = (ArrayList<BookDTO>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<BookDTO>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	BookDTO goodsQnt = new BookDTO();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("product.jsp?id=" + id);
%>