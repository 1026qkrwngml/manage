<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("utf-8");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection	conn	= null;
Statement	stmt	= null;
ResultSet	rs		= null;
int 		total	= 0;

try {
	String 	jdbcDriver 	= "jdbc:oracle:thin:@localhost:1521:ORCL";
	String	dbUser		= "hr";
	String	dbPass		= "hr";
	String	query		= "";
	//입사 년도별 월별 사원수
query += "SELECT 	to_char(hire_date, 'YYYY') hireYear, ";
query += "to_char(hire_date, 'MM')   hireMonth, ";
query += "count(*) manCount ";
query += "FROM	EMPLOYEES ";
query += "GROUP BY ROLLUP(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM')) ";
query += "ORDER by to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM')";
	
	conn	= DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	stmt	= conn.createStatement();
	
	rs		= stmt.executeQuery(query);
			
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입사 년도별 월별 사원수</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/jspMenu.css" rel="stylesheet">
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/function.js"></script>
</head>
<body>

<div class="container">
	<h2 align="center"><b>년도별 월별 입사 현황</b></h2>
	<div class="form-group">
		<div class="col-sm-offset-8 col-sm-2">
			<input class="btn btn-primary btn-sm" type="button" value="메인으로"
			onclick="javascript:window.location='../jspMenu.jsp'">
		</div>
	</div>
	<br><br>
	<table class="table table-bordered">
		<thead>
			<tr class="info">
				<td align="center">년도</td>
				<td align="center">월</td>
				<td align="center">사원수</td>
			</tr>
		</thead>
		<tbody>
		<%
		//쿼리 실행 결과를 모두 출력한다.(반복작업)
		while(rs.next()) 
		{
			if(rs.getString("hireMonth") == null) {
		%>
			<tr class="info">
			<% } else { %>
			<tr>
			<% } %>
				<td align="right">
					<% if(rs.getString("hireYear") != null) { %>
						<%=rs.getString("hireYear") %>
					<% } %>
				</td>
				<td align="right">
					<% if(rs.getString("hireYear")  == null &&
					      rs.getString("hireMonth") == null) {
					%>총 계
					<% } else if(rs.getString("hireMonth") == null) { 
					%>소 계
					<% } else { %><%=rs.getString("hireMonth") %>
					<% } %>
				</td>
				<td align="right"><%=rs.getString("manCount") %></td>
			</tr>
		<%
		}
		%>
		</tbody>
	</table>
</div>

</body>
</html>

<%
} catch (SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if(rs   != null) try { rs.close();   } catch(SQLException ex) {}
	if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
	if(conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
























