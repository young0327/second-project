 $("document").ready(function(){
    	  let id = sessionStorage.getItem("users")
    	  console.log(id)
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
  	