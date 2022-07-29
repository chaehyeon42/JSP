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
	// 데이터 수집
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	int bno = Integer.parseInt(request.getParameter("bno"));
	
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
		pstmt=conn.prepareStatement("update board set title = ?, content = ? where bno = ?");
		// 첫번째 물음표에는 사용자가 입력한 id값(request.getParameter("id"))을 설정
		pstmt.setString(1, title);
		// 두번째 물음표에는 사용자가 입력한 password값(request.getParameter("pw"))을 설정
		pstmt.setString(2,content);
		// 세번째 물음표에는 사용자가 입력한 bno값(request.getParameter("bno"))을 설정
		pstmt.setInt(3,bno);
		// 위 sql문장을 실행(workbench : ctrl+enter)
		// insert가 되었으면 1값을 result변수에 저장되고,
		// insert가 되지 않았으면 0값을 result변수에 저장.
		int result=pstmt.executeUpdate();
		
		if(result==1){
			// boarddetail.jsp 화면으로 이동.
			out.println("<script>");
			out.println("location.href='boarddetail.jsp?bno="+bno+"'");
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