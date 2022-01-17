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
     <link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/index.css?ver=1">
   	<title>Cloud Nine</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
  </head>
  <body>

    
      
      
    <!-- Side Bar Start-->
    <div class="main-box" style="background-image: url('./resources/img/darkness.jpg');">
      <div class="main-top">
        <div class="top-title-box">
          <div class="title-inner-box" style="width:30%"></div>
          <div class="title-inner-box">
            <form class="form-inline" action="search.do">
            <button class="search-btn"><i class="fas fa-search"></i></button>
            <input class="main-input" type="search" placeholder="어플 이름을 입력하세요" aria-label="Search" name ="appname" id="appSearch" autocomplete="off">
          </form>
          </div>
          <div class="title-inner-box" style="width:30%">
          </div>
        </div>
      </div>
      <div class="main-bottom">
        <div class="bottom-topbox">
          <div class="app-example-box"></div>
        </div>
        <div class="bottom-botbox">
          <div class="bot-main-box">
            <div class="bot-main-content">
              <div class="content-go">
                <div class="inner-content-box">
                  <div class="flaticon"><i class="fas fa-edit"></i></div>
                  <p class="main-title-word font-kr">커뮤니티 게시판</p>
                  <a href="#"><div class="direct-go"><p class="font-kr">바로가기  </p></div></a>
                </div>
              </div>
              </div>
            <div class="bot-main-content">
              <div class="content-go">
                <div class="inner-content-box">
                  <div class="flaticon"><i class="fas fa-not-equal"></i></div>
                  <p class="main-title-word font-kr">유사어플 비교하기</p>
                  <a href="#"><div class="direct-go"><p class="font-kr">바로가기  </p></div></a>
                </div>
              </div>
            </div>
            <div class="bot-main-content">
              <div class="content-go">
                <div class="inner-content-box">
                  <div class="flaticon"><i class="fas fa-edit"></i></div>
                  <p class="main-title-word font-kr">커뮤니티 게시판</p>
                  <a href="#"><div class="direct-go"><p class="font-kr">바로가기  </p></div></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>  

    



    <!-- 차트그리기-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js"></script>
    <script src="https://cdn.anychart.com/releases/v8/js/anychart-tag-cloud.min.js"></script>
    <!-- Optional JavaScript; choose one of the two! -->
    <script src="../JavaScript/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->.
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
   
    <script>
      $('.category').on('click',function(){
        $('.list-group').slideToggle();
      })

    </script>
  
  </body>
</html>
    
    
  </body>
</html>