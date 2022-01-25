 $("document").ready(function(){
    	  let id = sessionStorage.getItem("users")
    		  $("#myFavorite").html("")
    		  $.ajax({
          		  url:"bookmark/img",
          	  	  type:"get",
          	  	  data:{"id":id},
          	  	  success: function(data){
          	  	for(let i=0; i<data.length;i++){
          	  		let appicon = 
          	  			'<div class="myIcon-box" id="'+data[i].appid+'">'+
          	  			'<a href="detail.do?appid='+data[i].appid+'">'+
          	  					'<img src="'+data[i].appicon+'">'+
          	  					'</a>'+'</div>'
          	  				$("#myFavorite").append(appicon)
          	  	}
         	  			
          	  	  },
          	  	  error:function(){
          	  		  console.log("즐겨찾기 리스트 출력 실패")
          	  	  }
          	  	  })
      })
  	//즐겨찾기 삭제
      $("#bookmarkbtn").on("click",function(){
    	  let appid=$("#myFavorite").children().first().attr("id")
    	  let id = "<c:out value ='${users.id}'/>"
    	  console.log(appid)
    		  $.ajax({
	  				  url:"bookmark/cancel",
	  				  type:"delete",
	  				  data:{"appid":appid,"id":id},
	  				  success:function(){
	  			$("#myFavorite").children().first().attr('style',"display:none")
	  				  },
	  				  error:function(){
	  					  console.log("관심어플 취소 실패")
	  					
	  				  }
	  			  })
      })