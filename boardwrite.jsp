<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="boardwriteServer.jsp" method="post">
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="20px" rows="10px" name="content"></textarea></td>
		</tr>
		<tr>
			<c:if test="${id != null}">
				<td colspan="2"><input type="submit" value="글쓰기"></td>
			</c:if>
		</tr>
		
		
	</table>
</form>
</body>
</html>