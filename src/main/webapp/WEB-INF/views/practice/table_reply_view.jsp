<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>댓글쓰기</h2>
<form action="table_reply" method="post">
<input type="hidden" name="bid" value="${table_reply_view.bid }" />
<input type="hidden" name="bgroup" value="${table_reply_view.bgroup }" />
<input type="hidden" name="bstep" value="${table_reply_view.bstep }" />
<input type="hidden" name="bindent" value="${table_reply_view.bindent }" />
	
	<table>
		<tr>
		<td class="left">번호</td>
		<td>${table_reply_view.bid }</td>
	</tr>
	<tr>
		<td class="left">히트</td>
		<td>${table_reply_view.bhit }</td>
	</tr>
	<tr>
		<td class="left">이름</td>
		<td>
			<input type="text" name="bname"
			 value="${table_reply_view.bname }" />
		</td>
	</tr>
	<tr>
		<td class="left">제목</td>
		<td>
			<input type="text" name="btitle"
			value="${table_reply_view.btitle }" />
		</td>
	</tr>
	<tr>
		<td class="left">내용</td>
		<td>
			<textarea name="bcontent"  cols="50" rows="5">
			${table_reply_view.bcontent }
			</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" value="답변달기" /> &nbsp;&nbsp;
		</td>
	</tr>
	</table>
</form>
</body>
</html>