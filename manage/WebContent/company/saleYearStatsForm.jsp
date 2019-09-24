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
	String	dbUser		= "oe";
	String	dbPass		= "oe";
	String	query		= "";
	//년도별 영업사원별 주문실적
query += "SELECT	to_char(ord.ORDER_DATE, 'YYYY') Year, ";
query += "emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Name, ";
query += "SUM(ord.ORDER_TOTAL) manTotal ";
query += "FROM	orders ord, EMPLOYEES emp ";
query += "WHERE	ord.SALES_REP_ID = emp.EMPLOYEE_ID ";
query += "GROUP BY ROLLUP(to_char(ord.order_date, 'YYYY'), emp.FIRST_NAME || ' ' || emp.LAST_NAME) ";
query += "ORDER BY to_char(ord.order_date, 'YYYY'), emp.FIRST_NAME || ' ' || emp.LAST_NAME";

	conn	= DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	stmt	= conn.createStatement();
	
	rs		= stmt.executeQuery(query);
			
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>년도별 영업사원별 주문실적 현황</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/jspMenu.css" rel="stylesheet">
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/function.js"></script>
</head>
<body>

<div class="container">
	<h2 align="center"><b>년도별 영업사원별 주문실적 현황</b></h2>
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
				<td align="center">사원명</td>
				<td align="center">주문실적</td>
			</tr>
		</thead>
		<tbody>
		<%
		//쿼리 실행 결과를 모두 출력한다.(반복작업)
		while(rs.next()) 
		{
			if(rs.getString("Name") == null) {
		%>
			<tr class="info">
			<% } else { %>
			<tr>
			<% } %>
				<td align="right">
					<% if(rs.getString("Year") != null) { %>
						<%=rs.getString("Year") %>
					<% } %>
				</td>
				<td align="right">
					<% if(rs.getString("Year")  == null &&
					      rs.getString("Name") == null) {
					%>총 계
					<% } else if(rs.getString("Name") == null) { 
					%>소 계
					<% } else { %><%=rs.getString("Name") %>
					<% } %>
				</td>
				<td align="right"><%=rs.getString("manTotal") %></td>
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
























