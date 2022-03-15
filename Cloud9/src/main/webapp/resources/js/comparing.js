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
	      scale:{
	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
	    	pointLabels:{
	    		fontSize:18,
	    		fontColor: '#000000'
	    	}
			}
	    }
	});
	
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
			        	    	  scale:{
			        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
			        	  	    	pointLabels:{
			        	  	    		fontSize:18,
			        	  	    		fontColor: '#000000'
			        	  	    	}
			        	  			}
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
					        	    	 scale:{
						        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
						        	  	    	pointLabels:{
						        	  	    		fontSize:18,
						        	  	    		fontColor: '#000000'
						        	  	    	}
						        	  			}
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
					        	    	 scale:{
						        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
						        	  	    	pointLabels:{
						        	  	    		fontSize:18,
						        	  	    		fontColor: '#000000'
						        	  	    	}
						        	  			}
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
	
	
	$("#vsbtn1").on("click",function(){
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
	        	    	 scale:{
		        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
		        	  	    	pointLabels:{
		        	  	    		fontSize:18,
		        	  	    		fontColor: '#000000'
		        	  	    	}
		        	  			}
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
			        	    	 scale:{
				        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
				        	  	    	pointLabels:{
				        	  	    		fontSize:18,
				        	  	    		fontColor: '#000000'
				        	  	    	}
				        	  			}
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
			        	    	 scale:{
				        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
				        	  	    	pointLabels:{
				        	  	    		fontSize:18,
				        	  	    		fontColor: '#000000'
				        	  	    	}
				        	  			}
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
				        	    	 scale:{
					        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
					        	  	    	pointLabels:{
					        	  	    		fontSize:18,
					        	  	    		fontColor: '#000000'
					        	  	    	}
					        	  			}
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
						        	    	 scale:{
							        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
							        	  	    	pointLabels:{
							        	  	    		fontSize:18,
							        	  	    		fontColor: '#000000'
							        	  	    	}
							        	  			}
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
						        	    	 scale:{
							        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
							        	  	    	pointLabels:{
							        	  	    		fontSize:18,
							        	  	    		fontColor: '#000000'
							        	  	    	}
							        	  			}
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
     
	$("#vsbtn2").on("click",function(){
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
		        	    	 scale:{
			        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
			        	  	    	pointLabels:{
			        	  	    		fontSize:18,
			        	  	    		fontColor: '#000000'
			        	  	    	}
			        	  			}
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
				        	    	 scale:{
					        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
					        	  	    	pointLabels:{
					        	  	    		fontSize:18,
					        	  	    		fontColor: '#000000'
					        	  	    	}
					        	  			}
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
				        	    	 scale:{
					        	  	    	ticks: { beginAtZero: true, display: false, max: 10, min: 0, stepSize: 1 },
					        	  	    	pointLabels:{
					        	  	    		fontSize:18,
					        	  	    		fontColor: '#000000'
					        	  	    	}
					        	  			}
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
	
	
	})