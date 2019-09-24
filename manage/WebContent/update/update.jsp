<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("utf-8");
int updateCount = 0;

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
	String dbUser     = "scott";
	String dbPass     = "tiger";
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	String 	query = "";
	query  = "UPDATE tb_MEMBER "; 
	query += "SET pwd=?, name=?, tel=?, addr=?, birth=?, job=?, ";
	query += "gender=?, email=?, intro=? ";
	query += "WHERE id=?";
	
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1,  passwd);
	pstmt.setString(2,  name);
	pstmt.setString(3,  tel);
	pstmt.setString(4,  addr);
	pstmt.setString(5,  birth);
	pstmt.setString(6,  job);
	pstmt.setString(7,  gender);
	pstmt.setString(8,  email);
	pstmt.setString(9,  intro);
	pstmt.setString(10, id);
	
	updateCount = pstmt.executeUpdate();
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if(conn  != null) try { conn.close();  } catch(SQLException ex) {}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<% if(updateCount > 0) { %>
	<%=id %>의 정보를 수정하였습니다.
<% } else { %>
	<%=id %>의 정보를 수정하는데 실패하였습니다.
<% } %>
</body>
</html>

<%
//회원정보수정이 완료되면 회원목록화면으로 이동시킨다.
response.sendRedirect("../viewMemberList.jsp");
%>




























