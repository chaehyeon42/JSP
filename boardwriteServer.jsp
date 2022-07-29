<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	// 한글깨짐 방지 설정(form태그에서 method방식이 post일 때)
	request.setCharacterEncoding("UTF-8");
	// 데이터 수집
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String id = (String)session.getAttribute("id");// 로그인할 때 사용자가 입력한 id를 가져와라.

	// db관련 처리
	Connection conn = null;
	PreparedStatement pstmt=null;

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		// sql문장 처리
		// 회원가입을 하기 위한 sql문장
		// prepareStatement : java -> DB에 쿼리를 보내기 위해 사용하는 객체
		pstmt=conn.prepareStatement("insert into board(title,content,id) values(?,?,?)");
		// 첫번째 물음표에는 사용자가 입력한 id값(request.getParameter("id"))을 설정
		pstmt.setString(1, title);
		// 두번째 물음표에는 사용자가 입력한 password값(request.getParameter("pw"))을 설정
		pstmt.setString(2,content);
		// 세번째 물음표에는 사용자가 입력한 id값(session.getAttribute("id"))을 설정
		pstmt.setString(3,id);
		// 위 sql문장을 실행(workbench : ctrl+enter)
		// insert가 되었으면 1값을 result변수에 저장되고,
		// insert가 되지 않았으면 0값을 result변수에 저장.
		int result = pstmt.executeUpdate();
		
		// 글쓰기가 성공했으면
		if(result==1){
			// 게시판 목록 리스트 화면(boardlist.jsp)으로 이동
			out.println("<script>");
			out.println("location.href='boardlist.jsp'");
			out.println("</script>");
		}else{// 그렇지 않으면
			// 게시판 글쓰기 화면(boardwrite.jsp)으로 이동
			out.println("<script>");
			out.println("location.href='boardwrite.jsp'");
			out.println("</script>");
		}
		// executeQuery() : select(select된 결과를 ResultSet라는 공간에 저장해서 반환.)
		// executeUpdate() : insert, update, delete

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		pstmt.close();
	}
	
%>
</body>
</html>