<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragm", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div style="background-color:#063a88">
				<img style="" class="img-responsive" src="image/gguldromeda_nav.png"/>
			</div>
			<form class="form-horizontal" role="form" method="post" action="index.jsp">
				<div class="row" style="margin-top:20px">
					<div class="col-sm-4"></div>
					<div class="col-sm-4" style="padding:0px;">
						<div class="row form-group">	
							<label class="control-label" for="user_nick"
									style="margin-left:10px; font-size:30px">
								닉네임 변경
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="user_nick" name="user_nick"
									   placeholder="별명"/>
							</div>
							<div class="col-sm-4">
								<button type="button" class="btn btn-success">중복확인</button>
							</div>
						</div>
						<div class="row form-group">
							<label class="control-label" for="user_addr"
								style="margin-left:10px; font-size:30px">
								주소지 변경
							</label>
						
							<div class="col-sm-8">
								<input type="text" class="form-control" id="user_addr" name="user_addr"
									   placeholder="주소"/>
							</div>
							<div class="col-sm-4">
								<button type="button" class="btn btn-success">우편번호 검색</button>
							</div>
						</div>
						<div class="row form-group">
							<label class="control-label" for="user_pw"
								style="margin-left:10px; font-size:30px">
								비밀번호 변경
							</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="user_pw" name="user_pw"
									   placeholder="기존 비밀번호 입력"/>
							</div>
							<div class="col-sm-4">
								<button type="button" class="btn btn-success">확인</button>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-8">
								<input type="text" class="form-control" id="user_pw1" name="user_pw1"
									   placeholder="비밀번호 입력"/>
							</div>
							<div class="col-sm-8" style="margin-top:10px">
								<input type="text" class="form-control" id="user_pw2" name="user_pw2"
									   placeholder="재입력"/>
							</div>
						</div>
						<div class="row" style="margin-top:50px;">
							<div class="col-sm-4" style="text-align:left">
								<button type="submit" class="btn btn-primary">
							      	가입
							    </button>
							    <a href="index.jsp" class="btn btn-info">
							      		취소
							     </a>
						     </div>
						     <div class="col-sm-6"></div>
						     <div class="col-sm-2" style="text-align:left">
							    <a href="index.jsp" class="btn btn-danger">
							      		회원탈퇴
							     </a>
						     </div>
						</div>
					</div>
					<div class="col-sm-4"></div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>