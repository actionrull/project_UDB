<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<%
	Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>

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
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
<title>공고 관리</title>

</head>
<body>
<br />
<div class="container">
   <c:if test="${empty memberID }">
      <script type="text/javascript">
         alert("로그인이 필요합니다");
         location.href = "${HOME}/project_UDB/login-view";
      </script>
   </c:if>
   <c:if test="${not empty memberID }">
      <h3 id="title">공고 관리</h3>
      <br />
      <div class="guideBox" style="border: 3px solid green;">
         <br />
         <ul>
            <li>작성하신 공고의 공개 여부 및 기간을 수정 하실 수 있습니다.</li>
            <li>자신의 공고를 필요에 따라 각각 작성/관리 하실 수있으며 <strong>최대 5개</strong>까지
               보유하실 수 있습니다.
            </li>
            <li>프리미엄 등록을 통해 공고를 홈페이지 상단에 노출시킬 수 있습니다</li>            
           <!--  <li><strong>기본공고</strong>는 여러 공고를 작성하실 때 <strong>내용을
                  불러와 간편하게 작성</strong>할 수 있도록 지정하는 공고입니다.</li>
            <li>가장 최근에 업데이트 하신 공고를 기본공고로 지정하시면 최근 내용을 불러오실 수 있습니다.</li> -->
         </ul>
      </div>
      <br />
      <div>
         <table style="border: 3px solid lightgreen; height: 20px;">
            <tr>
               <td style="border: 3px solid lightgreen; width: 200px;"
                  align="center">
               <td style="width: 1000px;" align="center">원하는 인재상에 맞게 공고를 새로
                  작성해보세요</td>
               <td><input type="button" value="새 공고 작성" id="new-btn" /></td>
            </tr>
         </table>
      </div>
      <br />
      <h5>나의 공고 : 총 ${totalnoti }개</h5>
      <script type="text/javascript">
      		$(function(){
      			$('#new-btn').click(function(){
      				if ('${totalnoti}'==5) {
						alert("게시글 최대개수를 초과하였습니다.");						
						return false;
					}else{
						onclick=location.href='write_view';
					}
      			});
      		});
      </script>
      <div>
         <table
            style="border: 3px solid green; width: 1110px; text-align: center;">
            <tr>
               <td style="border: 3px solid green;">공고 제목</td>
               <td style="border: 3px solid green;">최종 수정일</td>
               <td style="border: 3px solid green;">관리</td>
               <td style="border: 3px solid green;">프리미엄 등록</td>
            </tr>
      <c:forEach items="${nmanage }" var="dto">
            <tr>
               <td style="border: 3px solid green;" align="left"><input
                  type="checkbox" /><a href="content_view?c=${dto.nseq }&p=${memberID }">${dto.ntitle }</a></td>
               <td style="border: 3px solid green;">${dto.nregdate}</td>
               <td style="border: 3px solid green;">
               <button type="button" id="btn-modify${dto.nseq }">수정</button><br />
               <button type="button" id="btn-delete${dto.nseq }" >삭제</button>
               </td>
               <script>
               		$(function(){
               			$('#btn-delete${dto.nseq }').click(function(){
               				if (confirm("삭제하시겠습니까?")) {
								self.location.href = "../notice/delete?nseq=${dto.nseq}";
							}
               			});
               			$('#btn-modify${dto.nseq}').click(function(){
               				location.href = "../notice/modify_view?nseq=${dto.nseq}";
               			});
               		});
               </script> 
               <td style="border: 3px solid green;">
               	<c:if test="${dto.npremium eq '0' }">
               	<button id="pay${dto.nseq }">프리미엄 등록</button> <img src="<%=application.getContextPath()%>/resources/img/guestion-512.png" title="홈페이지 상단부에 공고가 노출됩니다&#13;공고등록 만료까지 유지됩니다&#13;카카오페이 결제" />
               	</c:if>
               	<c:if test="${dto.npremium eq '1' }">
               		등록 완료 <img src="<%=application.getContextPath()%>/resources/img/checked_checkbox-512.png"/>
               	</c:if>
               </td>
               <script>
	$(document).ready(function() {
		$('#pay${dto.nseq }').click(function() {
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
					location.href = "./../notice/premium?nseq=${dto.nseq }"

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	});
</script>
            </tr>
      </c:forEach>
         </table>
      </div>
   </c:if>
	</div>
   &nbsp;
   <br />
   <hr />
   <div>
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
	</div>
</body>
</html>