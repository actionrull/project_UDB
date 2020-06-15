<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<link href="<%=application.getContextPath()%>/resources/img/logo.png"
   rel="shortcut icon" type="image/x-icon">
<title>회원정보 수정</title>
<script type="text/javascript"
   src="<%=application.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
   src="<%=application.getContextPath()%>/resources/js/gnb.js"></script>
</head>
<body>

   <div class="d-flex justify-content-center">
         <div style="padding-right: 200px;">
         <a href="/project_UDB"><img
            src="<%=application.getContextPath()%>/resources/img/logo.png"
            alt="로고" /></a>
         </div>
            
         <div>
         <br /><br />
         <a href="/project_UDB" class="text-success">HOME</a> | <a
            href="#" class="text-success">개인서비스</a> | <a href="logout"
            class="text-success">로그아웃</a>
         </div>
      </div>
      
   
   <hr />
   <div style="text-align: center;">
   <h2>회원정보 수정</h2>
   </div>
   <br /><br />
   <section id="tabs" class="project-tab">
            <div class="container" style="width: 700px;">
                <div class="row" >
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs nav-fill btn-group btn-group-toggle" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active btn btn-info active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">개인정보 수정</a>
                                <a class="nav-item nav-link btn btn-info" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">비밀번호 번경</a>
                                <a class="nav-item nav-link btn btn-info" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">회원탈퇴 신청</a>
                            </div>
                        </nav>
                        <div class="tab-content d-flex justify-content-center" id="nav-tabContent" style="border: 3px solid lightblue; padding: 50px;" >
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                     
                     <div>
                        <label>아이디</label><br />
                        <input type="text" size="35" disabled="disabled" placeholder="현재 아이디"/>
                     </div><br />
                     
                     <div>
                        <label>비밀번호</label><br />
                        <input type="password" size="35" placeholder="현재 비밀번호 입력"/>
                     </div><br />
                     
                     <div>
                        <label>이름</label><br />
                        <input type="text" size="35" disabled="disabled" placeholder="현재 이름"/>
                     </div><br />
                     
                     <div>
                        <label>이메일</label><br />
                        <input type="email" size="35"/>
                     </div><br />
                     
                     <div>
                        <label>전화번호</label><br />
                        <input type="tel" size="35"/>
                     </div><br />
                     
                     <div>
                        <label>주소</label><br />
                        <input type="text" size="35"/>
                     </div><br />
                     
                     <button type="button" class="btn btn-info btn-lg btn-block">수정 완료</button>
                     
                            </div>
                            
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                               <div>
                               <input type="text" placeholder="현재 비밀번호" size="80%"/>  
                               </div><br /> 
                               <div>
                               <input type="text" placeholder="새 비밀번호 입력" size="80%"/>  
                               </div><br /> 
                               <div>
                               <input type="text" placeholder="비밀번호 재확인" size="80%"/>  
                               </div><br />
                               
                               <div>
                               <p><strong>영문,숫자,특수기호 2가지 이상 조합해서 6~16자로 작성해주세요. (띄어쓰기 불가)</strong></p>
                        <p class="text-success">안전한 비밀번호를 사용하는 방법!</p>
                        -영문, 숫자, 특수기호 3가지 모두 조합하세요. <br />
                        -아이디와 동일한 비밀번호는 사용하지 마세요. <br />
                        -연속된 영문/숫자나 키보드의 연속패턴은 사용하지 마세요. (ex. AAA, 1234, ASDF) <br />
                        -비밀번호는 주기적으로 변경해주세요. 
                               </div><br />
                               
                               <button type="button" class="btn btn-info btn-lg btn-block">수정 완료</button>
                               
                            </div>
                            
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                              <div>
                              <p style="font-size: 20px;"><strong>회원탈퇴 시 아래 사항을 꼭 확인하세요!</strong></p>
                              <p>
                              1. 동일한 아이디로 재가입 불가 <br />
                       -탈퇴 신청 시 즉시 처리되며, 해당 아이디로 재가입/로그인이 불가능 합니다. <br />
                              </p>
                        
                       <p>
                       2. 탈퇴 즉시 회원정보 삭제 <br />
                       -탈퇴 즉시 이력서 및 구직활동 정보가 모두 삭제되며, 삭제된 정보는 복구되지 않습니다. 단, 공공적 성격의 게시물은 삭제되지 않으므로 탈퇴 전 미리 삭제해주세요.
                       </p>
                             
                       <p>
                       3. 이용 정보 일정기간 보관 <br />
                       -'전자상거래등에서의소비자보호에관한법률'에 따라 유료 결제에 관한 계약 기록은 일정기간 보관합니다. <br />
                       -부적합 정보, 이용제한 및 징계에 관한 기록은 일정기간 보관합니다. <br />
                       </p>       
                              </div><br />
                              
                              <button type="button" class="btn btn-info btn-lg btn-block">탈퇴하기</button>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


   <hr />

   <div align="center">ⓒ uDongBa Corp. All rights reserved.</div>


</body>
</html>