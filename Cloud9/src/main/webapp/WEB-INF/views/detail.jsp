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
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/main.css?ver=1">
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/detail.css?ver=1">
 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>Hello, world!</title>
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
  </nav><!--end-->
    <!-- Side Bar Start-->
    <div class="main-box">
      <div class="main-sub row">
        <div class="sidebar col-sm-2" id="List">
          <ul class="sidebar-list">
            <li class="sidebar-personal-list" ><i class="icon fas fa-adjust"></i><a class="list-a category" href="#">카테고리
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">category1</a>
                <a href="#" class="list-group-item list-group-item-action">category2</a>
                <a href="#" class="list-group-item list-group-item-action">category3</a>
              </div>
            </a></li>
            <li class="sidebar-personal-list" ><i class="icon fas fa-not-equal"></i><a class="list-a" href="Comparing.html">유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a" href="Community.html">커뮤니티</a></li>
           </ul>
          <!-- Side Bar end--> 
        </div>
        <!-- main-top-box-->
        <div class="main-content-box col-sm-10">
          <div class="main-content-carousel shadow p-3 mb-5 bg-white rounded">
            <div class="detail-top-box row">
              <div class="line detailtop-icon detailtop col-md-3">
                <div class="iconbox"><img src="../assets/kakao.png"></div>
              </div>
              <div class="line detailtop-name row detailtop col-md-7">
                <div class="namebox box_udline">
                  <h4 class="kr-font">카카오톡</h4>
                  <p class="kr-font">한줄요약이 들어가는 곳입니다</p>
                  <h2>4.3</h2>
                <div class="box">
                    <div class="content kr-font">
                    </div>
                </div>
                </div>
              </div>
              <div class="detailtop-like detailtop col-md-2">
                <div class="line likebox">
                  <div class="likebtn"><i class="fas fa-thumbs-up"></i></div>
                  <div class="likeWord">Like</div>
                </div>
              </div>
            </div>
            <div class="detail-top-imgbox">
              <ul class="row imgbox-ul">
                <li class="col-sm-3"><img src="../assets/screen.png"></li>
                <li class="col-sm-3"><img src="../assets/screen.png"></li>
                <li class="col-sm-3"><img src="../assets/screen.png"></li>
                <li class="col-sm-3"><img src="../assets/screen.png"></li>
              </ul>
            </div>

            <div class="detail-mid-box">
              <div class="mid-list-box">
                <ul class="mid-list-box-div row kr-font">
                  <li class="col-md-1"></li>
                  <li class="mid-list-box-list col-md-2">세부사항</li>
                  <li class="col-md-1"></li>
                  <li class="mid-list-box-list col-md-2">통계학</li>
                  <li class="col-md-1"></li>
                  <li class="mid-list-box-list col-md-2">뭔가있겠지</li>
                  <li class="col-md-1"></li>
                  <li class="mid-list-box-list col-md-2">뭔가있지</li>
                 
                </ul>
              </div>
              <div class="tab-box">
                <p>아스팔트 9: 레전드에서 Ferrari, Porsche, Lamborghini, W Motors 등 수많은 세계적 브랜드와 
                  전설급 일류 제조사의 자동차를 직접 운전해 보세요. 싱글 또는 멀티플레이 모드의 
                  역동적이고 현실감 넘치는 장소에서 레이스를 즐기고, 실력을 자랑하고, 스턴트 액션에 
                  도전하세요. 아스팔트 8: 에어본 제작진이 선사하는 짜릿한 레이싱 경험이 여러분을 찾아갑니다.
                </p>
              </div>
              <div class="tab-box">
                <p>second</p>
              </div>
              <div class="tab-box">
                <p>third</p>
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
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

     $('.mid-list-box-list').eq(0).click(function(){
       $('.tab-box').eq(0).css('display','block')
       $('.tab-box').eq(1).css('display','none')
       $('.tab-box').eq(2).css('display','none')
       $('.tab-box').eq(3).css('display','none')
     })
     $('.mid-list-box-list').eq(1).click(function(){
       $('.tab-box').eq(1).css('display','block')
       $('.tab-box').eq(0).css('display','none')
       $('.tab-box').eq(2).css('display','none')
       $('.tab-box').eq(3).css('display','none')
     })
     $('.mid-list-box-list').eq(2).click(function(){
       $('.tab-box').eq(2).css('display','block')
       $('.tab-box').eq(0).css('display','none')
       $('.tab-box').eq(1).css('display','none')
       $('.tab-box').eq(3).css('display','none')
     })
     $('.mid-list-box-list').eq(3).click(function(){
       $('.tab-box').eq(3).css('display','block')
       $('.tab-box').eq(0).css('display','none')
       $('.tab-box').eq(1).css('display','none')
       $('.tab-box').eq(2).css('display','none')
     })
     

    </script>
    <script text="javascript/text">
      $(document).ready(function(){
          $('.box').each(function(){
              var content = $(this).children('.content');
              var content_txt = content.text();
              var content_txt_short = content_txt.substring(0,100)+"...";
              var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');
  
              $(this).append(btn_more);
              
              if(content_txt.length >= 100){
                  content.html(content_txt_short)
              }else{
                  btn_more.hide()
              }
              btn_more.click(toggle_content);
              function toggle_content(){
                  if($(this).hasClass('short')){
                      // 접기 상태
                      $(this).html('더보기');
                      content.html(content_txt_short)
                      $(this).removeClass('short');
                  }else{
                      // 더보기 상태
                      $(this).html('접기');
                      content.html(content_txt);
                      $(this).addClass('short');
  
                  }
              }
          });
      });
    </script>
  </body>
</html>