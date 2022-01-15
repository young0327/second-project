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
    <link rel='stylesheet' href='../css/main.css'>
    <link rel='stylesheet' href='../css/comparing.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>Hello, world!</title>
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Merriweather&family=Noto+Sans+KR&family=Nunito&display=swap');
      </style>
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
      <div style="text-align: right;" class="col-sm-1 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><button type="button" class="top-icon-btn btn btn-secondary" style="font-family: 'Nunito', sans-serif;">Login</button></p></div>
      <div style="text-align: right;" class="col-sm-2 loginbox"><a class="nav-font-en" href="register.html"><button type="button" class="top-icon-btn btn btn-dark">Register</button></a></div>
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
            <li class="sidebar-personal-list" ><i class="icon fas fa-not-equal"></i><a class="list-a font-kr" href="Comparing.html">유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a font-kr" href="Community.html">커뮤니티</a></li>
          </ul>
          <!-- Side Bar end--> 
        </div>
        <div class="main-content-box col-sm-10">
          <div class="compare-background row ">
            <div class="compare-box">
              <div class="compare-search-box">
                <div class="search-inner-box">
                  <input type="search"><span>  </span><i class="fas fa-search" style="font-size: 24px;"></i>
                </div>
              </div>
              <div class="compare-search-box" style="width: 15%;">22</div>
              <div class="compare-search-box">
                <div class="search-inner-box">
                  <input type="search"><span>  </span><i class="fas fa-search" style="font-size: 24px;"></i>
                </div>
              </div>
              <div class="compare-icon-box">
                <div class="icon-inner-box">
                  <div class="icon-img"><img src="../assets/kakao.png"></div>
                  <div><p>카카오톡</p></div>
                </div>
              </div>
              <div class="compare-icon-box" style="width: 15%;">앱 아이콘</div>
              <div class="compare-icon-box">
                <div class="icon-inner-box">
                  <div class="icon-img"><img src="../assets/kakao.png"></div>
                  <div><p>카카오톡</p></div>
                </div>
              </div>
              <div class="compare-rating-box">
                <div class="rating-inner-box">
                  <div class="ratings"><h4>4.3</h4></div>
                </div>
              </div>
              <div class="compare-rating-box" style="width: 15%;">앱 평점</div>
              <div class="compare-rating-box">
                <div class="rating-inner-box">
                  <div class="ratings"><h4>4.5</h4></div>
                </div>
              </div>
              <div class="space"></div>
              <div class="rader-chart-box">
                <div class="rader-inner"><p></p></div>
              </div>
            </div>
          </div>
        </div>





    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
       var Modal = new Vue({
        el : '.Modal',
        data : {
          modalOpen : true,
        }
      })
      $('.category').on('click',function(){
        $('.list-group').slideToggle();
      })
    </script>
  </body>
</html>