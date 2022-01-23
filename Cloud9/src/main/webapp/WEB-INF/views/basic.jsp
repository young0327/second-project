<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36dce637eed1116a31d651d8b881cf78"></script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<script>
	$("#compare1").on("keyup",function(key){
			if(key.keyCode==13) {
				let compareApp1 = $("#compare1").val();
				console.log(compareApp1)
				
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
			          
			        	new Chart(document.getElementById("radar-chart"), {
			        	    type: 'radar',
			        	    data: {
			        	      labels: ["항목1", "항목2", "항목3"],
			        	      datasets: [appRader1,appRader2
			        	      ]
			        	    },
			        	    options: {
			        	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 }, //maxTicksLimit data 최대값의 2배
			        	    }
			        	});
			           
					},
					error:function(){
						console.log(error)
					}
					
				});
			}
	})
</scripy>
</body>
</html>
