<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%-- <%@ page import="dao.ProductRepository"%> --%>
<%@ include file="dbconn.jsp"%>
<%
	String id = request.getParameter("id");

// 	if (id == null || id.trim().equals("")) {
// 		response.sendRedirect("products.jsp");
// 		return;
// 	}

// 	ProductRepository dao = ProductRepository.getInstance();

// 	Product product = dao.getProductById(id);
// 	if (product == null) {
// 		response.sendRedirect("exceptionNoProductId.jsp");
// 	}

	Product goods = new Product();
	
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		
		goods.setProductId(rs.getString("p_id"));
		goods.setPname(rs.getString("p_name"));
		goods.setUnitPrice(rs.getInt("p_unitprice"));
		goods.setDescription(rs.getString("p_description"));
		goods.setCategory(rs.getString("p_category"));
		goods.setManufacturer(rs.getString("p_manufacturer"));
		goods.setUnitsInStock(rs.getLong("p_unitsInStock"));
		goods.setCondition(rs.getString("p_condition"));
		goods.setFilename(rs.getString("p_filename"));
		
		
	} else
		out.println("일치하는 상품이 없습니다");
	

// 	ArrayList<Product> goodsList = dao.getAllProducts();
// 	Product goods = new Product();
// 	for (int i = 0; i < goodsList.size(); i++) {
// 		goods = goodsList.get(i);
// 		if (goods.getProductId().equals(id)) { 			
// 			break;
// 		}
// 	}
	
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Product goodsQnt = new Product();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
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