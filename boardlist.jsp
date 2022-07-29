<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td>No.</td><td>제목</td><td>작성일자</td><td>조회수</td>
	</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;

	try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
	conn = ds.getConnection();

	pstmt=conn.prepareStatement("select * from board");

	rs=pstmt.executeQuery();
	
		while(rs.next()){
%>
			<tr>
				<td><%=rs.getString("bno") %></td>
				<td><a href="boarddetail.jsp?bno=<%=rs.getString("bno") %>"><%=rs.getString("title") %></a></td>
				<td><%=rs.getString("regdate") %></td>
				<td><%=rs.getString("cnt") %></td>
			</tr>
<%			
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		rs.close();
		pstmt.close();
	}
%>


</table>
</body>
</html>