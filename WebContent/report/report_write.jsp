
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<c:url var="path" value="/css/board.css" />
<link rel="stylesheet" href="${path}" />
</head>
<body>
	<div class="container-fluid">
		<div class="row box">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<form class="form-horizontal" role="form" method="post" action="${path}">
					<div class="form-group">
						<div class="col-sm-1">
							<img src="image/siren_55.png" width="50" height="50" alt="신고이미지"/>
						</div>
						<div class="col-sm-11">
							<h3>신고 글 작성</h3>
						</div>
					</div>
					<br/>
					<div class="form-group">
						<div class="col-sm-4">
							게시글 작성자 : LIONHEART
						</div>
						<div class="col-sm-8">
					   </div>						
					</div>
					<div class="form-group">
						<div class="col-sm-4">
							<select class="form-control" id="" style="width:auto;">
								<option>신고분류</option>
								<option>신고1</option>
								<option>신고2</option>
								<option>신고3</option>
							</select>
						</div>
						<div class="col-sm-8"></div>
					</div>	
					<div>
						<h5>신고사유</h5>
					</div>
					<div class="form-group">
							<div class="col-sm-9">
								<textarea name="board_content"
						   	             id="board_content"
						   	             class="form-control"
						   	             placeholder="신고내용을 입력해주세요"
						   	             rows="15"></textarea>
							</div>
							<div class="col-sm-3"></div>
					</div>
					<br/>
					<div class="form-group">
						<div class="col-sm-8">
							<a href="${path}" class="btn btn-primary"> 작성완료 </a> 
							<a href="${path}" class="btn btn-danger"> 취소 </a>						
						</div>
						<div class="col-sm-2">						
						</div>
						<div class="col-sm-2"></div>												 												 	
					</div>
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>