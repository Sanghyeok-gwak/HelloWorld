<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- ------------------------- -->
<style>
@import
	url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css')
	;

.modal-footer {
	justify-content: center;
}

.event-main {
	width: 50%;
	margin: auto;
}

img {
	width: 100%;
}

.copy-btn {
	background-color: transparent;
	border: 0px;
}

.container {
	display: flex;
}


</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<div>
		<p>
			<img
				src="../../assets/image/logo2.jpg"
				style="border-radius: 5px;" alt="상단배너이미지">
		</p>
	</div>
	</div>
	<div class="event-main">
		<div class="container">
			<div>
				<p>
					<span style="font-size: 20px"><strong>[9월 이벤트] 인기
							스테이 1만 원 딜 럭키 드로우, 토투 서울&nbsp;</strong></span>
			</div>
			<div>
				<button id="copy-btn" type="button" class="copy-btn"
					onclick="copyUrl()">
					<i class="fa-solid fa-share-nodes" style="cursor: pointer;"></i>
				</button>
			</div>
		</div>
		<!-- 분리  -->
		<!-- span div 묶기 -->
		<!-- span div btn div 묶기 -->
		<!-- 3번째거 div flex -->
		<br /> <strong><span style="color: #3399ff">Hello
				Word! 회원이라면 누구나!&nbsp;</span></strong><br /> <strong><span
			style="color: #3399ff">1만 원에 인기 스테이에 숙박할 수 있는 행운의 이벤트에 지금
				응모하세요!</span></strong>

		</p>
		<script>
                //현재 url 변수로 가져오기
                let nowUrl = window.location.href;

                function copyUrl() {
                    //nowUrl 변수에 담긴 주소를
                    navigator.clipboard.writeText(nowUrl).then(res => {
                        alert("링크가 복사되었습니다.");
                    })
                }
            </script>

		<p>
			<span style="color: #808080"><span style="font-size: 12px">응모
					기간: 2024년 9월 19일(월)~ 9월 26일(월)</span></span><br /> <span style="color: #808080"><span
				style="font-size: 12px">응모 대상: Hello World! 회원</span></span><br /> <span
				style="color: #808080"><span style="font-size: 12px">응모
					경품: 토투 서울 3월 30일(토) 숙박권 1만 원 딜</span></span><br /> <span style="color: #808080"><span
				style="font-size: 12px">응모 방법: 이벤트 페이지 하단 &#39;응모하기&#39; 버튼을
					누르면 자동 응모&nbsp;</span></span>
		</p>

		<p>
			<img alt="이미지1" src="../../assets/image/HAHA2226.jpg"
				style="height: 100%; width: 100%; border-radius: 5px;" />
		</p>

		<p style="text-align: center;">
			<strong>토투 서울 1박 2일 숙박&nbsp;(3월 30일 체크인 한정)</strong><br /> <strong><span
				style="font-size: 26px"><span style="color: #a9a9a9"><s>정가
							220,000원</s>&rarr;</span><span style="color: #ff0000">10,000원</span></span></strong>
		</p>

		<p>
			<span style="font-size: 12px">토투 서울 안내<br /> 느린 휴식을 위한 후암동 로컬
				스테이<br /> &#39;거북이(tortue)&#39;라는 의미를 가진 스테이 이름처럼, 빠르게 돌아가는 일상의
				리듬에서 벗어나<br /> 천천히 쉬어갈 수 있는 공간입니다. 음악을 듣고 책을 읽으면서 마치 이곳에서 오랫동안 살아온
				듯,<br /> 자신만의 속도에 맞춰 도심 속 휴가를 즐겨보세요. 아기자기한 후암동 탐험을 위해 스테이 운영자가<br />
				손수 그린 지도도 제공합니다.
			</span>
		</p>

		<p>
			<img alt="이미지2" src="../../assets/image/HAHA2825.jpg"
				style="height: 100%; width: 100%; border-radius: 5px;" /></span>
		</p>

		<p>
			<strong><span style="color: #0099ff">이벤트 안내</span></strong><br /> <strong><span
				style="font-size: 12px">당첨 인원: 총 1명<br /> 당첨 발표: 2024년 2월
					28일(수) (개별 안내 예정)<br /> 당첨 기준: 이벤트 기간 내 응모한 고객 중 랜덤 추첨<br /> 예약
					방법: 당첨자 발표 후 개별 안내를 받고 기한 내 1만 원 결제를 하면 예약 확정
			</span></strong>
		</p>

		<p>
			<span style="color: #0099ff"><strong>유의 사항</strong></span><br /> <strong><span
				style="font-size: 12px">- Hello World 홈페이지 회원만 응모 가능합니다. 당첨 시
					회원 여부를 재확인합니다. &nbsp;<br /> - 해당 스테이의 정보 및 유의사항을 확인하시기 바랍니다.<br />
					- 지정된 숙박일에만 사용 가능하므로 일정을 꼭 확인하세요.<br /> - 회원 당 매달 1회 응모 가능합니다. 한 번
					당첨된 고객은 이후 추첨에서 제외됩니다.&nbsp;<br /> - 현금이나 포인트로 교환 및 환불되지
					않습니다.&nbsp;<br /> - 기준 인원은 2인이며, 추가 인원 발생 시 별도 요금이 부과됩니다(스테이 별 정책
					상이).&nbsp;<br /> -&nbsp;숙박 후 리뷰 링크를 보내드립니다. 일주일 안에 피치바이피치 해당 스테이의
					상품 페이지에 리뷰를 남겨주세요.&nbsp;
			</span></strong>
		</p>
	</div>


	<p>&nbsp;</p>
	<div class="container mt-3 mt-3 d-flex justify-content-center" id="modalbtn">
		<!-- Button to Open the Modal -->

		<button type="button" class="btn btn-primary" id="modalbtn" data-toggle="modal"
			data-target="#myModal">
			<h3>응모하기</h3>
		</button>


		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h3 class="modal-title">응모하기</h3>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>

					<!-- Modal Body -->
					<div class="modal-body">
						<form>
							<!-- 이름 -->
							<div class="form-group">
								<label for="name">이름 <span class="text-danger">*</span></label>
								<input type="text" class="form-control" id="name"
									placeholder="홍길동" required>
							</div>

							<!-- 휴대전화 -->
							<div class="form-group">
								<label for="phone">휴대전화 (-제외) <span class="text-danger">*</span></label>
								<input type="text" class="form-control" id="phone"
									placeholder="01011112222" required>
							</div>

							<!-- 이메일 -->
							<div class="form-group">
								<label for="email">Email</label> <input type="email"
									class="form-control" id="email"
									placeholder="hello123@world.com">
							</div>

							<!-- 유입경로 -->
							<div class="form-group">
								<label for="referral">유입경로</label> <input type="text"
									class="form-control" id="referral" placeholder="ex) 블로그, 인스타그램">
							</div>

							<!-- 신청사연 -->
							<div class="form-group">
								<label for="request">신청사연 <span class="text-danger">*</span></label>
								<textarea class="form-control" id="request"
									placeholder="사연을 적어주세요." required></textarea>

							</div>
						</form>
					</div>

					<!-- Modal Footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btn-block"
							data-dismiss="modal">
							<h5>제출</h5>
						</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>