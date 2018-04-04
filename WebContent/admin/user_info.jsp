<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<c:url var="path" value="/manage/AdminPage.jsp"/>

<script>
$('#back').click(function(){
		parent.history.back();
		return false;
	});
</script>

</head>
<body>

<div class="container-fluid" style="border:3px solid #a3a3a3">

	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<p style="border-bottom:3px solid yellow; margin-top:30px; margin-bottom:30px;">abc1234@naver.com</p>
		<form class="form-inline">
		  <div class="form-group col-sm-4">
		    <label>이름 김코난</label>
		  </div>
		  <div class="form-group col-sm-8" style="text-align:right">
		    <label>권한
		  	<select class="form-control input-sm" style="width:auto;">
				<option>정렬 선택</option>
				<option>이름</option>
				<option>별명</option>									  
				<option>권한</option>
			  	<option>등급</option>
			  	<option>포인트</option>
			  	<option>상태</option>
			</select>
			</label>
		  </div>
		</form>
		
		<form class="form-inline">
		  <div class="form-group col-sm-4">
		    <label>이름 김코난</label>
		  </div>
		  <div class="form-group col-sm-8" style="text-align:right">
		    <label>권한
		  	<select class="form-control input-sm" style="width:auto;">
				<option>정렬 선택</option>
				<option>이름</option>
				<option>별명</option>									  
				<option>권한</option>
			  	<option>등급</option>
			  	<option>포인트</option>
			  	<option>상태</option>
			</select>
			</label>
		  </div>
		</form>
		
		<form class="form-inline">
		  <div class="form-group col-sm-4">
		    <label>이름 김코난</label>
		  </div>
		  <div class="form-group col-sm-8" style="text-align:right">
		    <label>권한
		  	<select class="form-control input-sm" style="width:auto;">
				<option>정렬 선택</option>
				<option>이름</option>
				<option>별명</option>									  
				<option>권한</option>
			  	<option>등급</option>
			  	<option>포인트</option>
			  	<option>상태</option>
			</select>
			</label>
		  </div>
		</form>
		
		<p>확인 <a href="${path}">취소</a></p>
	</div>
	<div class="col-sm-2"></div>

</div>

</body>
</html>