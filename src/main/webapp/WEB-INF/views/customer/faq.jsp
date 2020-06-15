<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="./../css/faq.css" />
</head>
<body>
<br /><br />
	<section id="tabs" class="project-tab">
		<div class="container" style="width: 1100px;">
			<div class="row">
				<div class="col-md-12">
					<nav>
						<div class="nav nav-tabs nav-fill btn-group btn-group-toggle" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active btn btn-info active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">개인 회원 FAQ</a>
							<a class="nav-item nav-link btn btn-info" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab"	aria-controls="nav-profile" aria-selected="false">기업 회원 FAQ</a>
						</div>
					</nav>
					<div class="tab-content d-flex justify-content-center" id="nav-tabContent" style="border: 3px solid lightblue; padding: 50px;">
					
						<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
							<div class="wrapper" style="text-align: center;">
								<!-- <div class="accordion">
									<div class="panel">
										<p>안심번호로 SMS도 전송 되나요?</p>
									</div>
									<div class="panel-content">
										<p>
											휴대폰 연락처로 안심번호를 설정하셨다면, <br /> 전화와 동일하게 회원님의 휴대폰으로 SMS도 전송이
											가능합니다.
										</p>
									</div>
								</div> -->
								<div class="accordion">
									<div class="panel panel2">
										<p>이력서는 어떻게 등록하나요?</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											이력서 작성은 개인회원으로 가입하신 후 이용 가능합니다. <br /> 
											이미 가입이 되어있다면 로그인 후 상단의 이력서 등록 메뉴를 이용해주세요.<br />
											미리 준비하신 이력서 파일을 첨부하시면 됩니다. <br />
											등록하신 이력서 파일을 변경할 경우, 이전의 파일은 사라지게 되니 이점 참고해주시기 바랍니다. <br />
											<br /> Tip. 이력서 제목과 자기소개서는 본인의 특기나 장점을 돋보이게 작성할수록
											기업의 선호도가 높아집니다.
										</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel">
										<p>아이디를 다른 걸로 변경할 수 있나요?</p>
									</div>
									<div class="panel-content">
										<p>
											한 번 부여된 아이디는 변경이 불가능합니다. <br />
											부득이하게 아이디를 변경하셔야 한다면, <br />
											회원탈퇴를 하신 후, 새로운 아이디로 재가입 하시는 방법이 있습니다. <br />

											단, 회원탈퇴를 하시면 등록하신 이력서 및 온라인 지원 등 그동안 저장되었던 회원님의 정보가 모두 삭제되고, <br /> 
											사용했던 아이디는 재사용이 불가능하므로 신중하게 생각하신 후 탈퇴를 하시기 바랍니다.
										</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel">
										<p>비밀번호를 변경하고 싶어요.</p>
									</div>
									<div class="panel-content">
										<p>비밀번호 변경은 로그인 후 <br />
										 개인서비스 > 마이페이지 > 비밀번호 변경 에서 수정하실 수 있습니다.</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel">
										<p>내가 찜한 공고만 보려면 어떻게 해야하나요?</p>
									</div>
									<div class="panel-content">
										<p>
											찜한 공고만 보려면 로그인 후 <br />
											개인서비스 > 마이페이지 > 스크랩 채용정보에서 확인 할 수 있습니다.
										</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel panel2">
										<p>내가 원하는 조건대로만 알바정보를 볼 수 있는 방법이 있나요?</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											로그인 후 상단의 채용정보 > 상세검색 에서 지역, 업직종, 근무기간, 시급 등등 <br /> 
											자신이 원하는 조건을 선택하여 검색하면 맞춤 알바 정보를 확인 할 수 있습니다.
										
										</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel panel2">
										<p>	공고를 보고 면접을 보러갔는데 실제 업무와 공고내용이 달라요!</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											허위공고와 같은 부적합 공고의 경우 <br />
											 고객 서비스 > 1:1 문의 > 서비스 이용에 문의 해주시면 확인을 거쳐 신속하게 조치를 취하고 있습니다. <br /> <br />

											[부적합 채용정보] <br />
											① 통장,신분증,비밀번호를 요구하는 경우 <br />
											② 유흥업소 및 불건전 업소 <br />
											③ 다단계 및 피라미드성 통신상품 판매 업체 <br />
											④ 허위 사기성 내용 <br />
											⑤ 임금체불, 채용사기 경험 업체 <br />
											⑥ 잘못 기재된 연락처 <br />
											⑦ 최저임금 미만의 급여 
										</p>
									</div>
								</div>
								<!-- <div class="accordion">
									<div class="panel panel2">
										<p>이력서에 증명사진을 올리고 싶어요.</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											개인회원 로그인 후 개인서비스 홈의 사진등록 또는 이력서 작성의 사진등록을 이용하세요. <br /> 이력서용
											증명사진이 없다면 일반 사진을 등록하신 후 원하는 부분을 적당한 크기로 편집해서 올릴 수 있습니다. <br />
											사진은 6MB 이하의 JPG, GIF,PNG 파일만 등록 가능하니, <br /> 혹시 등록이 되지 않는다면
											파일 용량이나 파일 종류를 확인하세요. <br /> Tip. 단정한 옷차림의 상반신 사진이 적당하며, 웃는
											표정일수록 호감도가 높아집니다. <br /> 개인회원 로그인 후 [개인서비스 홈화면] 또는 [이력서관리]에서
											수정하실 수 있습니다.
										</p>
									</div>
								</div> -->
								
								<!-- <div class="accordion">
									<div class="panel panel2">
										<p>알바ForU 서비스는 무엇인가요?</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											알바ForU 서비스는 구직자가 알바천국에서 구직활동하는 패턴을 분석하여 구직자에게 채용정보를 추천해주는
											서비스입니다. <br /> 채용정보조회, 스크랩, 입사지원 패턴을 분석하여 <br /> 이와 관련된
											추천공고를 보여줌으로서 구직 활동 시 유용하게 활용하실 수 있는 서비스입니다.
										</p>
									</div>
								</div> -->
							</div>

						</div>
<!-- 기업FAQ시작 -->
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<div class="wrapper" style="text-align: center;">
								<div class="accordion">
									<div class="panel panel2">
										<p>기업회원과 개인회원의 차이점을 알려주세요.</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											기업회원 <br />
											기업회원은 채용공고를 등록하거나 구직자의 인재정보를 검색하여 일 할 사람을 구하는 활동을 하는 회원을 말합니다. <br /> 

											개인회원 <br />
											개인회원은 채용정보를 검색하거나 인재정보에 본인의 이력서를 등록하여 일자리를 구하는 활동을 하는 회원을 말합니다.
										</p>
									</div>
								</div>
								
								<div class="accordion">
									<div class="panel">
										<p>공고는 어떻게 등록하나요?</p>
									</div>
									<div class="panel-content">
										<p>
											공고 등록은 기업회원으로 가입하신 후 이용 가능합니다. <br /> 
											이미 가입이 되어있다면 로그인 후 상단의 공고 등록 메뉴를 이용해주세요.<br />
											항목에 알맞게 내용을 입력하시면, <br />
											공고 등록이 정상적으로 완료 됩니다.
										</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel">
										<p>비밀번호를 변경하고 싶어요.</p>
									</div>
									<div class="panel-content">
										<p>비밀번호 변경은 로그인 후 기업서비스 > 기업페이지 > 비밀번호 변경 에서 수정하실 수 있습니다.</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel">
										<p>프리미엄 등록 서비스는 무엇인가요?</p>
									</div>
									<div class="panel-content">
										<p>
										프리미엄 등록 서비스는 기업회원으로 로그인 후 이용가능하며, <br />
										기존의 공고등록에서 프리미엄으로 등록하시면 홈페이지 메인 화면 최상단에 공고가 노출될 수 있도록 해드리고 있습니다. <br />
										프리미엄으로 등록하시려면 별도의 요금이 부과되는 점 참고해주시기 바랍니다.
										</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel">
										<p>	채용공고에 근무지 지도를 넣으려면 어떻게 해야 하나요?</p>
									</div>
									<div class="panel-content">
										<p>
										채용공고에 근무지 지도가 보여지도록 하기 위해서는  <br />
										채용공고 등록 시 근무지 입력란에 동/번지를 포함하여 주소를 정확히 입력하시면 됩니다. <br />
										상세주소에 추가 주소를 입력하시면 보다 더 자세한 위치로 등록 할 수 있습니다.

										</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel panel2">
										<p>등록한 공고의 지원자를 확인하고 싶어요.</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											등록한 공고의 지원자를 확인하시려면 <br />
											상단의 기업서비스 > 지원자 관리 에서 바로 확인 할 수 있습니다.
										</p>
									</div>
								</div>
								
								<!-- <div class="accordion">
									<div class="panel panel2">
										<p>이력서에 증명사진을 올리고 싶어요.</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											개인회원 로그인 후 개인서비스 홈의 사진등록 또는 이력서 작성의 사진등록을 이용하세요. <br /> 이력서용
											증명사진이 없다면 일반 사진을 등록하신 후 원하는 부분을 적당한 크기로 편집해서 올릴 수 있습니다. <br />
											사진은 6MB 이하의 JPG, GIF,PNG 파일만 등록 가능하니, <br /> 혹시 등록이 되지 않는다면
											파일 용량이나 파일 종류를 확인하세요. <br /> Tip. 단정한 옷차림의 상반신 사진이 적당하며, 웃는
											표정일수록 호감도가 높아집니다. <br /> 개인회원 로그인 후 [개인서비스 홈화면] 또는 [이력서관리]에서
											수정하실 수 있습니다.
										</p>
									</div>
								</div> -->
								<!-- <div class="accordion">
									<div class="panel panel2">
										<p>이력서는 어떻게 작성하나요?</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											이력서 작성은 개인회원으로 가입하신 후 이용 가능합니다. <br /> 이미 가입이 되어있다면 로그인 후
											개인서비스 > 새 이력서 작성 메뉴에서 작성하세요. <br /> 이력서 제목, 학력, 경력 등 본인의 이력과
											자기소개서를 상세하게 작성하세요. <br /> 작성하는 시간이 길더라도 2분 단위로 자동 저장되기 때문에
											작성한 내용이 사라지는 일은 없으니 안심하고 이용하세요. <br /> 이력서 내용을 작성하신 후에는 연락처가
											정확한지 반드시 확인하시고 공개 여부를 선택하세요. <br /> 이력서를 공개 설정하시는 것이 빠른 구직에
											도움이 됩니다. <br /> Tip. 이력서 제목과 자기소개서는 본인의 특기나 장점을 돋보이게 작성할수록
											기업의 선호도가 높아집니다.
										</p>
									</div>
								</div>
								<div class="accordion">
									<div class="panel panel2">
										<p>알바ForU 서비스는 무엇인가요?</p>
									</div>
									<div class="panel-content panel-content2 ">
										<p>
											알바ForU 서비스는 구직자가 알바천국에서 구직활동하는 패턴을 분석하여 구직자에게 채용정보를 추천해주는
											서비스입니다. <br /> 채용정보조회, 스크랩, 입사지원 패턴을 분석하여 <br /> 이와 관련된
											추천공고를 보여줌으로서 구직 활동 시 유용하게 활용하실 수 있는 서비스입니다.
										</p>
									</div>
								</div> -->
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<div><br /><hr />
			<div class="jumbotron">
				<div align="center">
					<a href="<%=application.getContextPath()%>/customer/intro" class="text-success">회사소개</a> | <a href="<%=application.getContextPath()%>/customer/ccontract"
						class="text-success">이용약관</a> | 
						<a href="#" class="text-success" data-toggle="modal" data-target="#staticBackdrop">이메일무단수집거부</a>
						<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="staticBackdropLabel">e-메일 무단수집 거부</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body" style="text-align: left;">
						        본 웹사이트에 게시된 e-메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며 이를 위반 시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
					| <a href="<%=application.getContextPath()%>/customer/campaign" class="text-success">알바보호정책</a> | <a href="<%=application.getContextPath()%>/customer/policy"
						class="text-success">운영정책</a> | <a href="<%=application.getContextPath()%>/customer/cscenter" class="text-success">문의/제안/신고</a>
					
				</div>
				<hr />
				<br />
				<br />
				<div align="center">
					서울특별시 강동구 천호대로 1095 현대코아 3층 ㈜ 우동바 대표 : 엄준식 | 고객센터 02-1234-5678 <br />
					팩스 : 02-1234-4321 | 통신판매업 신고번호 : 제 강동-3872호 | 사업자등록번호 :
					120-85-40538 <br /> 직업정보제공사업 신고번호 : 서울청 제2020-18호 | E-mail :
					help@udongba.com <br />
				</div>
				<br />
				<br />
				<div align="center">ⓒ uDongBa Corp. All rights reserved.</div>
			</div>
		</div>

</body>
<script type="text/javascript">
$(document).ready(function(){
    $(".panel").click(function(){
	$(this).next().slideToggle('slow');
	$(this).parent().siblings().find('.panel-content').slideUp();
	
    });
});
</script>
</html>