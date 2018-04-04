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
.navbar-toggle{
	padding:0;
	margin:0;
}

</style>
</head>
<body>
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

<div class="container-fluid" style="padding:0px;">
	<div class="sidebar col-sm-3" style="margin:0px; padding:0px;">
	<div class="collapse navbar-collapse st" style="border:1px solid #a3a3a3;">
		 <ul class="nav" style="height:300px;">
			<li><h3>즐겨찾는 이웃</h3>새로고침</li>
			<li><img src="image/springwater.png" class="img-circle" width="30" height="30" style="margin:10px;"/>정샘물</li>
			<li><img src="image/piano.png" class="img-circle" width="30" height="30" style="margin:10px;"/>피아노타일</li>
			<li><img src="image/man.png" class="img-circle" width="30" height="30" style="margin:10px;"/>유부남</li>			 
			<li><img src="image/pool.png" class="img-circle" width="30" height="30" style="margin:10px;"/>풀</li>			 
		 </ul>		  
		 <ul class="nav" style="border-top:1px solid #a3a3a3; height:300px">
		 	<li><h3>오늘의 추천</h3></li>
		 	<li>1</li>
		 	<li>2</li>
		 	<li>3</li>
		 </ul>
	</div>
	</div>

	
	<div class="tabbable col-sm-9">
		<ul class="nav nav-tabs">
			<li class="active" style="width:33.3%; text-align:center;">
				<a href="#tab1" data-toggle="tab"><b>기록</b>
					
				</a>
			</li>
		    <li style="width:33.3%; text-align:center;">
		    	<a href="#tab2" data-toggle="tab"><b>이웃 새글</b></a>
		    </li>
		    
		    <li style="width:33.3%; text-align:center;">
		    	<a href="#tab3" data-toggle="tab"><b>보관함</b></a>
		    </li>
		    
		</ul>
		    
		<div class="tab-content">
			<div class="tab-pane active" id="tab1">
				<div class="span8">
			    	<div class="tabbable tabs-left">
			    	

			        	<ul class="nav nav-pills">
			        		<li class="active" style="width:49.5%; text-align:center;">
			        			<a href="#tab4" data-toggle="tab">내가 쓴 글</a>
			        		</li>
			        		<li style="width:49.5%; text-align:center;">
			        			<a href="#tab5" data-toggle="tab">댓글</a>
			        		</li>
			        	</ul>

			      	 
				        <div class="tab-content" style="height:100%;">
				        	<div class="tab-pane active" id="tab4">
				            	<p>내가 쓴 글</p>
									<div class="container-fluid" style="border:1px solid black; padding:1%; margin:1%;">
										<div class="col-sm-1" align="center" style="background-color:grey; margin-top:4%;">2016.02<br/>29</div>
										<div class="col-sm-2">
											<img src="image/marvel.png" width="100" height="100">
										</div>
										<div class="col-sm-7">
											<p style="margin-bottom:5%;">내가 쓴 글</p>
											<p>글 내용</p>
										</div>
										<div class="col-sm-2">
											<p style="margin-bottom:20%;">
											수정 
											삭제
											</p>
											<p style="margin-top:20%;">
												<img src="image/heart_18.png">27
												<img src="image/interface.png">3
											</p>
										</div>
									</div>
									
									<div class="container-fluid" style="border:1px solid black; padding:1%;  margin:1%;">
										<div class="col-sm-1" align="center" style="background-color:grey; margin-top:4%;">2016.02<br/>29</div>
										<div class="col-sm-2">
											<img src="image/marvel.png" width="100" height="100">
										</div>
										<div class="col-sm-7">
											<p style="margin-bottom:5%;">으아아아ㅓ</p>
											<p>글 내용!</p>
										</div>
										<div class="col-sm-2">
											<p style="margin-bottom:20%;">
											수정 
											삭제
											</p>
											<p style="margin-top:20%;">
												<img src="image/heart_18.png">27
												<img src="image/interface.png">3
											</p>
										</div>
									</div>
									
				          	</div>
				          	<div class="tab-pane" id="tab5">
				            	<p>댓글</p>
				            	
				            	<div class="container-fluid" style="border:1px solid black; padding:1%; margin:1%;">
										<div class="col-sm-1" align="center" style="background-color:grey; margin-top:4%;">2016.02<br/>29</div>
										<div class="col-sm-2">
											<img src="image/bvs.png
											" width="100" height="100">
										</div>
										<div class="col-sm-7">
											<p style="margin-bottom:5%;">댓글 제목 - 작성자</p>
											<p>댓글 내용</p>
										</div>
										<div class="col-sm-2">
											<p style="margin-bottom:20%;">
											수정 
											삭제
											</p>
											<p style="margin-top:20%;">
												<img src="image/heart_18.png">27
												<img src="image/interface.png">3
											</p>
										</div>
									</div>
									
									<div class="container-fluid" style="border:1px solid black; padding:1%;  margin:1%;">
										<div class="col-sm-1" align="center" style="background-color:grey; margin-top:4%;">2016.02<br/>29</div>
										<div class="col-sm-2">
											<img src="image/bvs.png" width="100" height="100">
										</div>
										<div class="col-sm-7">
											<p style="margin-bottom:5%;">댓글입니다 - 정샘물</p>
											<p>컬러풀 라이프</p>
										</div>
										<div class="col-sm-2">
											<p style="margin-bottom:20%;">
											수정 
											삭제
											</p>
											<p style="margin-top:20%;">
												<img src="image/heart_18.png">27
												<img src="image/interface.png">3
											</p>
										</div>
									</div>
				          	</div>
				        </div>
			       	</div>
			     </div>      
			 </div>
			      
			     <div class="tab-pane" id="tab2">
			     	<p>이웃 새글을 보여줍니다</p>   
			     	
			     	<div class="container-fluid" style="border:1px solid black; padding:1%;  margin:1%;">
										<div class="col-sm-1" align="center" style="background-color:grey; margin-top:4%;">2016.02<br/>29</div>
										<div class="col-sm-2">
											<img src="image/piano.png" width="100" height="100">
										</div>
										<div class="col-sm-7">
											<p style="margin-bottom:5%;">이웃의 글! - 피아노타일</p>
											<p>코시코스의 우편마차</p>
										</div>
										<div class="col-sm-2">
											<p style="margin-bottom:20%;">
											수정 
											삭제
											</p>
											<p style="margin-top:20%;">
												<img src="image/heart_18.png">27
												<img src="image/interface.png">3
											</p>
										</div>
									</div>
			     </div>
			      
			     <div class="tab-pane" id="tab3">
			      	<p>보관함</p>
			      	<div class="container-fluid">
			      		<div class="pull-right">
			      			<p>앨범추가 편집</p>
			      		</div>
			      	</div>
			      	
			      	<ul class="nav nav-tabs" style="margin:3%;">
						<li style="width:33.3%; text-align:center;">
							<div>
								<img class="img-thumbnail" src="image/civilwar.png" style="width:200px; height:300px; margin:1%;">
							</div>
							<div>
								시빌워
							</div>
						</li>
					    <li style="width:33.3%; text-align:center;">
					    	<div>
					    		<img class="img-thumbnail" src="image/hulk.png" style="width:200px; height:300px; margin:1%;">
					    	</div>
					    	<div>
								헐크
							</div>
					    </li>
					    
					    <li style="width:33.3%; text-align:center;">
					    	<div>
					    		<img class="img-thumbnail" src="image/poolcable.png" style="width:200px; height:300px; margin:1%;">
					    	</div>
					    	<div>
								데드풀&케이블
							</div>
					    </li>
					</ul>
			      	
			      	<ul class="nav nav-tabs" style="margin:3%;">
						<li style="width:33.3%; text-align:center;">
							<div>
								<img class="img-thumbnail" src="image/civilwar.png" style="width:200px; height:300px; margin:1%;">
							</div>
							<div>
								시빌워
							</div>
						</li>
					    <li style="width:33.3%; text-align:center;">
					    	<div>
					    		<img class="img-thumbnail" src="image/hulk.png" style="width:200px; height:300px; margin:1%;">
					    	</div>
					    	<div>
								헐크
							</div>
					    </li>
					    
					    <li style="width:33.3%; text-align:center;">
					    	<div>
					    		<img class="img-thumbnail" src="image/poolcable.png" style="width:200px; height:300px; margin:1%;">
					    	</div>
					    	<div>
								<p>데드풀&케이블</p>
							</div>
					    </li>
					</ul>

			     </div>
		</div>
	</div>
</div>







</body>
</html>