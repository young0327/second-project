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
    