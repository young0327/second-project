<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel='stylesheet' href=' ${pageContext.request.contextPath}/resources/css/main.css?ver=1'>
    <link rel='stylesheet' href=' ${pageContext.request.contextPath}/resources/css/comparing.css?ver=1'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>Hello, world!</title>
    <style>
    	 #chartdiv{
          width: 100%;
          height: 500px;
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
		        		<div style="text-align: center; margin-left:-20px;" class="col-sm-2 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><i class="fas fa-sign-in-alt"></i>Login</p></div>
		      		</c:when>
		      		<c:otherwise>
		       			<div class="col-sm-3 loginbox solo" id="krFont"><p style="font-size:20px;">${users.nick}님 반갑습니다</p></div>
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
                  <div class="icon-img"><img src="#"></div>
                  <div><p>카카오톡</p></div>
                </div>
              </div>
              <div class="compare-icon-box" style="width: 15%;">앱 아이콘</div>
              <div class="compare-icon-box">
                <div class="icon-inner-box">
                  <div class="icon-img"><img src="#"></div>
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
                <div class="rader-inner">
                  <div class="chart-box"><canvas id="radar-chart" width="250" height="250"></canvas></div>
                </div>
              </div>
              <div class="second-rating-box"></div>
              <div class="second-rating-box" style="width: 15%;">감성분석</div>
              <div class="second-rating-box">
              </div>
                        <div id="chartdiv"></div>
            </div>
          </div>
        </div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script>
	new Chart(document.getElementById("radar-chart"), {
	    type: 'radar',
	    data: {
	      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
	      datasets: [
	        {
	          label: "1950",
	          fill: true,
	          backgroundColor: "rgba(179,181,198,0.2)",
	          borderColor: "rgba(179,181,198,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(179,181,198,1)",
	          data: [8.77,55.61,21.69,6.62,6.82]
	        }, {
	          label: "2050",
	          fill: true,
	          backgroundColor: "rgba(255,99,132,0.2)",
	          borderColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          data: [25.48,54.16,7.61,8.06,4.45]
	        }
	      ]
	    },
	    options: {
	      title: {
	        display: true,
	        text: 'Distribution in % of world population'
	      }
	    }
	});
	
	</script>

	
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/wc.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
    
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
       
       am5.ready(function() {
       
       // Create root element
       // https://www.amcharts.com/docs/v5/getting-started/#Root_element
       var root = am5.Root.new("chartdiv");
       
       
       // Set themes
       // https://www.amcharts.com/docs/v5/concepts/themes/
       root.setThemes([
         am5themes_Animated.new(root)
       ]);
       
       
       // Add series
       // https://www.amcharts.com/docs/v5/charts/word-cloud/
       var series = root.container.children.push(am5wc.WordCloud.new(root, {
         categoryField: "tag",
         valueField: "weight",
         maxFontSize: am5.percent(15),
         minFontSize: am5.percent(1),
         
       }));
       
       // Configure labels
       series.labels.template.setAll({
         fontFamily: "Gothic",
         fill: am5.color(0x85FFC4)
       });
       
       
       // Data from:
       // https://insights.stackoverflow.com/survey/2021#section-most-popular-technologies-programming-scripting-and-markup-languages
       series.data.setAll([
         { tag: "JavaScript", weight: 65 },
         { tag: "HTML/CSS", weight: 10 },
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
         { tag: "Perl", weight: 46 },
         { tag: "Haskell", weight: 12 },
         { tag: "Delphi", weight: 21 },
         { tag: "Clojure", weight: 88 },
         { tag: "Elixir", weight: 74 },
         { tag: "LISP", weight: 33 },
         { tag: "Julia", weight: 29 },
         { tag: "F#", weight: 97 },
         { tag: "Erlang", weight: 79 },
         { tag: "APL", weight: 65 },
         { tag: "Crystal", weight: 56 },
         { tag: "COBOL", weight: 13 },
       ]);
       
       }); // end am5.ready()
    </script>
    
  </body>
</html>