<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script type="text/javascript" src="./../resources/js/summernote-ko-KR.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<div class="container" style="margin-left: auto; margin-right: auto; width: 70%;">

<!-- <h4 style="text-align: left; margin-left: 380px;">수정</h4>
<hr align="center"
					style="border-bottom: solid 1px  #3cb371 ; width: 55%;" />	 -->
<br /><br />
<form action="fmodify" method="post">
<input type="hidden" name="fno" value="${fmodify_view.fno }" />
<table class="w-100"  style="margin-left: auto; margin-right: auto; 
			border-collapse: separate; border-spacing: 0 10px;">
	<tr>
		<td align="center" colspan="2"><input  style="size: 8" type="text" name="ftitle"  value=" ${fmodify_view.ftitle }" size="40" /> </td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: right ;">[작성자] ${fmodify_view.fwriter }</td>
	</tr>
	<%-- <tr>
		 <td colspan="2" style="text-align: right; margin-right: 30px;">[조회수] ${fmodify_view.fhit }</td>
	</tr> --%>
	<tr>
		<td><hr align="center" style="border: solid 1px  #3cb371 ; width: 100%;" /></td>
	</tr>
	<%-- <tr>
		<td>첨부 : ${fmodify_view.fileSrc }</td>
	</tr> --%>
	<tr>
		<td><textarea name="fcontent" id="fcontent" cols="60" rows="10">${fmodify_view.fcontent }</textarea></td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="submit" value="수정" /> &nbsp;
			<a href="../free/fList">취소</a>
		</td>
	</tr>
	

</table>
</form>

</div>
	
	
	
	
	<div>
<br />
<hr />
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
<script type="text/javascript">
   $(document).ready(function() {
      //여기 아래 부분
      $('#fcontent').summernote({
           height: 300,                 // 에디터 높이
           minHeight: null,             // 최소 높이
           maxHeight: null,             // 최대 높이
           focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
           lang: "ko-KR",               // 한글 설정
           placeholder: ''   //placeholder 설정
             
      });
   });
</script>
</html>