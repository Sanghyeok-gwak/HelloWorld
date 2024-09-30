<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="/world/assets/css/payment.css">
<script src="/world/assets/js/payment.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- ------------------------- -->
</head>

<!-- body -->
<body>

   <%@ include file="/views/common/header.jsp"%>

   <section>

      <div class="product-name">
         <div class="reservation">
            <!-- 예약과정 단계별 이미지표현-->
            <p>STEP 01</p>
            <h1>/ 예약하기</h1>
         </div>

         <div class="infoEnter">
            <p>STEP 02</p>
            <h1>/ 예약정보 입력</h1>
         </div>

         <div class="infoCheck">
            <p>STEP 03</p>
            <h1>/ 예약정보 확인</h1>
         </div>
      </div>

      <div class="order-window helloworld-main-sub">

         <div class="order-window-1 ow-all">
            <div>
               <h1 class="number">01</h1>
               <h5 class="num-name">상품정보</h5>
               <table class="one-table">
                  <thead>
                     <tr>
                        <td>분류</td>
                        <td>상품정보</td>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>상품명</td>
                        <td><a
                           href="https://travel.interpark.com/tour/goods?goodsCd=24100724852">비그랜드
                              리조트 왕복 픽업</a></td>
                     </tr>
                     <tr>
                        <td>여행기간</td>
                        <td></td>
                     </tr>
                     <tr>
                        <td>예약금</td>
                        <td>가격(100000)</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>

         <div class="order-window-2 ow-all">
            <div>
               <h1 class="number">02</h1>
               <h5 class="num-name">약관동의</h5>
            </div>

            <table class="order-window-2-dt">
               <thead>
                  <tr>
                     <th class="order-window-2-menu">취소수수료 특약</th>
                     <th class="order-window-2-menu">여행약관</th>
                     <th class="order-window-2-menu">개인정보수집이용</th>
                     <th class="order-window-2-menu">고유식별정보수집이용</th>
                     <th class="order-window-2-menu">개인정보 제3자제공</th>
                  </tr>
               </thead>
            </table>

            <div class="cancle-provision-content content-all">
               <!-- 이미지or icon -->
               <p>
                  <i class=""></i> 취소수수료 특약기준은 일반여행약관보다 우선합니다.
               </p>
               <p>[특별약관]</p>
               <p>- 여행개시 30일전까지( ~30) 취소 통보 시 - 계약금 환급</p>
               <p>- 여행개시 20일전까지(29~20) 취소 통보 시 - 여행경비의 10% 배상</p>
               <p>- 여행개시 10일전까지(19~10) 취소 통보 시 - 여행경비의 15% 배상</p>
               <p>- 여행개시 8일전까지( 9~8) 취소 통보 시 - 여행경비의 20% 배상</p>
               <p>- 여행개시 1일전까지( 7~1) 취소 통보 시 - 여행경비의 30% 배상</p>
               <p>- 여행(출발일) 당일 취소 통보 시 - 여행경비의 50% 배상</p>
            </div>

            <div class="travel-tern-content content-all">
               <h5 class="travel-title">1. 제1조(목적)</h5>
               <p>이 약관은 (주)인터파크트리플(이하 ‘당사’라 함)과 여행자가 체결한 국외여행계약의 세부 이행 및 준수사항을
                  정함을 목적으로 합니다.</p>
               <h5 class="travel-title">2. 제2조(용어의 정의)</h5>
               <p>여행의 종류 및 정의, 해외여행수속대행업의 정의는 다음과 같습니다.</p>
               <p>1. 기획여행 : 당사가 미리 여행목적지 및 관광일정, 여행자에게 제공될 운송 및 숙식서비스 내용(이하
                  ‘여행서비스’라 함), 여행요금을 정하여 광고 또는 기타 방법으로 여행자를 모집하여 실시하는 여행.</p>
               <p>2. 희망여행 : 여행자(개인 또는 단체)가 희망하는 여행조건에 따라 당사가 운송․숙식․관광 등 여행에 관한
                  전반적인 계획을 수립하여 실시하는 여행.</p>
               <p>3. 해외여행 수속대행(이하 ‘수속대행계약’이라 함) : 당사가 여행자로부터 소정의 수속대행요금을 받기로
                  약정하고, 여행자의 위탁에 따라 다음에 열거하는 업무(이하 ‘수속대행업무’라 함)를 대행하는 것.</p>
               <p>1) 사증, 재입국 허가 및 각종 증명서 취득에 관한 수속</p>
               <p>2) 출입국 수속서류 작성 및 기타 관련업무</p>
            </div>

            <div class="personal-information-content content-all">
               <h5>개인정보 수집 및 이용목적</h5>
               <table>
                  <thead>
                     <tr>
                        <th>수집 및 이용 목적</th>
                        <th>수집항목</th>
                        <th>보유 및 이용기간</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>상품 예약 및 상담, 출입국 가능 여부 확인</td>
                        <td>예약자정보(이름, 이메일, 휴대전화, 일반전화) 여행자정보(한글이름, 영문이름, 생년월일,
                           휴대번호, 성별, 여권번호, 여권만료일, 국적, 여권사본)</td>
                        <!-- lowspan 주기. -->
                        <td rowspan="4">회원탈퇴 후 파기됩니다. 다만 관계법령에 의해 보존할 경우 그 의무기간 동안
                           별도 보관되며 불,편법 행위의 방지 및 대응의 목적으로 60일간 별도 보관됩니다.</td>
                     </tr>
                     <tr>
                        <td>대금결제서비스 제공</td>
                        <td>소유자명, 카드번호, 할부개월, 유효기간, 카드 비밀번호 앞2자리</td>
                     </tr>
                     <tr>
                        <td>현금영수증 발급</td>
                        <td>현금영수증카드번호, 휴대폰번호</td>
                     </tr>
                     <tr>
                        <td>마일리지 적립</td>
                        <td>마일리지 번호</td>
                     </tr>
                  </tbody>
               </table>
            </div>

            <div class="collect-unique-information-content content-all">
               <h5>고유식별정보 수집 및 이용수집</h5>
               <table>
                  <thead>
                     <tr>
                        <th>수집 및 이용 목적</th>
                        <th>수집항목</th>
                        <th>보유 및 이용 기간</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>상품 예약시 출국가능 여부 파악 및 여행자 본인식별</td>
                        <td>여권번호</td>
                        <td>관계법령에 따른 보존기간</td>
                     </tr>
                     <tr>
                        <td>여행자 보험 가입</td>
                        <td>한글명, 영문명, 생년월일, 성별</td>
                        <td>관계법령에 따른 보존기간</td>
                     </tr>
                  </tbody>

               </table>
               <p>※ 동의를 거부할 권리 및 동의 거부에 따른 불이익</p>
               <p>정보주체는 개인정보 수집 및 이용에 대해 거부할 권리가 있습니다.</p>
               <p>동의를 거부할 경우 상품 예약과 관련한 정보의 수집 및 이용이 이루어지지 않으므로 서비스 제공이 불가함을
                  알려 드립니다.</p>
            </div>

            <div class="personal-information-third content-all">
               <h5>개인정보 제3자 제공에 관한 사항</h5>

               <table>
                  <thead>

                     <tr>
                        <th>제공받는자</th>
                        <th>이용 목적</th>
                        <th>개인정보 제공 항목</th>
                        <th>보유 및 이용 기간</th>
                     </tr>
                  </thead>

                  <tbody>
                     <tr>
                        <td>대한항공</td>
                        <td>마일리지 적립</td>
                        <td>마일리지번호</td>
                        <td>관계법령에 따른 보존기간</td>
                     </tr>

                     <tr>
                        <td>(주) 코리아나인슈</td>
                        <td>여행자보험 가입 등의 보험서비스 제공</td>
                        <td>한글명, 영문명, 생년월일, 성별</td>
                        <td>관계법령에 따른 보존기간</td>
                     </tr>

                     <tr>
                        <td>(주)월드와이드케어</td>
                        <td>여행자보험 가입 등의 보험서비스 제공</td>
                        <td>한글명, 영문명, 생년월일, 성별, 전화번호, 여권번호</td>
                        <td>관계법령에 따른 보존기간</td>
                     </tr>
                  </tbody>
               </table>
            </div>

            <div class="helloworld-main">
               <div class="check-box">

                  <div id="wrap2">
                     <input type="checkbox" id="chk-all"> <label for="chk-all">모든
                        약관의 동의</label> <input type="checkbox" id="chk-each"> <label
                        for="chk-each">모든 약관의 동의안함</label>
                  </div>

                  <div id="wrap3">
                     <input type="checkbox" id="chk-one" class="chk-each"
                        onclick="fnCheckAll();"> <label for="chk-one">취소수수료
                        특약 동의</label> <input type="checkbox" id="chk-two" class="chk-each"
                        onclick="fnCheckAll();"> <label for="chk-two">여행약관
                        동의</label> <input type="checkbox" id="chk-three" class="chk-each"
                        onclick="fnCheckAll();"> <label for="chk-three">개인정보수집이용동의</label>
                     <input type="checkbox" id="chk-f" class="chk-each"
                        onclick="fnCheckAll();"> <label for="chk-f">고유식정보수집동의</label>
                     <input type="checkbox" id="chk-five" class="chk-each"
                        onclick="fnCheckAll();"> <label for="chk-five">개인정보제3자
                        제공동의</label>
                  </div>

                  <script>

              document.getElementById('chk-all').addEventListener('click', function (evt) {
                const arr = document.getElementsByClassName('chk-each');
                if (evt.target.checked) {
                  for (let i = 0; i < arr.length; i++) {
                    arr[i].checked = true;
                  }
                  document.getElementById('chk-each').checked = false;

                } else {
                  for (let i = 0; i < arr.length; i++) {
                    arr[i].checked = false;
                  }
                }
              })


            </script>

                  <script>
              document.getElementById('chk-each').addEventListener('click', function (evt) {
                const arr = document.getElementsByClassName('chk-each');
                if (evt.target.checked) {

                  for (let i = 0; i < arr.length; i++) {
                    arr[i].checked = false;
                  }
                  document.getElementById('chk-all').checked = false;


                } else {
                  for (let i = 0; i < arr.length; i++) {
                    arr[i].checked = false;
                  }

                }
              })

              function fnCheckAll() {
                const arr = document.getElementsByClassName('chk-each');
                if (arr[0].checked && arr[1].checked && arr[2].checked && arr[3].checked && arr[4].checked) {
                  document.getElementById('chk-all').checked = true;

                } else if (arr[0].checked == false && arr[1].checked == false && arr[2].checked == false && arr[3].checked == false && arr[4].checked == false) {
                  document.getElementById('chk-each').checked = true;
                } else {
                  document.getElementById('chk-all').checked = false;
                  document.getElementById('chk-each').checked = false;

                }
              }

              // 모든약관의 동의 버튼누르면 모든약관의 동의 안함이 체크해제 되어야한다.

            </script>

                  <hr>

               </div>

               <div id="footer"></div>
            </div>
         </div>

         <div class="order-window-3 ow-all">
            <div>
               <h1 class="number">03</h1>
               <h5 class="num-name">여행자 정보</h5>
               <p class="sub-num-name">여행자 인원수를 확인해 주시기 바랍니다. 여행자 상세 정보는
                  마이페이지에서 추후 입력 및 수정 가능합니다(단, 전액 결제 상품 제외)</p>
            </div>

            <div class="ow3-content">
               <div class="form-group">
                  <h3>여행자 정보</h3>
               </div>

               <div class="form-group">
                  <label for="adult-select">성인</label> <select class="form-control"
                     id="adult-select" onchange="updateForm()">
                     <!-- <option value="0">0</option> -->
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                  </select>

               </div>
               <div class="form-group">
                  <label for="infant-select">유아</label> <select class="form-control"
                     id="infant-select" onchange="updateForm()">
                     <option value="0">0</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                  </select>
               </div>
            </div>
         </div>

         <div class="form-group-description">
            <p>-여행자 정보는 예약완료 단계 전까지 마이페이지를 통해 입력 및 수정 가능합니다.</p>
            <p>-예약 후 일행 변경 시 옵션 및 가격 변동이 있을 수 있습니다. 변경사항이 있을 경우 담당자에게 문의 해
               주시기 바랍니다.</p>
            <p>-성인,유아 기준 인원이 각 10명 이상일 경우 예약 후 담당자에게 초과 인원을 말씀해 주세요.</p>
         </div>

         <div class="section-data1">
            <h4 class="invisible">여행자 정보 작성</h4>
            <div class="sub-mask">
               <table summary="여행자 정보확인란 입니다." class="board-list02"
                  id="tblCustomer" name="tblCustomer">

                  <colgroup>
                     <col width="43px;">
                     <col width="86px;">
                     <col width="86px;">
                     <col width="121px;">
                     <col width="86px;">
                     <col width="106px;">
                     <col width="81px;">
                     <col width="84px;">
                     <col width="98px;">
                     <col width="*">
                  </colgroup>
                  <thead>
                     <tr>
                        <th class="first">구분</th>
                        <th>한글명</th>
                        <th>영문성</th>
                        <th>영문이름</th>
                        <th>생년월일<span class="data"></span></th>
                        <th>휴대번호</th>
                        <th>성별</th>
                        <th>국적</th>
                        <th>여권번호<span class="data"></span></th>
                        <th class="last">여권만료<span class="data"></span></th>
                     </tr>
                     <!-- 대표자 -->
                     <tr>
                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);"
                           class="rep rep-red">대표자 <input type="hidden"
                           id="CustomerAge" name="CustomerAge" value="100"> <input
                           type="hidden" id="CustomerSeniorDCYN" name="CustomerSeniorDCYN"
                           value="N"> <input type="hidden"
                           id="CustomerSeniorDCRate" name="CustomerSeniorDCRate" value="0">
                           <input type="hidden" id="CustomerSeniorDCAmt"
                           name="CustomerSeniorDCAmt" value="0">
                        </td>
                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
                           <input type="text" id="CustomerKrNM" name="CustomerKrNM"
                           value="" maxlength="10"
                           style="height: 18px; line-height: 18px; border: 1px solid #dcdcdc; position: relative; top: -2px; font-size: 11px; font-family: dotum;"
                           size="9" title="한글명">
                        </td>
                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
                           <input type="text" id="CustomerEnLastNM"
                           name="CustomerEnLastNM" value="" size="9"
                           style="height: 18px; line-height: 18px; border: 1px solid #dcdcdc; position: relative; top: -2px; font-size: 11px; font-family: dotum;"
                           maxlength="20" title="영문성">
                        </td>
                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
                           <input type="text" id="CustomerEnFirstNM"
                           name="CustomerEnFirstNM" value="" size="13"
                           style="height: 18px; line-height: 18px; border: 1px solid #dcdcdc; position: relative; top: -2px; font-size: 11px; font-family: dotum;"
                           maxlength="40" title="영문이름">
                        </td>
                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
                           <input type="text" id="CustomerBirthday"
                           name="CustomerBirthday" value="" size="10"
                           onblur="checkAge(this, '100', 'N');"
                           style="height: 18px; line-height: 18px; border: 1px solid #dcdcdc; position: relative; top: -2px; font-size: 11px; font-family: dotum;"
                           maxlength="8" title="생년월일 8자리">
                        </td>
                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
                           <input type="text" id="CustomerPhone" name="CustomerPhone"
                           value="" size="15" onblur="only_number2(this, '');"
                           style="height: 18px; line-height: 18px; border: 1px solid #dcdcdc; position: relative; top: -2px; font-size: 11px; font-family: dotum;"
                           maxlength="11" title="휴대폰번호">
                        </td>
                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
                           <select class="bsc1" id="CustomerSex_${i}"
                           name="CustomerSex-${i}" title="성별" style="width: 66px;">
                              <option value="" selected="selected">선택</option>
                              <option value="F">여</option>
                              <option value="M">남</option>
                        </select>
                        </td>

                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
                           <select class="bsc1" id="CustomerNationality_${i}"
                           name="CustomerNationality-${i}" title="국적" style="width: 66px;">
                              <option value="KOR">내국인</option>
                              <option value="">외국인</option>
                        </select>
                        </td>
                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
                           <input type="text" id="CustomerPPNO" name="CustomerPPNO"
                           value="" size="13"
                           style="height: 18px; line-height: 18px; border: 1px solid #dcdcdc; position: relative; top: -2px; font-size: 11px; font-family: dotum;"
                           maxlength="9" title="여권번호">
                        </td>
                        <td
                           style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
                           <input type="text" id="CustomerPPExpirationDT"
                           name="CustomerPPExpirationDT" value="" size="13"
                           style="height: 18px; line-height: 18px; border: 1px solid #dcdcdc; position: relative; top: -2px; font-size: 11px; font-family: dotum;"
                           maxlength="8" title="여권만료">
                        </td>
                     </tr>
                  </thead>

                  <tbody id="traveler-forms">
                     <!-- 추가되는 인원 수의 정보. -->
                  </tbody>
               </table>
            </div>
         </div>

         <div class="order-window-4 ow-all">
            <div>
               <h1 class="number">04</h1>
               <h5 class="num-name">결제금액 및 할인혜택</h5>
            </div>
            <table class="option-info">
               <tr>
                  <td rowspan="2" class="option-info-title">상품옵션</td>
                  <td class="main-bohum">
                     <div class="traffic-bohum">
                        <label for="transport">교통</label> <select class="form-control"
                           id="sel1">
                           <option>대한항공</option>
                           <option>아시아나</option>
                           <option>에어부산</option>
                           <option>에어프레미아</option>
                        </select>
                     </div> <label>보험 등급 </label> 
                     <input type="radio" id="select" name="optionChoose" value="선택"> <label for="select">선택</label>
                     <input type="radio" id="deselect" name="optionChoose"
                     value="선택안함"> 
                     <label for="deselect"> 선택안함</label>
                     <br> <br> 
                     <a id="insurance-link" href="#" onclick="window.open('bohum.html', 'bohum', 'width=600,height=400'); return false;"
                     class="disabled enabled"> 보험 등급 선택 </a>

                  </td>
               </tr>
               <tr>
                  <td class="product-pay"> 상품가격 <input type="text" readonly>
                     원
                  </td>
               </tr>
               <tr>
                  <td class="option-info-title">할인금액</td>
                  <td>
                     <div class="m-point">
                        <input type="checkbox" id="points"> <label for="points">적립금</label>
                        <input type="text" value="" class="pay-input"> 원 사용
                        <button id="btn-1" class="btn">적립금조회</button>
                     </div>
                     <ul class="point-precautions">
                        <li>일부 쿠폰을 I-Point와 동시 사용 불가합니다.</li>
                        <li>I-Point로 결제 시, 결제금액에서 포인트 사용금액을 제외한 차액에 한해 포인트가 적립됩니다.</li>
                     </ul>
                  </td>
               </tr>
            </table>
         </div>

         <div class="order-window-5 ow-all">
            <div>
               <table>
                  <tr>
                     <td class="order-window-5-title">결제 금액</td>
                     <td>상품가격</td>
                     <td><input type="checkbox" disabled> 할인금액 원</td>
                     <td><input type="checkbox" disabled> 총결제금액</td>
                  </tr>
               </table>
            </div>
         </div>

         <div class="order-window-6-button ow-all">
            <button id="btn-2" class="btn" onclick="console.log('Button clicked'); requestPay();">예약하기</button>
            <form method="post" action="/kakaoPay">
               <button id="btn-1" class="btn">취소</button>
            </form>
         </div>
      </div>

   </section>
       <!-- 결제 정보 -->
   
   <%@ include file="/views/common/footer.jsp"%>

   
 
<!-- 카카오페이 api 연결 결제시도-->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>



<script>
            
           // 객체 초기화
           var IMP = window.IMP;
           IMP.init("imp02350258");
         
               // 결제 요청 함수
               function requestPay() {
                     
                     
                   IMP.request_pay({
                       pg: 'kakaopay.TC0ONETIME',  
                       pay_method: 'kakaopay',          // 결제 방식
                       merchant_uid: 'merchant_' + new Date().getTime(),  // 주문 번호
                       name: 'world',         // 상품 이름
                       amount: 10,           // 결제 금액
                     
                   }, function (rsp) { // callback 로직 - 리다이렉트로 할 시 callback 필요없음
                       if (rsp.success) {
                       

                        $.ajax({
                     url:'<%= contextPath%>/pay.complete',
                     data:{paymentCode: rsp.merchant_uid
                       /*  , deliveryKind: getSelectedMethod()
                        , paymentPrice: '10000'
                        , paymentKind: '카카오페이'
                        , orderPrice: '10000'
                        , orderPoint: document.getElementById('points').value
                        , orderAddr: document.getElementById('postcode').value + " " + document.getElementById('roadAddress').value + " " + document.getElementById('detailAddress').value
                     , orderReceiver: document.getElementById('orderReceiver').value
                     , orderRequest: document.getElementById('request').value
                     , orderPhone: document.getElementById('phone1').value
                     , detailPrice: '10000' */
                        },
                     success:function(res){
                        alert(res);
                        $('#payform').submit();
                     
                     },
                     error:function(res){
                        alert(res+'오류발생')
                     }
                     
                  })
                
                  
              } else {
                  alert('결제 실패하였습니다. 오류 내용: ' + rsp.error_msg);
              }
          });
          
      }
</script>
  
<!-- section 끝 -->

 
</body>

</html>