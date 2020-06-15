<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br />
<div style="margin-left: auto; margin-right: auto; width: 70%;">

<!-- <h4 style="text-align: center;">답변</h4>
<hr align="center"
					style="border-bottom: solid 1px  #3cb371 ; width: 55%;" />	 -->
<br>
<br />
<form action="qreply" method="post">
<input type="hidden" name="qno" value="${qreply_view.qno }" />
<input type="hidden" name="qtitle" value="${qreply_view.qtitle }" />
<input type="hidden" name="qtype" value="${qreply_view.qtype }" />
<input type="hidden" name="qcontent" value="${qreply_view.qcontent }" />
<input type="hidden" name="qgroup" value="${qreply_view.qgroup }" />
<input type="hidden" name="qstep" value="${qreply_view.qstep }" />
<input type="hidden" name="qindent" value="${qreply_view.qindent }" />
<div style="margin-left: auto; margin-right: auto; width: 50%; border: solid 2px #3cb371 ;
				border-radius: 2em;">
	<br />		
	<h4 style="text-align: center;">${qreply_view.qtitle }</h4>
	<hr align="center" style="border-bottom: solid 1px #3cb371 ; width: 50%; ">		
	<%-- <ul>
			<li style="text-align: left; list-style: none;">등록일 :${qreply_view.qdate } </li>
			<li style="text-align: left; list-style: none;">작성자 :${qreply_view.qwriter } </li>			
	</ul> --%>
	<div align="right" style="margin-left: auto; margin-right: 50px; " >
		<%-- 	[작성자] ${qcontent_view.qwriter } --%> &nbsp;&nbsp; [등록일] ${qreply_view.qdate }
		</div>
	
</div>
<br />
<div style="margin-left: auto; margin-right: auto; width: 50%; height: 200px; " >
<br />
	<p style="text-align:center;"> ${qreply_view.qcontent }</p>
</div>
<br /><br />
<hr align="center" style="border: solid 1px #3cb371 ; width: 55%;" />
<br />

<div style="margin-left: auto; margin-right: auto; width: 50%; height: 100px; 
border: solid 1px #3cb371 ; border-radius: 1em;" >
<br />
	<input style="display: block; margin: 0 auto; border: 0px;" 
		type="text" name="qrcontent" size="60" />
</div>
<br />
<div style="margin-left: auto; margin-right: auto; width: 50%;">
	
	<input type="submit" value="답변달기" /> &nbsp;
	<a href="../question/qList">목록</a> &nbsp;
</div>
</form>

</div>

		<div><br /><hr />
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