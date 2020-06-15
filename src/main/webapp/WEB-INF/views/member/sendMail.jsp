<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>SendMail</title>


<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/gnb.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

    
      <div class="container" style="border: 2px solid black; width: 1080px;">
      <div class="d-flex justify-content-center">
      <label style="font-size: 30px;"><strong>인증 이메일이 전송 되었습니다.</strong></label>
      </div> <br /> &nbsp; &nbsp;
      <div class="d-flex justify-content-center">
      <label style="text-align: center;" >
      가입시 입력한 메일에서 인증 절차를 완료해주시기 바랍니다. <br />
      인증을 완료하셨다면 로그인화면으로 이동 후 진행가능니다.
      </label>
      </div>
      <div>
      <a href="login-view" class="d-flex justify-content-center">로그인 화면으로 이동</a>
      </div>
      </div>
      <br /><br /><br />
   <div align="center">ⓒ uDongBa Corp. All rights reserved.</div>
</body>
</html>