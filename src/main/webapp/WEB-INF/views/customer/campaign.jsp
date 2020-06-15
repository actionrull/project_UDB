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
  <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
</head>
<body>
	<section id="tabs" class="project-tab">
		<div class="container" style="width: 1100px;">
			<div class="row">
				<div class="col-md-12">
					<nav>
						<div class="nav nav-tabs nav-fill btn-group btn-group-toggle" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active btn btn-info active" id="nav-lowprice-tab" data-toggle="tab" href="#nav-lowprice" role="tab" aria-controls="nav-lowprice" aria-selected="true">2020년 최저 임금</a>
							<a class="nav-item nav-link btn btn-info" id="nav-four-tab" data-toggle="tab" href="#nav-four" role="tab" aria-controls="nav-four" aria-selected="false">4대보험</a>
							<a class="nav-item nav-link btn btn-info" id="nav-teen-tab" data-toggle="tab" href="#nav-teen" role="tab" aria-controls="nav-teen" aria-selected="false">청소년 근로 보호 센터</a>
							<a class="nav-item nav-link btn btn-info" id="nav-protect-tab" data-toggle="tab" href="#nav-protect" role="tab" aria-controls="nav-protect" aria-selected="false">취업사기 예방</a>
						</div>
					</nav>
					<div class="tab-content d-flex justify-content-center" id="nav-tabContent" style="border: 3px solid lightblue; padding: 50px;">
					
						<div class="tab-pane fade show active" id="nav-lowprice" role="tabpanel" aria-labelledby="nav-lowprice-tab">
						<!-- 내용자리 -->
							<div>
								<img
									src="<%=application.getContextPath()%>/resources/img/wage.png"
									alt="wage" />
							</div>
							<br />
							<div class="container" style="text-align: center;">
								<div class="row" style="border: 3px solid green;">
									<div class="col-sm" style="border-right: 3px solid lightgreen;">
										<h4>최저임금액</h4>
										<br />
										<p style="color: green;">
											2020년 적용 최저임금은 <br />시급 8,590원 입니다
										</p>
										<p style="text-align: left;">
											3개월 이내의 수습 근로자는 최저임금액의 10% 감액 적용이 가능합니다.<br />다만, 근로계약기간이 1년
											미만이거나 단순노무 종사자에게는 최저임금을 감액할 수 없습니다.
										</p>
										<p>적용기간 : 2020.1.1 ~ 2020.12.31</p>
									</div>
									<div class="col-sm" style="border-right: 3px solid lightgreen;">
										<h4>적용대상</h4>
										<p style="color: blue; text-align: left;">근로자 1명 이상인 모든
											사업장에 적용됩니다. 근로기준법상 근로자(정규직, 비정규직, 외국인 근로자 등)이면 모두 적용 됩니다.</p>
										<p style="text-align: left;">단, 가사 사용인(가정부, 보모 등), 동거하는
											친족만을 사용하는 사업에 종사하는 동거 친족, 정신 또는 지체장애로 근로능력이 현저히 낮아 고용노동부장관의
											적용제외 인가를 받은 자, 선원법의 적용을 받는 선원 등에게는 적용되지 않습니다.</p>
									</div>
									<div class="col-sm">
										<h4>사용자의 주지의무</h4>
										<p style="color: navy; text-align: left;">사용자는 최저임금액 등을
											근로자가 쉽게 볼 수 있는 장소에 게시하거나 그외 적당한 방법으로 근로자에게 널리 알려야 합니다.</p>
										<p>
											최저임금액 / 최저임금에 산입하지 아니하는 임금 / 적용제외 근로자의 범위 / <br />최저임금의 효력
											발생년월일
										</p>
										<p>내용을 주지하지 않을 경우에는 100만원 이하의 과태료에 처해 집니다.</p>
									</div>
								</div>
							</div>
							<br />
							<div>
								<p>*본 내용은 최저임금법을 토대로 작성되었습니다. 자세한 사항은 국가법령정보센터 홈페이지에서 확인 하실
									수 있습니다.</p>
								<div align="center">
									<a
										href="http://www.law.go.kr/lsSc.do?menuId=0&p1=&subMenu=1&nwYn=1&section=&tabNo=&query=%EC%B5%9C%EC%A0%80%EC%9E%84%EA%B8%88%EB%B2%95#undefined"
										target="_blank">
										<button type="button" class="btn btn-success btn-lg">최저임금법
											확인하기</button>
									</a>
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="nav-four" role="tabpanel"
							aria-labelledby="nav-four-tab">
							<!-- 내용자리 -->
							<h2>
								<strong>4대 사회보험</strong>은 필수!
							</h2>
							<h4>알바생이 알아야 할 필수 정보를 알려드립니다.</h4>
							<br />
							<h5 style="color: blue;">4대 사회보험</h5>
							<ul>
								<li>실업, 산업재해 등 사회적 위험으로부터 국민의 안정적 삶을 보장하기 위한 사회보장제도 입니다.</li>
								<li>일생동안 누구에게나 있을 수 있는 질병이나 상해, 실업, 노령 등 사회적 위험에 대비하여 부담을
									덜어주고, 안정적인 노후를 준비할 수 있도록 도와줍니다.</li>
								<li>4대 사회보험은 고용보험·산재보험·국민연금·건강보험을 말하며, 알바생도 근로자로서 요건에 해당하는
									경우 의무가입 대상입니다.</li>
							</ul>
							<br />
							<div align="center">
								<img
									src="<%=application.getContextPath()%>/resources/img/four.png"
									alt="4대보험" />
							</div>
							<br />
							<h4>근로자의 기본권리를 지켜줄 사회보험에 아직 가입하지 않았다면?</h4>
							<h6>미가입신고센터로 신고해 주세요. 찾아가는 가입서비스요원이 직접 방문하여 가입에 도움을 드립니다.</h6>
							<br />
							<div align="center">
								<a href="https://www.kcomwel.or.kr/kcomwel/cust/nowp/nowp.jsp"
									target="_blank">
									<button type="button" class="btn btn-success btn-lg">고용·산재보험
										미가입신고센터</button>
								</a>
							</div>
						</div>

						<div class="tab-pane fade" id="nav-teen" role="tabpanel" aria-labelledby="nav-teen-tab">
							<!-- 내용자리 -->
							<div>
							<div class="card" style="width: 680px;">
								<div class="card-body">
									<h5 class="card-title">청소년 근로현장도우미를 만나보세요</h5>
									<h6 class="card-subtitle mb-2 text-muted"></h6>
									<p class="card-text">여성가족부는 청소년 아르바이트 현장의 부당처우(임금체불, 성희롱	등)를 개선하기 위해 <br />
														 여성가족부는 '청소년 근로 보호센터'를 운영하고 있습니다. <br /> <hr />
														  청소년 근로현장도우미가 사업장에 직접 방문하여 해결될 수 있도록 도와드리겠습니다. <br /> <hr /> 
														  ▶ 중재가 되지 않거나 심각한 사안의 경우 노동 관서나 경찰서로 연계 <br />
														   * 건강상담, 진로상담, 학업상담, 직업교육 등도 연계 진행 합니다!</p>
								</div>
							</div> <br />
							<div class="card" style="width: 680px;">
								<div class="card-body">
									<h5 class="card-title">청소년 근로 보호 센터</h5> <hr />
									<h6 class="card-subtitle mb-2 text-muted"></h6>
									<div class="row row-cols-2">
									<p class="card-text">근로상담 전용전화 <br />1600-1729</p>
									<p class="card-text">문자, 카카오톡 플러스친구 <br />#1388</p>
									</div>
								</div>
							</div> <br />
							<div class="wrapper" style="text-align: center; width: 680px;">
								<div class="accordion">
									<div class="panel">
										<p>청소년 알바 10계명</p>
									</div>
									<div class="panel-content">
										<p>
										<strong> 01. 만 15세 이상의 청소년만 아르바이트, 시간제 근로가 가능합니다.</strong> <br />
										만 13~14세 청소년은 지방고용노동관에서 발급하는 취직인허가증 필요
										</p>
										<p>
										<strong> 02. 아르바이트를 지원할 땐, 친권자(또는 후견인) 동의서와 가족관계증명서를 제출해야 합니다.</strong> <br />
										만 13~14세 청소년은 지방고용노동관에서 발급하는 취직인허가증 필요
										</p>
										<p>
										<strong> 03. 임금, 근로시간, 휴일, 업무내용 등이 포함된 근로계약서를 작성해야 합니다.</strong> <br />
										근로계약서를 2장 작성해 아르바이트생과 사장님이 각 1부씩 보관
										</p>
										<p>
										<strong> 04. 성인과 동일한 최저임금을 적용받습니다.</strong> <br />
										2020년 기준 시간당 8,590원
										</p>
										<p>
										<strong> 05. 위험한 일이나 유해한 업종의 일은 할 수 없습니다.</strong> <br />
										유흥주점, 단란주점, 비디오방, 노래방, 전화방, 숙박업, 이발소, 안마실이 있는 목욕탕이나<br />
										사우나, 만화대여점, 소주방, 호프, 카페, 무도장, 성인오락실 및 도박장, PC방, 소각 또는 도살 업무, 유류(주유업무 제외) 또는 양조업장 등
										</p>
										<p>
										<strong> 06. 하루 7시간, 일주일에 40시간 이상 일할 수 없습니다.</strong> <br />
										('18.7.1 이후) 하루 7시간, 일주일에 35시간 이상 일할 수 없음
										</p>
										<p>
										<strong> 07. 근로자가 5명 이상인 경우 휴일 및 초과근무시 50%의 가산 임금을 받을 수 있습니다.</strong> <br />
										하루 7시간, 일주일에 40시간 이상 근무 불가
										</p>
										<p>
										<strong> 08. 1주일 15시간 이상 근무, 1주일 개근한 경우 하루의 유급휴가를 받을 수 있습니다.</strong> <br />
										국가지정 공휴일 등 유급휴일로 지정된 날에는 휴일근로수당을 받을 수 있음
										</p>
										<p>
										<strong> 09. 일하다 다쳤다면 산업재해보상보험법, 근로기준법에 따라 치료와 보상을 받을 수 있습니다.</strong> <br />
										사업장의 산업재해보험 가입여부 확인 필요
										</p>
										<p>
										<strong> 10. 이 밖에 궁금한 사항이 있거나 임금체불, 성희롱 등 부당한 처우를 받았다면 상담을 통해 도움을 받으세요.</strong> <br />
										청소년근로보호센터(☎1600-1729) 또는 청소년 모바일 문자상담, 카카오톡 플러스친구(#1388)
										</p>
										
									</div>
								</div>
							</div>
						</div>
					</div>


						<div class="tab-pane fade" id="nav-protect" role="tabpanel"	aria-labelledby="nav-protect-tab">
						<!-- 내용자리 -->
						<div>
							<div class="card" style="width: 800px; text-align: center;">
								<div class="card-body">
									<h5 class="card-title">취업사기에 대해 자세히 알아보고 소중한 자산을 지키세요.</h5>
									<h6 class="card-subtitle mb-2 text-muted"></h6>
										<p class="card-text">최근 일자리를 구하기 위해 열심히 준비하는 구직자들의 절박한 심정을	이용한 <br />
															취업사기가 극성을 부리고 있습니다. <br />
															 취업사기는 구직자들에게 사회에 대한 불신, 취업 의욕 상실은 물론 <br />  개인정보 유출로 인한 금전적 손실까지 입힐 수 있는 만큼, <br /> 무엇보다 사전에 주의해서 피해를 입지 않도록 해야
											합니다.</p>
									</div>
							</div> <br />
							 <br />
							 <h1>취업 사기 유형을 알아봅시다!</h1>
							<div class="wrapper row row-cols-3" style="text-align: center; width: 800px;">
								<div class="accordion">
									<div class="panel">
										<p> <strong>금전 탈취유형</strong> <br />
										<small>공인인증서, 보안카드, 통장비밀번호, <br /> 체크카드 등 금융정보를 요구</small></p>
									</div>
									<div class="panel-content">
										<p>
										월급 계좌 확인을 빌미로 계좌 비밀번호를 묻는 회사
										</p>
										<p>
										교육비, 비품 등의 명목으로 결제를 요구
										</p>
										<p>
										취업알선을 빙자해 금전을 요구
										</p>
										
									</div>
								</div>
								<div class="accordion">
									<div class="panel">
										<p><strong>기타 취업사기 유형</strong> <br />
										<small>개인정보 수집만을 위한 <br /> 허위 구인광고</small></p>
									</div>
									<div class="panel-content">
										<p>
										지인 상대로 영업을 요구하는 다단계 회사
										</p>
										<p>
										정규직 전환을 명목으로 청탁비를 요구
										</p>
										
									</div>
								</div>
								<div class="accordion">
									<div class="panel">
										<p><strong>개인정보 탈취유형</strong> <br />
										<small>개인정보 수집만을 위한 <br /> 허위 구인광고</small></p>
									</div>
									<div class="panel-content">
										<p>
										등본, 인감 등의 민감한 개인정보를 요구
										</p>
										<p>
										정확하지 않은 채용공고 (사이트 연결 X, 신원확인 X)
										</p>
										<p>
										고수익을 미끼로 한 채용공고
										</p>
										
									</div>
								</div>
							</div> <br />
							
							 <h1>취업사기를 피해봅시다!</h1>
							 <div class="wrapper" style="text-align: center; width: 800px;">
								<div class="accordion">
									<div class="panel">
										<p>01. 보이스피싱 조직들은 단순심부름 '구인광고’를 통해 보이스피싱 수금·송금책을 모집</p>
									</div>
									<div class="panel-content">
										<p>
										· '심부름 센터' · ’택배 아르바이트＇라는 제목의 게시글 아래 위챗 ID를 통해 모집 <br />
										· 일당 30~50만원의 고수익 일당 아르바이트 광고를 미끼로 유인 <br />
										· 고액의 보수, 자유로운 시간 보장, 단순 현금 전달 심부름으로 가장 <br />
										· 도박자금 등을 출금해주면 일단 50만원을 준다며 단순 심부름이라고 유혹 <br />
										</p>
										
									</div>
								</div>
								<div class="accordion">
									<div class="panel">
										<p>02. 보이스피싱 조직들은 구직자가 올린 '구직광고＇를 보고 전화해 수금·송금책을 모집</p>
									</div>
									<div class="panel-content">
										<p> 
										· 구직자가 업무대행 심부름을 하겠다는 광고를 게시하면, 보이스피싱 조직이 현금 수령 후 중국으로 송금을 지시 <br />
										· 구직희망자가 전화번호·신상정보를 올리면, 일당 제시와 함께 보이스피싱 심부름을 지시하면서 범죄에 연루 <br />
										</p>
										
									</div>
								</div>
							</div>
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