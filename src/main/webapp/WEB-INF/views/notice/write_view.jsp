<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../header.jsp"></jsp:include>
<head>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>



<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 결제기능 -->
<script>
	$(document).ready(function() {
		$('#pay').click(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp99236624'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '프리미엄배너결제',
				amount : 150000,
				buyer_email : 'iamport@siot.do',
				buyer_name : '애용',
				buyer_tel : '010-0000-0000',
				buyer_addr : '서울 강동구 어디쯤',
				buyer_postcode : '123-456',
			/* m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
			}, function(rsp) {
				event.preventDefault()
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					location.href = "./../notice/write_premium"

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	});
</script>

<link href="<%=application.getContextPath()%>/resources/img/logo.png"
	rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/css/notice.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="form2" id="form" method="post"
	onsubmit="return check_submit();"
		enctype="multipart/form-data">
		<div class="w-100 h-100 container">
			<div style="padding: 15px;">
				<label>공고 제목 :</label> &nbsp; <input type="text" name="ntitle" size="50" /> <br />
				<label>공고 내용 :</label> &nbsp; <input type="text" name="ncontent"
					size="50" />
			</div>
			<hr />
			<div style="padding: 15px;">
				<h3>근무 지역</h3>

				<input type="button" onclick="sample5_execDaumPostcode()"
					value="주소 검색"> <br /> <input type="text"
					id="sample5_address" size="50" name="naddr" placeholder="주소">
				&nbsp; <input type="text" id="sample5_detailAddress" size="50"
					placeholder="상세주소"> <br /> <input type="text"
					id="sample5_extraAddress" size="50" placeholder="참고항목">
				&nbsp; <input type="text" name="nlocation" size="50"
					placeholder="지역"> <br />
				<div id="map"
					style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
				<br /> <label>인근 지하철역 : </label>&nbsp; <input type="text"
					name="nnearsub" size="20">


				<script
					src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbcd375776081f93a035d9a90c792297&libraries=services"></script>

				<script type="text/javascript">
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					mapOption = {
						center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
						level : 5
					// 지도의 확대 레벨
					};

					//지도를 미리 생성
					var map = new daum.maps.Map(mapContainer, mapOption);
					//주소-좌표 변환 객체를 생성
					var geocoder = new daum.maps.services.Geocoder();
					//마커를 미리 생성
					var marker = new daum.maps.Marker({
						position : new daum.maps.LatLng(37.537187, 127.005476),
						map : map
					});

					function sample5_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {

										var addr = data.address; // 최종 주소 변수      
										var extraRoadAddr = ''; // 참고 항목 변수

										// 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById("sample5_address").value = addr;
										// 주소로 상세 정보를 검색
										geocoder
												.addressSearch(
														data.address,
														function(results,
																status) {
															// 정상적으로 검색이 완료됐으면

															if (status === daum.maps.services.Status.OK) {

																var result = results[0]; //첫번째 결과의 값을 활용

																// 해당 주소에 대한 좌표를 받아서
																var coords = new daum.maps.LatLng(
																		result.y,
																		result.x);
																$('#form')
																		.append(
																				"<input type='hidden' id='lat' name='lat' value='" + result.y + "' >");
																$('#form')
																		.append(
																				"<input type='hidden' id='lng' name='lng' value='" + result.x + "' >");
																// 지도를 보여준다.
																mapContainer.style.display = "block";
																map.relayout();
																// 지도 중심을 변경한다.
																map
																		.setCenter(coords);
																// 마커를 결과값으로 받은 위치로 옮긴다.
																marker
																		.setPosition(coords)
															}
															// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
															if (data.bname !== ''
																	&& /[동|로|가]$/g
																			.test(data.bname)) {
																extraRoadAddr += data.bname;
															}
															// 건물명이 있고, 공동주택일 경우 추가한다.
															if (data.buildingName !== ''
																	&& data.apartment === 'Y') {
																extraRoadAddr += (extraRoadAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}
															// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
															if (extraRoadAddr !== '') {
																extraRoadAddr = ' ('
																		+ extraRoadAddr
																		+ ')';
															}
															// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
															if (addr !== '') {
																document
																		.getElementById("sample5_extraAddress").value = extraRoadAddr;
															} else {
																document
																		.getElementById("sample5_extraAddress").value = '';
															}

														});
									}

								}).open();
					}

					$(document)
							.ready(
									function() {
										$('#radioButton')
												.click(
														function() {
															// getter
															var radioVal = $(
																	'input[name="radioTxt"]:checked')
																	.val();
															document
																	.getElementById("ncategory").value = radioVal;
														});
									});

					$(document)
							.ready(
									function() {
										$.datepicker
												.setDefaults($.datepicker.regional['ko']);
										$("#ndeadline")
												.datepicker(
														{
															changeMonth : true,
															changeYear : true,
															nextText : '다음 달',
															prevText : '이전 달',
															dayNames : [ '일요일',
																	'월요일',
																	'화요일',
																	'수요일',
																	'목요일',
																	'금요일',
																	'토요일' ],
															dayNamesMin : [
																	'일', '월',
																	'화', '수',
																	'목', '금',
																	'토' ],
															monthNamesShort : [
																	'1월', '2월',
																	'3월', '4월',
																	'5월', '6월',
																	'7월', '8월',
																	'9월',
																	'10월',
																	'11월',
																	'12월' ],
															monthNames : [
																	'1월', '2월',
																	'3월', '4월',
																	'5월', '6월',
																	'7월', '8월',
																	'9월',
																	'10월',
																	'11월',
																	'12월' ],
															dateFormat : "yy-mm-dd",
															maxDate : 100, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
															setDate : 'today', // 시작날짜를 오늘기준으로
															startDate : '+1d',
															onClose : function(
																	selectedDate) {
																//시작일(startDate) datepicker가 닫힐때
																//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
																$("#endDate")
																		.datepicker(
																				"option",
																				"minDate",
																				selectedDate);
															}

														});
										$("#endDate")
												.datepicker(
														{
															changeMonth : true,
															changeYear : true,
															nextText : '다음 달',
															prevText : '이전 달',
															dayNames : [ '일요일',
																	'월요일',
																	'화요일',
																	'수요일',
																	'목요일',
																	'금요일',
																	'토요일' ],
															dayNamesMin : [
																	'일', '월',
																	'화', '수',
																	'목', '금',
																	'토' ],
															monthNamesShort : [
																	'1월', '2월',
																	'3월', '4월',
																	'5월', '6월',
																	'7월', '8월',
																	'9월',
																	'10월',
																	'11월',
																	'12월' ],
															monthNames : [
																	'1월', '2월',
																	'3월', '4월',
																	'5월', '6월',
																	'7월', '8월',
																	'9월',
																	'10월',
																	'11월',
																	'12월' ],
															dateFormat : "yymmdd",
															maxDate : 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
															onClose : function(
																	selectedDate) {
																// 종료일(endDate) datepicker가 닫힐때
																// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
																$("#startDate")
																		.datepicker(
																				"option",
																				"maxDate",
																				selectedDate);
															}

														});
									});
				</script>
				
				<script type="text/javascript">
    function check_submit(){
       var form2 = document.form2;
       if (form2.npersonnel.value=="") {   // nday(select) 값이 비어있으면
         alert("모집인원을 입력해주세요.");      // 경고창을 띄운다
         form2.npersonnel.focus();      // nday(select)를 focus한다.
         return false;
      }if (form2.ndeadline.value=="") {
         alert("모집마감일을 입력해주세요.");
         form2.ndeadline.focus();
         return false;
      }if (form2.nwriter.value=="") {
         alert("담당자명을 입력해주세요.");
         form2.nwriter.focus();
         return false;
      }if (form2.nreception.value=="") {
         alert("담당자번호를 입력해주세요.");
         form2.nreception.focus();
         return false;
      }if (form2.nperiod.value=="") {
         alert("근무기간을 선택해주세요.");
         form2.nperiod[0].focus();       //0번째 nperiod(radio)로 focus
         return false;
      }if (form2.nday.value=="") {       
         alert("근무요일을 선택해주세요.");   
         form2.nday.focus();         
         return false;
      }if (form2.ntime.value=="") {       
         alert("근무시간을 선택해주세요.");   
         form2.ntime.focus();         
         return false;
      }if (form2.ntpay.value=="") {      
         alert("급여를 선택해주세요.");      
         form2.ntpay.focus();      
         return false;
      }if (form2.npay.value=="0") {
         alert("급여를 입력해주세요.");
         form2.npay.focus();       
         return false;
      }if (form2.ngender.value=="") {
         alert("성별을 선택해주세요.");
         form2.ngender[0].focus();       
         return false;
      }if (form2.nage.value=="") {
         alert("연령을 선택해주세요.");
         form2.nage[0].focus();       
         return false;
      }if (form2.nage.value=="연령제한") {
         if (form2.nag.value=="") {
         alert("연령을 선택해주세요.");   
         form2.nag.focus();         
         return false;            
         }
      }
    }                        
    </script>
				
				<div class="inputArea" style="padding: 15px;">
					<tr>
						<td>이미지</td>
						<br />
						<td><input type="file" id="nimg" name="nimg" value="" /></td>
					</tr>
					<div class="select_img">
						<img src="" />
					</div>
					<script>
						$("#nimg").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
				</div>
				<hr />
				<div class="mozip" style="padding: 15px;">
					<h3>모집 내용</h3>
					<!-- 시작 -->
					<div>
						<div class="horizontal-tabs">
							<ul class="nav nav-tabs " role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#a-h" role="tab" aria-controls="1">외식·음료</a></li>
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
							<div class="tab-content">
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
													value="스터디룸·독서실·고시원" name="radioTxt" /> 스터디룸·독서실·고시원</li>
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
												<li><input type="radio" value="전체" name="radioTxt" />
													전체</li>
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
												<li><input type="radio" value="전체" name="radioTxt" />
													전체</li>
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
												<li><input type="radio" value="전체" name="radioTxt" />
													전체</li>
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
												<li><input type="radio" value="전체" name="radioTxt" />
													전체</li>
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
												<li><input type="radio" value="전체" name="radioTxt" />
													전체</li>
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
												<li><input type="radio" value="전체" name="radioTxt" />
													전체</li>
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
												<li><input type="radio" value="전체" name="radioTxt" />
													전체</li>
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
												<li><input type="radio" value="전체" name="radioTxt" />
													전체</li>
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
												<li><input type="radio" value="전체" name="radioTxt" />
													전체</li>
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
												<li><input type="radio" value="전체" /> 전체</li>
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
					<button type="button" name="button" id="radioButton">확인</button>
					<br />
					<!-- 끝 -->
					<label>업직종 :</label> <br /> <input id="ncategory" size="25"
						type="text" name="ncategory" placeholder="카테고리에서 골라주세요" readonly>
					<br /> <label>*모집 인원 :</label> <br /> <input type="text"
						size="25" name="npersonnel" maxlength="15"
						placeholder="ex)2명 or 0명(인원미정)" /> <br /> <label>*모집 마감일
						:</label> <br /> <input type="text" size="25" placeholder="금일 이후 날짜 선택"
						id="ndeadline" name="ndeadline" readonly /> <br /> <label>복리
						후생 :</label> <br /> <input type="text" size="25" name="nwelfare"
						size="25" />

				</div>
				<hr />

				<h3>담당자 정보</h3>
				<div style="padding: 15px;">
					<label>*담당자명</label> &nbsp; <input type="text" name="nwriter"
						size="10" /> <label>*담당자 번호 :</label> &nbsp; <input type="text"
						name="nreception" size="20" maxlength="13" /> <br />
				</div>
				<hr />
				<div style="padding: 15px;">
					<h3>근무 조건</h3>
				</div>

				<div style="padding: 15px;">
					<label>*근무기간 :</label> &nbsp; <input type="radio" name="nperiod"
						value="1주일 이하" /><label>1주일 이하</label> &nbsp; <input type="radio"
						name="nperiod" value="1주일~1개월" /><label>1주일~1개월</label> &nbsp; <input
						type="radio" name="nperiod" value="1개월~3개월" /><label>1개월~3개월</label>
					&nbsp; <input type="radio" name="nperiod" value="3개월~6개월" /><label>3개월~6개월</label>
					&nbsp; <input type="radio" name="nperiod" value="6개월~1년" /><label>6개월~1년</label>
					&nbsp; <input type="radio" name="nperiod" value="1년이상" /><label>1년
						이상</label> &nbsp; <input type="radio" name="nperiod" value="기간협의" /><label>기간협의</label>
					<br /> <label>*근무요일 :</label> &nbsp; <select name="nday" id="nday"
						size="1">
						<option selectd value="">--선택--</option>
						<option value="월~일">월~일</option>
						<option value="월~토">월~토</option>
						<option value="월~금">월~금</option>
						<option value="토, 일">토, 일</option>
						<option value="주6일">주6일</option>
						<option value="주5일">주5일</option>
						<option value="주2일">주2일</option>
						<option value="주1일">주1일</option>
						<option value="요일협의">요일협의</option>
					</select> <br /> <label>*근무시간 :</label> &nbsp; <input type="text"
						name="ntime" size="30" placeholder="ex)09:00~18:00 (휴게시간 60분)" />

					<br /> <label>*급여 :</label> &nbsp; <select name="ntpay" id="npay"
						size="1">
						<option>- - 선택 - -</option>
						<option value="시급">시급</option>
						<option value="일급">일급</option>
						<option value="주급">주급</option>
						<option value="월급">월급</option>
						<option value="연봉">연봉</option>
					</select> &nbsp;&nbsp;&nbsp; <input type="text" name="npay" /> 원
					<!-- <td> <input type="button"  value="100만"  /></td> -->
					<br />
				</div>
				<hr />
				<div style="padding: 15px;">
					<h3>지원 조건</h3>

					<label>성별 :</label> &nbsp; <input type="radio" name="ngender"
						value="성별무관" /><label>성별무관</label> &nbsp; <input type="radio"
						name="ngender" value="남자" /><label>남자</label> &nbsp; <input
						type="radio" name="ngender" value="여자" /><label>여자</label> &nbsp;
					<br /> <label>연령 :</label> &nbsp; <input type="radio" name="nage"
						value="연령무관" /><label>연령무관</label> &nbsp; <input type="radio"
						name="nage" value="연령제한" /><label>연령제한</label> &nbsp; <input
						type="text" name="nag" size="30" placeholder="ex)20세~29세" value="" /> <br />
					<label>우대조건 :</label> &nbsp; <input type="text" name="npt"
						size="50" /> <br />

				</div>
				<input colspan="2" type="submit" value="등록" formaction="./../notice/write">
				<%-- <input colspan="2" type="submit" value="프리미엄 등록" id="pay"> <img src="<%=application.getContextPath()%>/resources/img/guestion-512.png" title="홈페이지 상단부에 공고가 노출됩니다&#13;공고등록 만료까지 유지됩니다&#13;카카오페이 결제" /> 
				<button type="submit" value="프리미엄 등록" id="pay">프리미엄 등록</button> --%>
				<a href="notice">목록보기</a>
			</div>
	</form>
	<div>
		<hr />
	</div>
</body>
</html>