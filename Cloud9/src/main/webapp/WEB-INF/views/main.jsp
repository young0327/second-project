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
<link rel="stylesheet" type="text/css"
	href=" ${pageContext.request.contextPath}/resources/css/index.css?ver=1">
<title>AppV:</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
#chartdiv {
	width: 100%;
	height: 400px;
}
</style>
</head>
<body>

	<!-- Side Bar Start-->
	<div class="main-box"
		style="background-image: url('./resources/img/back.jpg');">
		<div class="main-top">
			<div class="top-title-box">
				<div class="title-inner-box" style="width: 30%"></div>
				<div class="title-inner-box"></div>
				<div class="title-inner-box" style="width: 30%"></div>
			</div>
		</div>
		<div class="main-bottom">
			<div class="bottom-topbox">
				<div class="app-example-box">
					<div class="app-animation-box animation-left"></div>
					<div class="app-animation-box" style="width: 20%;">
						<div class="appicon-box">
							<p class="font-kr" style="color: white; font-size: 24px;"></p>
							<div style="margin-top: 300px;">
								<form class="form-inline" action="search.do">
									<button class="search-btn">
										<i class="fas fa-search" style="color: gray;"></i>
									</button>
									<input class="main-input" type="search"
										placeholder="?????? ????????? ???????????????" aria-label="Search" name="appname"
										id="appSearch" autocomplete="off">
								</form>
							</div>
						</div>
					</div>
					<div class="app-animation-box animation-right">
						<transition name='fade'>
						<div class="chart-box"></div>
						</transition>
					</div>
				</div>
			</div>
			<div class="bottom-botbox">
				<div class="bot-main-box">
					<div class="bot-main-content">
						<div class="content-go">
							<div class="inner-content-box">
								<div class="flaticon">
									<i class="fas fa-edit"></i>
								</div>
								<p class="main-title-word font-kr">???????????? ????????????</p>
								<a href="category.do?MF"><div class="direct-go">
										<p class="font-kr">????????????</p>
									</div></a>
							</div>
						</div>
					</div>
					<div class="bot-main-content">
						<div class="content-go">
							<div class="inner-content-box">
								<div class="flaticon">
									<i class="fas fa-not-equal"></i>
								</div>
								<p class="main-title-word font-kr">???????????? ????????????</p>
								<a href="compare.do"><div class="direct-go">
										<p class="font-kr" style="color: black;">????????????</p>
									</div></a>
							</div>
						</div>
					</div>
					<div class="bot-main-content">
						<div class="content-go">
							<div class="inner-content-box">
								<div class="flaticon">
									<i class="fas fa-clipboard-list"></i>
								</div>
								<p class="main-title-word font-kr">???????????? ?????????</p>
								<a href="community.do?category=category0"><div
										class="direct-go">
										<p class="font-kr">????????????</p>
									</div></a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>






		<!-- Optional JavaScript; choose one of the two! -->
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
			crossorigin="anonymous"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/catescroll.js"></script>
</body>
</html>


</body>
</html>