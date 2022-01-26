  var write = document.querySelector('.writing')
      var comm_modal = document.querySelector('.comm-black-modal')
      var commBtn = document.querySelector('#commbtn')
      write.addEventListener('click',function(){
    	  let id = "<c:out value='${users.id}'/>"
    	       	if(id==""){
    	       		alert("로그인해야 글을 작성할 수 있습니다.");
    	     	  	} else {
    	     	 		comm_modal.style.display ='block'
    	     	  	}   
      })
		
      comm_modal.addEventListener('click', function(e){
        if(e.target == e.currentTarget){
          comm_modal.style.display = 'none'
        }
      })
      
      // write modal page
      var article = document.querySelectorAll('.article')
      var board_modal = document.querySelector('.board-detail-blackmodal')
      comm_modal.addEventListener('click', function(e){
        if(e.target == e.currentTarget){
          comm_modal.style.display = 'none'
        }
      })
      // write modal page end
      //  detail modal page start HERE
      article.forEach(function(e){
        e.addEventListener('click',function(){
          board_modal.style.display = 'block'
        })
      })
      board_modal.addEventListener('click', function(e){
        if(e.target == e.currentTarget){
          board_modal.style.display = 'none'
        }
      })
      //  detail modal page end
      // modifying modal page start HERE
      var modifying = document.querySelector('.fa-recycle')
      var modifyModal = document.querySelector('.modifying-modal-black')
      modifying.addEventListener('click',function(){
        board_modal.style.display = 'none';
        modifyModal.style.display = 'block';
      })
       	modifyModal.addEventListener('click', function(e){
        if(e.target == e.currentTarget){
          modifyModal.style.display = 'none'
        }
      })
     
   
    //게시판 리스트 리딩
   $(".cate").on("click",function(){
	   $('div.article-box').html('');
    	let cateN =$(this).val();
    	  $.ajax({
    		  url:"board/list",
    		  type:"get",
    		  data: {"cate":cateN},
    		  success:function(data){
    			  for(let i = 0; i < data.length; i++){
    			  let articles = `
    			  		 <div class="article-list">
    			          <span class="article kr-font" style ="pointer-events: none;">` + data[i].category + `</span>
    			          <a><h5 class="article kr-font" data-value="` + data[i].bidx +`">` + data[i].title + `</h5></a>
    			          <div>
    			            <a><p class="article kr-font" id="test" data-value="`+ data[i].bidx + `">` + data[i].content + `</p></a>
    			          </div>
    			          <div>
    			            <span class="article kr-font" style ="pointer-events: none;">` + data[i].id + `</span>
    			          </div>
    			        </div>
    				  	`;
    			  $('.article-box').append(articles);	
    			  }
    		  },
    		  error:function(){
    		  }
    	  });
    })
    
  
    
    //게시글 작성
    $("#commbtn").on("click",function(){
    	let WriteData = $("#write_frm").serialize();
    	console.log(WriteData)
    	$.ajax({
    		url:"board",
    		type: "post",
    		data: WriteData,
    		success : function(){
    			alert("글이 작성되었습니다.")
    			comm_modal.style.display = 'none';
    			 location.href=("community.do?category=category0")
    		},
    		error: function(){
    			alert("error")
    		}
    	});
    })
  
    
    //게시글 상세 보기
   $(document).on("click",".article",function(){
    	let bidx= $(this).attr("data-value");
    	$.ajax({
    		url:"board/bidx",
    		type:"get",
    		data:{"bidx":bidx},
    		success: function(data){
    			board_modal.style.display = 'block'
    			let ps = $('.md');
    			$(ps[0]).html(data[0].category);
    			$(ps[1]).html(data[0].title);
    			$(ps[2]).html(data[0].id);
    			$(ps[3]).html(data[0].day);
    			$(ps[4]).html(data[0].content);
    			$(ps[5]).html(data[0].bidx);
    		},
    		error: function(){
    			console.log("전송 성공")
    		}
    	});
    })
    
    
    //게시글 수정
   
   $("#boardModify").on("click",function(){
	   let ps = $('.md');
	   let id1= $(ps[2]).html()
	   let id="<c:out value='${users.id}'/>"
	   if (id!=id){
		   modifyModal.style.display = 'none';
		   alert("작성자만 글을 수정할 수 있습니다.")
  		 }else{
    	let bidx= $("#detailBidx").html()
    	$.ajax({
    		url: "board/bidx",
    		type: "get",
    		data:{"bidx":bidx},
    		success:function(data){
    			let modi = $('.mdc');
    			$(modi[1]).html(data[0].bidx)
    			$(modi[2]).val(data[0].title)
    			$(modi[3]).val(data[0].content)
    		},
    		error:function(){
    			alert("error")
    		}
    	});
    	}
    }) 
    
    $("#modibtn").on("click",function(){
	   	let category =$("#modicate option:selected").val()
	    let title = $("#modititle").val()
	    let content = $("#modicontent").val()
    	let bidx = $("#modiBidx").text()
    	$.ajax({
    		url:"board",
    		type:"patch",
    		data:{"bidx":bidx, "category":category, "title":title, "content":content},
    		success:function(){
    			alert("수정하였습니다.");
		        location.href=("community.do?category=category0")
    		},
    		error:function(){
    			alert("error")
    		}
    	});
    })
    
    
    // 게시글 삭제
    $("#boardDelete").on("click",function(){
   	  let ps = $('.md');
   	   let id1= $(ps[2]).html()
   	   let id = sessionStorage.getItem("users")
   	   if (id1!=id){
   		   modifyModal.style.display = 'none';
   		   alert("작성자만 글을 삭제 할 수 있습니다.")
     		 }else{
    	let bidx= $("#detailBidx").text()
    	$.ajax({
    		url :"board/bidx",
    		type:"delete",
    		data:{"bidx":bidx},
    		success: function(){
				alert("글이 삭제 되었습니다.")
				board_modal.style.display = 'none';
				 location.href=("community.do?category=category0")
    		},
    		error: function(){
    			console.log("삭제 실패")
    		}
    	});
    }
    });
    