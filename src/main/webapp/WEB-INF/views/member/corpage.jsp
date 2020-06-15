<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/corpage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
<script>
   function goBottom() {
      $('html').scrollTop(document.body.scrollHeight);
   }     
</script>
<title>기업 페이지</title>
</head>
<body>
<div class="container">
   <c:if test="${empty memberID }">
      <script type="text/javascript">
         alert("로그인이 필요합니다");
         location.href = "${HOME}/project_UDB/login-view";
      </script>
   </c:if>
   <c:if test="${not empty memberID }">      
      
      <div class="container w-100">
      <h1 id="title"><strong>기업 페이지</strong></h1><br />
      
   <div class="row d-flex justify-content-center">
   <ul>
   <a href="<%=application.getContextPath()%>/notice/nmanage">
      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 Services-tab  item">
         <div class="folded-corner service_tab_1">
            <div class="text">
               <i class="fa fa-image fa-5x fa-icon-image"></i>
                  <p class="item-title">
                        <h3>내 공고</h3>
                     </p><!-- /.item-title -->
               <p><br /><br />
               <a href="#" onclick="btn()"><button type="button" class="btn btn-info" style="font-size: 15px;" >새 공고 작성</button></a>
               
               </p>
            </div>
         </div>
       </div></a>
       <script type="text/javascript">
      		function btn(){      			
      				if ('${totalnoti}'==5) {
						alert("게시글 최대개수를 초과하였습니다.");						
						return false;
					}else{
						onclick=location.href='<%=application.getContextPath()%>/notice/write_view';
					}
      			};
      		
      </script>
      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 Services-tab item">
         <div class="folded-corner service_tab_1">
            <div class="text">
               <i class="fa fa-line-chart fa-5x fa-icon-image" ></i>
                  <p class="item-title">
                     <h3>입사 지원자</h3>
                  </p><!-- /.item-title --> <br /><br />
                  <p style="font-size: 18px;">
                           <a href="<%=application.getContextPath()%>/member/appmanage"><button type="button" class="btn btn-info" style="font-size: 15px;" >지원자 관리</button></a>   
               </p>
            </div>
         </div>
      </div>
   
      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 Services-tab item">
            <div class="folded-corner service_tab_1">
               <div class="text">
                  <i class="fa fa-diamond fa-5x fa-icon-image"></i>
                     <p class="item-title">
                        <h3>회원 정보 수정</h3>
                     </p><!-- /.item-title -->
                  <p>
                  <div class="d-flex justify-content-around">
                  <div>
                  	<a href=changepass_view class="btn btn-info btn-sm" style="width: 90px; text-align: center;">비밀번호 변경</a>  
                  </div>
                  <div></div>
                  <div>
                  	<a href=changetel_view class="btn btn-info btn-sm" style="width: 90px; text-align: center;">전화번호 변경</a>
                  </div>
                  </div> <br />                 
                  <div class="d-flex justify-content-around">
                  <div>
                  	<a href=changeaddr_view class="btn btn-info btn-sm" style="width: 90px; text-align: center;">주소 변경</a>
                  </div>
                  <div></div>
                  <div>
                  	<a href=deleteid_view class="btn btn-info btn-sm" style="width: 90px; text-align: center;">회원 탈퇴</a>
                  </div>
                  </div> <br />
                  
                  <c:choose>
                     <c:when test="${msmaster == 'admin'}">
                        <a href=memberlist class="btn btn-info btn-sm" style="width: 90px; text-align: center;"> (관리자) <br />개인회원 정보</a>
                        <a href=offerlist class="btn btn-info btn-sm" style="width: 90px; text-align: center;"> (관리자) <br />법인회원 정보</a> 
                     </c:when>
                  </c:choose>
                  </p>
            </div>
         </div>
      </div>
      <a href="<%=application.getContextPath()%>/customer/cscenter">
      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 Services-tab item">
         <div class="folded-corner service_tab_1">
            <div class="text">
               <i class="fa fa-bullhorn fa-5x fa-icon-image"></i>
                  <p class="item-title">
                     <h3> 고객센터</h3>
                  </p><!-- /.item-title -->
               <p>
               
               </p>
            </div>
         </div>
      </div></a>
      </ul>
   </div>
</div>
      
      
   </c:if>
   </div>


   <br />
   <hr />
   <div>
      <div class="jumbotron">
         <div align="center">
            <a href="./../customer/intro" class="text-success">회사소개</a> | <a
               href="./../customer/ccontract" class="text-success">이용약관</a> | <a
               href="#" class="text-success" data-toggle="modal"
               data-target="#staticBackdrop">이메일무단수집거부</a>
            <div class="modal fade" id="staticBackdrop" data-backdrop="static"
               data-keyboard="false" tabindex="-1" role="dialog"
               aria-labelledby="staticBackdropLabel" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">e-메일 무단수집
                           거부</h5>
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                     </div>
                     <div class="modal-body" style="text-align: left;">본 웹사이트에
                        게시된 e-메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며
                        이를 위반 시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.</div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                           data-dismiss="modal">닫기</button>
                     </div>
                  </div>
               </div>
            </div>
            | <a href="./../customer/campaign" class="text-success">알바보호정책</a> | <a
               href="./../customer/policy" class="text-success">운영정책</a> | <a
               href="./../customer/cscenter" class="text-success">문의/제안/신고</a>

         </div>
         <hr />
         <br /> <br />
         <div align="center">
            서울특별시 강동구 천호대로 1095 현대코아 3층 ㈜ 우동바 대표 : 엄준식 | 고객센터 02-1234-5678 <br />
            팩스 : 02-1234-4321 | 통신판매업 신고번호 : 제 강동-3872호 | 사업자등록번호 : 120-85-40538
            <br /> 직업정보제공사업 신고번호 : 서울청 제2020-18호 | E-mail : help@udongba.com <br />
         </div>
         <br /> <br />
         <div align="center">ⓒ uDongBa Corp. All rights reserved.</div>
      </div>
   </div>
</body>
</html>