<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp" %>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>내용보기</h2>
	<form action="modify" method="post">
	<input type="hidden" name="bid" value="${table_view.bid }" />
		<table>
			<tr>
				<td class="left">번호</td>
				<td>${table_view.bid }</td>
			</tr>
			<tr>
				<td class="left">히트</td>
				<td>${table_view.bhit }</td>
			</tr>
			<tr>
				<td class="left">이름</td>
				<td><input type="text" name="bname" value="${table_view.bname }" /></td>
			</tr>
			<tr>
				<td class="left">제목</td>
				<td><input type="text" name="btitle" value="${table_view.btitle }" /></td>
			</tr>
			<tr>
				<td class="left">내용</td>
				<td><textarea name="bcontent" cols="50" rows="5">${table_view.bcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="수정" />&nbsp;&nbsp; 
				<a href="table">목록보기</a> &nbsp;&nbsp; 
				<a href="delete?bid=${table_view.bid }">삭제</a> &nbsp; 
				<a href="table_reply_view?bid=${table_view.bid }">답변</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>