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
    <link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/community.css">
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/main.css?ver=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>Hello, world!</title>
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

    <!-- Community Modal Start-->
     <div class="comm-black-modal">
      <div class="comm-white-modal shadow p-3 mb-5 bg-white rounded">
        <div class="modal-box">
         <form id ="write_frm">
          <div class="comm-writing"><p style="font-family: 'Noto Sans KR', sans-serif;">글쓰기</p></div>
          <div class="comm-writer"><p class="modal-p">작성자</p>
          <input class="comm-input kr-font" type='text' name ="nick" value ="${users.nick}"readonly="readonly"></div>
          <div class="comm-option">
            <p class="modal-p kr-font">카테고리</p>
            <select class="modal-select kr-font" name ="category">
              <option value="category1">category1</option>
              <option value="category2">category2</option>
              <option value="category3">category3</option>
              <option value="category4">category4</option>
              <option value="category5">category5</option>
            </select>
          </div>
          <div class="comm-title"><p class="modal-p">제목</p><input class="comm-input" type='text' id= 'title' name='title'></div>
          <div class="comm-content"><p class="modal-p">내용</p><textarea class="modal-area" id='content' name='content'></textarea></div>
          <div class="comm-btn"><button type="button" id="commbtn" class="btn btn-dark">작성하기</button></div>
           </form>
        </div>
      </div>
    </div>
  </div>
    <!-- Community Modal End-->
	 <!-- board detail Modal start HERE-->
   <div class="board-detail-blackmodal">
      <div class="board-detail-whitemodal shadow p-3 mb-5 bg-white rounded">
        <div class="modal-box">
          <div class="detail-topbox" >
            <div><p class="detail md"></p></div>
            <div><p class="detail-title md"></p></div>
            <div><p class="detail md"></p></div>
            <div class="detail-date md"></div>
          </div>
          <div class="detail-botbox">
            <p class="detail md"></p>
            <p class="detail md" style="display:none" id ="detailBidx"></p>
          </div>
          <div class="detail-btnbox">
            <div><button class="detail-btn btn" id ="boardDelete">  <i class="fas fa-trash-alt"></i></button></div>
            <div><button class="detail-btn btn" id ="boardModify">  <i class="fas fa-recycle"></i></button></div>
          </div>
        </div>
      </div>
    </div>
    <!-- board detail Modal end-->
     <!--modifying Modal start HERE-->
     <div class="modifying-modal-black">
      <div class="modifying-modal-white">
        <form id="modifyFrm">
        <div class="modifying-modal-box">
          <div class="modifying-writing"><p style="font-family: 'Noto Sans KR', sans-serif;">글 수정하기</p></div>
          <div class="modifying-writer"><p class="modifying-modal-p">작성자</p><input class="modifying-input mdc" type='text' value ="${users.nick}"readonly="readonly"></div>
          <span class="mdc" id="modiBidx" style="display:none"></span>
          <div class="modifying-option">
            <p class="modifying-modal-p">카테고리</p>
            <select class="modifying-modal-select" name= "modicate" id="modicate">
           	  <option value="category1">category1</option>
              <option value="category2">category2</option>
              <option value="category3">category3</option>
              <option value="category4">category4</option>
              <option value="category5">category5</option>
            </select>
          </div>
          <div class="modifying-title"><p class="modifying-modal-p">제목</p><input class="modifying-input mdc" type='text' name='title' id ="modititle"></div>
          <div class="modifying-content"><p class="modifying-modal-p">내용</p><textarea class="modifying-modal-area mdc" name ='content' id="modicontent"></textarea></div>
          <div class="modifying-btn"><button type="submit" id="modibtn" class="btn btn-dark">수정하기</button></div>
        </div>
          <form>
      </div>
    </div>
    <!--modifying Modal start-->
    <!-- Navbar Start-->
    <div class="navbar-box row">
      <div class="col-sm-2 logobox"><a href="main.jsp"><img class="logo-img" ></a></div>
      <div class="col-sm-4">
        <nav class="navbar navbar-light bg-white">
          <div><form class="form-inline">
            <button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
            <input class="search-input mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          </form></div>
        </nav>
      </div>
      <div class="col-sm-1 loginbox"></div>
      <c:choose>
        	<c:when test="${empty users}">
        		<div style="text-align: center; margin-left:-20px;" class="col-sm-3 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><button type="button" class="top-icon-btn btn btn-secondary">Login</button></p></div>
      		</c:when>
      		<c:otherwise>
       			<div class="col-sm-3 loginbox solo"><p class="welcomeBoard kr-font">${users.nick}님 반갑습니다</p></div>
       		</c:otherwise>
       		</c:choose>	
       <c:choose>
      	<c:when  test ="${!empty users.nick}">
      		<div style='margin-left:30px; margin-top:23px; display:block' ><a class="nav-font-en"><button class='top-icon-btn btn btn-dark' id ="logout">LOGOUT</button></a></div>
      		<div style="text-align: right; display:none" class="col-sm-1 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><button type="button" class="top-icon-btn btn btn-dark">Register</button></a></div>
      	</c:when>
      	<c:otherwise>
      	      <div style='margin-left:30px; margin-top:23px; display:none' ><a class="nav-font-en"><button class='top-icon-btn btn btn-dark' id ="logout">LOGOUT</button></a></div>
      		  <div style="text-align: right; display:block;" class="col-sm-1 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><button type="button" class="top-icon-btn btn btn-dark">Register</button></a></div>
      	</c:otherwise>
      </c:choose>
    </div>
  </nav>
    <!-- Navbar end-->
    <!-- Side Bar Start-->
    <div class="main-box" id="main-box">
      <div class="main-sub row">
        <div class="sidebar col-sm-2" id="List">
          <ul class="sidebar-list">
          	<li class="sidebar-personal-list" ><i class="icon fas fa-home"></i><a class="list-a category kr-font" href="main.jsp">홈 화면
            <li class="sidebar-personal-list" ><i class="icon fas fa-adjust"></i><a class="list-a category kr-font" href="#">카테고리
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">category1</a>
                <a href="#" class="list-group-item list-group-item-action">category2</a>
                <a href="#" class="list-group-item list-group-item-action">category3</a>
              </div>
            </a></li>
            <li class="sidebar-personal-list" ><i class="icon fas fa-not-equal"></i><a class="list-a kr-font" >유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a kr-font" href="community.do?category=category0">커뮤니티</a></li>
            <li class="sidebar-personal-list"><i class="icon far fa-comment-alt"></i><a class="list-a kr-font writing">글 작성</a></li>
           </ul>
          <!-- Side Bar end--> 
        </div>
        <div class="main-content-box col-sm-10 row">
          <div class="community-left-box">
            <div class="left-inner-box shadow p-3 mb-5 bg-white rounded">
              <div class="article-navbox">
                <ul class="article-navbox-ul row nav-font-en">
                  <li class="col-sm-2 cate" value=0>전체 강의</li>
                  <li class="col-sm-2 cate" value=1>Category1</li>
                  <li class="col-sm-2 cate" value=2>Category2</li>
                  <li class="col-sm-2 cate" value=3>Category3</li>
                  <li class="col-sm-2 cate" value=4>Category4</li>
                  <li class="col-sm-2 cate" value=5>Category5</li>
                </ul>
              </div>
              
              <div class="article-box">
               <c:forEach items="${boardlist}" var="list">          
                <div class="article-list kr-font">
                  <span class="article kr-font" style ="pointer-events: none;">${list.category}</span>
                  <a><h5 class="article kr-font" data-value="${list.bidx}">${list.title}</h5></a>
                  <div>
                    <a><p class="article kr-font" id="test" data-value="${list.bidx}">${list.content}</p></a>
                  </div>
                  <div>
                    <span class="article kr-font" style ="pointer-events: none;" id ="list_nick">${list.nick}</span>
                  </div>
                </div>
               </c:forEach>
              
            </div>
          </div>
        </div>
      </div>
        
    </div>
</body>




    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
       var Modal = new Vue({
        el : '.Modal',
        data : {
          modalOpen : true,
        }
      })
       
     // function write_right(e){
   		//let id = "<c:out value='${users.id}'/>"
      	//if(id==""){
      // 		// 글쓰기 모달창 안열리게 해주세요!
       //		alert("로그인해야 글을 작성할 수 있습니다.");
     	//  	} 
      // }
       
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
     
      
      // modifying modal page end
      
      $('.category').on('click',function(){
        $('.list-group').slideToggle();
      })
      
      // 로그인 확인 및 설정 
      $(document).on('click','#btn_Login',function(){
		if($('#id').val()!="" && $('#pwd').val()!=""){
			let loginData=$("#frm").serialize();
			$.ajax({ 
				url:"login.do",
				type: "post",
				data : loginData,
				success : function(YN){
					console.log(YN)
					if(YN=="y"){
						location.href="main"
					}else{
						alert("아이디와 비밀번호를 확인해 주세요");
					}
				},
				error : function(){
					alert("아이디와 비밀번호를 확인해 주세요");
				}
			});
			
		}else{
			
			if($('#id').val()==""){
				alert("아이디를 입력해 주세요")
			}
			
			if($('#pwd').val()==""){
				alert("비밀번호를 입력해 주세요")
			}
		}
	});
     
    // 로그아웃
    $("#logout").on("click",function(){
      	$.ajax({
      		url:"logout.do",
      		success:function(){
      			location.reload();
      		},
      		error:function(){}
      	})
      })
      
    //게시판 리스트 리딩
   $(".cate").click(function(){
	  	$('div.article-box').html('');
    	cateN = "category"+this.value;
    	console.log(cateN);
    	  $.ajax({
    		  url:"boardListAjax.do",
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
    			            <span class="article kr-font" style ="pointer-events: none;">` + data[i].nick + `</span>
    			          </div>
    			        </div>
    				  	`;
    			  $('.article-box').append(articles);	
    			  }
    			  console.log(data)
    		  },
    		  error:function(){
    		  }
    	  });
    })
    
  
    
    //게시글 작성
    $("#commbtn").on("click",function(){
    	let WriteData = $("#write_frm").serialize();
    	$.ajax({
    		url:"boardwrite.do",
    		type: "get",
    		data: WriteData,
    		success : function(){
    			alert("글이 작성되었습니다.")
    			comm_modal.style.display = 'none';
    			location.href=("community.do?category")
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
    		url:"boardread.do",
    		type:"get",
    		data:{"bidx":bidx},
    		success: function(data){
    			board_modal.style.display = 'block'
    			let ps = $('.md');
    			$(ps[0]).html(data[0].category);
    			$(ps[1]).html(data[0].title);
    			$(ps[2]).html(data[0].nick);
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
	   let nick1= $(ps[2]).html()
	   let nick="<c:out value='${users.nick}'/>"
	   if (nick1!=nick){
		   modifyModal.style.display = 'none';
		   alert("작성자만 글을 수정할 수 있습니다.")
  		 }

    	let bidx= $("#detailBidx").html()
    	$.ajax({
    		url: "boardread.do",
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
    }) 
    
    $("#modibtn").on("click",function(){
	   	let category =$("#modicate option:selected").val()
	    let title = $("#modititle").val()
	    let content = $("#modicontent").val()
    	let bidx = $("#modiBidx").text()
    	$.ajax({
    		url:"boardmodify.do",
    		type:"get",
    		data:{"bidx":bidx, "category":category, "title":title, "content":content},
    		success:function(){
    			alert("수정하였습니다.")
		        modifyModal.style.display = 'none'
				location.href=("community.do?category=category0")
    		},
    		error:function(){
    			alert("error")
    		}
    	});
    })
    
    
    // 게시글 삭제
    $("#boardDelete").on("click",function(){
    	let bidx= $("#detailBidx").val()
    	$.ajax({
    		url :"boardDelete.do",
    		type:"get",
    		data:{"bidx":bidx},
    		success: function(){
				alert("글이 삭제 되었습니다.")
				board_modal.style.display = 'none';
				location.href=("community.do?category")
    		},
    		error: function(){
    			console.log("삭제 실패")
    		}
    	})
    })
    
    
    </script>
    
  </body>
</html>