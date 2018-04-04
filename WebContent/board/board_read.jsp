<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<c:url var="path" value="/css/board.css" />
<link rel="stylesheet" href="${path}" />
<script>
	$(document).ready(function(){
	    $("#report").click(function(){
	    		 $("#tab1").load("member_management/read_member_profile.jsp");
	    });
	});
</script>
</head>
<body>

<!-- Trigger the modal with a button -->

<!-- Modal -->
<div id="myModal" class="modal left fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      	프로필
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
	      <div class="login_info">
				
				<div class="login_img" style="margin-bottom:10px;">
					<p style="text-align:right">
						<a href="#" id="write">글쓰기</a>
						<a href="#" id="user_modify"><img src="image/settings_24.png"></a>
					</p>
					<p align="center"><img src="image/rabbit.png" class="img-circle"/></p>
				</div> 
				
				<div class="login_ment" style="text-align:center;">
					<div class="login_nickname">
						<span><a href="#" id="mypage">내이름은</a></span><br/>
					</div>
					<div class="my_info" style="margin-top:10px; margin-bottom:40px;">
						<span>포인트 <a href="#">700점</a> | 꿀벌 등급</span><br/>				
						<a href="#"><span>신림동</span>접속</a>				
					</div>
				</div>
				
			</div>
			<div class="left_category" id="left_category" style="border-top:1px solid #D9D9D9; padding-top:20px;">
				<ul class="nav" id="nav">	
					<li style="margin:10px;"><a data-idx="1" href="#" style="font-size:150%; color:black"><img src="image/honey_32.png" style="padding-right:50px;"><b>TIP</b></a></li>
					<li style="margin:10px;"><a data-idx="2" href="#" style="font-size:130%; color:black"><img src="image/chat_32.png" style="padding-right:50px;"><b>수다&잡담</b></a></li>
					<li style="margin:10px;"><a data-idx="3" href="#" style="font-size:130%; color:black"><img src="image/question_32.png" style="padding-right:50px;"><b>묻고 답하기</b></a></li>
					<li style="margin:10px;"><a data-idx="4" href="#" style="font-size:130%; color:black"><img src="image/box_32.png" style="padding-right:50px;"><b>지역거래</b></a></li>
					<li style="margin:10px;"><a data-idx="5" href="#" style="font-size:130%; color:black"><img src="image/ads_32.png" style="padding-right:50px;"><b>광고</b></a></li>
					<li style="margin:10px;"><a data-idx="6" href="#" style="font-size:130%; color:black"><img src="image/notice_32.png" style="padding-right:50px;"><b>공지&이벤트</b></a></li>
				</ul>				
			</div>
 	   </div>
	</div>
  </div>
</div>

<!-- 여기부터 페이지 -->
<!-- 상단 네비 바 -->
<div class='navbar navbar-inverse navbar-fixed-top' style="background-color:#063a88;">
	<div class="container-fluid">
			<div class="navbar-header" style="padding-left:0px">
				<%-- id가 c1인 메뉴 부분을 펼칠 수 있도록 버튼을 설정한다 --%>
				<button class="navbar-toggle" data-toggle="modal" data-target="#myModal">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="${main}"><img style="text-align:top" src="image/gguldromeda_nav.png"></a>
			</div>
			
			<div class="collapse navbar-collapse" id="navbar">
				<ul class="nav navbar-nav navbar-right" style="margin:0px; padding:0px">
			    	<li><a href="#" style="padding-bottom:1px; padding-top:8px"><input id="search_text" type="text" onclick="" class="form-control"></a></li>
			        <li><a href="#" style="padding-bottom:1px; padding-top:8px"><input id="search_btn" type="image" src="image/search_32.png" ></a></li>
			        <li><a href="#" style="padding-bottom:1px; padding-top:8px"><input type="image" src="image/calendar_32.png" alt="button"></a></li>
			        <li><a href="#" style="padding-bottom:1px; padding-top:8px"><input type="image" style="margin-left:20px"src="image/alarm_32.png" alt="button"></a></li>
			    </ul>
			</div>
			
	</div>
</div>

<!-- 사이드바 부분 -->
	<div class="container col-sm-3" style="padding:0px; margin-top:5%">
		<div class="nav collapse navbar-collapse" style="position:left; position:fixed;">
			<div class="login_info">
			
				<div class="login_img" style="margin-bottom:10px;">
					<p style="text-align:right">
						<a href="#" id="write2">글쓰기</a>
						<a href="#" id="user_modify2"><img src="image/settings_24.png"></a>
					</p>
					<p align="center"><img src="image/rabbit.png" class="img-circle"/></p>
				</div> 
				
				<div class="login_ment" style="text-align:center;">
					<div class="login_nickname">
						<span><a href="#" id="mypage2">내이름은</a></span><br/>
					</div>
					<div class="my_info" style="margin-top:10px; margin-bottom:40px;">
						<span>포인트 <a href="#">700점</a> | 꿀벌 등급</span><br/>				
						<a href="#"><span>신림동</span>접속</a>				
					</div>
				</div>
				
			</div>
			<div class="left_category" id="left_category" style="border-top:1px solid #D9D9D9; padding-top:20px;">
				<ul class="nav" id="nav">	
					<li style="margin:10px;"><a data-idx="1" href="#" style="font-size:150%; color:black"><img src="image/honey_32.png" style="padding-right:50px;"><b>TIP</b></a></li>
					<li style="margin:10px;"><a data-idx="2" href="#" style="font-size:130%; color:black"><img src="image/chat_32.png" style="padding-right:50px;"><b>수다&잡담</b></a></li>
					<li style="margin:10px;"><a data-idx="3" href="#" style="font-size:130%; color:black"><img src="image/question_32.png" style="padding-right:50px;"><b>묻고 답하기</b></a></li>
					<li style="margin:10px;"><a data-idx="4" href="#" style="font-size:130%; color:black"><img src="image/box_32.png" style="padding-right:50px;"><b>지역거래</b></a></li>
					<li style="margin:10px;"><a data-idx="5" href="#" style="font-size:130%; color:black"><img src="image/ads_32.png" style="padding-right:50px;"><b>광고</b></a></li>
					<li style="margin:10px;"><a data-idx="6" href="#" style="font-size:130%; color:black"><img src="image/notice_32.png" style="padding-right:50px;"><b>공지&이벤트</b></a></li>
				</ul>	
				
			</div>
			</div>
			
		</div>
<!-- 게시글 읽기 페이지 -->
	<div class="col-sm-9" style="margin-top:50px; padding:0px; height:100%; background-color:white; border:20px solid #F1F1F2">
		<div class="row box" style="margin:50px 0px">
			<div class="col-sm-2" >
			</div>
			<div class="col-sm-8">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<div class="col-sm-12">
							<h3>범인은이안에 있어!(제목)</h3>
						</div>
						
					</div>
					<div class="form-group" style="border-bottom:1px solid #d9d9d9">
						<div class="col-sm-9" ></div>
						<div class="col-sm-3" align="right" >
							<h6>2016.02.25(작성일자)</h6>
						</div>
					</div>
					
					
					
				<%-- 	<div style="border-bottom::">
					
					</div>--%>
					
					<div class="form-group">
						<div class="col-sm-8" align="left">
							<h5>내이름은코난(작성자)</h5>
						</div>
					
						<div class="col-sm-4" align="right">
							<input type="image" src="image/heart_20.png"/>		
							27
							&nbsp;
							<a href="#" id="report">
								<input type="image" src="image/siren_24.png" />
							</a>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12" align="right">
							<a href="${path}" style="color:#063a88">수정</a> 
							<a href="${path}" style="color:#063a88">삭제</a> 
						</div>
					</div>
				</form>
				<div class="form-group">
					<div class="col-sm-8">
						${param.board_content}
					<%-- 
					<pre style="padding: 0px">
새로운 시즌 더멋있는 명추리로 코난이 찾아온다.
검은 조직의 계략의 의해 어린아이가 되버린 고등학생 명탐정 난도일
그는..............
더이상..................
..................
..........
...
.
				
				 </pre>
				 --%>
				 <%-- 
				 	<div id="board_content">
				 		
				 	</div>
				 	--%>
				 </div>
				</div>
				
				<div class="form-group" style="height:120px"></div>
				
				<form class="form-horizontal" role="form">
					<div class="form-group row">
						<div class="col-sm-12" align="left" style="color:#063a88">
							<a>#해시태그</a>
						</div>
					</div>
					<div class="form-group" align="right">
						<a>보관함으로</a>
						&nbsp;
						<a>이웃추가</a>
					</div>
					<div class="form-group" align="center">
						<div class="col-sm-5"></div>
						<div class="col-sm-2">
							<input type="image" src="image/left-1.png"/>
							<input type="image" src="image/right.png"/>
						</div>
						<div class="col-sm-5"></div>	
					</div>
					
					<div class="form-group" >

						<div class="col-sm-12" style="background:#ffffff;padding:20px 20px 0px;border:5px solid #d9d9d9">
							<div class="row" style="background:#ffffff;padding:0px;">
								
								<div class="col-xs-6 col-md-3" >
									<div class="thumbnail" style="word-break:break-all;height:170px;overflow:hidden">
										<a href="#" style="color:#000000">
										<img src="image/1.png" alt="...">
										<div class="caption">
										<h5>
											
											${param.pre_board_subject }
										</h5>
										</div>
										</a>
									</div>
								</div>
								<div class="col-xs-6 col-md-3" >
									<div class="thumbnail" style="word-break:break-all;height:170px;overflow:hidden">
										<a href="#" style="color:#000000">
										<img src="image/1.png" alt="...">
										<div class="caption">
										<h5>
											
											그런 슬픈 말은 하지 말아요~
										</h5>
										</div>
										</a>
									</div>
								</div>
								<div class="col-xs-6 col-md-3" >
									<div class="thumbnail" style="word-break:break-all;height:170px;overflow:hidden">
										<a href="#" style="color:#000000">
										<img src="image/1.png" alt="...">
										<div class="caption">
										<h5>
											
											${param.pre_board_subject }
										</h5>
										</div>
										</a>
									</div>
								</div>
								<div class="col-xs-6 col-md-3" >
									<div class="thumbnail" style="word-break:break-all;height:170px;overflow:hidden">
										<a href="#" style="color:#000000">
										<img src="image/1.png" alt="...">
										<div class="caption">
										<h5>
											
											${param.pre_board_subject }
										</h5>
										</div>
										</a>
									</div>
								</div>								
							</div>
						</div>
						<%-- 
						<div class="col-sm-2"></div>
						--%>
					</div>
					<div class="form-group">
						 
						<div class="col-sm-11" align="right" style="padding:2px">
						<%-- 
						  <input type="text" class="form-control"
						   	     id="board_subject"
						   	     name="board_subject"
						   	     placeholder="내용을 입력해 주세요"
						   	     autocomplete="off"
						   	     autofocus="autofocus"/>
						  --%>
						  <textarea name="reply_content" id="reply_content" class="form-control"
											placeholder="댓글을 입력해 주세요" rows="3" ></textarea>
						</div>
						<div class="col-sm-1" style="padding:2px" align="center">
							
							<div class="form-group" height="20px"></div>
							<div class="form group">
								<a href="${path}" class="btn btn-primary" style="background:#063a88">등록</a>
							</div> 
						</div>
					</div>	
					<div class="form-group">
						<div class="col-sm-8" align="left">
							 <div class="col-sm-3" style="padding:0px">	
							  	<img src="image/6.jpg" width="70" height="70" alt="댓글이미지"/>
							  </div>
							  <div class="col-sm-9" style="padding:0px">
							  	<h6>댓글제목(2016-02-25 오후 5:19)</h6>
							  	<h5>댓글내용</h5>
							</div>
						  	<!-- 
						  	<div class="col-sm-4" align="right">
								<input type="image" src="image/heart_24.png" width="15" height="15"/>		
								<input type="image" src="image/siren_24.png" width="15" height="15"/>
						  	</div>
						  	 -->
						</div>
						<div class="col-sm-1">
						</div>
						<div class="col-sm-3" align="right">
						  	<table style="width:75px; text-align:center; border:none; ">
							  <tr>
							    <td><a href="${path}" style="color:#063a88"> 수정 </a></td>
							    <td><a href="${path}" style="color:#063a88"> 삭제 </a></td> 
							  </tr>
							  <tr height="20px;"></tr>
							  <tr>
							    <td><input type="image" src="image/heart_24.png" width="15" height="15"/>&nbsp;27</td>
							    <td><input type="image" src="image/siren_24.png" width="15" height="15"/></td>
							  </tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>


