<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/main.css?ver=1">
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/category.css?ver=1">
    <title>Cloud Nine</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        		<div style="text-align: center; margin-left:-20px;" class="col-sm-2 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><i class="fas fa-sign-in-alt"></i>Login</p></div>
      		</c:when>
      		<c:otherwise>
       			<div class="col-sm-3 loginbox solo kr-font"><p class="font-kr" style="font-size:20px;">${users.nick}님 반갑습니다</p></div>
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
            <li class="sidebar-personal-list" ><i class="icon fas fa-adjust"></i><a class="list-a category font-kr" href="#">카테고리
              <div class="list-group">
                <a href="category.do?M" class="list-group-item list-group-item-action">음악</a>
                <a href="category.do?P" class="list-group-item list-group-item-action">사진/비디오</a>
                <a href="category.do?H" class="list-group-item list-group-item-action">여행</a>
              </div>
            </a></li>
            <li class="sidebar-personal-list"><i class="icon fas fa-not-equal"></i><a class="list-a font-kr" href="compare.do">유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a font-kr" href="community.do?category=category0">커뮤니티</a></li>
          </ul>
          <div class='myFavorite-box kr-font'><div class="kr-font" style="color:white;"><span>즐겨찾기<span><button class="detail-btn2" style="border:none; background:none;"><i class="fas fa-trash-alt" style="color:white;"></i></button></div>
           		<div class='myFavorite-inner' id= "myFavorite">
           	 </div>
           </div>
          <!-- Side Bar end--> 
        </div>
        <div class="main-content-box col-sm-10 row">
          <!-- Slide Carousel Start-->
          <div class="main-content-carousel shadow p-3 mb-5 bg-white rounded">
            	<c:choose>
            	<c:when test="${cateList[0].appcate eq 'MF'}">
            		 <div class="kr-font result-alert"><p><span style="font-size: 32px; color: rgb(23, 69, 79); font-weight: 700;">음악</span> 카테고리</p></div>
            	</c:when>
            	<c:when test="${cateList[0].appcate eq 'HF'}">
    		         <div class="kr-font result-alert"><p><span style="font-size: 32px; color: rgb(23, 69, 79); font-weight: 700;">여행</span> 카테고리</p></div>
            	</c:when>
            	<c:when test="${cateList[0].appcate eq 'PF'}">
            		 <div class="kr-font result-alert"><p><span style="font-size: 32px; color: rgb(23, 69, 79); font-weight: 700;">사진/비디오</span> 카테고리</p></div>
            	</c:when>
            	</c:choose>
           
            <div class="categoryBox">
            <c:forEach items="${cateList}" var="cateList">
            <div class="result-box row">
              <div class="app-icon-img col-md-3"><img src=${cateList.appicon}></div>
              <div class="kr-font app-content-box col-md-9">
                <h5 class="kr-font"><a href="detail.do?appid=${cateList.appid}" style="color:black;">${cateList.appname}</a></h5>
                <p class="kr-font" style="font-size: 23px;">${cateList.apprating}
                <span class="applicationid" style="display:none">${cateList.appid}</span>
                <c:choose>
	                <c:when test="${empty cateList.appprice}">
	               <span style="font-size: 15px;">&nbsp&nbsp&nbsp 무료</span>
	                </c:when>
	                <c:otherwise>
	                <span class="hashtag"></span>
	                <span style="font-size: 15px;">&nbsp&nbsp&nbsp ${cateList.appprice}원</span>
	                </c:otherwise>
				</c:choose>
               </p><p class="word" style="margin-left: 500px; margin-top: -60px;">${cateList.appcompany}</p>
                </div>
            </div>
            </c:forEach>
            </div>
          </div>
        </div>
      </div>  
    </div>
	
    <script>
   
  	let payCate ='<c:out value='${cateList[0].appcate}'/>'
 	let appids = '<c:out value='${fn:length(cateList)}'/>'
  	let applist=[]
 	
 	for(let i =0; i<appids; i++){
 		
 		
 		applist.push('<c:out value='${cateList[i].appid}'/>')
 	}
 	console.log(applist)
    </script>

    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bookmark.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/catescroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/cateprice.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/hashtag.js"></script>
     
  </body>
</html>