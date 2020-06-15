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
<h2 style="text-align: center;">freply_view</h2>
<hr align="center" style="border: solid 3px black; width: 60%;" />
<br /><br />
<form action="freply" method="post">
<input type="hidden" name="fno" value="${freply_view.fno }" />
<input type="hidden" name="fgroup" value="${freply_view.fgroup }" />
<input type="hidden" name="fstep" value="${freply_view.fstep }" />
<input type="hidden" name="findent" value="${freply_view.findent }" />

	<div style="margin-left: auto; margin-right: auto; width: 60%; border: solid 2px gray;
				border-radius: 2em;">
		<h3 style="text-align: center;">${freply_view.ftitle }</h2>
		<br />
		<ul>
			<li style="text-align: left; list-style: none;">작성자 : ${freply_view.fwriter }</li>
			<li style="text-align: left; list-style: none;">조회수 : ${freply_view.fhit }</li>			
		</ul>
	</div>
<br />

<div  style="margin-left: auto; margin-right: auto; width: 60%;">
	<p>첨부 : ${freply_view.fileSrc }</p>
	<p> ${freply_view.fcontent }</p>
</div>

<br /> <br />
<hr align="center" style="border: solid 1px black; width: 60%;" />

<div style="margin-left: auto; margin-right: auto; width: 50%; border: solid 2px gray;
				border-radius: 1em;">
<br />				
	<input style="display: block; margin: 0 auto;" 
		type="text" name="freply" size="60" />
<br />		
</div>

<br />
<div style="margin-left: auto; margin-right: auto; width: 50%;">
<input type="submit" value="등록"  />
</div>






<%-- <table  style="margin-left: auto; margin-right: auto; width: 60%;">
	
	<tr>
		<td colspan="4">
			<input type="submit" value="수정" /> &nbsp;
			<a href="../free/fList">목록</a> &nbsp;
			<a href="fdelete?fno=${fcontent_view.fno }">삭제</a> &nbsp;
			<a href="freply_view?fno=${fcontent_view.fno }">답변</a>		
		</td>
	</tr>


</table> --%>
</form>
</body>

</html>