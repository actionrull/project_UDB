<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp"></jsp:include>
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
</head>
<body>
<div class="container">
<br />
	<h2 id="title">온라인 문의</h2>
	<h6 style="text-align: center;">온라인으로 접수된 문의는 <strong style="color: green;">24시간</strong> 이내에 답변을 드릴 수 있도록 노력하고 있습니다.</h6>
<br />
<form action="qList" id="form1" name="form1" method="post">

<input type="hidden" name="page" id="page" value="" />
<script type="text/javascript">
			function fnSubmitForm(page){ 
					document.form1.page.value=page;
					document.form1.submit();
					}
</script>

	<div class="container table-responsive w-100">
	<select name="qtype">
		<c:choose>
			<c:when test="${all }">
				<option  value="all" selected="selected" >전체</option>
			</c:when>
			<c:otherwise>
				<option  value="all" >전체</option>			
			</c:otherwise>
		</c:choose>	
		
		<c:choose>
			<c:when test="${modi }">
				<option  value="modi" selected="selected" >정보수정</option>
			</c:when>
			<c:otherwise>
				<option  value="modi" >정보수정</option>			
			</c:otherwise>
		</c:choose>	
		
		<c:choose>
			<c:when test="${service }">
				<option  value="service" selected="selected" >서비스이용</option>
			</c:when>
			<c:otherwise>
				<option  value="service" >서비스이용</option>			
			</c:otherwise>
		</c:choose>	
		
		<c:choose>
			<c:when test="${insert }">
				<option  value="insert" selected="selected" >구인공고등록</option>
			</c:when>
			<c:otherwise>
				<option  value="insert" >구인공고등록</option>			
			</c:otherwise>
		</c:choose>	
		
		<c:choose>
			<c:when test="${write }">
				<option  value="write" selected="selected" >이력서작성</option>
			</c:when>
			<c:otherwise>
				<option  value="write" >이력서작성</option>			
			</c:otherwise>
		</c:choose>	
	</select>
<input type="submit" value="정렬" />
<br /><br />

		<table class="table">
			<colgroup>
				<col width="15%" />
				<col width="40%" />
				<col width="15%" />
				<col width="30%" />
			</colgroup>
			
			<thead class="table-success">
				<tr>
					<th scope="col">조회수</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일자</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.qhit }</td>
						<td>
						<c:set value="${dto.qindent }" var="endIndent" />
						<c:forEach begin="1" end="${dto.qindent }" var="cnt">
							<c:if test="${cnt ne 1 }">
								&nbsp;
							</c:if>
							<c:if test="${cnt eq endIndent }">
							ㄴ[답변완료]
							</c:if>
						</c:forEach>
						<a href="qcontent_view?qno=${dto.qno }">${dto.qtitle }</a>
						</td>
						<td>${dto.qwriter }</td>
						<td>${dto.qdate }</td>
					</tr>
				</c:forEach>
				
					<tr>
						<td colspan="4"><c:if test="${not empty memberID }"><a href="qwrite_view">문의</a></c:if></td>
					</tr>
			</tbody>
			
		</table>
	</div>
	<br /><br />
	<div class="d-flex justify-content-center">
	<c:if test="${searchVo.totPage>1 }">
		<c:if test="${searchVo.page>1 }">
			<a href="javascript:fnSubmitForm(${1 });">[처음]</a>
			<a href="javascript:fnSubmitForm(${searchVo.page-1 });">[이전]</a>
		</c:if>
			
		<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
			<c:choose>
				<c:when test="${i eq searchVo.page }">
					<strong style="color: black">${i } &nbsp;</strong>
				</c:when>
				<c:otherwise>
					<a href="javascript:fnSubmitForm(${i });">${i } &nbsp;</a>
				</c:otherwise>
			</c:choose> 
		</c:forEach>
		
		<c:if test="${searchVo.totPage>searchVo.page }">
			<a href="javascript:fnSubmitForm(${searchVo.page+1});">[다음]</a>
			<a href="javascript:fnSubmitForm(${searchVo.totPage});">[끝]</a>
		</c:if>
		
	</c:if>
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