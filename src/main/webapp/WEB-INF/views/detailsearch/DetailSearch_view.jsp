<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/notice.css" />
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/js/jquery-3.3.1.min.js" />
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
<title>Insert title here</title>

<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#radioButton').click(function() {
					// getter
					var radioVal = $('input[name="radioTxt"]:checked').val();
					document.getElementById("yo").value = radioVal;
				});
			});
		</script>

		<script type="text/javascript">
			function check_submit() {
				var form2 = document.form2;
				/* if (form2.ntpay.value = "") {
					alert("시급은 필수 입력사항입니다.");
					form2.ntpay[0].focus();
					return false;
				} */
				if (form2.npay.value == "") {
					alert("시급은 필수 입력사항입니다.");
					form2.npay.focus();
					return false;
				}
			}
		</script>
		<br />
		<h2 id="title">상세검색</h2>
		<hr align="center" style="border: solid 3px gray;" width="90%;" />
		<br />
		<form action="DetailSearch" method="post" name="form2"
			onsubmit="return check_submit();">
			<div
				style="margin-left: auto; margin-right: auto; width: 90%; height: auto; border: solid 2px yellowgreen; border-radius: 0.5em;">
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />
				<div
					style="margin-left: auto; margin-right: auto; width: 90%; height: auto;">
					<label>[ 지 역 ] </label> <br />
					<!-- &nbsp;<input type="radio" name="nlocation" value="강동전체" /> <label>강동전체</label> -->
					&nbsp;<input type="radio" name="nlocation" value="강일" /> <label>강일동</label>
					&nbsp;<input type="radio" name="nlocation" value="고덕" /> <label>고덕동</label>
					&nbsp;<input type="radio" name="nlocation" value="길" /> <label>길동</label>
					&nbsp;<input type="radio" name="nlocation" value="둔촌" /> <label>둔촌동</label>
					<br /> &nbsp;<input type="radio" name="nlocation" value="명일" /> <label>명일동</label>
					&nbsp;<input type="radio" name="nlocation" value="상일" /> <label>상일동</label>
					&nbsp;<input type="radio" name="nlocation" value="성내" /> <label>성내동</label>
					&nbsp;<input type="radio" name="nlocation" value="암사" /> <label>암사동</label>
					&nbsp;<input type="radio" name="nlocation" value="천호" /> <label>천호동</label>
				</div>
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />

				<div
					style="margin-left: auto; margin-right: auto; width: auto%; height: auto;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>[ 업직종 ] </label> <br />
					<!-- 시작 -->
					<div>
						<div class="horizontal-tabs">
							<ul class="nav nav-tabs " role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#a-h" role="tab" aria-controls="1">외식
										· 음료</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#b-h" role="tab" aria-controls="2">유통 · 판매</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#c-h" role="tab" aria-controls="3">문화 · 여가 · 생활</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#d-h" role="tab" aria-controls="4">서비스</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#e-h" role="tab" aria-controls="5">사무직</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#f-h" role="tab" aria-controls="6">고객상담 · 리서치 · 영업</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#g-h" role="tab" aria-controls="7">생산 · 건설 · 노무</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#h-h" role="tab" aria-controls="8">IT · 컴퓨터</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#i-h" role="tab" aria-controls="9">교육 · 강사</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#j-h" role="tab" aria-controls="10">디자인</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#k-h" role="tab" aria-controls="11">미디어</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#l-h" role="tab" aria-controls="12">운전 · 배달</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#m-h" role="tab" aria-controls="13">병원 · 간호 · 연구</a></li>
							</ul>
							<div class="tab-content job">
								<div class="tab-pane active" id="a-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input class="checkBoxId" type="radio"
													value="일반음식점" name="radioTxt" /> 일반음식점</li>
												<li><input class="checkBoxId" type="radio" value="레스토랑"
													name="radioTxt" /> 레스토랑</li>
												<li><input class="checkBoxId" type="radio"
													value="페밀리레스토랑" name="radioTxt" /> 페밀리레스토랑</li>
												<li><input class="checkBoxId" type="radio"
													value="패스트푸드점" name="radioTxt" /> 패스트푸드점</li>
												<li><input class="checkBoxId" type="radio"
													value="치킨 · 피자전문점" name="radioTxt" /> 치킨 · 피자전문점</li>
												<li><input class="checkBoxId" type="radio"
													value="커피전문점" name="radioTxt" /> 커피전문점</li>
												<li><input class="checkBoxId" type="radio"
													value="아이스크림 · 디저트" name="radioTxt" /> 아이스크림 · 디저트</li>
												<li><input class="checkBoxId" type="radio"
													value="베이커리 · 도넛 · 떡" name="radioTxt" /> 베이커리 · 도넛 · 떡</li>
												<li><input class="checkBoxId" type="radio"
													value="호프 · 일반주점" name="radioTxt" /> 호프 · 일반주점</li>
												<li><input class="checkBoxId" type="radio"
													value="바(bar)" name="radioTxt" /> 바(bar)</li>
												<li><input class="checkBoxId" type="radio"
													value="급식 · 푸드시스템" name="radioTxt" /> 급식 · 푸드시스템</li>
												<li><input class="checkBoxId" type="radio"
													value="도시락 · 반찬" name="radioTxt" /> 도시락 · 반찬</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="b-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input class="checkBoxId" type="radio"
													value="백화점·면세점" name="radioTxt" /> 백화점·면세점</li>
												<li><input class="checkBoxId" type="radio"
													value="복합쇼핑몰·아울렛" name="radioTxt" /> 복합쇼핑몰·아울렛</li>
												<li><input class="checkBoxId" type="radio"
													value="쇼핑몰·소셜커머스·홈쇼핑" name="radioTxt" /> 쇼핑몰·소셜커머스·홈쇼핑</li>
												<li><input class="checkBoxId" type="radio"
													value="유통점·마트" name="radioTxt" /> 유통점·마트</li>
												<li><input class="checkBoxId" type="radio" value="편의점"
													name="radioTxt" /> 편의점</li>
												<li><input class="checkBoxId" type="radio"
													value="의류·잡화매장" name="radioTxt" /> 의류·잡화매장</li>
												<li><input class="checkBoxId" type="radio"
													value="뷰티·헬스스토어" name="radioTxt" /> 뷰티·헬스스토어</li>
												<li><input class="checkBoxId" type="radio"
													value="휴대폰·전자기기매장" name="radioTxt" /> 휴대폰·전자기기매장</li>
												<li><input class="checkBoxId" type="radio"
													value="가구·침구·생활소품" name="radioTxt" /> 가구·침구·생활소품</li>
												<li><input class="checkBoxId" type="radio"
													value="서점·문구·팬시" name="radioTxt" /> 서점·문구·팬시</li>
												<li><input class="checkBoxId" type="radio" value="약국"
													name="radioTxt" /> 약국</li>
												<li><input class="checkBoxId" type="radio"
													value="농수산·청과·축산" name="radioTxt" /> 농수산·청과·축산</li>
												<li><input class="checkBoxId" type="radio"
													value="화훼·꽃집" name="radioTxt" /> 화훼·꽃집</li>
												<li><input class="checkBoxId" type="radio"
													value="유통·판매 기타" name="radioTxt" /> 유통·판매 기타</li>
											</ul>
										</table>
									</div>
								</div>
								<div class="tab-pane" id="c-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input class="checkBoxId" type="radio"
													value="놀이공원·테마파크" name="radioTxt" /> 놀이공원·테마파크</li>
												<li><input class="checkBoxId" type="radio"
													value="호텔·리조트·숙박" name="radioTxt" /> 호텔·리조트·숙박</li>
												<li><input class="checkBoxId" type="radio"
													value="여행·캠프·레포츠" name="radioTxt" /> 여행·캠프·레포츠</li>
												<li><input class="checkBoxId" type="radio"
													value="영화·공연" name="radioTxt" /> 영화·공연</li>
												<li><input class="checkBoxId" type="radio"
													value="전시·컨벤션·세미나" name="radioTxt" /> 전시·컨벤션·세미나</li>
												<li><input class="checkBoxId" type="radio"
													value=스터디룸·독서실·고시원 " name="radioTxt" /> 스터디룸·독서실·고시원</li>
												<li><input class="checkBoxId" type="radio" value="PC방"
													name="radioTxt" /> PC방</li>
												<li><input class="checkBoxId" type="radio" value="노래방"
													name="radioTxt" /> 노래방</li>
												<li><input class="checkBoxId" type="radio"
													value="볼링·당구장" name="radioTxt" /> 볼링·당구장</li>
												<li><input class="checkBoxId" type="radio"
													value="스크린 골프·야구" name="radioTxt" /> 스크린 골프·야구</li>
												<li><input class="checkBoxId" type="radio"
													value="DVD·멀티방·만화카페" name="radioTxt" /> DVD·멀티방·만화카페</li>
												<li><input class="checkBoxId" type="radio"
													value="오락실·게임장" name="radioTxt" /> 오락실·게임장</li>
												<li><input class="checkBoxId" type="radio"
													value="이색테마카페" name="radioTxt" /> 이색테마카페</li>
												<li><input class="checkBoxId" type="radio" value="키즈카페"
													name="radioTxt" /> 키즈카페</li>
												<li><input class="checkBoxId" type="radio"
													value="찜질방·사우나·스파" name="radioTxt" /> 찜질방·사우나·스파</li>
												<li><input class="checkBoxId" type="radio"
													value="피트니스·스포츠" name="radioTxt" /> 피트니스·스포츠</li>
												<li><input class="checkBoxId" type="radio" value="공인중개"
													name="radioTxt" /> 공인중개</li>
												<li><input class="checkBoxId" type="radio" value="골프캐디"
													name="radioTxt" /> 골프캐디</li>
												<li><input class="checkBoxId" type="radio"
													value="고속도로휴게소" name="radioTxt" /> 고속도로휴게소</li>
												<li><input class="checkBoxId" type="radio"
													value="문화·여가·생활 기타" name="radioTxt" /> 문화·여가·생활 기타</li>
											</ul>
										</table>
									</div>
								</div>
								<div class="tab-pane" id="d-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value=매장관리·판매 name="radioTxt" />
													매장관리·판매</li>
												<li><input type="radio" value="MD" name="radioTxt" />
													MD</li>
												<li><input type="radio" value="캐셔·카운터" name="radioTxt" />
													캐셔·카운터</li>
												<li><input type="radio" value="서빙" name="radioTxt" />
													서빙</li>
												<li><input type="radio" value="주방장·조리사" name="radioTxt" />
													주방장·조리사</li>
												<li><input type="radio" value="주방보조·설거지"
													name="radioTxt" /> 주방보조·설거지</li>
												<li><input type="radio" value="바리스타" name="radioTxt" />
													바리스타</li>
												<li><input type="radio" value="안내데스크" name="radioTxt" />
													안내데스크</li>
												<li><input type="radio" value="주차관리·주차도우미"
													name="radioTxt" /> 주차관리·주차도우미</li>
												<li><input type="radio" value="보안·경비·경호"
													name="radioTxt" /> 보안·경비·경호</li>
												<li><input type="radio" value="주유·세차" name="radioTxt" />
													주유·세차</li>
												<li><input type="radio" value="전단지배포" name="radioTxt" />
													전단지배포</li>
												<li><input type="radio" value="청소·미화" name="radioTxt" />
													청소·미화</li>
												<li><input type="radio" value="렌탈관리·A/S"
													name="radioTxt" /> 렌탈관리·A/S</li>
												<li><input type="radio" value="헤어·미용·네일샵"
													name="radioTxt" /> 헤어·미용·네일샵</li>
												<li><input type="radio" value="피부관리·마사지"
													name="radioTxt" /> 피부관리·마사지</li>
												<li><input type="radio" value="반려동물케어" name="radioTxt" />
													반려동물케어</li>
												<li><input type="radio" value="베이비시터·가사도우미"
													name="radioTxt" /> 베이비시터·가사도우미</li>
												<li><input type="radio" value="결혼·연회·장례도우미"
													name="radioTxt" /> 결혼·연회·장례도우미</li>
												<li><input type="radio" value="판촉도우미" name="radioTxt" />
													판촉도우미</li>
												<li><input type="radio" value="이벤트·행사스텝"
													name="radioTxt" /> 이벤트·행사스텝</li>
												<li><input type="radio" value="나레이터모델" name="radioTxt" />
													나레이터모델</li>
												<li><input type="radio" value="피팅모델" name="radioTxt" />
													피팅모델</li>
												<li><input type="radio" value="서비스 기타" name="radioTxt" />
													서비스 기타</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="e-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value="사무보조" name="radioTxt" />
													사무보조</li>
												<li><input type="radio" value="문서작성·자료조사"
													name="radioTxt" /> 문서작성·자료조사</li>
												<li><input type="radio" value="비서" name="radioTxt" />
													비서</li>
												<li><input type="radio" value="경리·회계보조" name="radioTxt" />
													경리·회계보조</li>
												<li><input type="radio" value="인사·총무" name="radioTxt" />
													인사·총무</li>
												<li><input type="radio" value="마케팅·광고·홍보"
													name="radioTxt" /> 마케팅·광고·홍보</li>
												<li><input type="radio" value="번역·통역" name="radioTxt" />
													번역·통역</li>
												<li><input type="radio" value="복사·출력·제본"
													name="radioTxt" /> 복사·출력·제본</li>
												<li><input type="radio" value="편집·교정·교열"
													name="radioTxt" /> 편집·교정·교열</li>
												<li><input type="radio" value="공공기관·공기업·협회"
													name="radioTxt" /> 공공기관·공기업·협회</li>
												<li><input type="radio" value="학교·도서관·교육기관"
													name="radioTxt" /> 학교·도서관·교육기관</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="f-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value="고객상담·인바운드"
													name="radioTxt" /> 고객상담·인바운드</li>
												<li><input type="radio" value="텔레마케팅·아웃바운드"
													name="radioTxt" /> 텔레마케팅·아웃바운드</li>
												<li><input type="radio" value="금융·보험영업" name="radioTxt" />
													금융·보험영업</li>
												<li><input type="radio" value="일반영업·판매" name="radioTxt" />
													일반영업·판매</li>
												<li><input type="radio" value="설문조사·리서치"
													name="radioTxt" /> 설문조사·리서치</li>
												<li><input type="radio" value="영업관리·지원" name="radioTxt" />
													영업관리·지원</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="g-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value="제조·가공·조립"
													name="radioTxt" /> 제조·가공·조립</li>
												<li><input type="radio" value="포장·품질검사" name="radioTxt" />
													포장·품질검사</li>
												<li><input type="radio" value="입출고·창고관리"
													name="radioTxt" /> 입출고·창고관리</li>
												<li><input type="radio" value="상하차·소화물 분류"
													name="radioTxt" /> 상하차·소화물 분류</li>
												<li><input type="radio" value="기계·전자·전기"
													name="radioTxt" /> 기계·전자·전기</li>
												<li><input type="radio" value="정비·수리·설치·A/S"
													name="radioTxt" /> 정비·수리·설치·A/S</li>
												<li><input type="radio" value="공사·건설현장" name="radioTxt" />
													공사·건설현장</li>
												<li><input type="radio" value="PVC(닥트·배관설치)"
													name="radioTxt" /> PVC(닥트·배관설치)</li>
												<li><input type="radio" value="조선소" name="radioTxt" />
													조선소</li>
												<li><input type="radio" value="재단·재봉" name="radioTxt" />
													재단·재봉</li>
												<li><input type="radio" value="생산·건설·노무"
													name="radioTxt" /> 생산·건설·노무</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="h-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value="웹·모바일기획" name="radioTxt" />
													웹·모바일기획</li>
												<li><input type="radio" value="사이트·콘텐츠 운영"
													name="radioTxt" /> 사이트·콘텐츠 운영</li>
												<li><input type="radio" value="바이럴·SNS마케팅"
													name="radioTxt" /> 바이럴·SNS마케팅</li>
												<li><input type="radio" value="프로그래머" name="radioTxt" />
													프로그래머</li>
												<li><input type="radio" value="HTML코딩" name="radioTxt" />
													HTML코딩</li>
												<li><input type="radio" value="QA·테스터·검증"
													name="radioTxt" /> QA·테스터·검증</li>
												<li><input type="radio" value="시스템·네트워크·보안"
													name="radioTxt" /> 시스템·네트워크·보안</li>
												<li><input type="radio" value="PC·디지털기기 설치·관리"
													name="radioTxt" /> PC·디지털기기 설치·관리</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="i-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value="입시·보습학원" name="radioTxt" />
													입시·보습학원</li>
												<li><input type="radio" value="외국어·어학원" name="radioTxt" />
													외국어·어학원</li>
												<li><input type="radio" value="컴퓨터·정보통신"
													name="radioTxt" /> 컴퓨터·정보통신</li>
												<li><input type="radio" value="요가·필라테스 강사"
													name="radioTxt" /> 요가·필라테스 강사</li>
												<li><input type="radio" value="피트니스 트레이너"
													name="radioTxt" /> 피트니스 트레이너</li>
												<li><input type="radio" value="레져스포츠 강사"
													name="radioTxt" /> 레져스포츠 강사</li>
												<li><input type="radio" value="예체능 강사" name="radioTxt" />
													예체능 강사</li>
												<li><input type="radio" value="유아·유치원" name="radioTxt" />
													유아·유치원</li>
												<li><input type="radio" value="방문·학습지" name="radioTxt" />
													방문·학습지</li>
												<li><input type="radio" value="보조교사" name="radioTxt" />
													보조교사</li>
												<li><input type="radio" value="자격증·기술학원"
													name="radioTxt" /> 자격증·기술학원</li>
												<li><input type="radio" value="국비교육기관" name="radioTxt" />
													국비교육기관</li>
												<li><input type="radio" value="교육·강사 기타"
													name="radioTxt" /> 교육·강사 기타</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="j-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value="웹·모바일디자인"
													name="radioTxt" /> 웹·모바일디자인</li>
												<li><input type="radio" value="그래픽·편집디자인"
													name="radioTxt" /> 그래픽·편집디자인</li>
												<li><input type="radio" value="제품·산업디자인"
													name="radioTxt" /> 제품·산업디자인</li>
												<li><input type="radio" value="CAD·CAM·인테리어디자인"
													name="radioTxt" /> CAD·CAM·인테리어디자인</li>
												<li><input type="radio" value="캐릭터·애니메이션디자인"
													name="radioTxt" /> 캐릭터·애니메이션디자인</li>
												<li><input type="radio" value="패션·잡화디자인"
													name="radioTxt" /> 패션·잡화디자인</li>
												<li><input type="radio" value="디자인 기타" name="radioTxt" />
													디자인 기타</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="k-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value="보조출연·방청" name="radioTxt" />
													보조출연·방청</li>
												<li><input type="radio" value="방송스텝·촬영보조"
													name="radioTxt" /> 방송스텝·촬영보조</li>
												<li><input type="radio" value="동영상촬영·편집"
													name="radioTxt" /> 동영상촬영·편집</li>
												<li><input type="radio" value="사진촬영·편집" name="radioTxt" />
													사진촬영·편집</li>
												<li><input type="radio" value="조명·음향" name="radioTxt" />
													조명·음향</li>
												<li><input type="radio" value="방송사·프로덕션"
													name="radioTxt" /> 방송사·프로덕션</li>
												<li><input type="radio" value="신문·잡지·출판"
													name="radioTxt" /> 신문·잡지·출판</li>
												<li><input type="radio" value="미디어 기타" name="radioTxt" />
													미디어 기타</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="l-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value="운송·이사" name="radioTxt" />
													운송·이사</li>
												<li><input type="radio" value="대리운전·일반운전"
													name="radioTxt" /> 대리운전·일반운전</li>
												<li><input type="radio" value="택시·버스운전" name="radioTxt" />
													택시·버스운전</li>
												<li><input type="radio" value="수행기사" name="radioTxt" />
													수행기사</li>
												<li><input type="radio" value="화물·중장비·특수차"
													name="radioTxt" /> 화물·중장비·특수차</li>
												<li><input type="radio" value="택배·퀵서비스" name="radioTxt" />
													택배·퀵서비스</li>
												<li><input type="radio" value="배달" name="radioTxt" />
													배달</li>
											</ul>
										</table>
									</div>
								</div>

								<div class="tab-pane" id="m-h" role="tabpanel">
									<div class="sv-tab-panel">
										<table>
											<ul class="row row-cols-5">
												<li><input type="radio" value="간호조무사·간호사"
													name="radioTxt" /> 간호조무사·간호사</li>
												<li><input type="radio" value="간병·요양보호사"
													name="radioTxt" /> 간병·요양보호사</li>
												<li><input type="radio" value="원무·코디네이터"
													name="radioTxt" /> 원무·코디네이터</li>
												<li><input type="radio" value="외래보조·병동보조"
													name="radioTxt" /> 외래보조·병동보조</li>
												<li><input type="radio" value="수의사·수의간호사"
													name="radioTxt" /> 수의사·수의간호사</li>
												<li><input type="radio" value="실험·연구보조" name="radioTxt" />
													실험·연구보조</li>
												<li><input type="radio" value="생동성·임상시험"
													name="radioTxt" /> 생동성·임상시험</li>
											</ul>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div style="margin-left: auto; margin-right: auto; width: 45%;">
						<button type="button" name="button" id="radioButton">확인</button>
						&nbsp;&nbsp;
						<!-- 끝 -->
						<input name="ncategory" id="yo" type="text" size="20" readonly>
					</div>
				</div>
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />

				<div
					style="margin-left: auto; margin-right: auto; width: 90%; height: auto;">
					<label>[ 근무기간 ] </label> <br /> &nbsp;<input type="radio"
						name="nperiod" value="1이하"><label>1주일 이하</label> &nbsp;<input
						type="radio" name="nperiod" value="1개월"><label>1주일~1개월</label>
					&nbsp;<input type="radio" name="nperiod" value="3개월"><label>1개월~3개월</label>
					&nbsp;<input type="radio" name="nperiod" value="6개월"><label>3개월~6개월</label>
					<br /> &nbsp;<input type="radio" name="nperiod" value="1년"><label>6개월~1년</label>
					&nbsp;<input type="radio" name="nperiod" value="이상"><label>1년이상</label>
					&nbsp;<input type="radio" name="nperiod" value="협의"><label>기간협의</label>
				</div>
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />

				<div
					style="margin-left: auto; margin-right: auto; width: 90%; height: auto;">
					<label>[ 근무요일 ] </label> <br /> &nbsp;<input type="radio"
						name="nday" value="일"><label>월~일</label> &nbsp;<input
						type="radio" name="nday" value="토"><label>월~토</label>
					&nbsp;<input type="radio" name="nday" value="금"><label>월~금</label>
					&nbsp;<input type="radio" name="nday" value="일"><label>토,일</label>
					&nbsp;<input type="radio" name="nday" value="6일"><label>주6일</label>
					&nbsp;<input type="radio" name="nday" value="5일"><label>주5일</label>
					<br /> &nbsp;<input type="radio" name="nday" value="2일"><label>주2일</label>
					&nbsp;<input type="radio" name="nday" value="1일"><label>주1일</label>
					&nbsp;<input type="radio" name="nday" value="협의"><label>요일협의</label>
				</div>
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />

				<div
					style="margin-left: auto; margin-right: auto; width: 90%; height: auto;">
					<label>[ 근무시간 ] </label> <br /> &nbsp;<input type="radio"
						name="ntime" value="오전"><label>오전</label> &nbsp;<input
						type="radio" name="ntime" value="오후"><label>오후</label>
					&nbsp;<input type="radio" name="ntime" value="09">&nbsp;<label>09:00~18:00</label>
					&nbsp;<input type="radio" name="ntime" value="10">&nbsp;<label>10:00~17:00</label>
				</div>
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />

				<div
					style="margin-left: auto; margin-right: auto; width: 90%; height: auto;">
					<label>*[ 급여 ] </label> <br /> &nbsp;<select name="ntpay" size="1">
						<option>- - 선택 - -</option>
						<option value="시급">시급</option>
						<option value="일급">일급</option>
						<option value="주급">주급</option>
						<option value="월급">월급</option>
						<option value="연봉">연봉</option>
					</select> &nbsp;&nbsp;&nbsp; &nbsp;<input
						type="text" name="npay" size="10" />&nbsp;원 이상
				</div>
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />

				<div
					style="margin-left: auto; margin-right: auto; width: 90%; height: auto;">
					<label>[ 복리후생 ] </label> <br /> &nbsp;<input type="radio"
						name="nwelfare" value="4대"><label>4대보험</label> &nbsp;<input
						type="radio" name="nwelfare" value="휴가"><label>휴가,휴무</label>
					&nbsp;<input type="radio" name="nwelfare" value="수당"><label>야간,휴일근로수당</label>
					&nbsp;<input type="radio" name="nwelfare" value="중식"><label>중식,석식제공</label>
				</div>
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />

				<div
					style="margin-left: auto; margin-right: auto; width: 90%; height: auto;">
					<label>[ 성별 ] </label> <br /> &nbsp;<input type="radio"
						name="ngender" value="성별무관"><label>성별무관</label> &nbsp;<input
						type="radio" name="ngender" value="남자"><label>남자</label>
					&nbsp;<input type="radio" name="ngender" value="여자"><label>여자</label>
				</div>
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />

				<div
					style="margin-left: auto; margin-right: auto; width: 90%; height: auto;">
					<label>[ 연령 ] </label> <br /> &nbsp;<input type="radio"
						name="nage" value="연령무관"><label>연령무관</label> &nbsp;<input
						type="radio" name="nage" value="연령제한"><label>연령제한</label>
					&nbsp;<input size="10" type="text" name="nag" />&nbsp;세
				</div>
				<hr align="center"
					style="border-bottom: solid 1px yellowgreen; width: 95%;" />


				<input type="hidden" name="page" value="" /> <br />

				<div style="margin-left: auto; margin-right: auto; width: 20%;">
					<input type="submit" value="검색" />
					<br /> <br />
				</div>
			</div>
		</form>
	</div>
		<div class="jumbotron">
			<div align="center">
				<a href="./../customer/intro" class="text-success">회사소개</a> | <a
					href="./../customer/ccontract" class="text-success">이용약관</a> | <a
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
				| <a href="./../customer/campaign" class="text-success">알바보호정책</a> | <a
					href="./../customer/policy" class="text-success">운영정책</a> | <a
					href="./../customer/cscenter" class="text-success">문의/제안/신고</a>

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
</body>
</html>