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
<link rel='stylesheet'
	href=' ${pageContext.request.contextPath}/resources/css/main.css?ver=1'>
<link rel='stylesheet'
	href=' ${pageContext.request.contextPath}/resources/css/comparing.css?ver=1'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<title>AppV</title>
<style>
#chartdiv {
	width: 100%;
	height: 500px;
}

#chartSecond {
	width: 100%;
	height: 500px;
}
</style>
</head>
<body>

	<nav class="top-navbar shadow p-3 mb-5 bg-white rounded Modal">

		<!-- Modal Page start-->
		<transition name="fade">
		<div class="black-modal" v-if="modalOpen==false">
			<div class="white-modal ">
				<span class="badge badge-pill badge-dark" @click="modalOpen=true">X</span>
				<form id='frm'>
					<div class="modal-id">
						<p class="nav-font-en login-h3">LOGIN</p>
						<i class="fas fa-sign-in-alt" style="width: 40px; color: gray;"></i><input
							class="modal-input input-id" type="text"
							placeholder="Type your ID" name='id' id='id' autocomplete="off">
					</div>
					<div class="modal-pw">
						<i class="fas fa-lock" style="width: 40px; color: gray;"></i><input
							class="modal-input input-pw" type="password"
							placeholder="Type your password" name='pwd' id='pwd'><br>
					</div>
					<button @click="modalOpen=true" class="login-btn nav-font-en"
						type="button" id="btn_Login">LOGIN</button>
					<p class="login-rg nav-font-en"
						style="text-align: center; cursor: pointer;"
						onclick="location.href='register.do'">OR REGISTER</p>
				</form>
			</div>
		</div>
		</div>
		<!-- Login Modal Page end--> </transition>
		<!-- Navbar Start-->
		<div class="navbar-box row">
			<div class="col-sm-2 logobox">
				<a href="main"><img class="logo-img"
					src="./resources/logo/appv.png"></a>
			</div>
			<div class="col-sm-5">
				<nav class="navbar navbar-light bg-white">
					<form class="form-inline" action="search.do">
						<button class="btn my-2 my-sm-0" type="submit">
							<i class="fas fa-search"></i>
						</button>
						<input class="search-input mr-sm-2" type="search"
							placeholder="Search" aria-label="Search" name="appname"
							id="appSearch" autocomplete="off">
					</form>
				</nav>
			</div>
			<div class="col-sm-1 loginbox"></div>
			<c:choose>
				<c:when test="${empty users}">
					<div style="text-align: center; margin-left: -20px;"
						class="col-sm-2 loginbox solo" @click="modalOpen=false">
						<p class='nav-font-en login-modal'>
							<i class="fas fa-sign-in-alt"></i>Login
						</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-sm-3 loginbox solo" id="krFont">
						<p style="font-size: 20px;">${users.nick}??????????????????</p>
					</div>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${!empty users.nick}">
					<div style='margin-left: 30px; margin-top: 23px; display: block'>
						<button class="nav-font-enlg" id="logout">
							<i class="fas fa-sign-out-alt"></i>LOGOUT
						</button>
					</div>
					<div style="text-align: right; display: none"
						class="col-sm-1 loginbox">
						<a class="nav-font-en" onclick="location.href='register.do'"><i
							class="fas fa-users-cog"></i>Register</a>
					</div>
				</c:when>
				<c:otherwise>
					<div style='margin-left: 30px; margin-top: 23px; display: none'>
						<button class="nav-font-enlg" id="logout">
							<i class="fas fa-sign-out-alt"></i>LOGOUT
						</button>
					</div>
					<div style="text-align: right; display: block"
						class="col-sm-1 loginbox">
						<a class="nav-font-en" onclick="location.href='register.do'"><i
							class="fas fa-users-cog"></i>Register</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<!-- Navbar end-->
	<!-- Side Bar Start-->
	<div class="main-box">
		<div class="main-sub row">
			<div class="sidebar col-sm-2" id="List">
				<ul class="sidebar-list">
					<li class="sidebar-personal-list"><i class="icon fas fa-home"></i><a
						class="list-a kr-font" href="main">??? ??????
							<li class="sidebar-personal-list"><i
								class="icon fas fa-adjust"></i><a
								class="list-a category font-kr" href="#">????????????
									<div class="list-group">
										<a href="category.do?M"
											class="list-group-item list-group-item-action">??????</a> <a
											href="category.do?P"
											class="list-group-item list-group-item-action">??????/?????????</a> <a
											href="category.do?H"
											class="list-group-item list-group-item-action">??????</a>
									</div>
							</a></li>
							<li class="sidebar-personal-list"><i
								class="icon fas fa-not-equal"></i><a class="list-a font-kr"
								href="compare.do">????????? ??????</a></li>
							<li class="sidebar-personal-list"><i
								class="icon far fa-comments"></i><a class="list-a font-kr"
								href="community.do?category=category0">????????????</a></li>
				</ul>
				<div class='myFavorite-box kr-font'>
					<div class="kr-font" style="color: white; padding-right: 17px;">
						<span>????????????<span>
					</div>
					<div class='myFavorite-inner' id="myFavorite"></div>
				</div>
				<!-- Side Bar end-->
			</div>

			<div class="main-content-box col-sm-10 kr-font">
				<div class="compare-background row ">
					<div class="compare-box">
						<div class="compare-search-box">
							<div class="search-inner-box">
								<input type="search" list="appOption1" id="compare1"
									autocomplete="off"><span> </span>
								<datalist id="appOption1">
								</datalist>
								<button id="vsbtn1" style="border: none; background: none;">
									<i class="fas fa-search" style="font-size: 24px;"></i>
								</button>
							</div>
						</div>

						<div class="compare-search-box" style="width: 15%;">
							<div>
								<select class="category-division" id="compareCate">
									<option value="none">=== ?????? ===</option>
									<option value="M">??????</option>
									<option value="P">??????/?????????</option>
									<option value="H">??????</option>
								</select>
							</div>
						</div>
						<div class="compare-search-box">
							<div class="search-inner-box">
								<input type="search" list="appOption2" id="compare2"
									autocomplete="off"><span> </span>
								<datalist id="appOption2">
								</datalist>
								<button id="vsbtn2" style="border: none; background: none;">
									<i class="fas fa-search" style="font-size: 24px;"></i>
							</div>
						</div>
						<div class="compare-icon-box" id="iconbox1">
							<div class="icon-inner-box">
								<div class="icon-img">
									<img src="./resources/img/dfimg.jpg"
										style="border: 3px solid gray; border-radius: 7px;">
								</div>
								<div>
									<p>????????? ????????? ?????????</p>
								</div>
							</div>
						</div>
						<div class="compare-icon-box" style="width: 15%;"></div>
						<div class="compare-icon-box" id="iconbox2">
							<div class="icon-inner-box">
								<div class="icon-img">
									<img src="./resources/img/dfimg.jpg"
										style="border: 3px solid gray; border-radius: 7px;">
								</div>
								<div>
									<p>????????? ????????? ?????????</p>
								</div>
							</div>
						</div>
						<div class="compare-rating-box" id="ratingbox1">
							<div class="rating-inner-box">
								<div class="ratings">
									<h4>--</h4>
								</div>
							</div>
						</div>
						<div class="compare-rating-box" style="width: 15%;">??? ??????</div>
						<div class="compare-rating-box" id="ratingbox2">
							<div class="rating-inner-box">
								<div class="ratings">
									<h4>--</h4>
								</div>
							</div>
						</div>
						<div class="space"></div>
						<div class="rader-chart-box">
							<div class="rader-inner">
								<div class="chart-box">
									<canvas id="radar-chart" width="250" height="250"></canvas>
								</div>
							</div>
						</div>
						<div class="second-rating-box kr-font">
							<div class='analy-inner analy-inner-left'>
								<p class='kr-font' style="font-size: 20px;"></p>
								<div class='rating-inner'></div>
								<div class='rating-inner rating-right'>
									<div class='point kr-font' style="padding-left: 25px;">
										<span id="emotion-word-rate1" class="ui-word starPoint"></span>%
									</div>
									<div class='point word kr-font'>
										<p>
											<span id="emotion-word-title1" class="ui-word starPoint"></span><br>
											<span>??? ????????? ????????????</span> <select
												style="border: none; background: #eee; border-radius: 20px;"
												id="emotionSelect1">
												<option value="1">??????</option>
												<option value="0">??????</option>
											</select><br>????????? ???????????????
										</p>
									</div>
								</div>
							</div>
							<div class="gamsung-bot">
								<div id="chartdiv"></div>
							</div>
							<div class="gamsung-down" id="compareReview1"></div>
						</div>
						<div class="second-rating-box" style="width: 15%;">????????????</div>
						<div class="second-rating-box kr-font">
							<div class='analy-inner analy-inner-left'>
								<p class='kr-font' style="font-size: 20px;"></p>
								<div class='rating-inner'></div>
								<div class='rating-inner rating-right'>
									<div class='point kr-font' style="padding-left: 25px;">
										<span id="emotion-word-rate2" class="ui-word starPoint"></span>%
									</div>
									<div class='point word kr-font'>
										<p>
											<span id="emotion-word-title2" class="ui-word starPoint"></span><br>
											<span>??? ????????? ????????????</span> <select
												style="border: none; background: #eee; border-radius: 20px;"
												id="emotionSelect2">
												<option value="1">??????</option>
												<option value="0">??????</option>
											</select><br>????????? ???????????????
										</p>
									</div>
								</div>
							</div>
							<div class="gamsung-bot">
								<div id="chartSecond"></div>
							</div>
							<div class="gamsung-down" id="compareReview2"></div>

						</div>

					</div>
				</div>
			</div>

			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
	

			<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
				integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
				crossorigin="anonymous"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
				crossorigin="anonymous"></script>
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
			<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
			<script src="https://cdn.amcharts.com/lib/5/radar.js"></script>
			<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/js/bookmark.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/js/catescroll.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/js/login.js"></script>
			<script
				src="${pageContext.request.contextPath}/resources/js/comparing.js"></script>

		
</body>
</html>