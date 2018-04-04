<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragm", "No-cache");
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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
#index_top {
	background-color: #063a88;
}

#ggul {
	color: #ffc000;
	font-size: 60px;
}

#dro {
	color: white;
	font-size: 30px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div id="index_top">
				<div>
					<form method="post" action="index.jsp">
							<input type="image"src="image/gguldromeda_nav.png" alt="Submit">
					</form>
				</div>
			</div>
			<div style="margin-top: 20px">
				<div class="col-sm-2"></div>
				<div class="col-sm-8" id="back">
					<form class="form-horizontal" role="form" action="#">
						<div class="form-group">
							<p style="text-align:center; font-size:30px">회원가입</p>
							<label class="control-label col-sm-2" for="user_id"> 
								이메일 : 
							</label>
							<div class="col-sm-3"style="padding-right: 0px;">
								<div class="row">
									<div class="col-sm-10">
										<input type="text" class="form-control" id="user_id"
											name="user_id" placeholder="이메일" autocomplete="off"
											style="width: 100%" />
									</div>
									<div class="col-sm-2"
										style="padding-left: 0px; padding-top: 8px">@</div>
								</div>
							</div>
							<div class="col-sm-2" style="padding-left: 0px;">
								<input type="text" class="form-control" id="user_d_email"
									name="user_d_email" placeholder="직접입력" autocomplete="off" />
							</div>
							<div class="dropdown col-sm-1" style="padding-left:0px;padding-right:0px">
								<button class="btn btn-default btn-block dropdown-toggle"
									type="button" data-toggle="dropdown">
									선택 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">naver.com</a></li>
									<li><a href="#">daum.net</a></li>
									<li><a href="#">google.com</a></li>
									<li><a href="#">직접입력</a></li><%--포커스 기능 넣기 --%>
								</ul>
							</div>
							<div class="col-sm-2">
								<button type="button" class="btn btn-primary btn-block ">
									중복확인
								</button>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label class="control-label col-sm-2" for="user_pw">
									비밀번호 : </label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="user_pw"
										name="user_pw" placeholder="비밀번호" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label class="control-label col-sm-2" for="user_pw2">
									비밀번호확인 : 
								</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="user_pw2"
										name="user_pw2" placeholder="비밀번호 확인" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label class="control-label col-sm-2" for="user_name">
									이 름 : 
								</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="user_name"
										name="user_name" placeholder="이름" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label class="control-label col-sm-2" for="user_nick">
									별 명 : 
								</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="user_nick"
										name="user_nick" placeholder="별 명" />
								</div>
								<div class="col-sm-2">
								<button type="button" class="btn btn-primary btn-block ">
									중복확인
								</button>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label class="control-label col-sm-2" for="user_birth">
									생년월일 : 
								</label>
								<div class="dropdown col-sm-1" style="padding-right:0px">
									<button class="btn btn-default btn-block dropdown-toggle"
										type="button" data-toggle="dropdown">
										년도 <span class="caret"></span>
									</button>
								<ul class="dropdown-menu">
									<li><a href="#">1992</a></li>
									<li><a href="#">1991</a></li>
									<li><a href="#">1990</a></li>
									<li><a href="#">1989</a></li>
								</ul>
								</div>
								<div class="dropdown col-sm-1">
									<button class="btn btn-default btn-block dropdown-toggle"
										type="button" data-toggle="dropdown">
										월 <span class="caret"></span>
									</button>
								<ul class="dropdown-menu">
									<li><a href="#">12</a></li>
									<li><a href="#">11</a></li>
									<li><a href="#">10</a></li>
									<li><a href="#">9</a></li>
								</ul>
								</div>
								<div class="dropdown col-sm-1">
									<button class="btn btn-default btn-block dropdown-toggle"
										type="button" data-toggle="dropdown">
										일 <span class="caret"></span>
									</button>
								<ul class="dropdown-menu">
									<li><a href="#">31</a></li>
									<li><a href="#">30</a></li>
									<li><a href="#">29</a></li>
									<li><a href="#">28</a></li>
								</ul>
								</div>
							</div>
						</div>
						<div class="row">
						<div class="form-group">
								<label class="control-label col-sm-2" for="user_addr">
									주 소 : 
								</label>
								<div class="col-sm-3">
									<a href="#" class="btn btn-default btn-block" id="user_addr">주소입력</a>
								</div>
								<div class="col-sm-2">
									<button class="btn btn-success">우편번호검색</button>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
							   	<label class="control-label col-sm-2"
							   	       for="user_profile">
							   	       프로필사진 : 
							   	</label>
							   	<div class="col-sm-5">
							   	   <input type='file' name="user_profile"
							   	          id="user_profile"
							   	          class="form-control"
							   	          accept="image/*"/>
							   	</div>
							   	
						   	</div>
						   </div>
						   <div class="form-group">
						   	<div class="row">
						   		<div class="col-sm-4"></div>
						   		<div class="col-sm-4">
							   		<img src="image/고준희.jpg" width="200" height="200"
							   			class="img-thumbnail"/>
							   	</div>
						   	</div>
						   </div>
						   <div class="form-group">
						   		<div class="row">
							   		<div style="text-align:center">
								   		<button type="submit" class="btn btn-primary">
								      		가입
								      	</button>
								      	<a href="index.jsp" class="btn btn-danger">
								      		취소
								      	</a>
								    </div>
						   		</div>
						   </div>
					</form>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>
</body>
</html>

















