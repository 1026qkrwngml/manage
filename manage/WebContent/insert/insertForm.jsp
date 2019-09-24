<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원등록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/jspMenu.css" rel="stylesheet">
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../js/function.js"></script>
</head>
<body>
<div class="container">

<form class="form-horizontal" method="post" name="insertForm" action="insert.jsp">
	<div class="form-group">
		<div class="col-sm-2"></div>
		<div class="col-sm-6">
			<h2 align="center">회 원 등 록</h2>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">아이디</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="id"
			maxlength="12" placeholder="Enter ID">
		</div>
		<input class="btn btn-danger btn-sm" type="button" 
			name="confirm_id" value="ID중복확인"
			onclick="confirmId(document.insertForm.id.value)">
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
		<label class="control-label col-sm-2">이 름</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" name="name"
			maxlength="16" placeholder="Enter Name">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">전화번호</label>
		<div class="col-sm-2">
			<select class="form-control" name="tel1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
		</div>
		<div class="input-group col-sm-3">
			<div class="input-group-addon">-</div>
			<div><input type="text" class="form-control col-sm-1" name="tel2"
					maxlength="4" placeholder="Tel">
			</div>
			<div class="input-group-addon">-</div>
			<div><input type="text" class="form-control col-sm-1" name="tel3"
					maxlength="4" placeholder="Tel">
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2 label-danager">주 소</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="addr"
			maxlength="100" placeholder="Enter Address">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">생년월일</label>
		<div class="col-sm-2">
			<input type="text" class="form-control col-sm-1" name="year"
					maxlength="4" placeholder="Year">
		</div>
		<div class="control-label col-sm-1">년</div>
		<div class="col-sm-2">
			<input type="text" class="form-control col-sm-1" name="month"
					maxlength="2" placeholder="Month">
		</div>
		<div class="control-label col-sm-1">월</div>
		<div class="col-sm-2">
			<input type="text" class="form-control col-sm-1" name="date"
					maxlength="2" placeholder="Date">
		</div>
		<div class="control-label col-sm-1">일</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">직 업</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" name="job"
			maxlength="50" placeholder="Enter Job">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">성별</label>
		<div class="col-sm-4">
			<label class="radio-inline">
				<input type="radio" name="gender" value="M" checked>남자
			</label>
			<label class="radio-inline">
				<input type="radio" name="gender" value="W">여자
			</label>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">이메일</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" name="email"
			maxlength="50" placeholder="Enter Email">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">자기소개</label>
		<div class="col-sm-7">
			<textarea rows="6" cols="100" name="intro"></textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-4 col-sm-3">
			<button type="button" class="btn btn-primary" 
				onclick="insertCheckForm(this.form)">등록</button>
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


































