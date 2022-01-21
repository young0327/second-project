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
                  <div class="kr-font">10,300</div>
                </div>
              </div>
            </div>
            <div class="detail-top-imgbox">
              <ul class="row imgbox-ul">
                <li class="col-sm-3"><img src="${appimg[0].appimg1}"></li>
                <li class="col-sm-3"><img src="${appimg[0].appimg2}"></li>
                <li class="col-sm-3"><img src="${appimg[0].appimg3}"></li>
                <li class="col-sm-3"><img src="${appimg[0].appimg4}"></li>
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
               	  	  			<option value="0.9">아주좋음</option>
               	  	  			<option value="0.7">좋음</option>
               	  	 			<option value="0.5">보통</option>
               	  	 			<option value="0.3">나쁨</option>
               	  	 			<option value="0.1">아주나쁨</option>
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
<<<<<<< HEAD
                				<div id="wordCloud">
                				<div id="demo"></div>
                				</div>
=======
                				<div id="bang"></div>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-Bigdata-6/Cloud9.git
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
     
       
      // 로그인 확인 및 설정 
      $(document).on('click','#btn_Login',function(){
		if($('#id').val()!="" && $('#pwd').val()!=""){
			let loginData=$("#frm").serialize();
			$.ajax({ 
				url:"user/login",
				type: "get",
				data : loginData,
				success : function(YN){
					console.log(YN)
					if(YN=="y"){
						location.reload();
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
      
      // 페이지 접속시 즐겨찾기 확인
      $("document").ready(function(){
    	  let appname=$("#appname").text()
    	  if($.cookie(appname)=="Y"){
    		 $(".likebtn").css("color","red");
   		  }else{
   			 $(".likebtn").css("color","black");
   		  }
      })
      
      // 페이지 접속시 도움이 되는 리뷰 출력
      $("document").ready(function(){
    	  let appid=$("#appid").text()
    	  $.ajax({
    		  url:"review",
    		  type:"get",
    		  data:{"appid":appid},
    		  success:function(data){
    			  for (let i =0; i<data.length; i++){
    				  let reviews=
    					   '<div class="helpful-box">'+
                     		'<div class="helpful-inner">'+
                        	'<div class="helpful-top kr-font" style="font-weight:700; font-size:20px;"><p>' + data[i].reviewTitle +'</p></div>'+
                        	'<div class="kr-font" style="margin-top:-10px;"><span style="font-weight:400">'+data[i].appCrawlId +'</span><span style="margin-left:62%; color: rgb(161, 161, 161);">'+data[i].reviewDate+'</span></div>'+
                        	'<div class="kr-font" style="font-size:20px;"><p><i class="fas fa-star" style="font-size:18px; color:yellow;"></i>&nbsp' + data[i].reviewRating + '</p></div>'+
                        	'<div class="kr-font"><p>'+data[i].reviewContent+'</p>'+
                     		 '</div>'+
                    		'</div>';
    				  
    				  $("#reviewbox").append(reviews);
    			  }
    		  },
    		  error:function(){
    			  console.log("error")
    		  }
    	  })
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
	          backgroundColor: ["#EF9FE4", "#EFE229","#34F2B3","#318AEF","#F05323"],
	          data: [apppoint1,apppoint2,apppoint3,apppoint4,apppoint5],
	          hoverOffset: 40,
	          maintainAspectRatio : true
	        }],
	     
	    },
	    options: {
	    	layout:{
	    		padding: 20},
		      title: {
		        display: true,
		        text: '평점 정보'
	   		 	},
	   		 plugins:{
	   			 legend :{
	   				 position : 'left',
	   				 labels:{
	   					padding:30,
	   					boxHeight : 20,
	   					color : "black",
	   					font: {
	   						size:20,
	   						family : "'Noto Sans KR', sans-serif",
	   						
	   					}
	   				 }
	   			 }
	   		 }
	    	}
		});
     })
     
     // 평점 추이 텍스트로 출력
     $("#detailBtn2").on("click",function(){
    	let appid = $("#appid").text();
    	let month = 1
    		$.ajax({
	    		url:"review/monthRate",
	    		type:"get",
	    		data:{"appid":appid,"month":month},
	    		success:function(data){
	    			$("#ui-word-rate").text(parseFloat(data).toFixed(1));
	    		},
	    		error: function(){
	    			console.log("n")
	    		}
	    	});
     })
   
     $("#monthSelect").on('change',function(){
    		let appid = $("#appid").text();
        	let month = $("#monthSelect").val()
        		$.ajax({
    	    		url:"review/monthRate",
    	    		type:"get",
    	    		data:{"appid":appid,"month":month},
    	    		success:function(data){
    	    			$("#ui-word-rate").text(parseFloat(data).toFixed(1));
    	    		},
    	    		error: function(){
    	    			console.log("n")
    	    		}
    	    	});
         })

         
   // 계기판 차트
   
    $("#detailBtn2").on("click",function(){
				 // Create root element
			    // https://www.amcharts.com/docs/v5/getting-started/#Root_element
			    var root = am5.Root.new("chartdiv");

			    // Set themes
			    // https://www.amcharts.com/docs/v5/concepts/themes/
			    root.setThemes([
			      am5themes_Animated.new(root)
			    ]);

			    // Create chart
			    // https://www.amcharts.com/docs/v5/charts/radar-chart/
			    var chart = root.container.children.push(am5radar.RadarChart.new(root, {
			      panX: false,
			      panY: false,
			      startAngle: 180,
			      endAngle: 360
			    }));

			    // Create axis and its renderer
			    // https://www.amcharts.com/docs/v5/charts/radar-chart/gauge-charts/#Axes
			    var axisRenderer = am5radar.AxisRendererCircular.new(root, {
			      innerRadius: -70,
			    });

			    axisRenderer.grid.template.setAll({
			      stroke: root.interfaceColors.get("background"),
			      visible: true,
			      strokeOpacity: 1,
			    });

			    var xAxis = chart.xAxes.push(am5xy.ValueAxis.new(root, {
			      maxDeviation: 0,
			      min: 0,
			      max: 5,
			      strictMinMax: true,
			      renderer: axisRenderer,
			    }));

			    // Add clock hand
			    // https://www.amcharts.com/docs/v5/charts/radar-chart/gauge-charts/#Clock_hands
			    var axisDataItem = xAxis.makeDataItem({});

			    var clockHand = am5radar.ClockHand.new(root, {
			    	 radius: am5.percent(85),
			    	    topWidth: 3,
			    	    bottomWidth: 20
			    })

			    var bullet = axisDataItem.set("bullet", am5xy.AxisBullet.new(root, {
			      sprite: clockHand
			    }));

			    xAxis.createAxisRange(axisDataItem);

			    var label = chart.radarContainer.children.push(am5.Label.new(root, {
			      fill: am5.color(0xffffff),
			    }));

			    axisDataItem.set("value",${appinfo[0].apppn}*5);
			    bullet.get("sprite").on("rotation", function () {
			      var value = axisDataItem.get("value");
			      var text = Math.round(axisDataItem.get("value")).toString();
			      var fill = am5.color(0x666666);
			      //label.set("text", Math.round(value).toString());
			      label.set("text", value.toString());

			      clockHand.pin.animate({ key: "fill", to: fill, duration: 500, easing: am5.ease.out(am5.ease.cubic) })
			      clockHand.hand.animate({ key: "fill", to: fill, duration: 500, easing: am5.ease.out(am5.ease.cubic) })
			    });

			    chart.bulletsContainer.set("mask", undefined);

			    // Create axis ranges bands
			    // https://www.amcharts.com/docs/v5/charts/radar-chart/gauge-charts/#Bands
			    var bandsData = [{
			      title: "아주나쁨",
			      color: "#ee1f25",
			      lowScore: 0,
			      highScore: 1,
			      fontSize: "0.3em"
			    }, {
			      title: "나쁨",
			      color: "#f04922",
			      lowScore: 1,
			      highScore: 2,
			      fontSize: "0.3em"
			    }, {
			      title: "보통",
			      color: "#fdae19",
			      lowScore: 2,
			      highScore: 3,
			      fontSize: "0.3em"
			    }, {
			      title: "좋음",
			      color: "#f3eb0c",
			      lowScore: 3,
			      highScore: 4,
			      fontSize: "0.3em"
			    }, {
			      title: "아주좋음",
			      color: "#b0d136",
			      lowScore: 4,
			      highScore: 5,
			      fontSize: "0.3em"
			    }];

			    am5.array.each(bandsData, function (data) {
			      var axisRange = xAxis.createAxisRange(xAxis.makeDataItem({}));

			      axisRange.setAll({
			        value: data.lowScore,
			        endValue: data.highScore
			      });

			      axisRange.get("axisFill").setAll({
			        visible: true,
			        fill: am5.color(data.color),
			      });

			      axisRange.get("label").setAll({
			        text: data.title,
			        inside: true,
			        radius: 15,
			        fontSize: "0.9em",
			        fill: root.interfaceColors.get("background")
			      });
			    });
			    
			    // Make stuff animate on load
			    chart.appear(1000, 100);
    });

    // 감정분석 리뷰
     $("#detailBtn2").on("click",function(){
    	let appid = ${appinfo[0].appid}
    	let apppn = ${appinfo[0].apppn}
    		$.ajax({
	    		url:"review/emo",
	    		type:"get",
	    		data:{"appid":appid,"apppn":apppn},
	    		success:function(data){
	    			  for (let i =0; i<4; i++){
	    				  let reviews=
	    					  '<div class="review-box kr-font">'+
	                  				'<div class="review-inner" style="text-align:left;">'+
	                  					'<p style="font-size:20px;">'+data[i].reviewRating+'</p>'+
	                  					'<p>'+data[i].reviewContent+'</p>'+
	                  				'</div>'+
	                    		'</div>';
	    				  $(".bottom-review-box").append(reviews);
	    			  	}
	    			  },
	    		error: function(){
	    			console.log("n")
	    		}
	    	});
     })
    
     //감성 분석 확률
   $("#detailBtn2").on("click",function(){
    	 let appid = $("#appid").text();
    	 let emo = ${appinfo[0].apppn};
    	  $.ajax({
    		  url:"review/per",
    		  type:"get",
    		  data:{"appid":appid,"emo":emo},
    		  success:function(data){
    			  $("#emotion-word-rate").text(data.emoCount/data.allCount*100)
    		  },
    		  error:function(){
    			  console.log("error")
    		  }
    	  })
     });
     
    	 $("#emotionSelect").on('change',function(){
     		let appid = $("#appid").text();
         	let emo = $("#emotionSelect").val()
         		$.ajax({
     	    		url:"review/per",
     	    		type:"get",
     	    		data:{"appid":appid,"emo":emo},
     	    		success:function(data){
     	    			  $("#emotion-word-rate").text(data.emoCount/data.allCount*100)
     	    		},
     	    		error: function(){
     	    			console.log("error")
     	    		}
     	    	});
          });
     
    	 $('#demo').jQCloud(words);
    	 var words = [
    		  {text: "Lorem", weight: 13},
    		  {text: "Ipsum", weight: 10.5},
    		  {text: "Dolor", weight: 9.4},
    		  {text: "Sit", weight: 8},
    		  {text: "Amet", weight: 6.2},
    		  {text: "Consectetur", weight: 5},
    		  {text: "Adipiscing", weight: 5}
    		];

    		
    	 </script>
    	<!-- Resources -->
	
<!-- Chart code -->
<script>
$("#detailBtn3").on("click",function(){

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
var coffee = am5.Root.new("bang");

// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
coffee.setThemes([
  am5themes_Animated.new(coffee)
]);


// Add series
// https://www.amcharts.com/docs/v5/charts/word-cloud/
var series = coffee.container.children.push(am5wc.WordCloud.new(coffee, {
  categoryField: "tag",
  valueField: "weight",
  maxFontSize: am5.percent(25),
  minFontSize: am5.percent(5),
  colors: am5.ColorSet.new(coffee, {
      colors: [
        am5.color(0x095256),
        am5.color(0x087f8c),
        am5.color(0x5aaa95),
        am5.color(0x86a873),
        am5.color(0xbb9f06),
        am5.color(0x22d558),
        am5.color(0x22d558),
        am5.color(0xE66C8C),
        am5.color(0xE117E8),
        am5.color(0xA5EB68),
        am5.color(0xD57622),
        am5.color(0x2264D5),

      ]
    }),
}));

// Configure labels
series.labels.template.setAll({
  fontFamily: "Gothic"
});


// Data from:
// https://insights.stackoverflow.com/survey/2021#section-most-popular-technologies-programming-scripting-and-markup-languages
series.data.setAll([
  { tag: "JavaScript", weight: 64.96 },
  { tag: "HTML/CSS", weight: 56.07 },
  { tag: "Python", weight: 48.24 },
  { tag: "SQL", weight: 47.08 },
  { tag: "Java", weight: 35.35 },
  { tag: "Node.js", weight: 33.91 },
  { tag: "TypeScript", weight: 30.19 },
  { tag: "C#", weight: 27.86 },
  { tag: "Bash/Shell", weight: 27.13 },
  { tag: "C++", weight: 24.31 },
  { tag: "PHP", weight: 21.98 },
  { tag: "C", weight: 21.01 },	
  { tag: "PowerShell", weight: 10.75 },
  { tag: "Go", weight: 9.55 },
  { tag: "Kotlin", weight: 8.32 },
  { tag: "Rust", weight: 7.03 },
  { tag: "Ruby", weight: 6.75 },
  { tag: "Dart", weight: 6.02 },
  { tag: "Assembly", weight: 5.61 },
  { tag: "Swift", weight: 5.1 },
  { tag: "R", weight: 5.07 },
  { tag: "VBA", weight: 4.66 },
  { tag: "Matlab", weight: 4.66 },
  { tag: "Groovy", weight: 3.01 },
  { tag: "Objective-C", weight: 2.8 },
  { tag: "Scala", weight: 2.6 },
  { tag: "Perl", weight: 2.46 },
  { tag: "Haskell", weight: 2.12 },
  { tag: "Delphi", weight: 2.1 },
  { tag: "Clojure", weight: 1.88 },
  { tag: "Elixir", weight: 1.74 },
  { tag: "LISP", weight: 1.33 },
  { tag: "Julia", weight: 1.29 },
  { tag: "F#", weight: 0.97 },
  { tag: "Erlang", weight: 0.79 },
  { tag: "APL", weight: 0.65 },
  { tag: "Crystal", weight: 0.56 },
  { tag: "COBOL", weight: 0.53 },
]);

}); // end am5.ready()
</script>
 
  </body>
</html>