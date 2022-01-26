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
    <title>AppV</title>
    <style>
    	 #chartdiv{
          width: 100%;
          height: 500px;
        }
    	 #chartSecond{
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
		      		<div style='margin-left:30px; margin-top:23px; display:block' ><button class="nav-font-enlg" id ="logout"><i class="fas fa-sign-out-alt"></i>LOGOUT</button></div>
		      		<div style="text-align: right; display:none" class="col-sm-1 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><i class="fas fa-users-cog"></i>Register</a></div>
		      	</c:when>
		      	<c:otherwise>
		      	      <div style='margin-left:30px; margin-top:23px; display:none' ><button class="nav-font-enlg" id ="logout"><i class="fas fa-sign-out-alt"></i>LOGOUT</button></div>
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
          <div class='myFavorite-box kr-font'><div class="kr-font" style="color:white; padding-right: 17px;"><span>즐겨찾기<span></div>
           	 <div class='myFavorite-inner' id= "myFavorite">
           	 </div>
           </div>
          <!-- Side Bar end--> 
        </div>
        
        <div class="main-content-box col-sm-10 kr-font">
          <div class="compare-background row ">
            <div class="compare-box">
              <div class="compare-search-box">
                <div class="search-inner-box">
                  <input type="search" list="appOption1" id="compare1" autocomplete="off"><span>  </span>
                  <datalist id="appOption1">
                  </datalist>
                  <button id ="vsbtn1" style="border:none;background:none;"><i class="fas fa-search" style="font-size: 24px;"></i></button>
                </div>
              </div>
          
              <div class="compare-search-box" style="width: 15%;">
              <div>
                    <select class="category-division" id="compareCate">
                       <option value="none">=== 선택 ===</option>
                       <option value="M">음악</option>
                       <option value="P">사진/비디오</option>
                       <option value="H">여행</option>
                    </select>
                 </div>
              </div>
              <div class="compare-search-box">
                <div class="search-inner-box">
                  <input type="search" list="appOption2" id="compare2" autocomplete="off"><span>  </span><i class="fas fa-search" style="font-size: 24px;"></i>
                   <datalist id="appOption2">
                  </datalist>
                </div>
              </div>
              <div class="compare-icon-box" id="iconbox1">
                <div class="icon-inner-box">
                  <div class="icon-img"><img src="./resources/img/dfimg.jpg" style="border: 3px solid gray;border-radius: 7px;"></div>
                  <div><p>어플을 검색해 주세요</p></div>
                </div>
              </div>
              <div class="compare-icon-box" style="width: 15%;"></div>
              <div class="compare-icon-box" id ="iconbox2">
                <div class="icon-inner-box">
                  <div class="icon-img"><img src="./resources/img/dfimg.jpg" style="border: 3px solid gray;border-radius: 7px;"></div>
                  <div><p>어플을 검색해 주세요</p></div>
                </div>
              </div>
              <div class="compare-rating-box" id="ratingbox1">
                <div class="rating-inner-box">
                  <div class="ratings"><h4>--</h4></div>
                </div>
              </div>
              <div class="compare-rating-box" style="width: 15%;">앱 평점</div>
              <div class="compare-rating-box" id="ratingbox2">
                <div class="rating-inner-box">
                  <div class="ratings"><h4>--</h4></div>
                </div>
              </div>
              <div class="space"></div>
              <div class="rader-chart-box">
                <div class="rader-inner">
                  <div class="chart-box"><canvas id="radar-chart" width="250" height="250"></canvas></div>
                </div>
              </div>
              <div class="second-rating-box kr-font">
        <div class='analy-inner analy-inner-left'><p class='kr-font' style="font-size:20px;"></p>
                		<div class='rating-inner'></div>
                		<div class='rating-inner rating-right'>
                			<div class='point kr-font' style="padding-left:25px;">
                				<span id="emotion-word-rate1" class="ui-word starPoint"></span>%
                			</div>
                			<div class='point word kr-font'>
                				<p>
                				<span id="emotion-word-title1" class="ui-word starPoint"></span><br>
                				<span>을 사용한 사람들이</span>
               	  				<select style="border:none; background:#eee; border-radius:20px;" id="emotionSelect1">
               	  	  			<option value="1">좋음</option>
               	  	 			<option value="0">나쁨</option>
               	  				</select><br>감정을 느꼈습니다</p>
                			</div>
                		</div>
                	</div>
              	<div class="gamsung-bot">
              		<div id="chartdiv"></div>
              	</div>
              	<div class="gamsung-down" id ="compareReview1">
					
				</div>
              </div>
              <div class="second-rating-box" style="width: 15%;">감성분석</div>
              <div class="second-rating-box kr-font">
                  <div class='analy-inner analy-inner-left'><p class='kr-font' style="font-size:20px;"></p>
                		<div class='rating-inner'></div>
                		<div class='rating-inner rating-right'>
                			<div class='point kr-font' style="padding-left:25px;">
                				<span id="emotion-word-rate2" class="ui-word starPoint"></span>%
                			</div>
                			<div class='point word kr-font'>
                				<p>
                				<span id="emotion-word-title2" class="ui-word starPoint"></span><br>
                				<span>을 사용한 사람들이</span>
               	  				<select style="border:none; background:#eee; border-radius:20px;" id="emotionSelect2">
               	  	  			<option value="1">좋음</option>
               	  	 			<option value="0">나쁨</option>
               	  				</select><br>감정을 느꼈습니다</p>
                			</div>
                		</div>
                	</div>
              	<div class="gamsung-bot">
              		<div id="chartSecond"></div>
              	</div>
              	<div class="gamsung-down" id ="compareReview2">
					
				</div>
              	
              </div>
                        
            </div>
          </div>
        </div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
	<script>
	
	new Chart(document.getElementById("radar-chart"), {
	    type: 'radar',
	    data: {
	      labels: ["항목1", "항목2", "항목3"],
	      datasets: [
	      ]
	    },
	    options: {
	      title: {
	        display: true,
	        text: '두 가지 앱을 비교해 보세요!'
	      },
	      /*ticks:{
	    	  beginAtZero:true,
	    	  min:0,
	    	  max:5,
	    	  stepSize:1
	      }*/
	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 } //maxTicksLimit data 최대값의 2배
			}
	    
	});
	
	</script>

	
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/radar.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bookmark.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/catescroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
    
    <script>
     
       
     
        
    
       

let app1emopn1;

am5.ready(function() {

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
	  startAngle: 160,
	  endAngle: 380
	}));


	// Create axis and its renderer
	// https://www.amcharts.com/docs/v5/charts/radar-chart/gauge-charts/#Axes
	var axisRenderer = am5radar.AxisRendererCircular.new(root, {
	  innerRadius: -70
	});

	axisRenderer.grid.template.setAll({
	  stroke: root.interfaceColors.get("background"),
	  visible: true,
	  strokeOpacity: 1
	});

	var xAxis = chart.xAxes.push(am5xy.ValueAxis.new(root, {
	  maxDeviation: 0,
	  min: 0,
	  max: 5,
	  strictMinMax: true,
	  renderer: axisRenderer
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
	  fill: am5.color(0xffffff)
	
	}));
	
	
	 axisDataItem.set("value", 0.1);
		$("#compare1").on("keyup",function(key){
			if(key.keyCode==13) {
			axisDataItem.set("value", appemo1*5);
			}
		})
	bullet.get("sprite").on("rotation", function () {
	  var value = axisDataItem.get("value");
	  var text = Math.round(axisDataItem.get("value")).toString();
	  var fill = am5.color(0x666666);
	  

	  label.set("text", Math.round(value).toString());

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
	      highScore: 1
	}, {
		  title: "나쁨",
	      color: "#f04922",
	      lowScore: 1,
	      highScore: 2
	}, {
		 title: "보통",
	      color: "#fdae19",
	      lowScore: 2,
	      highScore: 3
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
	    fillOpacity: 1.0
	  });

	  axisRange.get("label").setAll({
	    text: data.title,
	    inside: true,
	    radius: 15,
	    fontSize: "1.1em",
	    fill: root.interfaceColors.get("black")
	  });
	});


	// Make stuff animate on load
	chart.appear(1000, 100);

	}); // end am5.ready()

<!-- Resources -->


<!-- 두번째 감성분석 차트 -->

am5.ready(function() {

	// Create root element
	// https://www.amcharts.com/docs/v5/getting-started/#Root_element
	var root = am5.Root.new("chartSecond");


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
	  startAngle: 160,
	  endAngle: 380
	}));


	// Create axis and its renderer
	// https://www.amcharts.com/docs/v5/charts/radar-chart/gauge-charts/#Axes
	var axisRenderer = am5radar.AxisRendererCircular.new(root, {
	  innerRadius: -70
	});

	axisRenderer.grid.template.setAll({
	  stroke: root.interfaceColors.get("background"),
	  visible: true,
	  strokeOpacity: 1
	});

	var xAxis = chart.xAxes.push(am5xy.ValueAxis.new(root, {
	  maxDeviation: 0,
	  min: 0,
	  max: 5,
	  strictMinMax: true,
	  renderer: axisRenderer
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
	  fill: am5.color(0xffffff)
	
	}));

	 axisDataItem.set("value", 0.1);
		$("#compare2").on("keyup",function(key){
			if(key.keyCode==13) {
			axisDataItem.set("value", appemo2*5);
			}
		})
	bullet.get("sprite").on("rotation", function () {
	  var value = axisDataItem.get("value");
	  var text = Math.round(axisDataItem.get("value")).toString();
	  var fill = am5.color(0x666666);
	  

	  label.set("text", Math.round(value).toString());

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
	      highScore: 1
	}, {
		  title: "나쁨",
	      color: "#f04922",
	      lowScore: 1,
	      highScore: 2
	}, {
		 title: "보통",
	      color: "#fdae19",
	      lowScore: 2,
	      highScore: 3
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
	    fillOpacity: 1.0
	  });

	  axisRange.get("label").setAll({
	    text: data.title,
	    inside: true,
	    radius: 15,
	    fontSize: "1.1em",
	    fill: root.interfaceColors.get("black")
	  });
	});


	// Make stuff animate on load
	chart.appear(1000, 100);

	}); // end am5.ready()
	
	// 카테고리 선택에 따라 리스트값 변경
	$("#compareCate").on("change",function(){
		let cate= $("#compareCate").val();
		console.log(cate)
		$.ajax({
			url:"compare/list",
			type:"get",
			data:{"cate":cate},
			success:function(data){
				$("#appOption1").html("")
				$("#appOption2").html("")
				for(let i =0; i<data.length;i++){
				let appList = '<option value="'+data[i].appname+'"/>'
				$("#appOption1").append(appList)
				$("#appOption2").append(appList)
						}
			},
			error:function(){
				console.log("error")
			}
		});
	})
	
	let appRader1={};
	let appemo1="";
	let appid1="";
	//검색 어플 입력	
		$("#compare1").on("keyup",function(key){
			if(key.keyCode==13) {
				let compareApp1 = $("#compare1").val();
				let cate1= $("#compareCate").val();
				$.ajax({
					url:"compare/app",
					type:"get",
					data:{"appname":compareApp1},
					async: false,
					success:function(data){
						$("#iconbox1").html("")
						$("#ratingbox1").html("")
						let icon ='<div class="icon-inner-box">'+
			                  '<div class="icon-img"><img src="'+data[0].appicon+'" style="border: 3px solid gray;border-radius: 7px;"></div>'+
			                  '<div>'+'<p>'+data[0].appname+'</p>'+'</div>'+
			                '</div>'
						$("#iconbox1").append(icon);
			             
			            let rate ='<div class="rating-inner-box">'+
		                  '<div class="ratings">'+
		                  '<h4>'+data[0].apprating.toFixed(1)+'</h4>'+'</div>'+
			               '</div>'
			            $("#ratingbox1").append(rate);
			               
			               appemo1=data[0].apppn
			               appid1=data[0].appid
			               
			               let score1=data[0].evascore1*10
			               let score2=data[0].evascore2*10
			               let score3=data[0].evascore3*10
			            appRader1={
				        	          label: data[0].appname,
				        	          fill: true,
				        	          backgroundColor: "rgba(179,181,198,0.2)",
				        	          borderColor: "rgba(179,181,198,1)",
				        	          pointBorderColor: "#fff",
				        	          pointBackgroundColor: "rgba(179,181,198,1)",
				        	          data: [score1, score2, score3]
				        	        }
			             
			               console.log(cate1)
			               
			               if(cate1 =="M"){
			               new Chart(document.getElementById("radar-chart"), {
			        	    type: 'radar',
			        	    data: {
			        	      labels: ["디자인", "기능", "가격"],
			        	      datasets: [
			        	    	  appRader1,appRader2 
			        	      ]
			        	    },
			        	    options: {
			        	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 10}, //maxTicksLimit data 최대값의 2배
			        	    }
			        	})
			               }else if(cate1=="P"){
			            	   new Chart(document.getElementById("radar-chart"), {
					        	    type: 'radar',
					        	    data: {
					        	      labels: ["기능 및 디자인", "서비스", "CS"],
					        	      datasets: [
					        	    	  appRader1,appRader2 
					        	      ]
					        	    },
					        	    options: {
					        	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 10}, //maxTicksLimit data 최대값의 2배
					        	    }
					        	})
			               }else{
			            	   new Chart(document.getElementById("radar-chart"), {
					        	    type: 'radar',
					        	    data: {
					        	      labels: ["기능 및 디자인 ", "혜택", "CS"],
					        	      datasets: [
					        	    	  appRader1,appRader2 
					        	      ]
					        	    },
					        	    options: {
					        	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 10}, //maxTicksLimit data 최대값의 2배
					        	    }
					        	})
			               }
			               
			            $("#emotion-word-title1").text(data[0].appname)
			               
					},
					error:function(){
						console.log(error)
					}
					
				});
				let Emo1=1
				$.ajax({
					url:"compare/review",
					type:"get",
					data:{"appid":appid1, "emo":Emo1},
					success:function(data){
						let cul = data.emoCount/data.allCount*100
						  $("#emotion-word-rate1").text(cul.toFixed(1))
					},
					erorr:function(){
						console.log("n")
					}
				});
			
				$.ajax({
		    		url:"review/emo",
		    		type:"get",
		    		data:{"appid":appid1,"apppn":appemo1},
		    		success:function(data){
		    			 $("#compareReview1").html("");
		    			  for (let i =0; i<4; i++){
		    				  let reviews=
		    					  '<div class="gamsung-review-box kr-font">'+
		    					  '<div><h5>'+data[i].reviewTitle+'</h5></div>'+
		    					  '<div><p>'+data[i].reviewContent+'</p></div>'+
		                  		  '</div>';
		    				  $("#compareReview1").append(reviews);
		    			  	}
		    			  },
		    		error: function(){
		    			console.log("n")
		    		}
		    	});
			
			}
	})
	
	// 검색 어플 감성확률 
				
		 $("#emotionSelect1").on('change',function(){
			 let changeEmo1 = $("#emotionSelect1").val()
         		$.ajax({
         			url:"compare/review",
     	    		type:"get",
     	    		data:{"appid":appid1, "emo":changeEmo1},
     	    		success:function(data){
     	    			let cul = data.emoCount/data.allCount*100
     	    			  $("#emotion-word-rate1").text(cul.toFixed())
     	    		},
     	    		error: function(){
     	    			console.log("error")
     	    		}
     	    	});
          })
	
	
	let appRader2 ={};
	let appemo2="";
	let appid2="";
	//검색 어플 입력2 
	$("#compare2").on("keyup",function(key){
		
			if(key.keyCode==13) {
				let compareApp2 = $("#compare2").val();
				let cate2= $("#compareCate").val();
				$.ajax({
					url:"compare/app",
					type:"get",
					async: false,
					data:{"appname":compareApp2},
					success:function(data){
						$("#iconbox2").html("")
						$("#ratingbox2").html("")
						
						let icon ='<div class="icon-inner-box">'+
			                  '<div class="icon-img"><img src="'+data[0].appicon+'" style="border: 3px solid gray;border-radius: 7px;"></div>'+
			                  '<div>'+'<p>'+data[0].appname+'</p>'+'</div>'+
			                '</div>'
						$("#iconbox2").append(icon);
			             
						appemo2=data[0].apppn
						appid2=data[0].appid
			           
			            let rate ='<div class="rating-inner-box">'+
		                  '<div class="ratings">'+
		                  '<h4>'+data[0].apprating.toFixed(1)+'</h4>'+'</div>'+
			               '</div>'
			            $("#ratingbox2").append(rate);
			               let score1=data[0].evascore1*10
			               let score2=data[0].evascore2*10
			               let score3=data[0].evascore3*10
			               console.log(score1,score2,score3);
			            appRader2={
			        	          label: data[0].appname,
			        	          fill: true,
			        	          backgroundColor: "rgba(255,99,132,0.2)",
			        	          borderColor: "rgba(255,99,132,1)",
			        	          pointBorderColor: "#fff",
			        	          pointBackgroundColor: "rgba(255,99,132,1)",
			        	          pointBorderColor: "#fff",
			        	          data: [score1, score2, score3]
			        	        }
		          
			               
			            if(cate2 =="M"){
				               new Chart(document.getElementById("radar-chart"), {
				        	    type: 'radar',
				        	    data: {
				        	      labels: ["디자인", "기능", "가격"],
				        	      datasets: [
				        	    	  appRader1,appRader2 
				        	      ]
				        	    },
				        	    options: {
				        	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 10}, //maxTicksLimit data 최대값의 2배
				        	    }
				        	})
				               }else if(cate2=="P"){
				            	   new Chart(document.getElementById("radar-chart"), {
						        	    type: 'radar',
						        	    data: {
						        	      labels: ["기능 및 디자인", "서비스", "CS"],
						        	      datasets: [
						        	    	  appRader1,appRader2 
						        	      ]
						        	    },
						        	    options: {
						        	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 10}, //maxTicksLimit data 최대값의 2배
						        	    }
						        	})
				               }else{
				            	   new Chart(document.getElementById("radar-chart"), {
						        	    type: 'radar',
						        	    data: {
						        	      labels: ["기능 및 디자인 ", "혜택", "CS"],
						        	      datasets: [
						        	    	  appRader1,appRader2 
						        	      ]
						        	    },
						        	    options: {
						        	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 10}, //maxTicksLimit data 최대값의 2배
						        	    }
						        	})
				               }
			            $("#emotion-word-title2").text(data[0].appname)

					},
					error:function(){
						console.log(error)
				}
					
				});
				let Emo2 =1
				$.ajax({
					url:"compare/review",
					type:"get",
					data:{"appid":appid2, "emo":Emo2},
					success:function(data){
						let cul = data.emoCount/data.allCount*100
						  $("#emotion-word-rate2").text(cul.toFixed(1))
					},
					erorr:function(){
						console.log("n")
					}
				});
				
				$.ajax({
		    		url:"review/emo",
		    		type:"get",
		    		
		    		data:{"appid":appid2,"apppn":appemo2},
		    		success:function(data){
		    			$("#compareReview2").html("");
		    			  for (let i =0; i<4; i++){
		    				  let reviews=
		    					  '<div class="gamsung-review-box kr-font">'+
		    					  '<div><h5>'+data[i].reviewTitle+'</h5></div>'+
		    					  '<div><p>'+data[i].reviewContent+'</p></div>'+
		                  		  '</div>';
		    				  $("#compareReview2").append(reviews);
		    			  	}
		    			  },
		    		error: function(){
		    			console.log("n")
		    		}
		    	});
				
			}
	})
	
	//검색 어플 감성확률2
	 $("#emotionSelect2").on('change',function(){
		 let changeEmo2 = $("#emotionSelect2").val()
         		$.ajax({
         			url:"compare/review",
     	    		type:"get",
     	    		data:{"appid":appid2, "emo":changeEmo2},
     	    		success:function(data){
     	    			let cul = data.emoCount/data.allCount*100
						  $("#emotion-word-rate2").text(cul.toFixed(1))
     	    		},
     	    		error: function(){
     	    			console.log("error")
     	    		}
     	    	});
          })
	
 	$("#logout").on("click",function(){
 		sessionStorage.clear()
 		location.href="logout.do"
 	});
     
</script>
    
  </body>
</html>