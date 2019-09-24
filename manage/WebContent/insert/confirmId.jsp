<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
    
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");

int rtnVal = 0; // id가 있는지 결과값을 저장할 변수

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection			conn	= null;
PreparedStatement	pstmt	= null;
ResultSet			rs		= null;

try {
	String jdbcDriver 	= "jdbc:oracle:thin:@localhost:1521:ORCL";
	String dbUser		= "scott";
	String dbPass		= "tiger";
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	String query = "SELECT ID FROM TB_MEMBER WHERE ID=?";
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, id);
	
	rs = pstmt.executeQuery(); 
	
	if(rs.next()) {
		rtnVal = 1;  // 값이 하나라도 있으면 이미 사용 중인 id를 의미한다.
	} else {
		rtnVal = -1; // 사용 가능한 id를 의미한다.
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(rs    != null) try { rs.close();    } catch(SQLException ex) {}
	if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if(conn  != null) try { conn.close();  } catch(SQLException ex) {}
}

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 검사</title>
</head>
<body>

<%
if(rtnVal == -1) {
%>	
	<center><h2>사용할 수 있는 아이디 입니다.</h2></center>
	<center><input type="button" value="닫기" 
			onclick="javascript:self.close();"/></center>
<%
} else {
%>
	<center><h2>이미 사용 중인 아이디 입니다.</h2></center>
	<center><input type="button" value="닫기" 
			onclick="javascript:self.close();"/></center>
<%	
}
%>



</body>
</html>




















