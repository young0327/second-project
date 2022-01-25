$("#paySelect").on("change",function(){
    	let payD = $(this).val();
      	let payCate ='<c:out value='${cateList[0].appcate}'/>'
    	
    	  console.log("payD:"+payD)
    	  console.log("payCate:"+payCate)
    	  $.ajax({
    		  url:"cate/pay",
    		  type:"get",
    		  data:{"payD":payD, "payCate":payCate},
    		  success:function(data2){
    			  var data = data2;
    			  $(".result-box row").html('');
    			  var fin = ""
    			  for(let i=0; i<data.length; i++){
    				  console.log(data[i].appprice);
    				  var text = data[i].appprice==null?"무료":data[i].appprice;
	    			  let payList = `<div class="result-box row"><div class="app-icon-img col-md-3"><img src="`
	    			  +data[i].appicon
	    			  +`"></div><div class="kr-font app-content-box col-md-9"><h4 class="kr-font"><a href="detail.do?appid=`+data[i].appname
	    				+`">`
	    				+data[i].appname
	    				+`</h4><p class="kr-font" style="font-size: 23px;">`
	    				+data[i].apprating.toFixed(1)
	    				+`<span style="font-size: 15px;">&nbsp&nbsp&nbsp`
	    				+text
	    				+`</span></p><p class="word" style="margin-left: 590px; margin-top: -40px;">`
	    				+data[i].appcompany
	    				+`</p></div></div>`;
                //$(".categoryBox").append(payList);
                	fin+=payList;
    			 }
                $(".categoryBox").html(fin);
    		  },
    		  error:function(){
    			  console.log("error")
    		  }
    	  });
      })