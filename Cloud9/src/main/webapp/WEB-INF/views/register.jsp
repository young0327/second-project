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
    <title>Registser</title>
    <link rel='stylesheet' href="${pageContext.request.contextPath}/resources/css/register.css?ver=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </head>
  <body>

    <div class="bodyclass" style="background-image:url('./resources/img/darkness.jpg')">
      <div class="register-box row shadow p-3 mb-5 bg-white rounded">
        <div class="register-left-square col-md-5">
          <div class="register-inner-content">
	          <form id="frm">
	           <p class="rg-content">회원가입</p>
		            <h5></h5>
		            <input class="form-control" type="text" name="id" id ="id" placeholder="ID" autocomplete="off">
		            <div class="check-box"><i class="fas fa-check" id = "idcheck" style="text-align: left; ">중복 확인</i></div>
		            <h5></h5>
		            <input class="form-control pw-input" type="password" name="pwd" id="pwd" placeholder="Password">
		            <h5></h5>
		            <input class="form-control pw-reinput" type="password" name="pwd_check" id="pwd_check"  placeholder="비밀번호를 재입력해주세요">
		            <div class="pw_alertbox"><span class="pw_alert"></span></div>
		            <h5></h5>
		            <input class="form-control bbox" type="text" name="nick" id ="nick" placeholder="Nickname" autocomplete="off">
		            <div class="btn-box bbox">
		              <button class="btn rg-btn" type="button" id = "register">회원가입</button>
		            </div>
           		</form>
          </div>
        </div>
        <div class="register-right-square col-md-7">
          <h3 class="right-square-content">Welcome to LOGO</h3>
        </div>
      </div>
    </div>

    


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script>
     var pw_input = document.querySelector('.pw-input')
     var pw_reinput = document.querySelector('.pw-reinput')
     var pw_alert = document.querySelector('.pw_alert')

      function pw_check(){
        pw_input.addEventListener('keyup',function(){
          if(pw_input.value != pw_reinput.value){
          pw_alert.innerText = '비밀번호가 일치하지 않습니다'
          pw_alert.style.color = 'red'
        } else if(pw_input.value === pw_reinput.value) {
          pw_alert.innerText = '비밀번호가 일치합니다'
          pw_alert.style.color = 'blue'
        }
        })
        pw_reinput.addEventListener('keyup',function(){
          if(pw_input.value != pw_reinput.value){
          pw_alert.innerText = '비밀번호가 일치하지 않습니다'
          pw_alert.style.color = 'red'
        } else if(pw_input.value === pw_reinput.value) {
          pw_alert.innerText = '비밀번호가 일치합니다'
          pw_alert.style.color = 'blue'
        }
        })
      }
      pw_check();

      function pw_space(){
        window.addEventListener('keyup',function(){
          if(pw_input.value == '' && pw_reinput.value == ''){
          pw_alert.innerText = '';
        }
        })
      }
      pw_space()
      
      
      
    //회원 가입 로직
     let id_Check =0; 
  $("#register").on("click",function(){
	    if($("#id").val()!="" && $("#pwd").val()!="" &&$("#pwd").val()==$("#pwd_check").val()&& $("#nick").val()!="" && id_Check!=0){
	    	let Jdata=$("#frm").serialize();
	    	$.ajax({
	    		url: "user/singUp",
	    		type : "post",
	    		data : Jdata,
	    		success : function(){
	    			alert($("#nick").val()+"님 환영합니다.");
	    			location.href="main"
	    		},
	    		error : function(){
	    			alert("error");
	    		} 
	    	});
	    	
	    	
	    }else{
	    	if($("#id").val()==""){
	    		alert("아이디를 입력해 주세요");
	   		}
	    	if(check ==0){
	    		alert("아이디 중복을 확인해 주세요");
	    	}
	    	if($("#pwd").val()==""){
	    		alert("비밀 번호를 입력해 주세요");
	    	}
	    	
	    	if($("#nick").val()==""){
	    		alert("닉네임을 입력해 주세요");
	    	}
	    
	    }
    }); 
  
  // 중복 확인
      $("#idcheck").on("click",function(){
    	let id = $("#id").val();
    	$.ajax({
    		url : "user/idCheck",
    		type : "get",
    		data : {"id":id},
    		dataType:"text",
    		success: checkid,
    		error : function(){
    			alert("error")
    		}
    	});
    })

    function checkid(result){
    	if(result==0){
    		if($("#id").val()==""){
    			alert("아이디를 입력해 주세요")
    		}else{
    			id_Check=1;
    			$("#idcheck").css("color","green")
        		alert("생성 가능한 아이디 입니다.");
        		
    		}
    	}else{
    		alert("생성할 수 없는 아이디 입니다.");
    		$("#idcheck").css("color","red")
    	}
    }
    
  
    </script>
    
    
  </body>
</html>