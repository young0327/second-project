<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/main.css?ver=1">
    <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/category.css?ver=1">
    <title>Cloud Nine</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </head>
  <body>

    
    <nav class="top-navbar shadow p-3 mb-5 bg-white rounded Modal">
      
    <!-- Navbar Start-->
      <div class="navbar-box row">
        <div class="col-sm-2 logobox"><a href="#"><img class="logo-img" src='#'></a></div>
        <div class="col-sm-5">
          <nav class="navbar navbar-light bg-white">
            <form class="form-inline">
              <button class="btn my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
              <input class="search-input mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            </form>
          </nav>
        </div>
        <div class="col-sm-1 loginbox"></div>
        <div style="text-align: right;" class="col-sm-1 loginbox solo" @click="modalOpen=false"><p class='nav-font-en login-modal'><button type="button" class="top-icon-btn btn btn-secondary">Login</button></p></div>
      <div style="text-align: right;" class="col-sm-2 loginbox"><a class="nav-font-en" href="register.html"><button type="button" class="top-icon-btn btn btn-dark">Register</button></a></div>
    </div>
    </nav>
    <!-- Navbar end-->
    <!-- Side Bar Start-->
    <div class="main-box">
      <div class="main-sub row">
        <div class="sidebar col-sm-2" id="List">
          <ul class="sidebar-list">
            <li class="sidebar-personal-list" ><i class="icon fas fa-adjust"></i><a class="list-a category font-kr" href="#">카테고리
              <div class="list-group">
                <a href="category.do?cate=M" class="list-group-item list-group-item-action">category1</a>
                <a href="category.do?cate=P" class="list-group-item list-group-item-action">category2</a>
                <a href="category.do?cate=H" class="list-group-item list-group-item-action">category3</a>
              </div>
            </a></li>
            <li class="sidebar-personal-list" ><i class="icon fas fa-not-equal"></i><a class="list-a font-kr" href="">유사앱 비교</a></li>
            <li class="sidebar-personal-list" ><i class="icon far fa-comments"></i><a class="list-a font-kr" href="community.do?category=category0">커뮤니티</a></li>
          </ul>
          <!-- Side Bar end--> 
        </div>
        <div class="main-content-box col-sm-10 row">
          <!-- Slide Carousel Start-->
          <div class="main-content-carousel shadow p-3 mb-5 bg-white rounded">
            	<c:choose>
            	<c:when test="${cateList[0].appcate eq 'MF'}">
            		 <div class="kr-font result-alert"><p><span style="font-size: 32px; color: rgb(23, 69, 79); font-weight: 700;">음악</span> 카테고리</p></div>
            	</c:when>
            	<c:when test="${cateList[0].appcate eq 'HF'}">
    		         <div class="kr-font result-alert"><p><span style="font-size: 32px; color: rgb(23, 69, 79); font-weight: 700;">여행</span> 카테고리</p></div>
            	</c:when>
            	<c:when test="${cateList[0].appcate eq 'PF'}">
            		 <div class="kr-font result-alert"><p><span style="font-size: 32px; color: rgb(23, 69, 79); font-weight: 700;">사진/비디오</span> 카테고리</p></div>
            	</c:when>
            	</c:choose>
            <div class="kr-font" style="margin-right:80%;">
              <select style="border: none; background-color: #eee; border-radius: 10px; font-size: 20px;" id ="paySelect">
                <option value="${cateList[0].appcate}">전체</option>
                <option value="F">무료</option>
                <option value="P">유료</option>
              </select>
            </div>
            <div class="categoryBox">
            <c:forEach items="${cateList}" var="cateList">
            <div class="result-box row">
              <div class="app-icon-img col-md-3"><img src=${cateList.appicon}></div>
              <div class="kr-font app-content-box col-md-9">
                <h4 class="kr-font">${cateList.appname}</h4>
                <p class="kr-font" style="font-size: 23px;">${cateList.apprating}<span style="font-size: 15px;">&nbsp&nbsp&nbsp ${cateList.appprice}</span></p><p class="word" style="margin-left: 590px; margin-top: -40px;">${cateList.appcompany}</p>
                </div>
            </div>
            </c:forEach>
            </div>
          </div>
        </div>
      </div>  
    </div>

    

    <script src="../JavaScript/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    
    <script>
      $('.category').on('click',function(){
        $('.list-group').slideToggle();
      })

      
      // 가격 카테고리 선택
      /*${"#paySelect"}.on("change",function(){
    	  $(".result-box row").html("");
    	  let payData = $("#paySelect").val();
    	  let payCate = ${cateList[0].appcate}
    	  $.ajax({
    		  url:"cate/pay",
    		  type:"get",
    		  data:{"payDate":payData,"payCate":payCate},
    		  success:function(data){
    			  for(let i=0; i<data.length; i++){
    			  let payList=`
    			  <div class="result-box row">
                  <div class="app-icon-img col-md-3"><img src=`+${data[i].appicon}+`></div>
                  <div class="kr-font app-content-box col-md-9">
                    <h4 class="kr-font">`+${data[i].appname}+`</h4>
                    <p class="kr-font" style="font-size: 23px;">`+${data[i].apprating}+`<span style="font-size: 15px;">&nbsp&nbsp&nbsp`+${data[i].appprice}+`</span></p><p class="word" style="margin-left: 590px; margin-top: -40px;">`+${data[i].appcompany}+`</p>
                    </div>
                </div>
    			  `;}
    			  ${".categoryBox"}.append(payList);
    		  },
    		  error:function(data){
    			  console.log("error")
    		  }
    	  })
      })*/
      
    </script>

    
    
  </body>
</html>