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
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/main.css?ver=1">
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
        <div class="col-sm-2 logobox"><img class="logo-img" src='../assets/LOGO2.png'></a></div>
        <div class="col-sm-5">
          <nav class="navbar navbar-light bg-white">
            <form class="form-inline">
              <button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
              <input class="search-input mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            </form>
          </nav>
        </div>
        <div class="col-sm-1 loginbox"></div>
        <c:choose>
        	<c:when test="${empty users}">
        		<div style="text-align: right;" class="col-sm-1 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><button type="button" class="top-icon-btn btn btn-secondary">Login</button></p></div>
      		</c:when>
      		<c:otherwise>
       			<div class="col-sm-1 loginbox solo"><p>${users.nick}님 반갑습니다</p></div>
       		</c:otherwise>
       		</c:choose>	
      <div style="text-align: right;" class="col-sm-2 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><button type="button" class="top-icon-btn btn btn-dark" >Register</button></a></div>
    </div>
    </nav>
    <!-- Navbar end-->
    <!-- Side Bar Start-->
    <div class="main-box">
      <div class="main-sub row">
        <div class="sidebar col-sm-2" id="List">
          <ul class="sidebar-list">
            <li class="sidebar-personal-list" ><i class="icon fas fa-adjust"></i><a class="list-a category font-kr" href="#">카테고리
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">category1</a>
                <a href="#" class="list-group-item list-group-item-action">category2</a>
                <a href="#" class="list-group-item list-group-item-action">category3</a>
              </div>
            </a></li>
            <li class="sidebar-personal-list" ><i class="icon fas fa-not-equal"></i><a class="list-a font-kr" href="#">유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a font-kr" href="community.do">커뮤니티</a></li>
          </ul>
          <!-- Side Bar end--> 
        </div>
        <div class="main-content-box col-sm-10">
          <!-- Slide Carousel Start-->
          <div class="main-content-carousel shadow p-3 mb-5 bg-white rounded">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item item1 active">
                  <img class="d-block w-100">
                </div>
                <div class="carousel-item item2">
                  <img class="d-block w-100">
                </div>
                <div class="carousel-item item3">
                  <img class="d-block w-100">
                </div>
              </div>
             <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </button>
            </div>
          </div>
          <!-- Slide Carousel end-->
          <div class="main-content-lower row shadow p-3 mb-5 bg-white rounded">
            <div class="lower-left col-md-4">
              <div class="lower-content">
                <p class="font-kr">전체 순위</p>
              </div>
            </div>
            <div class="lower-right col-md-4">
              <div class="lower-content">
                <p class="font-kr">무료 앱 순위</p>
              </div>
            </div>
            <div class="lower-right col-md-4">
              <div class="lower-content">
                <p class="font-kr">유료 앱 순위</p>
              </div>
            </div>
          </div>
        </div>
      </div>  
    </div>

    

    <!-- Optional JavaScript; choose one of the two! -->
    
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->.
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script>
      var Modal = new Vue({
        el : '.Modal',
        data : {
          modalOpen : true,
        }
      })
      
    </script>
    
    <script>
      $('.category').on('click',function(){
        $('.list-group').slideToggle();
      })
      
// 로그인 확인 및 설정 
      $(document).on('click','#btn_Login',function(){
		if($('#id').val()!="" && $('#pwd').val()!=""){
			let loginData=$("#frm").serialize();
			$.ajax({ 
				url:"login.do",
				type: "post",
				data : loginData,
				success : function(YN){
					console.log(YN)
					if(YN=="y"){
						location.href="main"
					}else{
						alert("아이디와 비밀번호를 확인해 주세요");
					}
				},
				error : function(){
					alert("아이디와 비밀번호를 확인해 주세요");
				}
			});
			
		}else{
			
			if($('#id').val()==""){
				alert("아이디를 입력해 주세요")
			}
			
			if($('#pwd').val()==""){
				alert("비밀번호를 입력해 주세요")
			}
		}
	});
    </script>

    
    
  </body>
</html>