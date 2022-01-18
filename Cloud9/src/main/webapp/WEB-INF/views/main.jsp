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
    <style>
      #chartdiv {
        width: 100%;
        height: 400px;
      }
      </style>
  </head>
  <body>

    
      
      
    <!-- Side Bar Start-->
    <div class="main-box" style="background-image: url('./resources/img/darkness.jpg');">
      <div class="main-top">
        <div class="top-title-box">
          <div class="title-inner-box" style="width:30%"></div>
          <div class="title-inner-box">
            <form class="form-inline" action="search.do">
            <button class="search-btn"><i class="fas fa-search"></i></button>
            <input class="main-input" type="search" placeholder="어플 이름을 입력하세요" aria-label="Search" name ="appname" id="appSearch" autocomplete="off">
          </form>
          </div>
          <div class="title-inner-box" style="width:30%">
          </div>
        </div>
      </div>
      <div class="main-bottom">
        <div class="bottom-topbox">
          <div class="app-example-box">
            <div class="app-animation-box animation-left">
              
            </div>
            <div class="app-animation-box" style="width: 20%;">
              <div class="appicon-box">
                <p class="font-kr" style="color: white; font-size:24px;">라인과 카카오톡을 비교하면?!</p>
                <div><img src="./resources/img/kakaoLine.png"></div>
              </div>
            </div>
            <div class="app-animation-box animation-right">
              <transition name='fade'><div class="chart-box"><div id="chartdiv"></div></div></transition>
            </div>
          </div>
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
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
   
    <script>
      $('.category').on('click',function(){
        $('.list-group').slideToggle();
      })

    </script>
  	
  	<!-- Resources -->
  	<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
  	<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
  	<script src="https://cdn.amcharts.com/lib/5/radar.js"></script>
  	<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

  	<!-- Chart code -->
  	<script>
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
  	  startAngle: 180,
  	  endAngle: 360
  	}));


  	// Create axis and its renderer
  	// https://www.amcharts.com/docs/v5/charts/radar-chart/gauge-charts/#Axes
  	var axisRenderer = am5radar.AxisRendererCircular.new(root, {
  	  innerRadius: -180
  	});

  	axisRenderer.grid.template.setAll({
  	  stroke: root.interfaceColors.get("background"),
  	  visible: true,
  	  strokeOpacity: 0.8
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
  	  pinRadius: am5.percent(20),
  	  radius: am5.percent(70),
  	  bottomWidth: 40
  	})

  	var bullet = axisDataItem.set("bullet", am5xy.AxisBullet.new(root, {
  	  sprite: clockHand
  	}));

  	xAxis.createAxisRange(axisDataItem);

  	var label = chart.radarContainer.children.push(am5.Label.new(root, {
  	  fill: am5.color(0xffffff),
  	  centerX: am5.percent(50),
  	  textAlign: "center",
  	  centerY: am5.percent(50),
  	  fontSize: "3em"
  	}));

  	axisDataItem.set("value",1.6);
  	bullet.get("sprite").on("rotation", function () {
  	  var value = axisDataItem.get("value");
  	  var text = Math.round(axisDataItem.get("value")).toString();
  	  var fill = am5.color(0x000000);
  	  xAxis.axisRanges.each(function (axisRange) {
  	    if (value >= axisRange.get("value") && value <= axisRange.get("endValue")) {
  	      fill = axisRange.get("axisFill").get("fill");
  	    }
  	  })

  	  //label.set("text", Math.round(value).toString());
  	  label.set("text", value.toString());

  	  clockHand.pin.animate({ key: "fill", to: fill, duration: 500, easing: am5.ease.out(am5.ease.cubic) })
  	  clockHand.hand.animate({ key: "fill", to: fill, duration: 500, easing: am5.ease.out(am5.ease.cubic) })
  	});



  	chart.bulletsContainer.set("mask", undefined);


  	// Create axis ranges bands
  	// https://www.amcharts.com/docs/v5/charts/radar-chart/gauge-charts/#Bands
  	var bandsData = [{
  	  title: "ㅅㅄㅄㅄㅂ",
  	  color: "#ee1f25",
  	  lowScore: 0,
  	  highScore: 1,
  	}, {
  	  title: "ㅅㅂ?",
  	  color: "#f04922",
  	  lowScore: 1,
  	  highScore: 2
  	}, {
  	  title: "보통",
  	  color: "#fdae19",
  	  lowScore: 2,
  	  highScore: 3
  	}, {
  	  title: "좀좋아",
  	  color: "#f3eb0c",
  	  lowScore: 3,
  	  highScore: 4
  	}, {
  	  title: "개좋아",
  	  color: "#b0d136",
  	  lowScore: 4,
  	  highScore: 5
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
  	    fillOpacity: 0.8
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

  	}); // end am5.ready()
  	
  	</script>
  
  </body>
</html>
    
    
  </body>
</html>