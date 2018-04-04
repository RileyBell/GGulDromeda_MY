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

<link rel="stylesheet" href="css/board.css"/>
<c:url var="read_path" value="member_management/read_member_profile.jsp"/>

<script>

$(document).ready(function(){
    $("#member_list > tbody > tr").click(function(){
    		 $("#tab1").load("member_management/read_member_profile.jsp");
    });
    
    $("#report_list > tbody > tr").click(function(){
			 $("#tab2").load("member_management/report_member.jsp");
});
});

</script>

<%-- css 파일 추가 --%>
<%-- modal css --%>
<c:url var="path" value="/css/modal.css"/>
<link rel="stylesheet" href="${path}"/>
<%-- mainpage --%>
<c:url var="main" value="/MainPage.jsp"/>

</head>
<body>

<!-- Trigger the modal with a button -->

<!-- Modal -->
<div id="myModal2" class="modal left fade" role="dialog">
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
						<a href="#" id=""><img src="image/settings_24.png"></a>
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
				<button class="navbar-toggle" data-toggle="modal" data-target="#myModal2">
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

<!-- 하단 페이지 -->
<div class="container-fluid" style="margin-top:50px; padding:2%;">
		<div class="row">
			<div class="col-sm-3">
				<img src="image/rabbit.png" class="img-circle"/>
			</div>
			<div class="col-sm-3">
				<p><br/><br/><br/>주디<img src="image/settings_24.png"/></p>
				<div>선호지역 신림동 파주</div>
			</div>
			<div class="col-sm-6"></div>
		</div>
</div>

<div class="container-fluid">
	<ul class="nav nav-tabs">
		<li class="active" style="width:33.3%; text-align:center;">
				<a href="#tab1" data-toggle="tab"><b>회원 관리</b></a>
			</li>
		    <li style="width:33.3%; text-align:center;">
		    	<a href="#tab2" data-toggle="tab"><b>신고 처리</b></a>
		    </li>
		    
		    <li style="width:33.3%; text-align:center;">
		    	<a href="#tab3" data-toggle="tab"><b>통계</b></a>
		    </li>
		    
	</ul>

</div>
<div class="tab-content">
		<div class="tab-pane active" id="tab1">
			회원을 관리합니다		
				<div class="form-group">
						<div class="col-sm-2">
							<select class="form-control" id="board_select" style="width:auto;">
								<option>정렬 선택</option>
								<option>아이디-가나다</option>
								<option>이름</option>									  
								<option>별명</option>
							  	<option>권한</option>
							  	<option>등급</option>
							  	<option>포인트</option>
							  	<option>상태</option>
							</select>
						</div>
						<div class="col-sm-2">
							<input type="text" class="form-control"/>
						</div>
				</div>
			
			<div class="container-fluid">
				<table class="table table-hover" id="member_list" style="margin-top:50px;">
				    <thead>
				      <tr>
				      	<th style="width:100px">
				      		<input type="checkbox" name="data5" value="check1" checked/>
							전체선택
						</th>
						
				        <th>회원아이디</th>
				        <th>이름</th>
				        <th>별명</th>
				        <th>권한</th>
				        <th>등급</th>
				        <th>포인트</th>
				        <th>상태</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				      	<td><input type="checkbox" name="data5" value="check2"/></td>
				        <td>john@example.com</td>
				        <td>이름</td>
				        <td>코난</td>
				        <td>일반 사용자</td>
				        <td>꿀벌</td>
				        <td>700</td>
				        <td>활성화</td>
				      </tr>
				      <tr>
				      	<td><input type="checkbox" name="data5" value="check3"/></td>
				        <td>john@example.com</td>
				        <td>이름</td>
				        <td>샘물</td>
				        <td>일반 사용자</td>
				        <td>꿀벌</td>
				        <td>700</td>
				        <td>활성화</td>
				      </tr>
				      <tr>
				      	<td><input type="checkbox" name="data5" value="check4"/></td>
				        <td>john@example.com</td>
				        <td>이름</td>
				        <td>눈썹</td>
				        <td>일반 사용자</td>
				        <td>꿀벌</td>
				        <td>700</td>
				        <td>활성화</td>
				      </tr>
				      <tr>
				      	<td><input type="checkbox" name="data5" value="check5"/></td>
				        <td>john@example.com</td>
				        <td>이름</td>
				        <td>코난</td>
				        <td>일반 사용자</td>
				        <td>꿀벌</td>
				        <td>700</td>
				        <td>활성화</td>
				      </tr>
				      
				    </tbody>
			  </table>
				<div>
					  <div class="col-sm-10"></div>
					  <div class="col-sm-2">등록 삭제</div>
			  	</div>
			  	
			  <div>
			  	<div class="col-sm-4"></div>
			  	<div class="col-sm-4" style="text-align:center;">
				  	<ul class="pagination">
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div>
				<div class="col-sm-4"></div>
			  </div>
			</div>
					
		</div>
		<div class="tab-pane" id="tab2">
			신고를 처리한다	
			
			<div class="form-group">
						<div class="col-sm-2">
							<select class="form-control" id="board_select" style="width:auto;">
								<option>정렬 선택</option>
								<option>아이디 정렬</option>
								<option>유형별 정렬</option>
								<option>신고 분류</option>
								<option>권한</option>
								<option>신고자</option>
								<option>신고 날짜</option>
								<option>현황</option>

							</select>
						</div>
						<div class="col-sm-2">
							<input type="text" class="form-control"/>
						</div>
				</div>
				
			<div class="container-fluid">
				<table class="table table-hover" id="report_list" style="margin-top:50px;">
				    <thead>
				      <tr>
				      	<th style="width:100px">
				      		<input type="checkbox" name="data5" value="check1" checked/>
							전체선택
						</th>
						
				        <th>회원아이디</th>
				        <th>유형</th>
				        <th>신고분류</th>
				        <th>권한</th>
				        <th>신고자</th>
				        <th>신고날짜</th>
				        <th>현황</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				      	<td><input type="checkbox" name="data5" value="check2"/></td>
				        <td>john@example.com</td>
				        <td>댓글</td>
				        <td>부적절한 내용</td>
				        <td>일반 사용자</td>
				        <td>qwe234@naver.com</td>
				        <td>2016.2.12</td>
				        <td>완료</td>
				      </tr>
				      
				      <tr>
				      	<td><input type="checkbox" name="data5" value="check2"/></td>
				        <td>john@example.com</td>
				        <td>댓글</td>
				        <td>부적절한 내용</td>
				        <td>일반 사용자</td>
				        <td>qwe234@naver.com</td>
				        <td>2016.2.12</td>
				        <td>완료</td>
				      </tr>
				      
				      <tr>
				      	<td><input type="checkbox" name="data5" value="check2"/></td>
				        <td>john@example.com</td>
				        <td>댓글</td>
				        <td>부적절한 내용</td>
				        <td>일반 사용자</td>
				        <td>qwe234@naver.com</td>
				        <td>2016.2.12</td>
				        <td>완료</td>
				      </tr>
				      
				      <tr>
				      	<td><input type="checkbox" name="data5" value="check2"/></td>
				        <td>john@example.com</td>
				        <td>댓글</td>
				        <td>부적절한 내용</td>
				        <td>일반 사용자</td>
				        <td>qwe234@naver.com</td>
				        <td>2016.2.12</td>
				        <td>완료</td>
				      </tr>
				      
				      
				    </tbody>
			  </table>
				<div>
					  <div class="col-sm-10"></div>
					  <div class="col-sm-2">등록 삭제</div>
			  	</div>
			  	
			  <div>
			  	<div class="col-sm-4"></div>
			  	<div class="col-sm-4" style="text-align:center;">
				  	<ul class="pagination">
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div>
				<div class="col-sm-4"></div>
			  </div>
			</div>
		</div>
		<div class="tab-pane" id="tab3">
		
			통계를 보여줘요
			<div class="form-group">
				<div class="col-sm-1"></div>
				<div class="col-sm-5" style="border:3px solid #a3a3a3; margin:1%; padding:0px; height:300px">
					<p style="border-bottom:3px solid #a3a3a3; margin:0px; text-align:center">인기 게시글</p>
				</div>
				<div class="col-sm-5" style="border:3px solid #a3a3a3; margin:1%; padding:0px; height:300px">
					<p style="border-bottom:3px solid #a3a3a3; margin:0px; text-align:center">인기 해시태그</p>
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>


	</div>
</body>
</html>
