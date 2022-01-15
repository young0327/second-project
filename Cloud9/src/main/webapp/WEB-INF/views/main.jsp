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
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/index.css?ver=1">
    <title>Cloud Nine</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
      <div class="col-sm-4">
        <nav class="navbar navbar-light bg-white">
          
        </nav>
      </div>
      <div class="col-sm-1 loginbox"></div>
      <c:choose>
        	<c:when test="${empty users}">
        		<div style="text-align: center; margin-left:-20px;" class="col-sm-3 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><i class="fas fa-sign-in-alt"></i>Login</p></div>
      		</c:when>
      		<c:otherwise>
       			<div class="col-sm-3 loginbox solo kr-font"><p class="kr-font"><i class="fas fa-user-alt"></i>${users.nick}님 반갑습니다</p></div>
       		</c:otherwise>
       		</c:choose>	
      
      <c:choose>
      	<c:when  test ="${!empty users.nick}">
      		<div style='margin-left:30px; margin-top:23px; display:block' ><a class="nav-font-en"><button class='top-icon-btn btn btn-dark' id ="logout">LOGOUT</button></a></div>
      		<div style="text-align: right; display:none" class="col-sm-1 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><button type="button" class="top-icon-btn btn btn-dark">Register</button></a></div>
      	</c:when>
      	<c:otherwise>
      	      <div style='margin-left:30px; margin-top:23px; display:none' ><a class="nav-font-en"><button class='top-icon-btn btn btn-dark' id ="logout">LOGOUT</button></a></div>
      	      <div style="text-align: right; display:block" class="col-sm-1 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><button type="button" class="top-icon-btn btn btn-dark">Register</button></a></div>
      	</c:otherwise>
      </c:choose>
    </div>
  </nav>
    <!-- Navbar end-->
    <!-- Side Bar Start-->
    <div class="main-box" style="background-image: url('./resources/img/background.jpg');">
      <div class="main-top">
        <div class="top-title-box">
          <div class="title-inner-box"><p class="font-kr">인트로 문구</p></div>
        </div>
      </div>
      <div class="main-bottom">
        <div class="bottom-topbox">
          <form class="form-inline" style="display:inline-block" action="search.do">
          	<button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
          	<input class="main-input" type="search" placeholder="어플 이름을 입력하세요" aria-label="Search" name ="appname" id="appSearch" autocomplete="off">
          </form>
        </div>
        <div class="bottom-botbox">
          <div class="bot-main-box">
            <div class="bot-main-content">
              <div class="content-go">
                <div class="inner-content-box">
                  <div class="flaticon"><i class="fas fa-edit"></i></div>
                  <p class="main-title-word font-kr">커뮤니티 게시판</p>
                  <a href="#"><div class="direct-go"><p class="font-kr">바로가기  </p></div></a>
                </div>
              </div>
              </div>
            <div class="bot-main-content">
              <div class="content-go">
                <div class="inner-content-box">
                  <div class="flaticon"><i class="fas fa-not-equal"></i></div>
                  <p class="main-title-word font-kr">유사어플 비교하기</p>
                  <a href="#"><div class="direct-go"><p class="font-kr">바로가기  </p></div></a>
                </div>
              </div>
            </div>
            <div class="bot-main-content">
              <div class="content-go">
                <div class="inner-content-box">
                  <div class="flaticon"><i class="fas fa-edit"></i></div>
                  <p class="main-title-word font-kr">커뮤니티 게시판</p>
                  <a href="#"><div class="direct-go"><p class="font-kr">바로가기  </p></div></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>          
 

    

    <!-- Optional JavaScript; choose one of the two! -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->.
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
      
      $("#logout").on("click",function(){
      	$.ajax({
      		url:"logout.do",
      		success:function(){
      			location.reload();
      		},
      		error:function(){}
      	})
      })
      
  
    </script>

    
    
  </body>
</html>