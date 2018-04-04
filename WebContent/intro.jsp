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
	font-size: 60px;
}

#dro2 {
	color: #063a88;
	font-size: 60px;
}

#Subject {
	margin-top: 135px;
}

#back {
	/*background-color : red;*/
	
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<%-- 상단바 --%>
			<!-- <div id="index_top">
				<div>
					<img class="img-responsive" src="image/gguldromeda_nav.png">
				</div>
			</div> -->
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="container-fluid" style="background-color:#063a88">
					<div class="row">
						<div class="navbar-header col-sm-4" style="padding-left:0px">
							<form method="post" action="index.jsp">
								<input type="image"src="image/gguldromeda_nav.png" alt="Submit">
							</form>	
						</div>
						
					</div>
				</div>
			</nav>
			<div id="Subject">
				<div class="row">
					<div class="col-sm-3"></div>
					<div id="back" class="col-sm-6">
						<div  style="text-align:center; margin-left:20px; margin-right:20px">
							<!-- <span id="ggul">꿀</span><span id="dro2">드로메다</span> -->
							<img  class="img-responsive" src="image/gguldromeda!.png" />
						</div>

						<!-- <div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-5">
								<button type="button" class="btn btn-info btn-block"
									data-toggle="modal" data-target="#myModal">지역검색</button>
							</div>
							<div class="col-sm-5">
								<button type="button" class="btn btn-primary">검색</button>
							</div>
						</div> -->
						<div style="text-align:center;margin-top:20px">
							<span>
								<button type="button" class="btn btn-default" style="width:50%"
									data-toggle="modal" data-target="#myModal">
									지역검색
								</button>
							</span>
							<span>
								<button type="button" class="btn btn-primary">검색</button>
							</span>
						</div>
						<!-- <div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6" style="margin-top: 20px">
								<span style="text-align: center">
									<button class="btn btn-default" type="button"
										data-toggle="modal" data-target="#login_modal"
										style="margin-right: 20px">로그인</button> | <a
									class="btn btn-default" href="add_user.jsp"
									style="margin-left: 20px">회원가입</a>
								</span>
							</div>
							<div class="col-sm-3"></div>
						</div> -->
						<div style="text-align:center;margin-top:20px">
							<span style="text-align: center">
									<a  type="button"
										data-toggle="modal" data-target="#login_modal"
										style="margin-right: 20px">로그인</a> | <a
									 href="add_user.jsp"
									style="margin-left: 20px">회원가입</a>
								</span>
						</div>
					</div>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>
	<!-- 지역선택 Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!--  Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">지역을 선택해주세요</h4>
				</div>
				<div class="modal-body">
					<ul>
						<li><a href="#">신림동</a></li>
						<li><a href="#">월계동</a></li>
						<li><a href="#">파주시</a></li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="login_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<img class="img-thumbnail" id="img_logo" src="image/고준희.jpg"
						width="200" height="200">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
				</div>

				<!-- Begin # DIV Form -->
				<div id="div-forms">

					<!-- Begin # Login Form -->
					<form id="login-form" method="post" action="MainPage.jsp">
						<div class="modal-body">
							<div id="div-login-msg">
								<div id="icon-login-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-login-msg"> 이메일과 비밀번호를 입력해 주세요. </span>
							</div>
							<input id="login_username" class="form-control" type="text"
								placeholder="이메일을 입력하세요" required /> <input id="login_password"
								class="form-control" type="password" placeholder="비밀번호를 입력하세요"
								required />
						</div>
						<div class="modal-footer">
							<div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">
									로그인</button>
							</div>
							<div>
								<button id="login_lost_btn" type="button" class="btn btn-link">
									비밀번호를 잊었니?</button>
								<a href="add_user.jsp" id="login_register_btn" type="button"
									class="btn btn-link">회원가입</a>
							</div>
						</div>
					</form>
					<!-- End # Login Form -->

				</div>
			</div>
		</div>
	</div>
	<!-- END # MODAL LOGIN -->
</body>
</html>