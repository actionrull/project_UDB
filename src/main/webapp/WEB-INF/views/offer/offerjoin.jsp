<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <jsp:include page="../header.jsp"></jsp:include> --%>
<head>
<!-- Bootstrap -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link href="<%=application.getContextPath()%>/resources/img/logo.png"
	rel="shortcut icon" type="image/x-icon">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join</title>


<script type="text/javascript">
	$(function() {
		$("form")
				.submit(
						function() {
							var getIDCheck = RegExp(/^[A-Za-z0-9가-힣]{2,8}$/);
							var getPWCheck = RegExp(/^[A-Za-z0-9_\.\-]{8,12}$/);
							var getNickName = RegExp(/^[A-Za-z0-9가-힣]{2,16}$/);
							var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

							//에러 초기화
							$("p.error").remove();
							$("dl dd").removeClass("error");

							//필수 항목 체크
							$(":text,:password")
									.filter(".validate")
									.each(
											function() {
												$(this)
														.filter(".required")
														.each(
																function() {
																	if ($(this)
																			.val() == "") {
																		$(this)
																				.parent()
																				.append(
																						"<p style='color:red'; class='error'>필수항목입니다</p>");
																	}
																});
											});

							//에러일 경우 처리
							if ($("p.error").length > 0) {
								$('html,body').animate(
										{
											scrollTop : $("p.error:first")
													.offset().top - 40
										}, 'slow');
								$("p.error").parent().addClass("error");
								return false;
							}

							if (!getIDCheck.test($("#id").val())) {
								alert("ID를 확인해주세요.");
								$("#id").val("");
								$("#id").focus();
								return false;
							}

							if (!getPWCheck.test($("#pw1").val())) {
								alert("비밀번호 형식이 올바르지 않습니다.");
								$("#pw1").val("");
								$("#pw1").focus();
								return false;
							}

							if ($("#pw1").val() != ($("#pw2").val())) {
								alert("비밀번호가 일치하지 않습니다.");
								$("#pw2").val("");
								$("#pw2").focus();
								return false;
							}

							if (!getNickName.test($("#msname").val())) {
								alert("사용할 수 없는 이름입니다");
								$("#msname").val("");
								$("#msname").focus();
								return false;
							}

							if (!getMail.test($("#email").val())) {
								alert("이메일 형식이 올바르지 않습니다.")
								$("#email").val("");
								$("#email").focus();
								return false;
							}
						});
	});

	$(function() {
		$("#id").focus(function() {
			$("#idEl").css("display", "none");
		});
		$("#msname").focus(function() {
			$("#nnEl").css("display", "none");
		});
	});

	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#msbirth")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy-mm-dd",
									maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										//시작일(startDate) datepicker가 닫힐때
										//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										$("#endDate").datepicker("option",
												"minDate", selectedDate);
									}

								});
				$("#endDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yymmdd",
									maxDate : 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										// 종료일(endDate) datepicker가 닫힐때
										// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}

								});
			});
</script>
</head>
<body>
	<div class="d-flex justify-content-around h-100">
		<a href="/project_UDB" style="color: green; font-size: 30px;"><img
			src="./img/logo.png" alt="로고" /></a>
		<div></div>
		<div>
			<br /> <br /> <a href="./login-view" class="text-success">로그인</a> |
			<a href="/Project_UDB0520" class="text-success">HOME</a> | <a
				href="#" class="text-success">채용정보</a> | <a href="#"
				class="text-success">인재정보</a> | <a href="#" class="text-success">고객지원</a>
		</div>
	</div>
	<hr />
	<!-- ===================================================================<상단바> -->
	<section>
	<div class="d-flex justify-content-center" id="container">
		<div id="content">
			<form action="offerjoin" method="post">

				<div>
					<label>ID 입력<span> ※ </span></label><br /> <input type="text"
						name="id" id="id" size="35" class="validate required"
						placeholder="2자리~8자리" /> <span id="idEl"
						style="font-style: italic; color: red;">&nbsp;&nbsp;${idDupl }</span>
				</div>
				<hr />

				<div>
					<label>비밀번호 입력<span> ※ </span></label><br /> <input
						type="password" name="pw1" id="pw1" size="35"
						class="validate required" /><br> 영문(대,소구별),숫자,특수문자 조합 8~12자
				</div>
				<hr />

				<div>
					<label>비밀번호 확인<span> ※ </span></label><br /> <input
						type="password" name="pw2" id="pw2" size="35"
						class="validate required" /><br />
				</div>
				<hr />

				<div>
					<label>기업명<span> ※ </span></label><br /> <input type="text"
						name="msname" id="msname" size="35" class="validate required" /><br>
					2~8자 <span id="nnEl" style="font-style: italic; color: red;">&nbsp;&nbsp;${nnDupl }</span>
				</div>
				<hr />

				<div>
					<label>사업자 등록번호<span> ※ </span></label><br /> <input type="text"
						name="molisense" id="molisense" size="35"
						class="validate required" />
				</div>
				<hr />

				<div>
					<label>대표 이메일 입력<span> ※ </span></label><br /> <input type="text"
						name="email" id="email" size="35" class="validate required" />
				</div>
				<hr />

				<div>
					<label>대표 주소 입력<span> ※ </span></label><br /> <input type="text"
						id="mspostcode" name="mspostcode" placeholder="우편번호"> <input
						type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="msaddr" name="msaddr" placeholder="주소"
						class="validate required"><br> <input type="text"
						id="msdetailaddress" name="msdetailaddress" placeholder="상세주소">
					<input type="text" id="msextraaddress" name="msextraaddress"
						placeholder="참고항목">
					<script
						src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						function sample6_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraAddr !== '') {
													extraAddr = ' ('
															+ extraAddr + ')';
												}
												// 조합된 참고항목을 해당 필드에 넣는다.
												document
														.getElementById("msextraaddress").value = extraAddr;

											} else {
												document
														.getElementById("msextraaddress").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('mspostcode').value = data.zonecode;
											document.getElementById("msaddr").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"msdetailaddress").focus();
										}
									}).open();
						}
					</script>
					<br />
				</div>
				<hr />

				<div>
					<label>대표 전화번호 입력<span> ※ </span></label><br /> <input type="text"
						name="mstel" id="mstel" size="35" class="validate required" />
				</div>
				<hr />







				<p style="text-align: center">
					<input class="btn btn-outline-success" type="submit" value="확인" />
					<input class="btn btn-outline-success" type="button" value="취소"
						onclick="location.href='/Project_UDB/'" />
				</p>
			</form>
		</div>
	</div>
	</section>
	<div class="jumbotron">
		<div align="center">
			<a href="<%=application.getContextPath()%>/customer/intro"
				class="text-success">회사소개</a> | <a
				href="<%=application.getContextPath()%>/customer/ccontract"
				class="text-success">이용약관</a> | <a href="#" class="text-success"
				data-toggle="modal" data-target="#staticBackdrop">이메일무단수집거부</a>
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
			| <a href="<%=application.getContextPath()%>/customer/campaign"
				class="text-success">알바보호정책</a> | <a
				href="<%=application.getContextPath()%>/customer/policy"
				class="text-success">운영정책</a> | <a
				href="<%=application.getContextPath()%>/customer/cscenter"
				class="text-success">문의/제안/신고</a>

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