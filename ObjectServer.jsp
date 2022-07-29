<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name=request.getParameter("name");

	String id=request.getParameter("id");
	
	session.setAttribute("id", id);

%>
</head>
<body>
<%=name %>
<%=session.getAttribute("id") %>
</body>
</html>