<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
    
<%
request.setCharacterEncoding("utf-8");

String 	id 			= request.getParameter("id");
String 	passwd		= request.getParameter("passwd");
String 	repasswd	= request.getParameter("repasswd");
String	name		= request.getParameter("name");
String	tel			= request.getParameter("tel1") + "-"
					+ request.getParameter("tel2") + "-"
					+ request.getParameter("tel3");
String	addr		= request.getParameter("addr");
String	birth		= request.getParameter("year") 
					+ request.getParameter("month")
					+ request.getParameter("date");
String	job			= request.getParameter("job");
String	gender		= request.getParameter("gender");
String	email		= request.getParameter("email");
String	intro		= request.getParameter("intro");

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection			conn	= null;
PreparedStatement	pstmt	= null;

try {
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String dbUser	  = "scott";
	String dbPass	  = "tiger";
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	pstmt = conn.prepareStatement(
			"insert into TB_MEMBER values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	pstmt.setString(1,  id);
	pstmt.setString(2,  passwd);
	pstmt.setString(3,  name);
	pstmt.setString(4,  tel);
	pstmt.setString(5,  addr);
	pstmt.setString(6,  birth);
	pstmt.setString(7,  job);
	pstmt.setString(8,  gender);
	pstmt.setString(9,  email);
	pstmt.setString(10, intro);
	
	//쿼리문을 실행한다.
	pstmt.executeUpdate();
} catch (SQLException se) {
	se.printStackTrace();
	se.getMessage();
} finally {
	if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if(conn  != null) try { conn.close();  } catch(SQLException ex) {}
}
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원등록</title>
</head>
<body>
	<h1>회원가입이 완료되었습니다.</h1>
</body>
</html>












