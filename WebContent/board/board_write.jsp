<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="css/board.css"/>

<style>
	body{
		background-color:white;
		padding:0px;
		margin:0px;
	}
</style>

<script>
$(window).scroll(function(){
	if($(window).scrollTop() == $(document).height() - $(window).height()) {
		alert("끝!");
	}
});
</script>

</head>

<body>
	<div class="container-fluid" style="padding:0px; margin:0px;">
			<div class="row box" style="width:100%">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div style="margin:10%;">
					<div>
						<h3><strong>글 작성하기</strong></h3>
						<div style="border-bottom:2px solid #063a88"></div>
					</div><br/>
					
					<div>
						<form class="form-horizontal" role="form" method="post"
								action="ModifyBoard.jsp">
							<div class="form-group">
								<label class="control-label col-sm-3" style="margin:0px;" for="board_select">
									게시판선택
								</label>
								<div class="col-sm-3" style="margin:0px;">
									<select class="form-control" id="board_select" style="width:auto;">
										<option>TIP</option>
										<option>수다&잡담</option>
										<option>묻고답하기</option>									  
										<option>지역거래</option>
									  	<option>광고</option>
									  	<option>공지&이벤트</option>
									</select>
								</div>
								<label class="control-label col-sm-3" style="margin:0px;" for="category_select">
									카테고리선택
								</label>
								
								<div class="col-sm-3" style="margin:0px;">
									<select class="form-control" id="category_select" style="width:auto;">
									 	<option>카테고리</option>
									 	<option>잡담</option>
									  	<option>질문</option>
									  	<option>???</option>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-sm-3"
										for="board_subject">
									제목
								</label>
								<div class="col-sm-9">
									<input type="text" class="form-control"
											id="board_subject"
											name="board_subject"
											placeholder="제목"
											autocomplete="off" required/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3"
										for="board_content">
									내용
								</label>
								<div class="col-sm-9">
									<textarea name="board_content"
											id="board_content"
											class="form-control"
											placeholder="내용"
											rows="5"
											required></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3"
										for="file_name">
									이미지 첨부
								</label>
								<div class="col-sm-9">
									<input type="file" name="file_name"
											id="file_name"
											class="form-control"
											accept="image/*"/>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3"
										for="hashtag">
									해시태그		
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="hashtag" name="hashtag" value="#"/>
								</div>
								<div style="text-align:right" class="col-sm-3">
									<button type="button" class="btn" style="background:#063a88; color:white">해시태그</button>
								</div>
							</div>
							<div style="text-align:center">
							<button type="submit" class="btn" style="background:#d9d9d9; color:white">
								작성하기
							</button>
							<a href="board_main.jsp" class="btn" style="background:#d9d9d9; color:white">
								메인 페이지
							</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
		</div>
		
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
</body>
</html>