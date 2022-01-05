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
      <div class="comm-white-modal">

      </div>
    </div>
  </div>
    <!-- Community Modal End-->

    <!-- Navbar Start-->
    <div class="navbar-box row">
      <div class="col-sm-2 logobox"><a href="main.html"><img class="logo-img" src='../assets/LOGO2.png'></a></div>
      <div class="col-sm-5">
        <nav class="navbar navbar-light bg-white">
          <form class="form-inline">
            <button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
            <input class="search-input mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          </form>
        </nav>
      </div>
      <div class="col-sm-1 loginbox"></div>
      <c:choose>
        	<c:when test="${empty users}">
        		<div style="text-align: right;" class="col-sm-1 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><button type="button" class="top-icon-btn btn btn-secondary">Login</button></p></div>
      		</c:when>
      		<c:otherwise>
       			<div class="col-sm-1 loginbox solo"><p>${users.nick}님 반갑습니다</p></div>
       		</c:otherwise>
       		</c:choose>	
      <div style="text-align: right;" class="col-sm-2 loginbox"><a class="nav-font-en" onclick="location.href='register.do'"><button type="button" class="top-icon-btn btn btn-dark">Register</button></a></div>
    </div>
  </nav>
    <!-- Navbar end-->
    <!-- Side Bar Start-->
    <div class="main-box" id="main-box">
      <div class="main-sub row">
        <div class="sidebar col-sm-2" id="List">
          <ul class="sidebar-list">
            <li class="sidebar-personal-list" ><i class="icon fas fa-adjust"></i><a class="list-a category font-kr" href="#">카테고리
              <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action">category1</a>
                <a href="#" class="list-group-item list-group-item-action">category2</a>
                <a href="#" class="list-group-item list-group-item-action">category3</a>
              </div>
            </a></li>
            <li class="sidebar-personal-list" ><i class="icon fas fa-not-equal"></i><a class="list-a font-kr" href="Comparing.html">유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a font-kr" href="Community.html">커뮤니티</a></li>
            <li class="sidebar-personal-list"><i class="icon far fa-comment-alt"></i><a class="list-a font-kr writing">글 작성</a></li>
           </ul>
          <!-- Side Bar end--> 
        </div>
        <div class="main-content-box col-sm-10 row">
          <div class="community-left-box">
            <div class="left-inner-box shadow p-3 mb-5 bg-white rounded">
              <div class="article-navbox">
                <ul class="article-navbox-ul row nav-font-en">
                  <li class="col-sm-2">Category1</li>
                  <li class="col-sm-2">Category1</li>
                  <li class="col-sm-2">Category1</li>
                  <li class="col-sm-2">Category1</li>
                  <li class="col-sm-2">Category1</li>
                  <li class="col-sm-2">Category1</li>
                </ul>
              </div>
              <div class="article-box">
                                
                <div class="article-list">
                  <span>카테고리</span>
                  <a><h5>연말 강아지 자랑대회</h5></a>
                  <div>
                    <a><p>고양이 대회에 이어 강아지 대회 진행하겠습니다. </p></a>
                  </div>
                  <div>
                    <span>참치팩</span>
                  </div>
                </div>
                <div class="article-list">
                  <span>카테고리</span>
                  <a><h5>연말 강아지 자랑대회</h5></a>
                  <div>
                    <a><p>고양이 대회에 이어 강아지 대회 진행하겠습니다. </p></a>
                  </div>
                  <div>
                    <span>참치팩</span>
                  </div>
                </div>
                
                <div class="article-list">
                  <span>카테고리</span>
                  <a><h5>연말 강아지 자랑대회</h5></a>
                  <div>
                    <a><p>고양이 대회에 이어 강아지 대회 진행하겠습니다. </p></a>
                  </div>
                  <div>
                    <span>참치팩</span>
                  </div>
                </div>
                
            
              </div>
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
      var write = document.querySelector('.writing')
      var comm_modal = document.querySelector('.comm-black-modal')
      write.addEventListener('click',function(){
        comm_modal.style.display ='block'
      })

      comm_modal.addEventListener('click', function(e){
        if(e.target == e.currentTarget){
          comm_modal.style.display = 'none'
        }
      })
      
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
    </script>
    
  </body>
</html>