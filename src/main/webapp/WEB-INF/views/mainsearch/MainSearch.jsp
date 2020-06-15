<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<title>Insert title here</title>
</head>
<body>
<br />   
<!-- <h2 style="text-align: center">MainSearchResult</h2>
<hr align="center" style="border: solid 3px gray;" width="90%;" /> -->
<div class="container">
<input type="hidden" name="page" value="" />
<br />
<div style="margin-left: auto; margin-right: auto; width: 90%; height:auto; border-bottom:solid 2px #3cb371;
		border-radius: 0.5em; ">
	<br />
	<h4 style="font-family: sans-serif "; align="center">
	"입력하신 <strong style="color: #3cb371 ;">${ncategory }</strong> 에 대한 검색 결과입니다."</h4>
</div>


<%-- <div style="margin-left: auto; margin-right: auto; width: 90%; height:auto;  ">
	<p>검색결과 | 총 ${total }개</p>
	등록순<strong><a href="ordercheck?ot=1&ncategory=${param.ncategory}">∨</a>
					<a	href="ordercheck?ot=2&ncategory=${param.ncategory}">∧</a></strong>
	&nbsp;&nbsp;
	시급순<strong><a href="ordercheck?ot=3&ncategory=${param.ncategory}">∨</a>
					<a	href="ordercheck?ot=4&ncategory=${param.ncategory}">∧</a></strong>				
</div> --%>


<br /><br />


<c:forEach items="${ms }" var="dto">

<br />
	<div style=" width:80%; background-color: #c3e6cb;  height: 130px; 
			margin-left: auto;margin-right: auto; margin-top: auto; margin-bottom:0; border-radius: 0.5em;">
				
				<p style="text-align: center; font-size: 25px;">
				<a style="color: #2E8B57;" href="notice/content_view?c=${dto.nseq }&p=${memberID }" >&nbsp;&nbsp;&nbsp;"&nbsp;&nbsp;${dto.ntitle }&nbsp;&nbsp;"</a>
				
				</p>
				<hr align="center" style="margin-left: auto; margin-right: auto; border: solid 1px #3cb371 ; width: 90%; " />
				
				<div style="width: 50%; background-color: #c3e6cb; height: auto; margin-left: auto; margin-right: auto; 
							border:solid 2px #3cb371 ;	border-radius: 0.5em; ">
				
			&nbsp;&nbsp;&nbsp;[지역]&nbsp;  ${dto.nlocation }&nbsp;&nbsp;[시급]&nbsp;  ${dto.npay }&nbsp;&nbsp; [등록일]&nbsp;  ${dto.nregdate }&nbsp;<br />
				&nbsp;&nbsp;[미리보기]<c:if test="${empty sessionScope.dspreview }"><a href="previewon?pn=${dto.nseq }&remainpage=${searchVo.page }&dday=${dto.ndeadline }&now=<%= sf.format(nowTime) %>&ncategory=${param.ncategory}">
							<img src="<%=application.getContextPath() %>/img/slidedown.png" /></a></c:if>
							<c:if test="${not empty sessionScope.dspreview }">
							<c:if test="${dto.nseq eq sessionScope.dspreview }">
							<a href="previewoff?remainpage=${searchVo.page }&ncategory=${param.ncategory}">
							<img src="<%=application.getContextPath() %>/img/offpreview.png" /></a></c:if></c:if>&nbsp;&nbsp;
				
				</div>
				
			</div>	
			<br />
			
			
								
			
				<div style="margin-left: auto; margin-right: auto; width: 80%; height: auto; background-color:#66ff99 ; 
					border-radius: 0.5em;">
				
				<c:if test="${not empty sessionScope.dspreview }">
						<c:if test="${dto.nseq eq sessionScope.dspreview }">
							<table>
							<tbody>
								<tr height="50px">
									<td colspan="5">
									<strong>업 직 종</strong>&nbsp;&nbsp;&nbsp; ${dto.ncategory } 
									<br /> <pre><strong>기간·요일</strong> ${dto.nperiod }|${dto.nday }         <strong>마 감 일</strong> <c:if test="${empty dto.ndeadline }">상시모집</c:if><c:if test="${not empty dto.ndeadline}">${dto.ndeadline } (${lefttime })</c:if></pre>
									</td>	
								</tr>
							</tbody>
							</table>
						</c:if>
					</c:if>	
				</div>				
			

<hr align="center" width="90%;" />
	
</c:forEach >

<div style="margin-left: auto; margin-right: auto; width: 90%; height:auto;  ">
	<p>검색결과 | 총 ${total }개</p>
	등록순<strong><a href="ordercheck?ot=1&ncategory=${param.ncategory}">∨</a>
					<a	href="ordercheck?ot=2&ncategory=${param.ncategory}">∧</a></strong>
	&nbsp;&nbsp;
	시급순<strong><a href="ordercheck?ot=3&ncategory=${param.ncategory}">∨</a>
					<a	href="ordercheck?ot=4&ncategory=${param.ncategory}">∧</a></strong>				
</div>	
					


<br />
<!--페이징  -->
<div class="d-flex justify-content-center">
<c:if test="${searchVo.totPage>1 }">
			<c:if test="${searchVo.page>1 }">
				<a href="MainSearch?page=1&ncategory=${param.ncategory}">[처음]</a>
				<a href="MainSearch?page=${searchVo.page-1 }&ncategory=${param.ncategory}">[이전]</a>
			</c:if>
			<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
				<c:choose>
					<c:when test="${i eq searchVo.page }">
						<strong style="color: red">${i } &nbsp;</strong>
					</c:when>
					<c:otherwise>
						<a href="MainSearch?page=${i }&ncategory=${param.ncategory}">${i } &nbsp;</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${searchVo.totPage>searchVo.page }">
				<a href="MainSearch?page=${searchVo.page+1 }&ncategory=${param.ncategory}">[다음]</a>
				<a href="MainSearch?page=${searchVo.totPage }&ncategory=${param.ncategory}">[마지막]</a>
			</c:if>
		</c:if>
</div>		

<div>
	<hr />
</div>		
</div>
		

</body>
</html>