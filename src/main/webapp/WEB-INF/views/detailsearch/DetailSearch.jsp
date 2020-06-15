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

<br />   
<h2 id="title">상세 검색 결과</h2>
<input type="hidden" name="page" value="" />
<br />

<div class="container table-responsive">
<div class="w-100 container">
      <table class="table">
         <thead>
            <tr>
               <td>검색결과 | 총 ${total }개</td>
            </tr>
            <tr>
               <td>등록순<strong><a href="ordercheck?ot=1&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}">∨</a><a
                     href="ordercheck?ot=2&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}">∧</a></td>
               <%-- <td></strong>시급순<strong><a href="ordercheck?ot=3&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}">∨</a><a
                     href="ordercheck?ot=4&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}">∧</a></strong></td> --%>
            </tr>
            <!-- <tr class="thead-dark"> -->
            <tr class="table-success">
               <th scope="col">지역</th>
               <th scope="col">기업명/모집제목</th>
               <th scope="col">시급</th>
               <th scope="col">근무시간</th>
               <th scope="col">등록일</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${DetailSearchList }" var="dto">
               <tr>
                  <td>${dto.nlocation }</td>
                  <td><a href="../notice/content_view?c=${dto.nseq }&p=${memberID }" >${dto.ntitle }</a>
                     <c:if test="${empty sessionScope.dspreview }"><a href="previewon?pn=${dto.nseq }&remainpage=${searchVo.page }&dday=${dto.ndeadline }&now=<%= sf.format(nowTime) %>&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}"><img src="../img/slidedown.png" /></a></c:if><c:if test="${not empty sessionScope.dspreview }"><c:if test="${dto.nseq eq sessionScope.dspreview }"><a href="previewoff?remainpage=${searchVo.page }&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}"><img src="./../resources/img/offpreview.png" /></a></c:if></c:if> 
                  </td>
                  <td>${dto.ntpay} ${dto.npay }원</td>
                  <td>${dto.ntime }</td>
                  <td>${dto.nregdate }</td>
               </tr>
               <c:if test="${not empty sessionScope.dspreview }">
                  <c:if test="${dto.nseq eq sessionScope.dspreview }">
                     <tbody>
                        <tr height="50px">
                           <td colspan="5">
                           <strong>업 직 종</strong>&nbsp;&nbsp;&nbsp; ${dto.ncategory } 
                           <br /> <pre><strong>기간·요일</strong> ${dto.nperiod }|${dto.nday }         <strong>마 감 일</strong> <c:if test="${empty dto.ndeadline }">상시모집</c:if><c:if test="${not empty dto.ndeadline}">${dto.ndeadline } (${lefttime })</c:if></pre>
                           </td>   
                        </tr>
                     </tbody>
                  </c:if>
               </c:if>
            </c:forEach>
         </tbody>
      </table>
      
<!--페이징  -->

<c:if test="${searchVo.totPage>1 }">
         <c:if test="${searchVo.page>1 }">
            <a href="DetailSearch?page=1&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}">[처음]</a>
            <a href="DetailSearch?page=${searchVo.page-1 }&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}">[이전]</a>
         </c:if>
         <c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }"
            var="i">
            <c:choose>
               <c:when test="${i eq searchVo.page }">
                  <strong style="color: red">${i } &nbsp;</strong>
               </c:when>
               <c:otherwise>
                  <a href="DetailSearch?page=${i }&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}">${i } &nbsp;</a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${searchVo.totPage>searchVo.page }">
            <a href="DetailSearch?page=${searchVo.page+1 }&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}">[다음]</a>
            <a href="DetailSearch?page=${searchVo.totPage }&nlocation=${param.nlocation}&ncategory=${param.ncategory}&nperiod=${param.nperiod}
               &nday=${param.nday}&ntime=${param.ntime}&ntpay=${param.ntpay}&npay=${param.npay}&nwelfare=${param.nwelfare}
               &ngender=${param.ngender}&nage=${param.nage}&nag=${param.nag}">[마지막]</a>
         </c:if>
      </c:if>
</div>
</div>
<div>
   <hr />
</div>
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
</body>
</html>