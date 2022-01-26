<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/community.css?ver=1">
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/main.css?ver=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>AppV</title>
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

    <!-- Community Modal Start-->
     <div class="comm-black-modal">
      <div class="comm-white-modal shadow p-3 mb-5 bg-white rounded">
        <div class="modal-box">
         <form id ="write_frm">
          <div class="comm-writing"><p style="font-family: 'Noto Sans KR', sans-serif;">글쓰기</p></div>
          <div class="comm-writer"><p class="modal-p">작성자</p>
          <input class="comm-input kr-font" type='text' name ="id" value ="${users.id}"readonly="readonly"></div>
          <div style="display:none" name="id">${user.id}</div>
          <div class="comm-option">
            <p class="modal-p kr-font">카테고리</p>
            <select class="modal-select kr-font" name ="category">
              <option value="여행/숙박">여행/숙박</option>
              <option value="음악">음악</option>
              <option value="게임">게임</option>
              <option value="엔터테인먼트">엔터테인먼트</option>
              <option value="자유게시판">자유게시판</option>
            </select>
          </div>
          <div class="comm-title"><p class="modal-p">제목</p><input class="comm-input" type='text' id= 'title' name='title'></div>
          <div class="comm-content"><p class="modal-p">내용</p><textarea class="modal-area" id='content' name='content'></textarea></div>
          <div class="comm-btn"><button type="button" id="commbtn" class="btn btn-dark">작성하기</button></div>
           </form>
        </div>
      </div>
    </div>
    <!-- Community Modal End-->
	 <!-- board detail Modal start HERE-->
   <div class="board-detail-blackmodal">
      <div class="board-detail-whitemodal shadow p-3 mb-5 bg-white rounded">
        <div class="modal-box">
          <div class="detail-topbox" >
            <div><p class="detail md"></p></div>
            <div><p class="detail-title md"></p></div>
            <div><p class="detail md"></p></div>
            <div class="detail-date md"></div>
          </div>
          <div class="detail-botbox">
            <p class="detail md"></p>
            <p class="detail md" style="display:none" id ="detailBidx"></p>
          </div>
          <div class="detail-btnbox">
            <div><button class="detail-btn btn" id ="boardDelete">  <i class="fas fa-trash-alt"></i></button></div>
            <div><button class="detail-btn btn" id ="boardModify">  <i class="fas fa-recycle"></i></button></div>
          </div>
        </div>
      </div>
    </div>
    <!-- board detail Modal end-->
     <!--modifying Modal start HERE-->
     <div class="modifying-modal-black">
      <div class="modifying-modal-white">
        <form id="modifyFrm">
        <div class="modifying-modal-box">
          <div class="modifying-writing"><p style="font-family: 'Noto Sans KR', sans-serif;">글 수정하기</p></div>
          <div class="modifying-writer"><p class="modifying-modal-p">작성자</p><input class="modifying-input mdc" type='text' value ="${users.id}"readonly="readonly"></div>
          <span class="mdc" id="modiBidx" style="display:none"></span>
          <div class="modifying-option">
            <p class="modifying-modal-p">카테고리</p>
            <select class="modifying-modal-select" name= "modicate" id="modicate">
           	  <option value="여행/숙박">여행/숙박</option>
              <option value="음악">음악</option>
              <option value="게임">게임</option>
              <option value="엔터테인먼트">엔터테인먼트</option>
              <option value="자유게시판">자유게시판</option>
            </select>
          </div>
          <div class="modifying-title"><p class="modifying-modal-p">제목</p><input class="modifying-input mdc" type='text' name='title' id ="modititle"></div>
          <div class="modifying-content"><p class="modifying-modal-p">내용</p><textarea class="modifying-modal-area mdc" name ='content' id="modicontent"></textarea></div>
          <div class="modifying-btn"><button type="button" id="modibtn" class="btn btn-dark">수정하기</button></div>
        </div>
          <form>
      </div>
    </div>
    <!--modifying Modal start-->
    <!-- Navbar Start-->
    <div class="navbar-box row">
      <div class="col-sm-2 logobox"><a href="main"><img class="logo-img" src="./resources/logo/appv.png" ></a></div>
      <div class="col-sm-5">
        <nav class="navbar navbar-light bg-white">
          <div><form class="form-inline" action="search.do">
            <button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
            <input class="search-input mr-sm-2" type="search" placeholder="Search" aria-label="Search" name ="appname" id="appSearch" autocomplete="off">
          </form></div>
        </nav>
      </div>
      <div class="col-sm-1 loginbox"></div>
      <c:choose>
        	<c:when test="${empty users}">
        		<div style="text-align: center; margin-left:-20px;" class="col-sm-2 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><i class="fas fa-sign-in-alt"></i>Login</p></div>
      		</c:when>
      		<c:otherwise>
       			<div class="col-sm-3 loginbox solo"><p class="welcomeBoard kr-font" style="font-size:20px;">${users.nick}님 반갑습니다</p></div>
       		</c:otherwise>
       		</c:choose>	
       <c:choose>
      	<c:when  test ="${!empty users.nick}">
      		<div style='margin-left:30px; margin-top:23px; display:block' ><a class="nav-font-en" href="logout.do"><i class="fas fa-sign-out-alt"></i>>LOGOUT</a></div>
      		<div style="text-align: right; display:none" class="col-sm-1 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><i class="fas fa-users-cog"></i>Register</a></div>
      	</c:when>
      	<c:otherwise>
      	      <div style='margin-left:30px; margin-top:23px; display:none' ><a class="nav-font-en" href="logout.do"><i class="fas fa-sign-out-alt"></i>LOGOUT</a></div>
      		  <div style="text-align: right; display:block;" class="col-sm-1 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><i class="fas fa-users-cog"></i>Register</a></div>
      	</c:otherwise>
      </c:choose>
    </div>
  </nav>
    <!-- Navbar end-->
    <!-- Side Bar Start-->
    <div class="main-box" id="main-box">
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
            <li class="sidebar-personal-list" ><i class="icon fas fa-not-equal"></i><a class="list-a kr-font" href="compare.do">유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a kr-font" href="community.do?category=category0">커뮤니티</a></li>
            <li class="sidebar-personal-list"><i class="icon far fa-comment-alt"></i><a class="list-a kr-font writing">글 작성</a></li>
           </ul>
           
           <div class='myFavorite-box kr-font'><div class="kr-font" style="color:white;"><span>즐겨찾기<span><button class="detail-btn2" style="border:none; background:none;"><i class="fas fa-trash-alt" style="color:white;"></i></button></div>
           	<div class='myFavorite-inner' id= "myFavorite">
           	 </div>
           </div>
          <!-- Side Bar end--> 
        </div>
        <div class="main-content-box col-sm-10 row">
          <div class="community-left-box">
            <div class="left-inner-box shadow p-3 mb-5 bg-white rounded">
              <div class="article-navbox">
                <ul class="article-navbox-ul row nav-font-en kr-font" id="comuCate">
                  <li class="col-sm-2 cate" value=0>전체 토픽</li>
                  <li class="col-sm-2 cate" value=1>여행/숙박</li>
                  <li class="col-sm-2 cate" value=2>음악</li>
                  <li class="col-sm-2 cate" value=3>게임</li>
                  <li class="col-sm-2 cate" value=4>엔터테인먼트</li>
                  <li class="col-sm-2 cate" value=5>자유게시판</li>
                </ul>
              </div>
              
              <div class="article-box">
               <c:forEach items="${boardlist}" var="list">          
                <div class="article-list kr-font">
                  <span class="article kr-font" style ="pointer-events: none;">${list.category}</span>
                  <a><h5 class="article kr-font" data-value="${list.bidx}">${list.title}</h5></a>
                  <div>
                    <a><p class="article kr-font" id="test" data-value="${list.bidx}">${list.content}</p></a>
                  </div>
                  <div>
                    <span class="article kr-font" style ="pointer-events: none;" id ="list_id">${list.id}</span>
                  </div>
                </div>
               </c:forEach>
              
            </div>
          </div>
        </div>
      </div>
        
    </div>
</body>




    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/catescroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bookmark.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/community.js"></script>
    
  </body>
</html>
