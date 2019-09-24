<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");

//1. JDBC Driver Loading
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection		conn	= null;
Statement		stmt	= null;
ResultSet		rs		= null;

try {
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String dbUser	  = "scott";
	String dbPass     = "tiger";
	String query = "Select * From tb_member Where id ='" + id + "'";

	// 2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	// 3. Statement 생성
	stmt = conn.createStatement();
	
	// 4. 쿼리를 실행
	rs = stmt.executeQuery(query);
	
	// 5. 쿼리 실행 결과를 출력한다.
	rs.next();
	
	//전화번호를 화면에 맞게 나눈다.
	String tel1 = "";
	String tel2 = "";
	String tel3 = "";
	
	tel1 = rs.getString("tel").substring(0, 3);
	if(rs.getString("tel").length() == 12) { //가운데 자리가 3개 인경우
		tel2 = rs.getString("tel").substring(4,  7);
		tel3 = rs.getString("tel").substring(8, 12);
	} else { // 가운데 자리가 4개인 경우
		tel2 = rs.getString("tel").substring(4,  8);
		tel3 = rs.getString("tel").substring(9, 13);
	}
	
	//생년월일을 화면에 맞게 년,월,일로 나눈다.
	String year		= "";
	String month	= "";
	String date		= "";
	
	year	= rs.getString("birth").substring(0, 4);
	month	= rs.getString("birth").substring(4, 6);
	date	= rs.getString("birth").substring(6, 8);
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보수정</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/jspMenu.css" rel="stylesheet">
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/function.js"></script>
</head>
<body>
<div class="container">

<form class="form-horizontal" method="post" name="updateForm" action="update.jsp">
	<div class="form-group">
		<div class="col-sm-2"></div>
		<div class="col-sm-6">
			<h2 align="center">회 원 정 보 수 정</h2>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">아이디</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="id"
			maxlength="12" value=<%=rs.getString("id") %> readonly>
		</div>
	</div>
	<div class="form-group"> 
		<label class="control-label col-sm-2">비밀번호</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" name="passwd"
				maxlength="12" value=<%=rs.getString("pwd")%>>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">비밀번호확인</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" name="repasswd"
				maxlength="12" value=<%=rs.getString("pwd") %> >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">이 름</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="name"
			maxlength="16" value=<%=rs.getString("name") %> >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">전화번호</label>
		<div class="col-sm-2">
			<select class="form-control" name="tel1">
				<option value="010" <%if(tel1.equals("010")) {%> selected <%}%> >010</option>
				<option value="011" <%if(tel1.equals("011")) {%> selected <%}%> >011</option>
				<option value="017" <%if(tel1.equals("017")) {%> selected <%}%> >017</option>
				<option value="018" <%if(tel1.equals("018")) {%> selected <%}%> >018</option>
				<option value="019" <%if(tel1.equals("019")) {%> selected <%}%> >019</option>
			</select>
		</div>
		<div class="input-group col-sm-3">
			<div class="input-group-addon">-</div>
			<div><input type="text" class="form-control col-sm-1" name="tel2"
					maxlength="4" value=<%= tel2 %> >
			</div>
			<div class="input-group-addon">-</div>
			<div><input type="text" class="form-control col-sm-1" name="tel3"
					maxlength="4" value=<%= tel3 %> >
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">주 소</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="addr"
			maxlength="100" value=<%=rs.getString("addr") %> >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">생년월일</label>
		<div class="col-sm-2">
			<input type="text" class="form-control col-sm-1" name="year"
					maxlength="4" value=<%= year %> >
		</div>
		<div class="control-label col-sm-1">년</div>
		<div class="col-sm-2">
			<input type="text" class="form-control col-sm-1" name="month"
					maxlength="2" value=<%= month %> >
		</div>
		<div class="control-label col-sm-1">월</div>
		<div class="col-sm-2">
			<input type="text" class="form-control col-sm-1" name="date"
					maxlength="2" value=<%= date %> >
		</div>
		<div class="control-label col-sm-1">일</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">직 업</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" name="job"
			maxlength="50" value=<%=rs.getString("job") %> >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">성별</label>
		<div class="col-sm-4">
			<label class="radio-inline">
				<input type="radio" name="gender" value="M" 
				<%if(rs.getString("gender").equals("M")) {%>checked <%} %> >남자
			</label>
			<label class="radio-inline">
				<input type="radio" name="gender" value="W"
				<%if(rs.getString("gender").equals("W")) {%>checked <%} %> >여자
			</label>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">이메일</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" name="email"
			maxlength="50" value=<%=rs.getString("email") %> >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">자기소개</label>
		<div class="col-sm-7">
			<textarea rows="6" cols="100" name="intro"><%=rs.getString("intro") %></textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-4 col-sm-3">
			<button type="button" class="btn btn-warning" 
				onclick="updateCheckForm(this.form)">수정</button>
			<button type="button" class="btn btn-primary"
				onclick="javascript:window.location='../viewMemberList.jsp'">회원목록</button>
			<button type="button" class="btn btn-success"
				onclick="javascript:window.location='../jspMenu.jsp'">메인메뉴</button>
		</div>
	</div>

</form>

	
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
































