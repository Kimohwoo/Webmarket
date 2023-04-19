<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="./db/dbconn.jsp" %>
<%
	String filename = "";
	//	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String realFolder = getServletContext().getRealPath("/") + "upload2";
	System.out.println("경로확인---->"+realFolder);
	
	
	String encType = "UTF-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	
	String bookId = multi.getParameter("bookId");
	String bname = multi.getParameter("name");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String publisher_date = multi.getParameter("publisher_date");
	String description = multi.getParameter("description");
	String bookPrice = multi.getParameter("bookPrice");

	Integer price;

	if (bookPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(bookPrice);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	

	
		String sql = "SELECT * FROM book WHERE b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE book SET b_name=?, b_author=?, b_publisher=?, b_publisher_date=?, b_description=?, b_bookPrice=? WHERE b_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bname);
				pstmt.setString(2, author);
				pstmt.setString(3, publisher);
				pstmt.setString(4, publisher_date);
				pstmt.setString(5, description);
				pstmt.setInt(6, price);
				pstmt.setString(7, bookId);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE book SET b_name=?, b_author=?, b_publisher=?, b_publisher_date=?, b_description=?, b_bookPrice=? WHERE b_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bname);
				pstmt.setString(2, author);
				pstmt.setString(3, publisher);
				pstmt.setString(4, publisher_date);
				pstmt.setString(5, description);
				pstmt.setInt(6, price);
				pstmt.setString(7, bookId);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("editProduct.jsp?edit=update");
%>


