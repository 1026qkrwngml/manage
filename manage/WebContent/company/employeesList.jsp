<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사원목록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/jspMenu.css" rel="stylesheet">
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/function.js"></script>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-sm-offset-5 col-sm-5">
			<h1>사 원 목 록</h1>
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
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>HireDate</th>
				<th>Job</th>
				<th>Salary</th>
				<th>CommPct</th>
				<th>Manager</th>
				<th>Department</th>
			</tr>
		</thead>
		<tbody>
		<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection	conn	= null;
		Statement	stmt	= null;
		ResultSet	rs		= null;
		
		try {
			String	jdbcDriver	= "jdbc:oracle:thin:@localhost:1521:ORCL";
			String	dbUser		= "hr";
			String	dbPass		= "hr";
			String	query		= "";
			query += "SELECT ";
			query += "emp.employee_id id, emp.first_name || ' ' || emp.last_name name, ";
			query += "emp.email, emp.phone_number phone, emp.hire_date hiredate, ";
			query += "job.job_title jobtitle, emp.salary salary, emp.commission_pct commpct, ";
			query += "emp.manager_id manager, dep.department_name department ";
			query += "FROM employees emp, departments dep, jobs job ";
			query += "WHERE emp.department_id = dep.department_id ";
			query += "AND   emp.job_id = job.job_id ";
			query += "ORDER BY emp.employee_id";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
		%>
		<tr>
			<td><%= rs.getString("id") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("email") %></td>
			<td><%= rs.getString("phone") %></td>
			<td><%= rs.getString("hiredate") %></td>
			<td><%= rs.getString("jobtitle") %></td>
			<td><%= rs.getString("salary") %></td>
			<td><%= rs.getString("commpct") %></td>
			<td><%= rs.getString("manager") %></td>
			<td><%= rs.getString("department") %></td>
		</tr>
		<%
			}
		} catch (SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if(rs   != null) try { rs.close();   } catch(SQLException ex) {}
			if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		%>
		</tbody>
	</table>
	
</div>

</body>
</html>

























