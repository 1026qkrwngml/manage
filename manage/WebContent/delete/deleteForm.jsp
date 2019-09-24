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
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보삭제</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/jspMenu.css" rel="stylesheet">
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/function.js"></script>
</head>
<body>

<div class="container">

<form class="form-horizontal" method="post" name="deleteForm" action="delete.jsp">
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-6">
			<h2 align="center">회 원 정 보 삭 제</h2>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">아이디</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="id"
				maxlength="12" value=<%=id%> readonly>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">비밀번호</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" name="passwd"
				maxlength="12" placeholder="Enter Password">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">비밀번호확인</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" name="repasswd"
				maxlength="12" placeholder="Enter Password">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-1 col-sm-5">
			<button type="button" class="btn btn-danger" 
			onclick="deleteCheckForm(this.form)">회원정보삭제</button>
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

























