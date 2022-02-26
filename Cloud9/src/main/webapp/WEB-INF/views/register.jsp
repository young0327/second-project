
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<title>Registser</title>
<link rel='stylesheet'
	href="${pageContext.request.contextPath}/resources/css/register.css?ver=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<div class="bodyclass"
		style="background-image: url('./resources/img/darkness.jpg')">
		<div class="register-box row shadow p-3 mb-5 bg-white rounded kr-font">
			<div class="register-left-square col-md-12 kr-font">
				<div class="register-inner-content kr-font">
					<form id="frm">
						<p class="rg-content">회원가입</p>
						<h5></h5>
						<input class="form-control" type="text" name="id" id="id"
							placeholder="ID" autocomplete="off">
						<div class="check-box kr-font">
							<i class="fas fa-check" id="idcheck" style="text-align: left;">중복
								확인</i>
						</div>
						<h5></h5>
						<input class="form-control pw-input" type="password" name="pwd"
							id="pwd" placeholder="Password">
						<h5></h5>
						<input class="form-control pw-reinput" type="password"
							name="pwd_check" id="pwd_check" placeholder="비밀번호를 재입력해주세요">
						<div class="pw_alertbox">
							<span class="pw_alert"></span>
						</div>
						<h5></h5>
						<input class="form-control bbox" type="text" name="nick" id="nick"
							placeholder="Nickname" autocomplete="off">
						<div class="btn-box bbox">
							<button class="btn rg-btn kr-font" type="button" id="register">회원가입</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/register.js"></script>

	<script>
		
	</script>


</body>
</html>