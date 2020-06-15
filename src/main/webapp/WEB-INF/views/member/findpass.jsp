<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>changepass</title>
<script type="text/javascript"
   src="./../resources/js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findpass</title>

<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/gnb.js"></script>
   <script type="text/javascript">
    $(function(){
    	$("form").submit(function(){
    		var getIDCheck=RegExp(/^[A-Za-z0-9가-힣]{2,8}$/);
    	    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    	
    		//에러 초기화
    		$("p.error").remove();
    		$("dl dd").removeClass("error");
    		
    		//필수 항목 체크
    		$(":text,:password").filter(".validate").each(function(){
    			$(this).filter(".required").each(function(){
    				if($(this).val()==""){
    					$(this).parent().append("<p class='error'>필수항목입니다</p>");
    				}
    			});
    		});
    		
    		//에러일 경우 처리
    		if($("p.error").length > 0){
    				$('html,body').animate({ scrollTop: $("p.error:first").offset().top-40 }, 'slow');
    				$("p.error").parent().addClass("error");
    				return false;
    
				}

			if (!getIDCheck.test($("#id").val())) {
				alert("ID를 확인해주세요.");
				$("#id").val("");
				$("#id").focus();
				return false;
			}

			if (!getMail.test($("#email").val())) {
				alert("이메일 형식이 올바르지 않습니다.")
				$("#email").val("");
				$("#email").focus();
				return false;
			}
		});
	});
    $(function(){
    	$("#id").focus(function(){
    		$("#idEl").css("display","none");
    	});
    });    
</script>
</head>
<body>
<div id="wrap">
		<div class="d-flex justify-content-center">
      <div style="padding-right: 200px;">
         <a href="/project_UDB"><img
            src="<%=application.getContextPath()%>/resources/img/logo.png"
            alt="로고" /></a>
      </div>

      <div>
         <br /> <br /> <a href="/project_UDB" class="text-success">HOME</a>
         | <a href="#" class="text-success">개인서비스</a> | <a href="logout"
            class="text-success">로그아웃</a>
      </div>
   </div>


   <hr />
   <div style="text-align: center;">
      <h2>비밀번호찾기</h2>
   </div>
   <br />
   <br />
   

   <form action="findpass" method="post">
   <div class="container" id="content" style="width: 700px;">
      <div class="row">
         <div class="col-md-12">
            <nav>
            <div class="nav nav-tabs nav-fill btn-group btn-group-toggle"
               id="nav-tab" role="tablist">
               <a class="nav-item nav-link btn btn-info" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">비밀번호 번경</a>
               
            </div>
            </nav>
            <div class="tab-content d-flex justify-content-center" id="nav-tabContent" style="border: 3px solid lightblue; padding: 50px;">

               <div class="tab-pane fade show active" id="nav-profile" role="tabpanel"
                  aria-labelledby="nav-profile-tab">
                  <br />
                  <div>
                  	<label>아이디를 입력해주세요</label> <br />
                     <input type="text" name="id" id="id" size="35" class="validate required" />
                  </div>
                  <br />
                  <div>
                  	<label>회원가입시 입력한 이메일을 입력해주세요</label> <br />
                     <input type="text" name="email" id="email" size="35" class="validate required" />
                  </div>
                  <br />

                  <div>
                     <p class="text-success">안전한 비밀번호를 사용하는 방법!</p>
                     -영문, 숫자, 특수기호 3가지 모두 조합하세요. <br /> -아이디와 동일한 비밀번호는 사용하지 마세요. <br />
                     -연속된 영문/숫자나 키보드의 연속패턴은 사용하지 마세요. <br />
                		(ex. AAA, 1234, ASDF) <br />
                     -비밀번호는 주기적으로 변경해주세요.
                  </div>
                  <br />

                  <th colspan="2">
                  
                <p style="text-align:center; margin-bottom:20px;">
                	<input class="btn btn-outline-success" type="submit" value="확인" />
					<a class="btn btn-outline-success" href="<%=application.getContextPath()%>">취소</a>
				</p>
                  </th>

               </div>

               
            </div>
         </div>
      </div>
   </div>
   </form>
   </section>
</div>
</body>
</html>