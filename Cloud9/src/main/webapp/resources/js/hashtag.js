 $("document").ready(function(){
  		for(let i=0; i<appids.length;i++){
  			let appidd=appids[i].appid
  			console.log(appid)
  			$.ajax({
  			url:"hashtag",
  			type:"get",
  			data:{"appid":appidd},
  			success:function(data){
  				console.log(data)
  			},
  			error:function(){
  				console.log("E")
  			}
  			
  		})
  		}
  		
  	})