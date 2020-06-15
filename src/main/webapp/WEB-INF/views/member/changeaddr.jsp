<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>changeaddr</title>
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


<script type="text/javascript" src="./../resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./../resources/js/gnb.js"></script>



</head>
<body>
   <div class="d-flex justify-content-center">
      <div style="padding-right: 200px;">
         <a href="/project_UDB"><img src="<%=application.getContextPath()%>/resources/img/logo.png" alt="로고" /></a>
      </div>

      <div>
         <br /> <br /> <a href="/project_UDB" class="text-success">HOME</a> |
         <a href="#" class="text-success">개인서비스</a> | <a href="logout"    class="text-success">로그아웃</a>
      </div>
   </div>


   <hr />
   <div style="text-align: center;">
      <h2>회원정보 수정</h2>
   </div>
   <br />
   <br />
   <section id="tabs" class="project-tab">
   <div class="container" style="width: 700px;">
      <div class="row">
         <div class="col-md-12">
            <nav>
            <div class="nav nav-tabs nav-fill btn-group btn-group-toggle"
               id="nav-tab" role="tablist">
               <a class="nav-item nav-link btn btn-info" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">주소 변경</a>
               
            </div>
            </nav>
            <div class="tab-content d-flex justify-content-center" id="nav-tabContent" style="border: 3px solid lightblue; padding: 50px;">

               <div class="tab-pane fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                  <br />
                  <input type="text" id="mspostcode" name="mspostcode" placeholder="우편번호">
                  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
                  <input type="text" id="changedADDR" name="changedADDR" placeholder="주소" class="validate required"><br> 
                  <input type="text" id="msdetailaddress" name="msdetailaddress" placeholder="상세주소" class="validate required">
                  <input type="text" id="msextraaddress" name="msextraaddress" placeholder="참고항목" class="validate required">
                  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                  <br />
                  <br />
                  <br />

                  <th colspan="2">
                     <input type="hidden" id="hID" name="hID" value="${memberID }">
                  <button class="btn btn-info btn-lg btn-block" id="setADDR">수정 완료</button>
                  </th>

               </div>

               
            </div>
         </div>
      </div>
   </div>
   </section>
   <hr />

   <div align="center">ⓒ uDongBa Corp. All rights reserved.</div>
      
      <script>
            function sample6_execDaumPostcode() {
               new daum.Postcode(
                     {
                        oncomplete : function(data) {
                           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                           var addr = ''; // 주소 변수
                           var extraAddr = ''; // 참고항목 변수

                           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                              addr = data.roadAddress;
                           } else { // 사용자가 지번 주소를 선택했을 경우(J)
                              addr = data.jibunAddress;
                           }

                           // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                           if (data.userSelectedType === 'R') {
                              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                              if (data.bname !== ''
                                    && /[동|로|가]$/g.test(data.bname)) {
                                 extraAddr += data.bname;
                              }
                              // 건물명이 있고, 공동주택일 경우 추가한다.
                              if (data.buildingName !== ''
                                    && data.apartment === 'Y') {
                                 extraAddr += (extraAddr !== '' ? ', '
                                       + data.buildingName
                                       : data.buildingName);
                              }
                              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                              if (extraAddr !== '') {
                                 extraAddr = ' (' + extraAddr + ')';
                              }
                              // 조합된 참고항목을 해당 필드에 넣는다.
                              document
                                    .getElementById("msextraaddress").value = extraAddr;

                           } else {
                              document
                                    .getElementById("msextraaddress").value = '';
                           }

                           // 우편번호와 주소 정보를 해당 필드에 넣는다.
                           document.getElementById('mspostcode').value = data.zonecode;
                           document.getElementById("changedADDR").value = addr;
                           // 커서를 상세주소 필드로 이동한다.
                           document.getElementById(
                                 "msdetailaddress").focus();
                        }
                     }).open();
            }
            </script>
      
      
      
      
      <script>
         $('#setADDR').on('click', function() {
            /* var getADDRCheck = RegExp(/^[A-Za-z0-9가-힣]{2,50}$/);

            if (!getADDRCheck.test($("#changedADDR").val())) {
               alert("주소를 다시 한번 확인해 주세요.");
               $("#changedADDR").val("");
               $("#changedADDR").focus();
               return false;
            }
 */

            $.ajax({
               url : 'setADDR',
               type : 'post',
               data : {
                  hID : $('#hID').val(),
                  changedADDR : $('#changedADDR').val(),
                  mspostcode : $('#mspostcode').val(),
                  msdetailaddress : $('#msdetailaddress').val(),
                  msextraaddress : $('#msextraaddress').val(),
               },
               success : function(t) {
                  alert('주소가 변경되었습니다.');
                  location.href = "mypage";
               },
               error : function() {
                  alert('주소 변경 실패');
               }
            });
         });
      </script>
   </div>
   </section>
   </div>
</body>
</html>