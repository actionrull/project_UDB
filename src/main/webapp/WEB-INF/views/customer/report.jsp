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
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">   
<jsp:include page="../header.jsp"></jsp:include>
<title>허위정보신고</title>
<script type="text/javascript">
function chk(){
 var req = document.form.req.checked;
 var num = 0;
 if(req == true){
  num = 1;
 }
 if(num==1){
  document.form.submit();
 }else{
  alert("개인정보 약관에 동의하셔야 합니다.");
 }
}

</script>
</head>
<body>
<form action="#" name="form" method="post">
	<div class="container w-100">
	<h2>허위정보신고</h2>
	<hr />
		<p style="font-size: 14px;">우동바는 신뢰성 있는 구인공고를 제공하고자 노력하고 있습니다. <br/>
		구인공고 내용에 허위사실이 있거나 사기성 또는 불건전한 내용 등 허위정보로 의심되거나 이로 인해 피해를 보신 경우 신고해 주세요. <br/>
		정확한 내용으로 신고해 주신 분들께 선정을 통해 소정의 상품을 드리오니 상품 수령을 위해 연락처를 바르게 기재하여 주시기 바랍니다. <br/>
		* 입력한 연락처는 사실 확인 용도로만 사용되며,신고한 업체에는 노출되지 않습니다.</p><hr />
		<p><strong>문의하실 내용을 작성하신 후 보내기 버튼을 클릭하세요.</strong></p>
		<table class="table" style="border: 2px solid lightgreen;">
			<tr>
				<td style="border-right: 2px solid lightgreen;" width="200px;">채용공고URL</td>
				<td><input type="text" size="80px;" /></td>
			</tr>
			<tr>
				<td style="border-right: 2px solid lightgreen;">신고제목</td>
				<td><input type="text" size="80px;"/></td>
			</tr>
			<tr>
				<td style="border-right: 2px solid lightgreen;">회사명</td>
				<td><input type="text" size="50px;"/></td>
			</tr>
			<tr>
				<td style="border-right: 2px solid lightgreen;">신고자명*</td>
				<td><input type="text" size="50px;"/></td>
			</tr>
			<tr>
				<td style="border-right: 2px solid lightgreen;">휴대폰*</td>
				<td><input type="text" size="50px;"/></td>
			</tr>
			<tr>
				<td style="border-right: 2px solid lightgreen;">신고사유*</td>
				<td><input type="radio" name="option" value="통장,신분증,비밀번호를 요구하는 경우"/> 통장,신분증,비밀번호를 요구하는 경우<br/>
					<input type="radio" name="option" value="유흥업 및 불건전 업소"/> 유흥업 및 불건전 업소<br />
					<input type="radio" name="option" value="광고 내용과 실제 근무 조건이 다른경우"/> 광고 내용과 실제 근무 조건이 다른경우<br />
					<input type="radio" name="option" value="다단계 및 통신상품 판매업체"/> 다단계 및 통신상품 판매업체<br />
					<input type="radio" name="option" value="최저임금보다 적은 급여"/> 최저임금보다 적은 급여<br />
					<input type="radio" name="option" value="업체 연락처가 잘못된 경우"/> 업체 연락처가 잘못된 경우<br />
					<input type="radio" name="option" value="채용이 이미 마감된 경우"/> 채용이 이미 마감된 경우<br />
					<input type="radio" name="option" value="기타"/> 기타</td>
			</tr>
			<tr>
				<td style="border-right: 2px solid lightgreen;">신고내용*</td>
				<td><textarea style="width: 700px; height: 200px;"></textarea></td>
			</tr>
		</table>
		<p><strong>개인정보 수집 및 이용동의 안내</strong></p>
		<table class="table">
			<tr style="border-top: 1px solid gray;">
				<td style="border-right: 1px solid gray;">수집주체</td>
				<td>(주) 우동바</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid gray;">수집항목</td>
				<td>신고자명, 휴대폰번호</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid gray;">수집목적</td>
				<td>신고내용 사실 확인 및 경품 발송을 위한 목적으로 수집하며 이외의 목적으로는 사용되지 않습니다.</td>
			</tr>
			<tr style="border-bottom: 1px solid gray;">
				<td style="border-right: 1px solid gray;">보유기간</td>
				<td>신고완료 및 경품 당첨자 선정/발송 후 3개월 이내 파기함</td>
			</tr>
		</table> <br />
		    <div align="center">
			<input type="checkbox" name="req"/> 개인정보 수집 및 이용에 동의합니다. <br /><br />
			<button type="button" class="btn btn-danger" onclick="chk()">신고하기</button>
		    </div>
		

	</div>
	</form>

<br /> <hr />
      <div>
			<div class="jumbotron">
				<div align="center">
					<a href="<%=application.getContextPath()%>/customer/intro" class="text-success">회사소개</a> | <a href="<%=application.getContextPath()%>/customer/ccontract"
						class="text-success">이용약관</a> | 
						<a href="#" class="text-success" data-toggle="modal" data-target="#staticBackdrop">이메일무단수집거부</a>
						<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="staticBackdropLabel">e-메일 무단수집 거부</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body" style="text-align: left;">
						        본 웹사이트에 게시된 e-메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며 이를 위반 시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
					| <a href="<%=application.getContextPath()%>/customer/campaign" class="text-success">알바보호정책</a> | <a href="<%=application.getContextPath()%>/customer/policy"
						class="text-success">운영정책</a> | <a href="<%=application.getContextPath()%>/customer/cscenter" class="text-success">문의/제안/신고</a>
					
				</div>
				<hr />
				<br />
				<br />
				<div align="center">
					서울특별시 강동구 천호대로 1095 현대코아 3층 ㈜ 우동바 대표 : 엄준식 | 고객센터 02-1234-5678 <br />
					팩스 : 02-1234-4321 | 통신판매업 신고번호 : 제 강동-3872호 | 사업자등록번호 :
					120-85-40538 <br /> 직업정보제공사업 신고번호 : 서울청 제2020-18호 | E-mail :
					help@udongba.com <br />
				</div>
				<br />
				<br />
				<div align="center">ⓒ uDongBa Corp. All rights reserved.</div>
			</div>
		</div>    
</body>
</html>