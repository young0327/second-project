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
      
      //페이지 접속시 즐겨찾기 리스트 출력
      $("document").ready(function(){
    	  let id = "<c:out value ='${users.id}'/>"
    		  $("#myFavorite").html("")
    		  $.ajax({
          		  url:"bookmark/img",
          	  	  type:"get",
          	  	  data:{"id":id},
          	  	  success: function(data){
          	  		  console.log(data)
          	  		 
          	  	for(let i=0; i<data.length;i++){
          	  		let appicon = 
          	  			'<div class="myIcon-box" id="'+data[i].appid+'">'+
          	  			'<a href="detail.do?appid='+data[i].appid+'">'+
          	  					'<img src="'+data[i].appicon+'">'+
          	  					'</div>'+'</a>'
          	  				$("#myFavorite").append(appicon)
          	  	}
         	  			
          	  	  },
          	  	  error:function(){
          	  		  console.log("즐겨찾기 리스트 출력 실패")
          	  	  }
          	  	  })
      })
      
      
      // 페이지 접속시 즐겨찾기 확인
      let bookYN="";
      $("document").ready(function(){
    	  let appid=$("#appid").text()
        	 let id = sessionStorage.getItem("users")
      	  $.ajax({
      		  url:"bookmark/list",
      	  	  type:"get",
      	  	  data:{"appid":appid, "id":id},
      	  	  success: function(data){
      	  		  bookYN=data
      	  		if(data==0){
      	  		$(".likebtn").css("color","black")
      	  		}else{
      	  		$(".likebtn").css("color","red")
      	  		}
     	  	  },
     	  	  erorr:function(){
     	  		  console.log("즐겨찾기 읽기 실패")
     	  	  }
     	  	  
      	  })  
      })
      // 페이지 접속시 도움이 되는 리뷰 출력
      $("document").ready(function(){
    	  let appid=$("#appid").text()
    	  $.ajax({
    		  url:"review",
    		  type:"get",
    		  data:{"appid":appid},
    		  success:function(data){
    		  if(data==0){
    		  for (let i =0; i<4; i++){
	    				  let reviews=
	    					   '<div class="helpful-box">'+
	                     		'<div class="helpful-inner">'+
	                        	'<div class="helpful-top kr-font" style="font-weight:700; font-size:20px;"><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspAppV:가 도움이 될만한 리뷰를 수집 중입니다&nbsp:)</p>'+'</div>'+
	                        	'<div class="kr-font" style="margin-top:-10px;"><span style="font-weight:400"></span><span style="margin-left:62%; color: rgb(161, 161, 161);"></span></div>'+
	                        	'<div class="kr-font" style="font-size:20px;"><p></p></div>'+
	                        	'<div class="kr-font"><p></p>'+
	                     		 '</div>'+
	                    		'</div>';
	    				  
	    				  $("#reviewbox").append(reviews);
	    				  }
    		  }else{
	    			 for (let i =0; i<4; i++){
	    				  let reviews=
	    					   '<div class="helpful-box">'+
	                     		'<div class="helpful-inner">'+
	                        	'<div class="helpful-top kr-font" style="font-weight:700; font-size:20px;"><p>' + data[i].reviewTitle +'</p>'+'</div>'+
	                        	'<div class="kr-font" style="margin-top:-10px;"><span style="font-weight:400">'+data[i].appWriter +'</span><span style="margin-left:62%; color: rgb(161, 161, 161);">'+data[i].reviewDate+'</span></div>'+
	                        	'<div class="kr-font" style="font-size:20px;"><p><i class="fas fa-star" style="font-size:18px; color:yellow;"></i>&nbsp' + data[i].reviewRating + '</p></div>'+
	                        	'<div class="kr-font"><p>'+data[i].reviewContent+'</p>'+
	                     		 '</div>'+
	                    		'</div>';
	    				  
	    				  $("#reviewbox").append(reviews);
	    			  }
    			  }
    		  },
    		  error:function(){
    			  console.log("error")
    		  }
    	  })
      })
      
      
 
      // 즐겨찾기 추가
      $(".likebtn").on("click",function(){
      let id = sessionStorage.getItem("users")
    	 let appids=$("#appid").text()
    	 let urls = $(".iconimg").attr("src")
    	  		  if( $(".likebtn").attr("style")=="color: black;"){
    	  			  $.ajax({
    	  				  url:"bookmark/enroll",
    	  				  type:"post",
    	  				  data:{"appid":appid,"id":id},
    	  				  success:function(data){
    	  				  if(data=="Y"){
    	  					alert("관심있는 어플에 등록 되었습니다.");
    	  	    	 		$(".likebtn").css("color","red")
    	  	    	 		appicon = 
          	  			'<div class="myIcon-box" id="'+appids+'">'+
          	  			'<a href="detail.do?appid="'+appids+'">'+
          	  					'<img src="'+urls+'">'+
          	  				'</a>'+'</div>'
          	  				$("#myFavorite").append(appicon)
    	  	    	 	}else{
    	  	    	 		alert("로그인 후 이용해 주세요");
    	  	    	 	}	
    	  				  },
    	  				  error:function(){
    	  					  console.log("관심어플 등록 실패")
    	  				  }
    	  			  })
    	  		  }else{
    	  			 $.ajax({
   	  				  url:"bookmark/cancel",
   	  				  type:"delete",
   	  				  data:{"appid":appid,"id":id},
   	  				  success:function(){
   	  				 alert("관심있는 어플에 등록이 해제되었습니다.");
   	    		  $(".likebtn").css("color","black");
   	    		  $('#'+appids).attr("style","display:none")
   	  				  },
   	  				  error:function(){
   	  					  console.log("관심어플 취소 실패")
   	  					
   	  				  }
   	  			  })
    	  		  }
    	  		  
 })
      
      //도넛차트
    
    
    
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
	   				 position : 'right',
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
    	let month = 6;
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
				axisDataItem.set("value",appvalue*5);
			    var label = chart.radarContainer.children.push(am5.Label.new(root, {
			      fill: am5.color(0xffffff),
			    }));

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
			        fontSize: "1.1em",
			        fill: root.interfaceColors.get("black")
			      });
			    });
			    
			    // Make stuff animate on load
			    chart.appear(1000, 100);
    });

    // 감정분석 리뷰
     $("#detailBtn2").on("click",function(){
    	
    		$.ajax({
	    		url:"review/emo",
	    		type:"get",
	    		data:{"appid":appid,"apppn":apppn},
	    		success:function(data){
	    		console.log(data)
	    		let size = data.length
	    			  for (let i = size-1; i>size-4; i--){
	    				  let reviews=
	    					  '<div class="review-box kr-font">'+
	                  				'<div class="review-inner" style="text-align:left;">'+
	                  					'<p style="font-size:20px;">'+data[i].reviewTitle+'</p>'+
	                  					'<p>'+data[i].reviewContent+'</p>'+'</div>'+'</div>'
	                    		;
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
    	let emos = $("#emotionSelect").val()
    	  $.ajax({
    		  url:"review/per",
    		  type:"get",
    		  data:{"appid":appid,"emo":emos},
    		  success:function(data){
				let cul=data.emoCount/data.allCount*100
    			  $("#emotion-word-rate").text(cul.toFixed(1))
    		  },
    		  error:function(){
    			  console.log("error")
    		  }
    	  })
     });
     
    	 $("#emotionSelect").on('change',function(){
			let emos = $("#emotionSelect").val()
         		$.ajax({
     	    		url:"review/per",
     	    		type:"get",
     	    		data:{"appid":appid,"emo":emos},
     	    		success:function(data){
						let cul=data.emoCount/data.allCount*100
     	    			  $("#emotion-word-rate").text(cul.toFixed(1))
     	    		},
     	    		error: function(){
     	    			console.log("error")
     	    		}
     	    	});
          });
     
    	
    	<!-- Resources -->
<!-- Chart code -->


