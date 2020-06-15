<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/login.css" />
<title>로그인페이지</title>
</head>
<body>
<div>
<div class="d-flex justify-content-around h-100">
	<a href="/Project_UDB" style="color: green; font-size: 30px;">우 동 바  <br />
 		 우리 동네 알바</a>
</div>
<div>

</div>
</div>
<hr />
<section class="login-block">
    <div class="container" style="border: 10px solid green;">
   <div class="d-flex justify-content-center">
      <div class="col-md-4 login-sec">
          <h2 class="text-center">로그인</h2>
          <form class="login-form" action="/Project_UDB">
  <div class="form-group">
    <label for="exampleInputEmail1" class="text-uppercase">아이디</label>
    <input type="text" class="form-control" placeholder="아이디">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" class="text-uppercase">비밀번호</label>
    <input type="password" class="form-control" placeholder="비밀번호">
  </div>
  
  
    <div class="form-check">
    <label class="form-check-label">
      <input type="checkbox" class="form-check-input">
      <small>자동 로그인</small>
    </label>
    <button type="submit" class="btn btn-login float-right">로그인</button>
  </div>
  <br />
  <div class="form-group">
  	<a href="#" class="text-success">아이디/비밀번호 찾기</a>
  </div>
  
</form>
      </div>
</div>
</div>
</section>
</body>
</html>