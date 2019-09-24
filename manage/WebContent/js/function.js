/**
 * 공통으로 사용하는 함수를 기술한다.
 */
//-----------------------------------------------------
// 검사 기능
//-----------------------------------------------------
function isNumberCheck(inputVal)
{
	var var_normalize = /[^0-9]gi; // 정규식
	if(var_normalize.test(inputVal) == true) return false;
	else return true;
}

// 
function containsCharsOnly(input, chars) 
{
	for(var inx = 0; inx < input.length; inx++) {
		if(chars.indexOf(input.charAt(inx)) == -1)
			return false;
	}
}
// 숫자 검사
function isNum(input)
{
	var chars = "0123456789";
	return containsCharsOnly(input, chars);
}

// 영숫자 판별
function isAlphaNumCheck(input)
{
	var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	return containsCharsOnly(input, chars);
}

// 이름 검사
function isNameCheck(input)
{
	var chars = "0123456789~!@#$%^&*()_-+=|{}[]<>,./?";
	return containsCharsOnly(input, chars);
}

//-----------------------------------------------------
// 회원 ID 검사
//-----------------------------------------------------
function confirmId()
{
	if(document.insertForm.id.value == "") {
		alert("아이디를 입력하십시오.");
		return;
	}
	url = "confirmId.jsp?id=" +
			document.insertForm.id.value;
	
	window.open(url, "confirm", 
				"toolbar=no, location=no, status=no, menubar=no \
				 scrollbars=no, resizable=no, width=500, height=400");
}

//-----------------------------------------------------
// 회원 가입시 검사 사항
//-----------------------------------------------------
function insertCheckForm(insertForm)
{
	// id 검사
	if(!insertForm.id.value) {
		alert("고객 id 입력은 필수사항입니다.");
		document.insertForm.id.focus();
		return;
	}
	if(isAlphaNumCheck(insertForm.id.value) == false) {
		alert("고객 id는 숫자와 영문자만 입력이 가능합니다.");
		document.insertForm.id.focus();
		return;
	}
	if( (insertForm.id.value.length < 4) || 
		(insertForm.id.value.length > 12) ) {
		alert("\n고객 id는 4자리에서 12자리를 입력하셔야 합니다.");
		document.insertForm.id.focus();
		return;
	}
	
	// 비밀번호 검사
	if(!insertForm.passwd.value) {
		alert("비밀번호 입력은 필수사항입니다.");
		document.insertForm.passwd.focus();
		return;
	}
	if(isAlphaNumCheck(insertForm.passwd.value) == false) {
		alert("비밀번호는 숫자와 영문자만 입력이 가능합니다.");
		document.insertForm.passwd.focus();
		return;
	}
	if( (insertForm.passwd.value.length < 4) || 
		(insertForm.passwd.value.length > 12) ) {
		alert("\n비밀번호는 4자리에서 12자리를 입력하셔야 합니다.");
		document.insertForm.id.focus();
		return;
	}

	// 비밀번호확인 검사
	if(!insertForm.repasswd.value) {
		alert("비밀번호확인 입력은 필수사항입니다.");
		document.insertForm.repasswd.focus();
		return;
	}
	if(isAlphaNumCheck(insertForm.repasswd.value) == false) {
		alert("비밀번호확인은 숫자와 영문자만 입력이 가능합니다.");
		document.insertForm.repasswd.focus();
		return;
	}
	if( (insertForm.repasswd.value.length < 4) || 
		(insertForm.repasswd.value.length > 12) ) {
		alert("\n비밀번호확인은 4자리에서 12자리를 입력하셔야 합니다.");
		document.insertForm.repasswd.focus();
		return;
	}

	// 이름 검사
	if(!insertForm.name.value) {
		alert("이름 입력은 필수사항입니다.");
		document.insertForm.name.focus();
		return;
	}
	if(isNameCheck(insertForm.name.value) != false) {
		alert("이름에는 숫자나 특수문자를 입력할 수 없습니다.");
		document.insertForm.name.focus();
		return;
	}
	
	// 전화번호 2번째 자리 검사
	if(!insertForm.tel2.value) {
		alert("전화번호 가운데 자리 입력은 필수사항입니다.");
		document.insertForm.tel2.focus();
		return;
	}
	if(isNum(insertForm.tel2.value) == false) {
		alert("전화번호는 숫자만 입력이 가능합니다.");
		document.insertForm.tel2.focus();
		return;
	}
	if(insertForm.tel2.value.length < 3) {
		alert("전화번호 가운데 자리는 최소 3자를 입력하셔야 합니다.");
		document.insertForm.tel2.focus();
		return;
	}
	
	// 전화번호 3번째 자리 검사
	if(!insertForm.tel3.value) {
		alert("전화번호 마지막 자리 입력은 필수사항입니다.");
		document.insertForm.tel3.focus();
		return;
	}
	if(isNum(insertForm.tel3.value) == false) {
		alert("전화번호는 숫자만 입력이 가능합니다.");
		document.insertForm.tel3.focus();
		return;
	}
	if(insertForm.tel3.value.length < 4) {
		alert("전화번호 마지막 자리  자리는 최소 4자를 입력하셔야 합니다.");
		document.insertForm.tel3.focus();
		return;
	}
	
	// 주소 검사
	if(!insertForm.addr.value) {
		alert("주수 입력은 필수사항입니다.");
		document.insertForm.addr.focus();
		return;
	}
	
	// 생년월일 년도 검사
	if(!insertForm.year.value) {
		alert("년도 입력은 필수사항입니다.");
		document.insertForm.year.focus();
		return;
	}
	if(isNum(insertForm.year.value) == false) {
		alert("년도는 숫자만 입력이 가능합니다.");
		document.insertForm.year.focus();
		return;
	}
	if(insertForm.year.value.length < 4) {
		alert("년도는 4자를 입력하셔야 합니다.");
		document.insertForm.year.focus();
		return;
	}
	
	// 생년월일 월 검사
	if(!insertForm.month.value) {
		alert("월 입력은 필수사항입니다.");
		document.insertForm.month.focus();
		return;
	}
	if(isNum(insertForm.month.value) == false) {
		alert("월은 숫자만 입력이 가능합니다.");
		document.insertForm.month.focus();
		return;
	}
	if(insertForm.month.value.length < 2) {
		alert("월은 2자를 입력하셔야 합니다.");
		document.insertForm.month.focus();
		return;
	}
	
	// 생년월일 일 검사
	if(!insertForm.date.value) {
		alert("일 입력은 필수사항입니다.");
		document.insertForm.date.focus();
		return;
	}
	if(isNum(insertForm.date.value) == false) {
		alert("일은 숫자만 입력이 가능합니다.");
		document.insertForm.date.focus();
		return;
	}
	if(insertForm.date.value.length < 2) {
		alert("일은 2자를 입력하셔야 합니다.");
		document.insertForm.date.focus();
		return;
	}
	
	// 직업 검사
	if(!insertForm.job.value) {
		alert("직업 입력은 필수사항입니다.");
		document.insertForm.job.focus();
		return;
	}

	document.insertForm.submit();
	
}

//-----------------------------------------------------
//회원 정보 수정시 검사 사항
//-----------------------------------------------------
function updateCheckForm(updateForm)
{
	// 비밀번호 검사
	if(!updateForm.passwd.value) {
		alert("비밀번호 입력은 필수사항입니다.");
		document.updateForm.passwd.focus();
		return;
	}
	if(isAlphaNumCheck(updateForm.passwd.value) == false) {
		alert("비밀번호는 숫자와 영문자만 입력이 가능합니다.");
		document.updateForm.passwd.focus();
		return;
	}
	if( (updateForm.passwd.value.length < 4) || 
		(updateForm.passwd.value.length > 12) ) {
		alert("\n비밀번호는 4자리에서 12자리를 입력하셔야 합니다.");
		document.updateForm.id.focus();
		return;
	}

	// 비밀번호확인 검사
	if(!updateForm.repasswd.value) {
		alert("비밀번호확인 입력은 필수사항입니다.");
		document.updateForm.repasswd.focus();
		return;
	}
	if(isAlphaNumCheck(updateForm.repasswd.value) == false) {
		alert("비밀번호확인은 숫자와 영문자만 입력이 가능합니다.");
		document.updateForm.repasswd.focus();
		return;
	}
	if( (updateForm.repasswd.value.length < 4) || 
		(updateForm.repasswd.value.length > 12) ) {
		alert("\n비밀번호확인은 4자리에서 12자리를 입력하셔야 합니다.");
		document.updateForm.repasswd.focus();
		return;
	}

	// 이름 검사
	if(!updateForm.name.value) {
		alert("이름 입력은 필수사항입니다.");
		document.updateForm.name.focus();
		return;
	}
	if(isNameCheck(updateForm.name.value) != false) {
		alert("이름에는 숫자나 특수문자를 입력할 수 없습니다.");
		document.updateForm.name.focus();
		return;
	}
	
	// 전화번호 2번째 자리 검사
	if(!updateForm.tel2.value) {
		alert("전화번호 가운데 자리 입력은 필수사항입니다.");
		document.updateForm.tel2.focus();
		return;
	}
	if(isNum(updateForm.tel2.value) == false) {
		alert("전화번호는 숫자만 입력이 가능합니다.");
		document.updateForm.tel2.focus();
		return;
	}
	if(updateForm.tel2.value.length < 3) {
		alert("전화번호 가운데 자리는 최소 3자를 입력하셔야 합니다.");
		document.updateForm.tel2.focus();
		return;
	}
	
	// 전화번호 3번째 자리 검사
	if(!updateForm.tel3.value) {
		alert("전화번호 마지막 자리 입력은 필수사항입니다.");
		document.updateForm.tel3.focus();
		return;
	}
	if(isNum(updateForm.tel3.value) == false) {
		alert("전화번호는 숫자만 입력이 가능합니다.");
		document.updateForm.tel3.focus();
		return;
	}
	if(updateForm.tel3.value.length < 4) {
		alert("전화번호 마지막 자리  자리는 최소 4자를 입력하셔야 합니다.");
		document.updateForm.tel3.focus();
		return;
	}
	
	// 주소 검사
	if(!updateForm.addr.value) {
		alert("주수 입력은 필수사항입니다.");
		document.updateForm.addr.focus();
		return;
	}
	
	// 생년월일 년도 검사
	if(!updateForm.year.value) {
		alert("년도 입력은 필수사항입니다.");
		document.updateForm.year.focus();
		return;
	}
	if(isNum(updateForm.year.value) == false) {
		alert("년도는 숫자만 입력이 가능합니다.");
		document.updateForm.year.focus();
		return;
	}
	if(updateForm.year.value.length < 4) {
		alert("년도는 4자를 입력하셔야 합니다.");
		document.updateForm.year.focus();
		return;
	}
	
	// 생년월일 월 검사
	if(!updateForm.month.value) {
		alert("월 입력은 필수사항입니다.");
		document.updateForm.month.focus();
		return;
	}
	if(isNum(updateForm.month.value) == false) {
		alert("월은 숫자만 입력이 가능합니다.");
		document.updateForm.month.focus();
		return;
	}
	if(updateForm.month.value.length < 2) {
		alert("월은 2자를 입력하셔야 합니다.");
		document.updateForm.month.focus();
		return;
	}
	
	// 생년월일 일 검사
	if(!updateForm.date.value) {
		alert("일 입력은 필수사항입니다.");
		document.updateForm.date.focus();
		return;
	}
	if(isNum(updateForm.date.value) == false) {
		alert("일은 숫자만 입력이 가능합니다.");
		document.updateForm.date.focus();
		return;
	}
	if(updateForm.date.value.length < 2) {
		alert("일은 2자를 입력하셔야 합니다.");
		document.updateForm.date.focus();
		return;
	}
	
	// 직업 검사
	if(!updateForm.job.value) {
		alert("직업 입력은 필수사항입니다.");
		document.updateForm.job.focus();
		return;
	}

	document.updateForm.submit();
	
}

//-----------------------------------------------------
//회원 정보 삭제시 검사 사항
//-----------------------------------------------------
function deleteCheckForm(deleteForm)
{
	// 비밀번호 검사
	if(!deleteForm.passwd.value) {
		alert("비밀번호 입력은 필수사항입니다.");
		document.deleteForm.passwd.focus();
		return;
	}
	if(isAlphaNumCheck(deleteForm.passwd.value) == false) {
		alert("비밀번호는 숫자와 영문자만 입력이 가능합니다.");
		document.deleteForm.passwd.focus();
		return;
	}
	if( (deleteForm.passwd.value.length < 4) || 
		(deleteForm.passwd.value.length > 12) ) {
		alert("\n비밀번호는 4자리에서 12자리를 입력하셔야 합니다.");
		document.deleteForm.id.focus();
		return;
	}

	// 비밀번호확인 검사
	if(!deleteForm.repasswd.value) {
		alert("비밀번호확인 입력은 필수사항입니다.");
		document.deleteForm.repasswd.focus();
		return;
	}
	if(isAlphaNumCheck(deleteForm.repasswd.value) == false) {
		alert("비밀번호확인은 숫자와 영문자만 입력이 가능합니다.");
		document.deleteForm.repasswd.focus();
		return;
	}
	if( (deleteForm.repasswd.value.length < 4) || 
		(deleteForm.repasswd.value.length > 12) ) {
		alert("\n비밀번호확인은 4자리에서 12자리를 입력하셔야 합니다.");
		document.deleteForm.repasswd.focus();
		return;
	}
	//비밀번호와 비밀번호확인이 틀립니다.
	if(deleteForm.passwd.value != deleteForm.repasswd.value) {
		alert("\n비밀번호와 비밀번호확인이 틀립니다.\n\n확인 후 다시 시도하십시오.");
		deleteForm.passwd.focus();
		return false;
	}
	
	//회원정보를 삭제하기 전에 한번 더 확인해본다.
	if(confirm("회원정보를 삭제하시겠습니까?")) {
		deleteForm.action = "delete.jsp";
		deleteForm.submit();
	} else {
		return false;
	}

}



















