<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/jspMenu.css" rel="stylesheet">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<div class="container-fluid" style="background-color:#F44336; 
	 color:#FFF; height:200px;">
	<h1>회 원 관 리 매 니 저</h1>
	<h3>회원관리 프로그램 입니다.</h3>
	<p>회원관리 및 제품별 지점별 통계를 확인가능합니다.</p>
	<p>작업하시고자 하는 프로그램을 선택하거나,
	 새로 작성하여 메뉴에 등록하시면 됩니다.</p>
</div>

<!-- 회원관리 메뉴 시작 -->
<nav class="ㅁㅁnavbar navbar-inverse" data-spy="affix" data-offset-top="197">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="myNavbar">
				<span class="icon-bar"></span>		
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="JspMenu.jsp">Home</a>
		</div>
		<div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="viewMemberList.jsp">회원전체목록</a></li>
					<li><a href="insert/insertForm.jsp">회원정보등록</a></li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Employees</a>
						<ul class="dropdown-menu">
							<li><a href="company/employeesList.jsp">사원리스트</a></li>
							<li><a href="company/hireMonthStatsLineForm.jsp">월간 입사 현황(Line)</a></li>
							<li><a href="company/hireMonthStatsBarForm.jsp">월간 입사 현황(Bar)</a></li>
							<li><a href="company/hireYearMonthStatsForm.jsp">년도별 월별 입사 현황</a></li>
							<li><a href="company/saleYearStatsForm.jsp">년도별 영업사원별 주문 실적 현황</a></li>
							<li><a href="company/salalyDepartmentJobStatsForm.jsp">부서별 직급별 월급의 총합</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">통계</a>
						<ul class="dropdown-menu">
							<li><a href="#section41">제품별 월간 판매현황</a></li>
							<li><a href="#section42">대리점별 월간 판매현황</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</nav>

<div style="width: 100%; height: 100px; line-height: 100px; text-align: center">

    <img src="image1.jpg" style="width: 100%; height: 100%;  vertical-align: middle" />

</div>



<div id="section1" class="container-fluid">
	<h1>회원정보목록</h1>
	<p>가입한 회원들의 전체 목록을 볼 수 있습니다.</p>
</div>
<div id="section2" class="container-fluid">
	<h1>회원정보등록</h1>
	<p>회원의 정보를 등록합니다.</p>
</div>
<div id="section3" class="container-fluid">
	<h1>회원정보수정</h1>
	<p>회원의 정보를 수정합니다.</p>
</div>
<div id="section41" class="container-fluid">
	<h1>제품별 월간 판매현황</h1>
	<p>제품별로 판매한 월간 현황을 출력합니다.</p>
</div>
<div id="section42" class="container-fluid">
	<h1>대리점별 월간 판매현황</h1>
	<p>대리점별로 판매한 월간 현황을 출력합니다.</p>
</div>

</body>
</html>
























