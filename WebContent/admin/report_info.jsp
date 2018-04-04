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
</head>
<body>

<div class="container-fluid" style="border:3px solid #a3a3a3">

	<div class="col-sm-2"></div>
	<div class="col-sm-8" >
		<div class="col-sm-6" style="border-bottom:3px solid yellow; margin-top:30px; margin-bottom:30px;">
			<label>신고자 : qwe234@naver.com</label>
		</div>
		<div class="col-sm-6" style="border-bottom:3px solid yellow; margin-top:30px; margin-bottom:30px;">
			<label>신고일 : 2016.02.12</label>
		</div>
		
		<div class="col-sm-12">
			<label>신고대상 : lionheart2@naver.com</label>
		</div>

		<div class="col-sm-6">
			<label>유형 : 댓글</label>
		</div>
		<div class="col-sm-6">
			<label>신고분류 : 부적절한 내용</label>
		</div>
		
		<div class="col-sm-12">
			<label class="control-label" for="board_content">신고사유</label>
		</div>
		
		<div class="col-sm-12">
			<textarea name="board_content"
						id="board_content"
						class="form-control"
						placeholder="내용"
						rows="5"
						required></textarea>
			
		</div>
		
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
		<p style="text-align:center">
			해당 게시글 링크 : 
			<a href="http://bbs2.ruliweb.daum.net/gaia/do/ruliweb/default/news/522/read?articleId=2002414&bbsId=G003&searchKey=subjectNcontent&itemGroupId=29&sortKey=depth&searchValue=%EC%A3%BC%ED%86%A0%ED%94%BC%EC%95%84&pageIndex=1">
				클릭
			</a>
		</p>
		</div>
		<div class="col-sm-2"></div>
		
	</div>
	
	<div class="col-sm-2"></div>

</div>
<div class="container-fluid" style="text-align:center">
	<div class="col-sm-3"></div>
	<div class="col-sm-2">게시글 삭제</div> 
	<div class="col-sm-2">승인 거부</div> 
	<div class="col-sm-2"><a href="${path}">돌아가기</a></div>
	<div class="col-sm-3"></div>
</div>
</body>
</html>