<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.util.ArrayList" %>
<jsp:useBean id ="QueryBean" scope = "page" class="db.beans.QueryBean" />
<jsp:setProperty property = "*" name = "QueryBean" />
<%

	response.setHeader("Cache-Control", "no-store");
	response.setHeader("pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	
	response.setCharacterEncoding("UTF-8");
	
	String memberId = (request.getParameter("user_id")==null) ? "" : request.getParameter("user_id").trim();
	
	QueryBean.getConnection();
	
	ArrayList resArr = new ArrayList();
	
	try{
		resArr = QueryBean.selectMemberInfo(memberId);
	} catch(SQLException e){
		e.printStackTrace();
	} finally{
		QueryBean.closeConnection();
	}
	
	out.println("{");
	out.println("\"datas\":[");
	
	if(resArr.size() == 0){
		out.println("}");
		out.println("}");
	} else {
		
		out.println("{");
		out.println("\"id\":\"" + (String)resArr.get(0) + "\", ");
		out.println("\"context\":\"" + (String)resArr.get(1) + "\", ");
		out.println("\"regdate\":\"" + (String)resArr.get(2) + "\" ");
		out.println("}");
		
		for(int i = 3; i < resArr.size(); i+= 3){
			out.println(",");
			out.println("{");
			out.println("\"id\":\"" + (String)resArr.get(i) + "\", ");
			out.println("\"context\":\"" + (String)resArr.get(i + 1) + "\", ");
			out.println("\"regdate\":\"" + (String)resArr.get(i + 2) + "\" ");
			out.println("}");
			
		}
		out.println("]");
		out.println("}");
		
	}

	
	
%>















