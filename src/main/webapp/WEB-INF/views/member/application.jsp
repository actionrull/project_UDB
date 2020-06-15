<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   <c:if test="${empty memberID }">
      <script type="text/javascript">
         alert("로그인이 필요합니다");
         location.href = "${HOME}/project_UDB/login-view";
      </script>
   </c:if>
   <c:if test="${not empty memberID }">

      <br />
      <h2 id="title">지원현황</h2>
      <hr align="center" style="border: solid 3px gray;" width="90%;" />
      <br />
      <div class="container">
         <div
            style="margin-left: auto; margin-right: auto; width: 90%; height: auto; border: solid 2px yellowgreen; border-radius: 0.5em;"">
            <br />
            <p>&nbsp;&nbsp;* 입사 지원한 내역을 확인하실 수 있습니다.</p>

            <!-- <p>&nbsp;&nbsp;* 입사 지원 후 이력서를 수정할 경우 지원한 이력서의 내용도 수정되며, 삭제할 경우 지원한 회사에는 삭제된 이력서로 노출됩니다.</p>  -->

            <!-- <p>&nbsp;&nbsp;* 지원 취소한 경우 지원한 회사에는 지원 취소로 표시되며, 지원 취소 시점부터 이력서를
               확인할 수 없습니다.</p> -->

            <!-- &nbsp;* 단, 이메일 지원 시 채용담당자 이메일로 발송된 이력서는 회수가 불가합니다. <br /> -->


            <p>&nbsp;&nbsp;* 구직과정 중 급여 지급, 출입증 발급 등을 이유로 통장 비밀번호를 알려 달라고
               하거나,</p>
            <p>&nbsp;&nbsp;&nbsp;체크카드를 제출하라고 하는 경우는 반드시 거절하시길 바랍니다.</p>
            <br />
         </div>
      </div>
      <br />
      <br />
      <br />
      <table class="table container w-100">
         <thead class="table-success">
            <tr>
               <th scope="col">지원일</th>
               <th scope="col">지원내역</th>
               <th scope="col">합격여부</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${list }" var="l">
               <tr>
                  <th scope="row">${l.appdate }</th>
                  <td><a href="./../notice/content_view?c=${l.nseq }&p=${memberID }">${l.ntitle }</a></td>
                  <td>${l.pass }</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </c:if>
   <br />
   </div>
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