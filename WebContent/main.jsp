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

<%-- css 파일 추가 --%>
<%-- modal css --%>
<c:url var="path" value="/css/modal.css"/>
<link rel="stylesheet" href="${path}"/>
<%-- mainpage --%>
<c:url var="main" value="/MainPage.jsp"/>

<c:url var="read" value="/board_read.jsp"/>

<style>

	.carousel {
		  max-height: 300px;
		  overflow: hidden;
		
		  .item img {
		    width: 100%;
		    height: auto;
	  }
	}
	
	html, body{ overflow:auto;}

	ul {
		height:100% !important;
	}
	
	a:link{
		text-decoration:none;
	}	
	a:visited{
		text-decoration:none;
	}
	a:hover{
		text-decoration:none;
	}
	
/* nav */
	nav:hover{
		backgound-color : yellow;
	}
</style>

<script>


$(function(){

	// 게시판을 클릭 했는지 확인 여부를 위한 변수
	var click = 0;
	
	// 클릭한 게시판은 마우스오버를 적용하지 않는다
    $("#nav > li > a").hover(function(){	// 들어올 때
    	var idx = $(this).data("idx");
	    	$(this).css("background-color", "#ffc000");
	        $(this).css("color", "white");

        }, 
        function(){		// 나갈 때
        	var idx = $(this).data("idx");
        	if(click != idx){
	        	$(this).css("background-color", "white");
			    $(this).css("color", "black");
        	}
    });
    
	// 새로운 게시판 클릭 시 이전에 클릭한 게시판에 적용된 배경색 해제 후 클릭한 게시판 배경색 변경
    $("#nav > li > a").click(function(){
    		var idx = $(this).data("idx");
    		
	    	$("#nav > li > a").css("background-color", "white");
	    	$("#nav > li > a").css("color", "black");

	    	$(this).css("background-color", "#ffc000");
	        $(this).css("color", "white");
			
	        click = idx;
    });
    
    
    
    // 게시판을 눌렀을 때 frame 아이디를 가진 div에 해당 게시판 jsp를 불러온다.
    $("#nav > li > a").click(function(){
    	var idx = $(this).data("idx");
    	if(idx == 1){
			$("#frame").load("board/board_tip.jsp");
    	} else if(idx == 2){
    		$("#frame").load("board/board_talk.jsp");
    	} else if(idx == 3){
    		$("#frame").load("board/board_answer.jsp");
    	} else if(idx == 4){
    		$("#frame").load("board/board_trade.jsp");
    	} else if(idx == 5){
    		$("#frame").load("board/board_ad.jsp");
    	} else if(idx == 6){
    		$("#frame").load("board/board_notice_event.jsp");
    	}
	});
    
    
    // 마이페이지, 관리자 페이지	- modal
    $("#mypage").click(function(){
   		$("#pageload").load("manage/AdminPage.jsp");
   	});
    
    // 글쓰기 버튼 눌렀을 때 글쓰는 화면으로...	-modal
    $("#write").click(function(){
   		$("#frame").load("board/WriteBoard.jsp");
   	});

    // 마이페이지, 관리자 페이지	- 큰화면
    $("#mypage2").click(function(){
   		$("#pageload").load("manage/AdminPage.jsp");
   	});
    
    // 글쓰기 버튼 눌렀을 때 글쓰는 화면으로...	-큰화면
    $("#write2").click(function(){
   		$("#frame").load("board/WriteBoard.jsp");
   	});
    
 	// 톱니바퀴 버튼 눌렀을 때 글쓰는 화면으로...	-큰화면
    $("#user_modify1").click(function(){
   		$("#pageload").load("user_modify.jsp");
   	});
 	
 	// 톱니바퀴 버튼 눌렀을 때 글쓰는 화면으로...	-큰화면
    $("#user_modify2").click(function(){

   		$("#pageload").load("user_modify.jsp");
   	});
 	
	$(window).scroll(function(){
		
		if($(window).scrollTop() == $(document).height() - $(window).height()) {
			alert("끝!");
		}
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
					<li style="margin:10px;"><a data-idx="1" href="board_category.bee?board_main=tip&board_sub=nothing" style="font-size:150%; color:black"><img src="image/honey_32.png" style="padding-right:50px;"><b>TIP</b></a></li>
					<li style="margin:10px;"><a data-idx="2" href="board_category.bee?board_main=chat&board_sub=nothing" style="font-size:130%; color:black"><img src="image/chat_32.png" style="padding-right:50px;"><b>수다&잡담</b></a></li>
					<li style="margin:10px;"><a data-idx="3" href="board_category.bee?board_main=QnA&board_sub=nothing" style="font-size:130%; color:black"><img src="image/question_32.png" style="padding-right:50px;"><b>묻고 답하기</b></a></li>
					<li style="margin:10px;"><a data-idx="4" href="board_category.bee?board_main=trade&board_sub=nothing" style="font-size:130%; color:black"><img src="image/box_32.png" style="padding-right:50px;"><b>지역거래</b></a></li>
					<li style="margin:10px;"><a data-idx="5" href="board_category.bee?board_main=ads&board_sub=nothing" style="font-size:130%; color:black"><img src="image/ads_32.png" style="padding-right:50px;"><b>광고</b></a></li>
					<li style="margin:10px;"><a data-idx="6" href="board_category.bee?board_main=notice&board_sub=nothing" style="font-size:130%; color:black"><img src="image/notice_32.png" style="padding-right:50px;"><b>공지&이벤트</b></a></li>
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
				<!-- 여기 서블릿 호출 .bee 하고 파라미터로 page_num 보내주기 -->
				<c:url var="main_board" value="/main.bee"/>
				<a href="${main_board}"><img style="text-align:top" src="image/gguldromeda_nav.png"></a>
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
<div id="pageload">
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
					<li style="margin:10px;"><a data-idx="1" href="board_category.bee?board_main=tip" style="font-size:150%; color:black"><img src="image/honey_32.png" style="padding-right:50px;"><b>TIP</b></a></li>
					<li style="margin:10px;"><a data-idx="2" href="board_category.bee?board_main=chat" style="font-size:130%; color:black"><img src="image/chat_32.png" style="padding-right:50px;"><b>수다&잡담</b></a></li>
					<li style="margin:10px;"><a data-idx="3" href="board_category.bee?board_main=QnA" style="font-size:130%; color:black"><img src="image/question_32.png" style="padding-right:50px;"><b>묻고 답하기</b></a></li>
					<li style="margin:10px;"><a data-idx="4" href="board_category.bee?board_main=trade" style="font-size:130%; color:black"><img src="image/box_32.png" style="padding-right:50px;"><b>지역거래</b></a></li>
					<li style="margin:10px;"><a data-idx="5" href="board_category.bee?board_main=ads" style="font-size:130%; color:black"><img src="image/ads_32.png" style="padding-right:50px;"><b>광고</b></a></li>
					<li style="margin:10px;"><a data-idx="6" href="board_category.bee?board_main=notice" style="font-size:130%; color:black"><img src="image/notice_32.png" style="padding-right:50px;"><b>공지&이벤트</b></a></li>
				</ul>	
				
			</div>
			</div>
			
		</div>
		
		<!-- 게시판 불러오는 부분 -->
		<div class="col-sm-9" style="margin-top:50px; padding:0px; height:100%; background-color:white; border:20px solid #F1F1F2" id="frame">
			<div class="container-fluid" style="padding:0px; margin:0px">

				<form class="form-horizontal" role="form">
				<div class="form-group" style="margin-bottom:0px; border:5px solid #F1F1F2">
					<div class="col-sm-9" style="padding-right:0px; padding-left:0px">
						<div id="c1" class="carousel slide" data-ride="carousel" style="border:6px solid #F1F1F2; height:300px !important">
					     	 <%-- 슬라이드될 이미지 배치 --%>

					     	 	<div class="carousel-inner" role="listbox" style="max-height:300px !important; margin-bottom:0px">
						     	    <div class="item active">
						     	     	<a href="http://google.com" class="thumbnail" style="margin-bottom:0px; padding:0px">				   
						                <img class="img-responsive" src="image/1.png" style="width:100%"/>
					                	</a>				     	     	
						     	    </div>
						     	    <div class="item">
						     	     	<a href="http://google.com" class="thumbnail" style="margin-bottom:0px; padding:0px">				   
						                <img class="img-responsive" src="image/2.jpg" style="width:100%"/>
					                	</a>
						     	    </div>
						     	    <div class="item">
						     	     	<a href="http://google.com" class="thumbnail" style="margin-bottom:0px; padding:0px">				   
						                <img src="image/1.png" style="width:100%"/>
					                	</a>				     	    
						     	    </div>
						     	    <div class="item">
						     	     	<a href="http://google.com" class="thumbnail" style="margin-bottom:0px; padding:0px">				   
						                <img src="image/2.jpg" style="width:100%"/>
					                	</a>				     	   	
						     	    </div>
						     	    <%-- indicator --%>
						    	    <ol class="carousel-indicators">
							     	    <li data-target="#c1" data-slide-to="0"
							     	    class="active"></li>
							         	<li data-target="#c1" data-slide-to="1"></li>
							        	<li data-target="#c1" data-slide-to="2"></li>
							            <li data-target="#c1" data-slide-to="3"></li>
						     		</ol>
					     	</div>
	     
						</div>
					</div>
					<div class="col-sm-3" style="border:5px solid #F1F1F2; height:300px" >
						<h5>BEST</h5>
						<hr/>
						<a>1. 이이이이이이이이이이이</a>
						<br/>
						<br/>
						<a>2. 이이이이이이이이이이이</a>
						<br/>
						<br/>
						<a>3. 이이이이이이이이이이이</a>
						<br/>
						<br/>
						<a>4. 이이이이이이이이이이얍</a>
						<br/>
						<br/>
						<a>5. 이이이이이이이이이이이</a>	
						<br/>
						<br/>
						<a>6. 이이이이이이이이이이이</a>	
						<br/>
						<br/>
					</div>
				</div>
			</form>
		</div>
	
				<div class="form-group">
					<c:forEach var="board_bean" items="${requestScope.board_list}">
					<div class="col-sm-3 col-md-3" style="border:5px solid #F1F1F2;">
						<div style="margin-top:15px">
						<a href="${read}" class="thumbnail">	
								<!-- board_img_main 으로 띄우기!! -->			   
				                <img src="image/1.png" width="200" height="100"/>
			            </a>
			            </div>
			            <div class="form-group" style="padding-left:20px; padding-right:20px">
				            	<div align="left">
				            	<!-- bean에서 제목가져옴 -->	
				            	<p>${board_bean.board_subject}</p>
				            	</div>
							</div>
							<div class="form-group" style="padding-right:15px">
								<div align="right">
								<!-- bean에서 사용자 닉네임 가져오기 -->
								<p>${board_bean.user_nick}</p>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12" align="right">
									<c:forEach var="i" begin="0" end="2">
										<!-- bean에서 해시태그 가져오기 -->
										<!-- href에 해당 해시태그 검색화면을 넘어가도록 주소값주기 -->
										<a># ${board_bean.board_hash[i]}</a>
									</c:forEach>
								</div>
								<div class="col-sm-12" align="right">
								 	<input type="image" src="image/heart_24.png" width="15" height="15"/>
								 	<!-- bean에서 좋아요 수 구하기 -->
								 	<h11>${board_bean.board_like}</h11>
								 	<input type="image" src="image/interface.png" width="15" height="15"/>
								 	<!-- bean에서 댓글 수 구하기 -->
								 	<h11>${board_bean.comment_cnt}</h11>		
								</div>
							</div>
					</div>
					</c:forEach>
					

					
				</div>
		</div>
</div>	

</body>
</html>