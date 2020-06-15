<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="<%=application.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/practice.css" />
<link href="<%=application.getContextPath()%>/resources/img/logo.png"
	rel="shortcut icon" type="image/x-icon">

<script>
	history.replaceState({}, null, location.pathname);
	function goTop() {
		$('html').scrollTop(0);
	}
</script>
<style type="text/css">
.btn_submit {
	background-image: url('./img/search.png');
	background-position: 0px 0px;
	background-repeat: no-repeat;
	width: 40px;
	height: 22px;
	border: 0px;
	cursor: pointer;
	outline: 0;
}
</style>
<style type="text/css">
   @font-face{
   font-family: "TmonMonsori"; /*파일이름*/
   src:url("<%=application.getContextPath()%>/resources/font/TmonMonsori.ttf.ttf") format("truetype"); /*파일경로, 타입*/
   font-style: normarl; /*이건 그냥 냅두면 될듯*/
   font-weight: normal; /*이거도*/
   }
   #title{ /*적용할 부분*/
      font-family: TmonMonsori; /*파일이름*/
      font-size: 30px;
      text-align: center;
   }
</style>
</head>
<title>우 동 바</title>
<body>
	<div>
		<form action="MainSearch" method="post">
			<div class="d-flex justify-content-around h-100">
				<a href="<%=application.getContextPath()%>"><img
					class="img-fluid" src="./resources/img/logo.png" alt="로고" /></a>
				<div class="searchbar" style="border: 3px solid green;">
					<input class="search_input" type="text" name="ncategory"
						placeholder="업직종 검색" style=""> <input type="submit"
						value="" class="btn_submit" />

					<!-- <a href="#" class="search_icon"><img
					src="./img/search.png" alt="검색" /><i class="fas fa-search"></i></a> -->
				</div>
				<input type="hidden" name="page" value="" />
		</form>
		<div>
			<br />
			<hr />
			<c:if test="${empty memberNickname }">
				<a href="login-view" class="btn btn-outline-success">로그인</a>
				<a href="<%=application.getContextPath()%>/practice/contract"
					class="btn btn-outline-success">회원가입</a>
			</c:if>
			<c:if test="${not empty memberNickname }">
				<c:choose>
					<c:when test="${msmaster == 'seeker'}">
						<a href="member/mypage" class="btn btn-outline-primary">${memberNickname }
							접속중</a>
					</c:when>
					<c:when test="${msmaster == 'offer'}">
						<a href="member/corpage" class="btn btn-outline-primary">${memberNickname }
							접속중</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="btn btn-outline-primary">${memberNickname }
							접속중</a>
					</c:otherwise>
				</c:choose>
				<a href="logout" class="btn btn-outline-danger">로그아웃</a>
			</c:if>
			<a href="<%=application.getContextPath()%>/customer/faq"
				class="btn btn-outline-success">FAQ</a> <a
				href="<%=application.getContextPath()%>/customer/campaign"
				class="btn btn-outline-success">캠페인</a>
			<hr />
		</div>
	</div>
	<hr />
	<div class="fixed-bottom d-flex justify-content-end">
		<button type="button" onclick="goTop()">맨 위로 ↑</button>
	</div>
	<div class="container w-100">
		<div class="w-auto p-3">
			<nav class="navbar navbar-expand-lg navbar-light container"
				style="background-color: #58cf91;">
				<a class="navbar-brand" href="/project_UDB">우리 동네 알바</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 채용정보 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="notice/notice">전체알바정보</a> <a
									class="dropdown-item" href="detailsearch/DetailSearch_view">상세검색</a>
							</div></li>

						<c:if test="${msmaster == 'seeker' || msmaster == 'admin' }">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 개인서비스 </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="member/mypage">마이페이지</a> <a
										class="dropdown-item" href="member/resume">이력서 등록</a> <a
										class="dropdown-item" href="member/application">지원현황</a>
								</div></li>
						</c:if>

						<c:if test="${msmaster == 'offer' || msmaster == 'admin' }">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 기업서비스 </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="member/corpage">기업페이지</a> <a
										class="dropdown-item" href="notice/nmanage">공고관리</a> <a
										class="dropdown-item" href="member/appmanage">지원자 관리</a>
								</div></li>
						</c:if>

						<c:if test="${empty memberNickname }">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 개인서비스 </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="member/mypage">마이페이지</a><a
										class="dropdown-item" href="member/resume">이력서 등록</a> <a
										class="dropdown-item" href="#">지원현황</a>
								</div></li>

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 기업서비스 </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="member/corpage">기업페이지</a> <a
										class="dropdown-item" href="notice/nmanage">공고관리</a> <a
										class="dropdown-item" href="member/appmanage">지원자 관리</a>
								</div></li>
						</c:if>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="free/fList">알바 후기</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 고객서비스 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="customer/cscenter">고객센터</a> <a
									class="dropdown-item" href="inform/iList">공지사항</a> <a
									class="dropdown-item" href="customer/faq">FAQ</a> <a
									class="dropdown-item" href="question/qList">1:1문의</a> <a
									class="dropdown-item" href="customer/campaign">캠페인</a> <a
									class="dropdown-item" href="customer/policy">운영정책</a> 
								<%-- 	<a class="dropdown-item" href="customer/report">허위정보신고</a>
								<c:choose>
									<c:when test="${msmaster == 'admin'}">
										<a class="dropdown-item" href="customer/reportboard">허위정보신고내역</a>
									</c:when>
								</c:choose> --%>
							</div></li>
					</ul>
				</div>
				<div>
					<c:if test="${msmaster == 'seeker' || msmaster == 'admin' }">
						<a href="member/resume" class="text-white"><img
							src="./img/resume.png" alt="" />이력서 등록</a>
					</c:if>
					<c:if test="${msmaster == 'offer' || msmaster == 'admin' }">
						<a href="notice/write_view" id="new_btn" class="text-white"><img
							src="./img/notice.png" alt="" />공고 등록</a>
					</c:if>
				</div>
				<script type="text/javascript">
					$(function() {
						$('#new_btn')
								.click(
										function() {
											if ('${totalnoti}' == 5) {
												alert("게시글 최대개수를 초과하였습니다.");
												return false;
											} else {
												onclick = location.href = './notice/write_view';
											}
										});
					});
				</script>
			</nav>
		</div>
		<div id="banner" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#banner" data-slide-to="0"
					class="active bg-success"></li>
				<li data-target="#banner" data-slide-to="1"
					class="active bg-success"></li>
				<li data-target="#banner" data-slide-to="2"
					class="active bg-success"></li>
				<li data-target="#banner" data-slide-to="3"
					class="active bg-success"></li>
			</ol>
			<div class="container">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="https://albam.net" target="_blank"> <img
							src="./img/main1.png" height="250" width="1200" alt="슬라이드1"
							class="img-fluid"></a>
					</div>
					<div class="carousel-item">
						<a href="member/resume"> <img src="./img/main2.png"
							height="250" width="1200" alt="슬라이드2" class="img-fluid"></a>

					</div>
					<div class="carousel-item">
						<a href="customer/campaign"> <img src="./img/main3.png"
							height="250" width="1200" alt="슬라이드3" class="img-fluid"></a>
					</div>
					<div class="carousel-item">
						<a href="customer/campaign"> <img src="./img/main4.png"
							height="250" width="1200" alt="슬라이드4" class="img-fluid"></a>
					</div>
				</div>
			</div>
		</div>
		<br />
		<%-- <jsp:include page="banner.jsp"></jsp:include> --%>
		<!-- Swiper -->
		<h5 id="title">프리미엄 등록관</h5> <br /> <br />
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach items="${premium }" var="p">
					<div class="swiper-slide">
						<a href="notice/content_view?c=${p.nseq }&p=${memberID }"> <img class="img-fluid"
							src="<%=application.getContextPath() %>/resources/uploadimg/${p.nimg }" />
							${p.nlocation }/${p.npay }원
						</a>
					</div>
				</c:forEach>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
			<!-- Add Arrows -->
		</div>
		<!-- Swiper JS -->
		<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

		<!-- Initialize Swiper -->
		<script>
			var swiper = new Swiper('.swiper-container', {
				slidesPerView : 8,
				spaceBetween : 30,
				slidesPerGroup : 8,
				loop : true,
				loopFillGroupWithBlank : true,
				pagination : {
					el : '.swiper-pagination',
					clickable : true,
				},
				navigation : {
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				},
			});
		</script>
		<span style="text-align: center;"> </span> <br /> <h5 id="title">최신 등록</h5>
		<hr />
		<div class="w-auto container" style="border: 1px solid #3cb371;">
			<div class="row row-cols-3">
				<c:forEach items="${home }" var="dto">
					<div class='col w-auto'
						style="padding: 15px;">
						<div class="col w-auto">
							<a href="notice/content_view?c=${dto.nseq }"
								class="goodsBox-info"> <span class='logo'> <img
									class="img-fluid" style="width: 250px; height: 150px;"
									src='<%=application.getContextPath() %>/resources/uploadimg/${dto.nimg }'
									onerror="this.src='<%=application.getContextPath() %>/resources/img/white.jpg'"
									alt='' /> </br>
							</span> <span class='company'>${dto.nwriter }</span> </br> <span
								class='title'> <span>${dto.ntitle } </span>
							</span> <%-- <span class='wrap'> <span class='time'>/
										${dto.ntime }</span>
							</span> <span class='wrap'> <span class='local'>/
										${dto.nlocation }</span> <span class='pay'> <span
										class='payIcon hour'>/ ${dto.ntpay }</span> <span
										class='number'>${dto.npay }</span>원
								</span>
							</span> --%>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		&nbsp; <br />
		<hr />
		<div align="center">
			<!-- 	<img style="WIDTH: 650px" onclick="window.open(this.src)" alt="클릭하시면 조금더 커집니다.." hspace="0" src="./img/price.png"> -->
			<jsp:include page="price.jsp"></jsp:include>
		</div>
	</div>
	&nbsp;
	<br />
	<hr />
	<!-- <div class="fixed-bottom" > -->
	<div>
		<div class="jumbotron">
			<div align="center">
				<a href="customer/intro" class="text-success">회사소개</a> | <a
					href="customer/ccontract" class="text-success">이용약관</a> | <a
					href="#" class="text-success" data-toggle="modal"
					data-target="#staticBackdrop">이메일무단수집거부</a>
				<div class="modal fade" id="staticBackdrop" data-backdrop="static"
					data-keyboard="false" tabindex="-1" role="dialog"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">e-메일 무단수집
									거부</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="text-align: left;">본 웹사이트에
								게시된 e-메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며
								이를 위반 시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				| <a href="customer/campaign" class="text-success">알바보호정책</a> | <a
					href="customer/policy" class="text-success">운영정책</a> | <a
					href="customer/cscenter" class="text-success">문의/제안/신고</a>

			</div>
			<hr />
			<br /> <br />
			<div align="center">
				서울특별시 강동구 천호대로 1095 현대코아 3층 ㈜ 우동바 대표 : 엄준식 | 고객센터 02-1234-5678 <br />
				팩스 : 02-1234-4321 | 통신판매업 신고번호 : 제 강동-3872호 | 사업자등록번호 : 120-85-40538
				<br /> 직업정보제공사업 신고번호 : 서울청 제2020-18호 | E-mail : help@udongba.com <br />
			</div>
			<br /> <br />
			<div align="center">ⓒ uDongBa Corp. All rights reserved.</div>
		</div>
	</div>
</body>
</html>