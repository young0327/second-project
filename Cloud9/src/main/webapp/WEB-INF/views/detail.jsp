<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/main.css?ver=1">
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/detail.css?ver=1">
 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
      #chartdiv{
        width: 100%;
        height: 400px;
      }
      #bang{
        width: 100%;
        height: 400px;
      }
      </style>
  </head>
  <body>
    
    <nav class="top-navbar shadow p-3 mb-5 bg-white rounded Modal">
    
     <!-- Modal Page start-->
      <transition name="fade">
        <div class="black-modal" v-if="modalOpen==false">
          <div class="white-modal ">
            <span class="badge badge-pill badge-dark" @click="modalOpen=true">X</span>
             <form id ='frm'>
            <div class="modal-id">
              <p class="nav-font-en login-h3">LOGIN</p>
              <i class="fas fa-sign-in-alt" style="width: 40px; color: gray; "></i><input class="modal-input input-id" type="text" placeholder="Type your ID" name='id' id = 'id' autocomplete="off">
            </div>
            <div class="modal-pw">
              <i class="fas fa-lock" style="width: 40px; color: gray;"></i><input class="modal-input input-pw" type="password" placeholder="Type your password" name='pwd' id='pwd'><br>
            </div>
            <button @click="modalOpen=true" class="login-btn nav-font-en" type="button" id ="btn_Login">LOGIN</button>
            <p class="login-rg nav-font-en" style="text-align: center; cursor:pointer;" onclick="location.href='register.do'">OR REGISTER</p>
           </form>
          </div>
          </div>
        </div>
      <!-- Login Modal Page end-->
    </transition>
    <!-- Navbar Start-->
    <div class="navbar-box row">
      <div class="col-sm-2 logobox"><a href="main"><img class="logo-img" src="./resources/logo/appv.png"></a></div>
      <div class="col-sm-5">
        <nav class="navbar navbar-light bg-white">
         <form class="form-inline" action="search.do">
            <button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
            <input class="search-input mr-sm-2" type="search" placeholder="Search" aria-label="Search" name ="appname" id="appSearch" autocomplete="off">
          </form>
        </nav>
      </div>
      <div class="col-sm-1 loginbox"></div>
      <c:choose>
        	<c:when test="${empty users}">
        		<div style="text-align: center; margin-left:20px;" class="col-sm-2 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><i class="fas fa-sign-in-alt"></i>Login</p></div>
      		</c:when>
      		<c:otherwise>
       			<div class="col-sm-3 loginbox solo"><p class="kr-font welcomeBoard" style="font-size:20px;">${users.nick}님 반갑습니다</p></div>
       		</c:otherwise>
       		</c:choose>	
      
      <c:choose>
      	<c:when  test ="${!empty users.nick}">
      		<div style='margin-left:30px; margin-top:23px; display:block' ><a class="nav-font-en" href="logout.do"><i class="fas fa-sign-out-alt"></i>LOGOUT</a></div>
      		<div style="text-align: right; display:none" class="col-sm-1 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><i class="fas fa-users-cog"></i>Register</a></div>
      	</c:when>
      	<c:otherwise>
      	      <div style='margin-left:30px; margin-top:23px; display:none' ><a class="nav-font-en" href="logout.do"><i class="fas fa-sign-out-alt"></i>LOGOUT</a></div>
      	      <div style="text-align: right; display:block" class="col-sm-1 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><i class="fas fa-users-cog"></i>Register</a></div>
      	</c:otherwise>
      </c:choose>
    </div>
  </nav>
    <!-- Navbar end-->
    <!-- Side Bar Start-->
    <div class="main-box">
      <div class="main-sub row">
        <div class="sidebar col-sm-2" id="List">
          <ul class="sidebar-list">
            <li class="sidebar-personal-list" ><i class="icon fas fa-home"></i><a class="list-a kr-font" href="main">홈 화면
            <li class="sidebar-personal-list" ><i class="icon fas fa-adjust"></i><a class="list-a category kr-font" href="#">카테고리
              <div class="list-group">
                <a href="category.do?M" class="list-group-item list-group-item-action">음악</a>
                <a href="category.do?P" class="list-group-item list-group-item-action">사진/비디오</a>
                <a href="category.do?H" class="list-group-item list-group-item-action">여행</a>
              </div>
            </a></li>
            <li class="sidebar-personal-list"><i class="icon fas fa-not-equal"></i><a class="list-a kr-font" href="compare.do">유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a kr-font" href="community.do?category=category0">커뮤니티</a></li>
          </ul>
          <div class='myFavorite-box kr-font'><div class="kr-font" style="color:white;"><span>즐겨찾기<span><button class="detail-btn2" style="border:none; background:none;"><i class="fas fa-trash-alt" style="color:white;"></i></button></div>
           	 <div class='myFavorite-inner' id= "myFavorite">
           	 </div>
           </div>
          <!-- Side Bar end--> 
        </div>
        <!-- main-top-box-->
        <div class="main-content-box col-sm-10">
          <div class="main-content-carousel shadow p-3 mb-5 bg-white rounded">
            <div class="detail-top-box row">
              <div class="line detailtop-icon detailtop col-md-3">
                <div class="iconbox"><img src="${appinfo[0].appicon}"></div>
                <span id="appid"style="display:none">${appinfo[0].appid}</span>
              </div>
              <div class="line detailtop-name row detailtop col-md-7">
                <div class="namebox box_udline">
                  <h4 class="kr-font" id ="appname">${appinfo[0].appname}</h4><span class='kr-font'>${appinfo[0].appcompany}</span>
                  <p class="kr-font">한줄요약이 들어가는 곳입니다</p>
                  <h2><i class="fas fa-star" style="font-size:24px"></i>  ${appinfo[0].apprating}</h2>
                <div class="box">
                    <div class="content kr-font">
                    </div>
                </div>
                </div>
              </div>
              <div class="detailtop-like detailtop col-md-2">
                <div class="line likebox">
                  <div class="likebtn"><i class="fas fa-heart"></i></div>
                  <div class="likeWord">Like</div>
                  <c:choose>
                  <c:when test="${empty appinfo[0].appprice}">
                  <div class="kr-font">무료</div>
                  </c:when>
                  <c:otherwise>
                  <div class="kr-font">${appinfo[0].appprice}</div>
                  </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
            <div class="detail-top-imgbox">
              <ul class="row imgbox-ul">
        		 <li class="col-sm-3"><img src="${appimg[0].appimg1}"></li>
	             <c:if test="${appimg[0].appimg2!='None'}">
	             <li class="col-sm-3"><img src="${appimg[0].appimg2}"></li>
	             </c:if>
	              <c:if test="${appimg[0].appimg3!='None'}">
	             <li class="col-sm-3"><img src="${appimg[0].appimg3}"></li>
	             </c:if>
	             <c:if test="${appimg[0].appimg4!='None'}">
	             <li class="col-sm-3"><img src="${appimg[0].appimg4}"></li>
	             </c:if>
              </ul>
             </div>
	
            <div class="detail-mid-box">
              <div class="mid-list-box">
                <ul class="mid-list-box-div row kr-font">
                  <li class="col-md-2"></li>
                  <li class="mid-list-box-list col-md-2">어플 정보</li>
                  <li class="col-md-1"></li>
                  <li class="mid-list-box-list col-md-2" id= "detailBtn2">리뷰분석</li>
                  <li class="col-md-1"></li>
                  <li class="mid-list-box-list col-md-2" id="detailBtn3">워드클라우드</li>
                  <li class="col-md-1"></li>
                </ul>
              </div>
               </div>
              <div class="tab-box">
                <div class="tab-inner-box">
                  <div class="tab-content-box tab-content-left">
                  ${appinfo[0].appinfo}
                  </div>
                  <div class="tab-content-box tab-content-right" id ="reviewbox">
                    
                  </div>
                </div>
              </div>
              <div class="tab-box">
                <div class="analy-top">
                	<div class='analy-inner analy-inner-left'><p class='kr-font' style="font-size:20px;">평점	분석</p>
                		<div class='rating-inner'></div>
                		<div class='rating-inner rating-right'>
                			<div class='point kr-font' style="padding-left:80px;">
                				<span id="ui-word-rate" class="ui-word starPoint"></span>점
                			</div>
                			<div class='point word kr-font'>
                				<p>
               	  				<select style="border:none; background:#eee; border-radius:20px;" id="monthSelect">
               	  	  			<option value="1">1개월</option>
               	  	  			<option value="3">3개월</option>
               	  	 			<option value="6">6개월</option>
               	  				</select>동안<br><span id="ui-word-title" class="ui-word">${appinfo[0].appname}</span><br>의 평점</p>
                			</div>
                		</div>
                	</div>
                	<div class='analy-inner analy-inner-right'><p class='kr-font' style="font-size:20px;">전체평점분포</p>
                		<div class="doughnut-box"width="500" height="500">
               	  	<canvas id="doughnut-chart"></canvas>
               	  </div>
                	</div>
                </div>
                <div class="analy-bot">
                	<div class='bot-analy'>
                		<div class='kr-font' style="font-size:20px;"><p>감성분석 결과</p></div>
                  		<div class="gauge-box" style="width:100%; height:100%;">
                    	<div id="chartdiv"></div>
                  		</div>
                	</div>
                	<div class='analy-inner analy-inner-left'><p class='kr-font' style="font-size:20px;"></p>
                		<div class='rating-inner'></div>
                		<div class='rating-inner rating-right'>
                			<div class='point kr-font' style="padding-left:80px;">
                				<span id="emotion-word-rate" class="ui-word starPoint"></span>%
                			</div>
                			<div class='point word kr-font'>
                				<p>
                				<span id="emotion-word-title" class="ui-word">${appinfo[0].appname}</span><br>
                				<span>사용한 사람들이</span>
               	  				<select style="border:none; background:#eee; border-radius:20px;" id="emotionSelect">
               	  	  			<option value="1">좋음</option>
               	  	 			<option value="0">나쁨</option>
               	  				</select><br>감정을 느꼈습니다</p>
                			</div>
                		</div>
                	</div>
                </div>
                <div class='bottom-review-box'>
                </div>
                </div>
              </div>
              <div class="tab-box">
                <div class='wordCloud-box'>
                	<div class='wordCloud-inner-box'>
                		<div class='wordCloud-inner'>
                			<div class="chart-area"> 
                				<div id="wordCloud">
                				</div>
                				<div id="bang" style="width: 100%; height:800px;"></div>
                			 </div>
                		</div>
                	</div> 
                </div>
              </div>
              <div class="tab-box">
                <p>fourth</p>
              </div>
            </div>
          </div>
          <!-- main-top-box-end -->

          <!-- <div class="main-content-lower row shadow p-3 mb-5 bg-white rounded">
            <div class="img-content-box">
              <ul class="img-list-box row">
                
              </ul>

            </div>
          </div> -->
        </div>
        
        
     <script type="text/javascript">
    let apppoint1 = ${appinfo[0].apppoint1}
    let apppoint2 = ${appinfo[0].apppoint2}
    let apppoint3 = ${appinfo[0].apppoint3}
    let apppoint4 = ${appinfo[0].apppoint4}
    let apppoint5 = ${appinfo[0].apppoint5}
    let appvalue = ${appinfo[0].apppn}
    let appid = ${appinfo[0].appid}
	let apppn = ${appinfo[0].apppn}
	 let emo = ${appinfo[0].apppn};
    </script>
        
        
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/radar.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/wc.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/catescroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/detail.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bookmark.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/word.js"></script>
 	
  </body>
</html>