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
      <div class="col-sm-2 logobox"><a href="main.html"><img class="logo-img"  src="./resources/logo/appv.png"></a></div>
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
          	<li class="sidebar-personal-list" ><i class="icon fas fa-home"></i><a class="list-a kr-font" href="main">홈 화면
            <li class="sidebar-personal-list" ><i class="icon fas fa-adjust"></i><a class="list-a category" href="#">카테고리
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">category1</a>
                <a href="#" class="list-group-item list-group-item-action">category2</a>
                <a href="#" class="list-group-item list-group-item-action">category3</a>
              </div>
            </a></li>
            <li class="sidebar-personal-list" ><i class="icon fas fa-not-equal"></i><a class="list-a" href="Comparing.html">유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a" href="community.do?category=category0">커뮤니티</a></li>
           </ul>
          <!-- Side Bar end--> 
        </div>
        <!-- main-top-box-->
        <div class="main-content-box col-sm-10">
          <div class="main-content-carousel shadow p-3 mb-5 bg-white rounded">
            <div class="detail-top-box row">
              <div class="line detailtop-icon detailtop col-md-3">
                <div class="iconbox"><img src="${appinfo[0].appicon}"></div>
              </div>
              <div class="line detailtop-name row detailtop col-md-7">
                <div class="namebox box_udline">
                  <h4 class="kr-font" id ="appname">${appinfo[0].appname}</h4><span class='kr-font'>Daum Kakao</span>
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
                  <div class="kr-font">10,300</div>
                </div>
              </div>
            </div>
            <div class="detail-top-imgbox">
              <ul class="row imgbox-ul">
                <li class="col-sm-3"><img src="${appinfo[0].appimg1}"></li>
                <li class="col-sm-3"><img src="${appinfo[0].appimg2}"></li>
                <li class="col-sm-3"><img src="${appinfo[0].appimg3}"></li>
                <li class="col-sm-3"><img src="${appinfo[0].appimg4}"></li>
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
                  <li class="mid-list-box-list col-md-2">워드클라우드</li>
                  <li class="col-md-1"></li>
                 
                </ul>
              </div>
              <div class="tab-box">
                <div class="tab-inner-box">
                  <div class="tab-content-box tab-content-left">
                  ${appinfo[0].appinfo}
                  </div>
                  <div class="tab-content-box tab-content-right">
                    <div class="helpful-box">
                      <div class="helpful-inner">
                        <div class="helpful-top kr-font"><p>작성자 이름</p></div>
                        <div class="kr-font"><p>제목자리</p><p>동북아시아와 국제적인 정세를 살펴보았을때</p></div>
                      </div>
                    </div>
                    <div class="helpful-box">
                      <div class="helpful-inner">
                        <div class="helpful-top kr-font"><p>작성자 이름</p></div>
                        <div class="kr-font"><p>제목자리</p><p>동북아시아와 국제적인 정세를 살펴보았을때</p></div>
                      </div>
                    </div>
                    <div class="helpful-box">
                      <div class="helpful-inner">
                        <div class="helpful-top kr-font"><p>작성자 이름</p></div>
                        <div class="kr-font"><p>제목자리</p><p>동북아시아와 국제적인 정세를 살펴보았을때</p></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-box">
                <p><canvas id="doughnut-chart" width="800" height="450"></canvas></p>
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>    
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
      
		$("document").ready(function(){
			$('.tab-box').eq(0).css('display','block')
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
      
      $("document").ready(function(){
    	  let appname=$("#appname").text()
    	  if($.cookie(appname)=="Y"){
    		 $(".likebtn").css("color","red");
   		  }else{
   			 $(".likebtn").css("color","black");
   		  }
      })
      
      // 즐겨찾기 추가
      $(".likebtn").on("click",function(){
    	 let appname=$("#appname").text()
    		 
    	 if($.cookie(appname)=="Y"){
    		 $.removeCookie(appname); 
    		 alert("관심있는 어플에 등록이 해제되었습니다.");
    		  $(".likebtn").css("color","black")
    	 }else{
    		 $.cookie(appname,"Y",{expires:7})
    		 alert("관심있는 어플에 등록 되었습니다.");
    		 $(".likebtn").css("color","red")
    	 }
      })
      
      
      //도넛차트
    
     let apppoint1 = ${appinfo[0].apppoint1}
     let apppoint2 = ${appinfo[0].apppoint2}
     let apppoint3 = ${appinfo[0].apppoint3}
     let apppoint4 = ${appinfo[0].apppoint4}
     let apppoint5 = ${appinfo[0].apppoint5}
     $("#detailBtn2").on("click",function(){
     new Chart($("#doughnut-chart"), {
	    type: 'doughnut',
	    data: {
	      labels: ["1점", "2점", "3점", "4점", "5점"],
	      datasets: [{
	          label: "평점 정보",
	          backgroundColor: ["#1a1423", "#372549","#774c60","#b75d69","#eacdc2"],
	          data: [apppoint1,apppoint2,apppoint3,apppoint4,apppoint5],
	          hoverOffset: 70	
	        }],
	     
	    },
	    options: {
	      title: {
	        display: true,
	        text: '평점 정보'
	      }
	    }
		});
     })
    </script>
  </body>
</html>