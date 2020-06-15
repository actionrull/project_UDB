<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>글쓰기</h2>
<form action="table_write" method="post">
	<table>
		<tr>
				<td>이름</td>
				<td><input type="text" name="bname" size="30" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="btitle" size="30" /></td>
			</tr>
			<tr>
				<td >내용</td>
				<td><textarea rows="5" name="bcontent" cols="50" ></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입력"/>
					<a href="table">목록보기</a>
				</td>
			</tr>
	</table>
</form>
</body>
</html>