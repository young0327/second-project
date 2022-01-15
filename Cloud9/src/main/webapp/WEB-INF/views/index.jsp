<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  </head>
  <body>

    
    <nav class="top-navbar shadow p-3 mb-5 bg-white rounded Modal">
      <!-- Modal Page start-->
      <transition name="fade">
        <div class="black-modal" v-if="modalOpen==false">
          <div class="white-modal ">
            <span class="badge badge-pill badge-dark" @click="modalOpen=true">X</span>
            <div class="modal-id">
              <p class="nav-font-en login-h3">LOGIN</p>
              <i class="fas fa-sign-in-alt" style="width: 40px; color: gray; "></i><input class="modal-input input-id" type="text" placeholder="Type your ID">
            </div>
            <div class="modal-pw">
              <i class="fas fa-lock" style="width: 40px; color: gray;"></i><input class="modal-input input-pw" type="text" placeholder="Type your password"><br>
            </div>
            <button @click="modalOpen=true" class="login-btn nav-font-en" type="submit">LOGIN</button>
            <p class="login-rg nav-font-en" style="text-align: center;"><a class="login-rg" href="register.html">OR REGISTER</a></p>
          </div>
          </div>
        </div>
      <!-- Login Modal Page end-->
    </transition>
    <!-- Navbar Start-->
      <div class="navbar-box row">
        <div class="col-sm-2 logobox"><a href="main.html"><img class="logo-img" src='../assets/LOGO2.png'></a></div>
        <div class="col-sm-5">
          <nav class="navbar navbar-light bg-white">
            <form class="form-inline">
              <button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
              <input class="search-input mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            </form>
          </nav>
        </div>
        <div class="col-sm-1 loginbox"></div>
        <div style="text-align: right;" class="col-sm-1 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><button type="button" class="top-icon-btn btn btn-secondary">Login</button></p></div>
      <div style="text-align: right;" class="col-sm-2 loginbox"><a class="nav-font-en" href="register.html"><button type="button" class="top-icon-btn btn btn-dark">Register</button></a></div>
    </div>
    </nav>
    <!-- Navbar end-->
    <!-- Side Bar Start-->
    <div class="main-box">
      <div class="main-top">
        <div class="top-title-box">
          <div class="title-inner-box"><p class="font-kr">인트로 문구</p></div>
        </div>
      </div>
      <div class="main-bottom">
        <div class="bottom-topbox">
          <i class="fas fa-search"></i><input class="main-input" type="text" placeholder="어플 이름을 입력하세요">
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

    



    <!-- 차트그리기-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js"></script>
    <script src="https://cdn.anychart.com/releases/v8/js/anychart-tag-cloud.min.js"></script>
    <!-- Optional JavaScript; choose one of the two! -->
    <script src="../JavaScript/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->.
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script>
      // 데이터 바인딩 시작
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

    </script>
  </body>
</html>