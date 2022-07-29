<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Connection conn=null;

	try{
		// 드라이브 로드
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?serverTimezone=Asia/Seoul","root","1234");
		
		System.out.println("DB연결 성공");
		
		conn.close();
	}catch(Exception e){
		System.out.println("DB연결 실패");
		e.printStackTrace();
	}
	


%>
</head>
<body>
</body>
</html>