<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("utf-8");
int updateCount = 0;

String	id			= request.getParameter("id");
String	passwd		= request.getParameter("passwd");
String	repasswd	= request.getParameter("repasswd");

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection			conn	= null;
PreparedStatement	pstmt	= null;

try {
	String	jdbcDriver 	= "jdbc:oracle:thin:@localhost:1521:ORCL";
	String	jdbcUser	= "scott";
	String 	jdbcPass	= "tiger";
	
	conn = DriverManager.getConnection(jdbcDriver, jdbcUser, jdbcPass);
	
	String query = "";
	query = "DELETE FROM TB_MEMBER WHERE id=? AND pwd=?";
	
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	
	updateCount = pstmt.executeUpdate();
} catch (SQLException se) {
	se.printStackTrace();
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
	<title>회원정보삭제</title>
</head>
<body>
<% if(updateCount > 0) { %>
	<%= id %>의 정보를 삭제하였습니다.
<% } else { %>
	<%= id %>의 정보를 삭제하는데 실패하였습니다.
<% } %>
</body>
</html>

<%
//작업이 완료되면 회원목록화면으로 이동한다.
response.sendRedirect("../viewMemberList.jsp");
%>



















