<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <jsp:include page="../header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="http://code.jquery.com/jquery.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        
        
        
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
      <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="modify" name="form2" id="form" method="post" onsubmit="return check_submit();" enctype="multipart/form-data" >
<input type="hidden" name="nseq" value="${modify_view.nseq }" />
   <div class="w-100 h-100 container" >
      <div style="padding: 15px;">
         <td>공고 제목 : </td> &nbsp;
         <td> <input type="text" name="ntitle" size="50" value="${modify_view.ntitle }" /> </td> <br />
         <td>공고 내용 : </td> &nbsp;
         <td> <input type="text" name="ncontent" size="50" value="${modify_view.ncontent }" /> </td>
      </div>
      <hr />
         <div style="padding: 15px;">
            <h3>근무 지역</h3>             
                          
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"> <br />   
         <input type="text" id="sample5_address" size="50" name="naddr" placeholder="주소" value="${modify_view.naddr }"> &nbsp;       
<input type="text" id="sample5_detailAddress" size="50" placeholder="상세주소"> <br />
<input type="text" id="sample5_extraAddress" size="50" placeholder="참고항목"> &nbsp;
<input type="text" name="nlocation" size="50" placeholder="지역" value="${modify_view.nlocation }"> <br />
<input type="hidden" name="lat" value="${modify_view.lat }" />
<input type="hidden" name="lng" value="${modify_view.lng }" />
<div id="map" style="width:300px;height:300px;margin-top:10px;"></div> <br />
<tr>
   <td>인근지하철역 : </td> &nbsp;
   <td><input type="text" name="nnearsub" size="20" value="${modify_view.nnearsub }" > </td>
</tr>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbcd375776081f93a035d9a90c792297&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng('${modify_view.lat}', '${modify_view.lng}'), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng('${modify_view.lat}', '${modify_view.lng}'),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
               
                var addr = data.address; // 최종 주소 변수      
                var extraRoadAddr = ''; // 참고 항목 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용
                        

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);                        
                        $('#form').append("<input type='hidden' id='lat' name='lat' value='" + result.y + "' >");
                        $('#form').append("<input type='hidden' id='lng' name='lng' value='" + result.x + "' >");
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                 // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(addr !== ''){
                        document.getElementById("sample5_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample5_extraAddress").value = '';
                    }
                                        
                });
            }
        
        }).open();
    }
    
    $(document).ready(function () {
        $.datepicker.setDefaults($.datepicker.regional['ko']); 
        $( "#ndeadline" ).datepicker({
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달', 
             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             dateFormat: "yy-mm-dd",
             maxDate: 100, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
             setDate: 'today', // 시작날짜를 오늘기준으로
             startDate: '+1d',
             onClose: function( selectedDate ) {    
                  //시작일(startDate) datepicker가 닫힐때
                  //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                 $("#endDate").datepicker( "option", "minDate", selectedDate );
             }    

        });
        $( "#endDate" ).datepicker({
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달', 
             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             dateFormat: "yymmdd",
             maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
             onClose: function( selectedDate ) {    
                 // 종료일(endDate) datepicker가 닫힐때
                 // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                 $("#startDate").datepicker( "option", "maxDate", selectedDate );
             }    

        });
});
</script>            

         </div>     
         <hr />
          <script type="text/javascript">
    function check_submit(){
       var form2 = document.form2;
       if (form2.npersonnel.value=="") {   // nday(select) 값이 비어있으면
         alert("모집인원을 입력해주세요.");      // 경고창을 띄운다
         form2.npersonnel.focus();      // nday(select)를 focus한다.
         return false;
      }if (form2.ndeadline.value=="") {
         alert("모집마감일을 입력해주세요.");
         form2.ndeadline.focus();
         return false;
      }if (form2.nwriter.value=="") {
         alert("담당자명을 입력해주세요.");
         form2.nwriter.focus();
         return false;
      }if (form2.nreception.value=="") {
         alert("담당자번호를 입력해주세요.");
         form2.nreception.focus();
         return false;
      }if (form2.nperiod.value=="") {
         alert("근무기간을 선택해주세요.");
         form2.nperiod[0].focus();       //0번째 nperiod(radio)로 focus
         return false;
      }if (form2.nday.value=="") {       
         alert("근무요일을 선택해주세요.");   
         form2.nday.focus();         
         return false;
      }if (form2.ntime.value=="") {       
         alert("근무시간을 선택해주세요.");   
         form2.ntime.focus();         
         return false;
      }if (form2.ntpay.value=="") {      
         alert("급여를 선택해주세요.");      
         form2.ntpay.focus();      
         return false;
      }if (form2.npay.value=="0") {
         alert("급여를 입력해주세요.");
         form2.npay.focus();       
         return false;
      }if (form2.ngender.value=="") {
         alert("성별을 선택해주세요.");
         form2.ngender[0].focus();       
         return false;
      }if (form2.nage.value=="") {
         alert("연령을 선택해주세요.");
         form2.nage[0].focus();       
         return false;
      }if (form2.nage.value=="연령제한") {
         if (form2.nag.value=="") {
         alert("연령을 선택해주세요.");   
         form2.nag.focus();         
         return false;            
         }
      }
    }                        
    </script>
    
     <div class="inputArea" style="padding: 15px;">
        <tr>
           <td>이미지</td> <br />
           <td> <input type="file" id="nimg" name="nimg" value=""/> </td>           
        </tr>                     
        <div class="select_img">        
        <img style="width:500px; height:300px;"
        src="<%=application.getContextPath() %>/resources/uploadimg/${modify_view.nimg }"
        onerror="this.style.display='none'"/></div>
        <script>
  $("#nimg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
  if (condition) {
   
}
 </script>             
     </div> 
     <hr />          
     <div style="padding: 15px;">
          <h3>모집 내용</h3>
          <tr>
             <td>*모집인원 : </td>
             <td> <input type="text" name="npersonnel" size="25" maxlength="15" placeholder="ex)2명 or 0명(인원미정)" value="${modify_view.npersonnel }" />  </td>                                                  
          </tr> <br />
          <tr>
             <td>*모집 마감일 : </td>
             <td> <input type="text" id="ndeadline" name="ndeadline" value="${modify_view.ndeadline }" /> </td><br /> 
          </tr> 
          
          <tr>
             <td>업직종 : </td>
             <td> <input type="text" name="ncategory" size="50" value="${modify_view.ncategory }"/></td>
          </tr> <br />
          <tr>
             <td>복리후생 : </td>
             <td> <input type="text" name="nwelfare" size="50" value="${modify_view.nwelfare }"/></td>      
          </tr>
      </div>
                <hr />
            
      <div style="padding: 15px;">
      <h3>담당자 정보</h3>
       <tr>       
          <td>* 담장자명 : </td> &nbsp;
           <td> <input type="text" name="nwriter" size="10" value="${modify_view.nwriter }" /> </td>  
          <td>* 담당자번호 : </td> &nbsp;
          <td> <input type="text" name="nreception" size="20" maxlength="13" placeholder="010-0000-0000" value="${modify_view.nreception }" /></td>
          
       </tr> <br />                          
       </div>                 
          <hr />
         <div style="padding: 15px;">
            <h3>근무 조건</h3>
         </div>        
         <div style="padding: 15px;">                          
         <tr>         
         <td>*근무기간 : </td> &nbsp;
         <td> <input type="radio" name="nperiod" value="1주일 이하" ${modify_view.nperiod eq '1주일 이하' ? 'checked':'' }/><label>1주일 이하</label> </td> &nbsp; 
         <td> <input type="radio" name="nperiod" value="1주일~1개월" ${modify_view.nperiod eq '1주일~1개월' ? 'checked':'' }/><label>1주일~1개월</label> </td> &nbsp;
         <td> <input type="radio" name="nperiod" value="1개월~3개월" ${modify_view.nperiod eq '1개월~3개월' ? 'checked':'' }/><label>1개월~3개월</label> </td> &nbsp;
         <td> <input type="radio" name="nperiod" value="3개월~6개월" ${modify_view.nperiod eq '3개월~6개월' ? 'checked':'' }/><label>3개월~6개월</label> </td> &nbsp;
         <td> <input type="radio" name="nperiod" value="6개월~1년" ${modify_view.nperiod eq '6개월~1년' ? 'checked':'' }/><label>6개월~1년</label> </td> &nbsp;
         <td> <input type="radio" name="nperiod" value="1년이상" ${modify_view.nperiod eq '1년이상' ? 'checked':'' }/><label>1년 이상</label> </td> &nbsp;
         <td> <input type="radio" name="nperiod" value="기간협의" ${modify_view.nperiod eq '기간협의' ? 'checked':'' }/><label>기간협의</label> </td> 
         </tr> <br />                   
    <tr>
       <td>*근무요일 : </td> &nbsp;           
       <td>       
          <select name="nday" id="nday" size="1">                    
             <option selected value="${modify_view.nday }">${modify_view.nday }</option>       
             <option value="월~일">월~일</option>       
             <option value="월~토">월~토</option>       
             <option value="월~금">월~금</option>       
             <option value="토, 일">토, 일</option>       
             <option value="주6일">주6일</option>       
             <option value="주5일">주5일</option>
             <option value="주2일">주2일</option>
             <option value="주1일">주1일</option>
             <option value="요일협의">요일협의</option>                                     
          </select>              
       </td>            
    </tr> <br />       
           
    <tr>
         <td>*근무시간 : </td> &nbsp;                     
         <td> <input type="text" name="ntime" size="30" placeholder="ex)09:00~18:00 (휴게시간 60분)" value="${modify_view.ntime }"/></td>   
    </tr> <br />        
    <tr>
       <td>*급여 : </td> &nbsp;
       <td>
          <select name="ntpay" id="ntpay" size="1">
             <option selected value="${modify_view.ntpay }">${modify_view.ntpay }</option>       
             <option value="시급">시급</option>
             <option value="일급">일급</option>
             <option value="주급">주급</option>
             <option value="월급">월급</option>
             <option value="연봉">연봉</option>
          </select>
       </td>&nbsp;&nbsp;&nbsp;   
       <td> <input type="text" name="npay" value="${modify_view.npay }"/> 원 </td>       
       <br />
    </tr>         
         </div>       
          <hr />
         <div style="padding: 15px;">
         <h3>지원 조건</h3>         
         <tr>
         <td>*성별 : </td> &nbsp;
         <td> <input type="radio" name="ngender" value="성별무관" ${modify_view.ngender eq '성별무관' ? 'checked':'' } /><label>성별무관</label> </td> &nbsp; 
         <td> <input type="radio" name="ngender" value="남자" ${modify_view.ngender eq '남자' ? 'checked':'' } /><label>남자</label> </td> &nbsp;
         <td> <input type="radio" name="ngender" value="여자" ${modify_view.ngender eq '여자' ? 'checked':'' }/><label>여자</label> </td> &nbsp; <br />
         <td>*연령 : </td> &nbsp;
         <td> <input type="radio" name="nage" value="연령무관" ${modify_view.nage eq '연령무관' ? 'checked':'' }/><label>연령무관</label> </td> &nbsp;         
         <td> <input type="radio" name="nage" value="연령제한" ${modify_view.nage eq '연령제한' ? 'checked':'' }/><label>연령제한</label> </td> &nbsp;
         <td> <input type="text" name="nag" size="30" placeholder="ex)20세~29세" value="${modify_view.nag }"/></td> <br />
         <td>우대조건 : </td> &nbsp;
         <td> <input type="text" name="npt" size="50" value="${modify_view.npt }"/></td>         
         </tr> <br />
                      
         </div>
         <tr>      
      <td colspan="2">
      <input type="submit" value="입력" /> 
      <a href="notice">목록보기</a>
      </td>
   </tr>
   </div>
    </form>
    <div>
       <hr />
    </div>
</body>
</html>