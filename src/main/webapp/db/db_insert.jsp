<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>

<jsp:useBean id="QueryBean" class="mvc.database.beans.QueryBean"/>
<jsp:setProperty property="*" name="QueryBean" />

<%
	response.setHeader("Chche-Control", "no-store");
	response.setHeader("pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	
	response.setCharacterEncoding("UTF-8");
	
	QueryBean.getConnection();
	
	String user_id = (request.getParameter("user_id")==null)? "" : request.getParameter("user_id");
	String context = (request.getParameter("context")==null)? "" : request.getParameter("context");
	
	int result = QueryBean.insertSearchingData(user_id, context);
	
	out.println("{");
	out.println("	\"SUCCESS\"" + result + "\"");
	out.println("}");



%>




















