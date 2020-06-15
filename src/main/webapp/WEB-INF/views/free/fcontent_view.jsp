<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<title>Insert title here</title>
<style type="text/css">
.f{
	border-collapse: separate;
  	border-spacing: 0 10px;
  	width: 90%;
}
</style>
</head>
<body>
<br>
<div class="w-100" style="width: 1080px;">

<!-- <h4 style="text-align: left; margin-left: 350px;">후기</h4>
<hr align="center"
					style="border-bottom: solid 1px  #3cb371 ; width: 55%;" /> -->	
<br>
<br />
<form action="fmodify_view?fno=${fcontent_view.fno }" method="post">
<input type="hidden" name="fno" value="" />

	<div style="margin-left: auto; margin-right: auto; width: 50%; border: solid 2px #3cb371 ;
				border-radius: 2em;">
		<br>		
		<h4 style="text-align: center;">${fcontent_view.ftitle }</h4>
		<hr align="center" style="border-bottom: solid 1px #3cb371 ; width: 50%; ">	
		
		<div align="right" style="margin-left: auto; margin-right: 50px; " >
			[작성자] ${fcontent_view.fwriter } &nbsp;&nbsp; [조회수] ${fcontent_view.fhit }
		</div>
		
	</div>
<br /> <br>
<!--  border-left:solid 2px #3cb371 ; border-right:solid 2px #3cb371 ;	border-radius: 1em;-->
<div align="center" style="margin-left: auto; margin-right: auto; width: 50%; height:auto; " >
	<div  style="margin-left: auto; margin-right: auto; width: 60%;">
	<c:if test="${not empty fcontent_view.fileSrc }"><img style="width: 300px; height: 200px;" 
	src="../resources/upload/${fcontent_view.fileSrc }" alt="그림" /></c:if>
	<br />
	<p> ${fcontent_view.fcontent }</p>
	</div>
</div>

<br />
<hr align="center" style="border: solid 1px #3cb371 ; width: 50%;" />
<br>

<table  style="margin-left: auto; margin-right: auto; width: 50%;">
	
	<tr>
		<td colspan="4">
			<c:if test="${memberID eq fcontent_view.fwriter }"><input type="submit" value="수정" /> &nbsp;
			<a href="fdelete?fno=${fcontent_view.fno }">삭제</a> &nbsp;</c:if>
			<a href="../free/fList">목록</a> &nbsp;
		</td>
	</tr>


</table>
<br /><br />
</form>



	<c:forEach items="${frcontent_view }" var="frcontent_view">
		<div style="margin-left: auto; margin-right: auto; width: 50%; height:auto;
			border: solid 2px #3cb371 ; border-radius: 0.5em;">
	<br>
	<p style="text-align: left;">&nbsp;&nbsp;작성자 : ${frcontent_view.frwriter } &nbsp;&nbsp; 작성시간 : ${frcontent_view.frdate }</p>
	<p style="text-align: left;">&nbsp;&nbsp; ${frcontent_view.frcontent }</p>
	<!-- <hr align="center" style="border: solid 1px #3cb371 ; width: 95%;" />	 -->
		</div>
		<br />
	</c:forEach>
<br>

<div align="left" style="margin-left: auto; margin-right: auto; width: 50%;" >
[댓글 작성]
</div>

<br>

<div style="margin-left: auto; margin-right: auto; width: 50%;
		border-top: solid 2px #3cb371 ;
				border-radius: 0.5em;" >
			
	<form action="freply?fno=${fcontent_view.fno }" method="post">
			<table class="f">
				<!-- <tr>
					<td>[작성자]</td>
					<td><input type="text" name="frwriter" size="10"></td>
				</tr> -->
				<tr>
					<td>[내용]</td>
					<td> <textarea  name="frcontent" id="" cols="50" rows="3"></textarea></td>
					
				</tr>
				<tr>
					<td colspan="2"><input  type="submit" value="등록" /></td>
					
				</tr>				
			</table>
	</form>				
</div>

<br />
</div>

</div>
<br /> 
<hr />

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