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
	<title>회원목록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/jspMenu.css" rel="stylesheet">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script>
	function openUser(id) {
		window.open('update/updateForm.jsp?id='+id, '', 
				'left=160, top=100, width=800, height=780, scorllbars=no, \
				status=no, resizable=no, fullscreen=no, channelmode=no');
	}
	</script>
</head>
<body>
<div class="container">

	<div class="row">
		<div class="col-sm-offset-5 col-sm-5">
			<h1>회 원 목 록</h1>
		</div>
		<div class="col-sm-offset-9 col-sm-3">
			<button type="button" class="btn btn-primary"
			onclick="javascript:window.location='insert/insertForm.jsp'">회원등록</button>
			<button type="button" class="btn btn-success"
			onclick="javascript:window.location='jspMenu.jsp'">메인메뉴</button>
		</div>
	</div>
	
	<br>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>생년월일</th>
				<th>직업</th>
				<th>성별</th>
				<th>이메일</th>
				<th>자기소개</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<% 
			//1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection		conn = null;
			Statement		stmt = null;
			ResultSet		rs   = null;
			
			try {
				String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:ORCL";
				String dbUser     = "scott";
				String dbPass     = "tiger";
				String query = "SELECT * FROM TB_MEMBER ORDER BY ID";
				
				// 2. 데이터베이스 커넥션 생성
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				
				// 3. Statement 생성
				stmt = conn.createStatement();
				
				// 4. 쿼리를 실행
				rs = stmt.executeQuery(query);
			
				// 5. 쿼리 실행 결과를 출력한다.
				while(rs.next()) {
			%>
			<tr>
				<td><a href="#" onclick="return openUser('<%= rs.getString("ID") %>')"><%= rs.getString("ID") %></a></td>
				<td><%= rs.getString("PWD") %></td>
				<td><%= rs.getString("NAME") %></td>
				<td><%= rs.getString("TEL") %></td>
				<td><%= rs.getString("ADDR") %></td>
				<td><%= rs.getString("BIRTH") %></td>
				<td><%= rs.getString("JOB") %></td>
				<td><%= rs.getString("GENDER") %></td>
				<td><%= rs.getString("EMAIL") %></td>
				<td><%= rs.getString("INTRO") %></td>
				<%
				String urlUp  = "update/updateForm.jsp?id=" + rs.getString("ID");
				String urlDel = "delete/deleteForm.jsp?id=" + rs.getString("ID");
				%>
				<td><input class="btn btn-warning btn-xs" type="button" value="수정"
						onclick="javascript:window.location='<%=urlUp%>'"></td>
				<td><input class="btn btn-warning btn-xs" type="button" value="삭제"
						onclick="javascript:window.location='<%=urlDel%>'"></td>
			</tr>
			<%
				}
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
		</thead>
	</table>






</div>
</body>
</html>



















