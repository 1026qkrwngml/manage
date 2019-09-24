<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("utf-8");

//1. JDBC Driver Loading
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection		conn	= null;
Statement		stmt	= null;
ResultSet		rs		= null;

try {
	String jdbcDriver 	= "jdbc:oracle:thin:@localhost:1521:ORCL";
	String dbUser	 	= "hr";
	String dbPass     	= "hr";
	String query 		= "";

/*
query += "SELECT sum(mt) tt, SUM(m1) t1, SUM(m2) t2, SUM(m3) t3, ";
query += "SUM(m4) t4, SUM(m5) t5, SUM(m6) t6, SUM(m7) t7, SUM(m8) t8, ";
query += "SUM(m9) t9, SUM(m10) t10, SUM(m11) t11, SUM(m12) t12 ";
query += "FROM ";
query += "(SELECT count(*) mt, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '01', count(*), 0) m1, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '02', count(*), 0) m2, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '03', count(*), 0) m3, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '04', count(*), 0) m4, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '05', count(*), 0) m5, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '06', count(*), 0) m6, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '07', count(*), 0) m7, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '08', count(*), 0) m8, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '09', count(*), 0) m9, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '10', count(*), 0) m10, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '11', count(*), 0) m11, ";
query += "DECODE(TO_CHAR(hire_date, 'mm'), '12', count(*), 0) m12 ";
query += "FROM employees ";
query += "GROUP BY TO_CHAR(hire_date, 'mm') ";
query += "ORDER BY TO_CHAR(hire_date, 'mm') )";
*/

query += "SELECT SUM(count(TO_CHAR(hire_date, 'mm'))) mt, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '01', count(*), 0)) m1, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '02', count(*), 0)) m2, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '03', count(*), 0)) m3, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '04', count(*), 0)) m4, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '05', count(*), 0)) m5, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '06', count(*), 0)) m6, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '07', count(*), 0)) m7, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '08', count(*), 0)) m8, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '09', count(*), 0)) m9, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '10', count(*), 0)) m10, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '11', count(*), 0)) m11, ";
query += "SUM(DECODE(TO_CHAR(hire_date, 'mm'), '12', count(*), 0)) m12 ";
query += "FROM employees ";
query += "GROUP BY TO_CHAR(hire_date, 'mm') ";
query += "ORDER BY TO_CHAR(hire_date, 'mm') ";
	


	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery(query);
	
	rs.next();
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>월별 입사 현황</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/jspMenu.css" rel="stylesheet">
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/function.js"></script>
	<link href="../css/morris.css" rel="stylesheet">
	<script src="../js/morris.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.2/raphael-min.js"></script>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-sm-offset-5 col-sm-5">
			<h1>월 별 입 사 현 황</h1>
		</div>
		<div class="col-sm-offset-10 col-sm-2">
			<button type="button" class="btn btn-primary"
			onclick="javascript:window.location='../jspMenu.jsp'">메인메뉴</button>
		</div>
	</div>
	<br>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>1월</th>
				<th>2월</th>
				<th>3월</th>
				<th>4월</th>
				<th>5월</th>
				<th>6월</th>
				<th>7월</th>
				<th>8월</th>
				<th>9월</th>
				<th>10월</th>
				<th>11월</th>
				<th>12월</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=rs.getString("m1") %></td>
				<td><%=rs.getString("m2") %></td>
				<td><%=rs.getString("m3") %></td>
				<td><%=rs.getString("m4") %></td>
				<td><%=rs.getString("m5") %></td>
				<td><%=rs.getString("m6") %></td>
				<td><%=rs.getString("m7") %></td>
				<td><%=rs.getString("m8") %></td>
				<td><%=rs.getString("m9") %></td>
				<td><%=rs.getString("m10") %></td>
				<td><%=rs.getString("m11") %></td>
				<td><%=rs.getString("m12") %></td>
			</tr>
			<tr class="danger">
				<td align="right" colspan="12">
					<h4>
						<p class="bg-danger">총 사원 수 : <%=rs.getString("mt") %></p>
					</h4>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div id="myfirstchart" style="height: 250px; weidth: 700px;"></div>

<script>
new Morris.Bar({
	// 그래프를 표시하기 위한 객체의 id
	element:	'myfirstchart',
	// 그래프 데이터. 각 요소가 하나의 그래프 상의 값에 해당된다.
	data:	[
		{ x: '1월',	 y: <%=rs.getString("m1") %> },
		{ x: '2월',	 y: <%=rs.getString("m2") %> },
		{ x: '3월',	 y: <%=rs.getString("m3") %> },
		{ x: '4월',	 y: <%=rs.getString("m4") %> },
		{ x: '5월',	 y: <%=rs.getString("m5") %> },
		{ x: '6월',	 y: <%=rs.getString("m6") %> },
		{ x: '7월',	 y: <%=rs.getString("m7") %> },
		{ x: '8월',	 y: <%=rs.getString("m8") %> },
		{ x: '9월',	 y: <%=rs.getString("m9") %> },
		{ x: '10월', y: <%=rs.getString("m10") %> },
		{ x: '11월', y: <%=rs.getString("m11") %> },
		{ x: '12월', y: <%=rs.getString("m12") %> },
	],
	// 그래프 데이터에서 x축에 해당하는 값의 이름
	xkey:	'x',
	// 그래프 데이터에서 y축에 해당하는 값의 이름
	ykeys:	['y'],
	// 각 값에 대해서 마우스 오버시 표시하기 위한 레이블
	labels: ['사원수'],
	barColors: function(row, series, type) {
		if(type == 'bar') {
			var red = Math.ceil(255 * row.y / this.ymax);
			return 'rgb(' + red + ', 0, 0)';
		} else {
			return '#000';
		}
	}
});


</script>

</body>
</html>

<%
} catch (SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement을 닫는다.
	if(rs   != null) try { rs.close();   } catch(SQLException ex) {}
	if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
	// 7. 커넥션을 종료한다.
	if(conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>






