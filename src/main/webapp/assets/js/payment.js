
$(document).ready(function () {

    $('.content-all').hide();
    $('.content-all').first().show();

    $('th.order-window-2-menu').on('click', function () {
        var index = $(this).index();
        $('.content-all').hide();
        $('.content-all').eq(index).show();
    });
});

$(document).ready(function() {
    $('input[name="optionChoose"]').on('change', function() {
        console.log('Radio button changed');
        if ($('#select').is(':checked')) {
            console.log('Select is checked');
            $('#insurance-link').removeClass('disabled');
            $('#insurance-link').addClass('enabled');
        } else {
            console.log('Select is not checked');
            $('#insurance-link').addClass('disabled');
            $('#insurance-link').removeClass('enabled');
        }
    });

    if ($('#select').is(':checked')) {
        $('#insurance-link').removeClass('disabled');
        $('#insurance-link').addClass('enabled');
    } else {
        $('#insurance-link').addClass('disabled');
        $('#insurance-link').removeClass('enabled');
    }
});


  // 모든 order-window-2-menu 클래스를 가진 요소에 대해 이벤트 리스너 추가
  document.querySelectorAll('.order-window-2-menu').forEach(function(element) {
    element.addEventListener('mouseover', function() {
      // 마우스를 올렸을 때 커서를 포인터로 변경
      this.style.cursor = 'pointer';
    });

    element.addEventListener('mouseout', function() {
      // 마우스를 벗어났을 때 커서를 기본값으로 변경
      this.style.cursor = 'default';
    });
  });


// ow3-content 여행자정보관련 js
function updateForm() {
    const adultCount = document.getElementById('adult-select').value;
    const infantCount = document.getElementById('infant-select').value;
    const travelerForms = document.getElementById('traveler-forms');

    // 기존 입력 필드 삭제
    travelerForms.innerHTML = '';
      
      // 성인 입력값 수정예정
    // 성인 입력 필드 추가
    for (let i = 1; i <= adultCount; i++) {
        const adultForm = `
      <tr>
    <td style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);"
        class="rep">성인${i}
        <input type="hidden" id="CustomerAge${i}" name="CustomerAge${i}" value="100">
        <input type="hidden" id="CustomerSeniorDCYN${i}" name="CustomerSeniorDCYN${i}" value="N">
        <input type="hidden" id="CustomerSeniorDCRate${i}" name="CustomerSeniorDCRate${i}" value="0">
        <input type="hidden" id="CustomerSeniorDCAmt${i}" name="CustomerSeniorDCAmt${i}" value="0">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerKrNM${i}" name="CustomerKrNM${i}" value="" maxlength="10"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            size="9" title="한글명">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerEnLastNM${i}" name="CustomerEnLastNM${i}" value="" size="9"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="20" title="영문성">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerEnFirstNM${i}" name="CustomerEnFirstNM${i}" value="" size="13"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="40" title="영문이름">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerBirthday${i}" name="CustomerBirthday${i}" value="" size="10"
            onblur="checkAge(this, '100', 'N');"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="8" title="생년월일 8자리">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerPhone${i}" name="CustomerPhone${i}" value="" size="15"
            onblur="only_number2(this, '');"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="11" title="휴대폰번호">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <select class="bsc1" id="Gender_${i}" name="Gender{i}" title="성별" style="width: 66px;">
            <option value="" selected="selected">선택</option>
            <option value="F">여</option>
            <option value="M">남</option>
        </select>
    </td>

    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <select class="bsc1" id="CustomerNationality_${i}" name="CustomerNationality${i}" title="국적"
            style="width: 66px;">
            <option value="KOR">내국인</option>
            <option value="">외국인</option>
        </select>
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerPPNO${i}" name="CustomerPPNO${i}" value="" size="13"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="9" title="여권번호">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerPPExpirationDT${i}" name="CustomerPPExpirationDT${i}" value="" size="13"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="8" title="여권만료">
    </td>
  </tr>
      `;
        travelerForms.insertAdjacentHTML('beforeend', adultForm); // 올바르게 수정된 부분
    }

    // 유아 입력 필드 추가
    for (let i = 1; i <= infantCount; i++) {
        const infantForm = `
      <tr>
    <td style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);"
        class="rep">유아${i}
        <input type="hidden" id="CustomerAge-${i}" name="CustomerAge-${i}" value="100">
        <input type="hidden" id="CustomerSeniorDCYN-${i}" name="CustomerSeniorDCYN-${i}" value="N">
        <input type="hidden" id="CustomerSeniorDCRate${i}" name="CustomerSeniorDCRate-${i}" value="0">
        <input type="hidden" id="CustomerSeniorDCAmt-${i}" name="CustomerSeniorDCAmt-${i}" value="0">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerKrNM-${i}" name="CustomerKrNM-${i}" value="" maxlength="10"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            size="9" title="한글명">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerEnLastNM-${i}" name="CustomerEnLastNM-${i}" value="" size="9"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="20" title="영문성">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerEnFirstNM-${i}" name="CustomerEnFirstNM-${i}" value="" size="13"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="40" title="영문이름">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerBirthday-${i}" name="CustomerBirthday-${i}" value="" size="10"
            onblur="checkAge(this, '100', 'N');"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="8" title="생년월일 8자리">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerPhone-${i}" name="CustomerPhone-${i}" value="" size="15"
            onblur="only_number2(this, '');"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="11" title="휴대폰번호">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <select class="bsc1" id="CustomerSex_${i}" name="CustomerSex-${i}" title="성별" style="width: 66px;">
            <option value="" selected="selected">선택</option>
            <option value="F">여</option>
            <option value="M">남</option>
        </select>
    </td>

    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <select class="bsc1" id="CustomerNationality_${i}" name="CustomerNationality-${i}" title="국적"
            style="width: 66px;">
            <option value="KOR">내국인</option>
            <option value="">외국인</option>
        </select>
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerPPNO-${i}" name="CustomerPPNO-${i}" value="" size="13"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="9" title="여권번호">
    </td>
    <td
        style="padding: 7px 0px 2px; font-size: 11px; color: rgb(90, 90, 90); text-align: center; letter-spacing: -0.025em; border: 1px solid rgb(220, 220, 220);">
        <input type="text" id="CustomerPPExpirationDT-${i}" name="CustomerPPExpirationDT-${i}" value="" size="13"
            style="height:18px;line-height:18px; border:1px solid #dcdcdc; position:relative; top:-2px; font-size:11px; font-family:dotum;"
            maxlength="8" title="여권만료">
    </td>
</tr>
    `;
        travelerForms.insertAdjacentHTML('beforeend', infantForm); // 올바르게 수정된 부분
    }
};

/* 여행자 정보 필드값  로그인된것 입력해서 나오게 해주기*/
 $(function() {
    $('#user_id_1, #user_pw_1').on('focus', // #user_id_1, #user_pw_1 에 on이벤트를 이용하여 focus 이벤트를 넣음
    function() {
        $(this).css({backgroundColor: 'pink'}); // this === #user_id_1, #user_pw_1 이므로 focus가 대상 요소로 이동하면 배경 핑크 이벤트 발생
        }
    );
    $('#user_id_1, #user_pw_1').on('blur', 
    function() {
        $(this).css({backgroundColor: 'white'}); // focus가 blur이벤트로 인해 벗어나면 배경 white 이벤트 발생
    });

// 카카오 결제
$("#check_module").click(function () {
    var IMP = window.IMP; 
    IMP.init('imp02350258');
    
    IMP.request_pay({
        pg: 'kakao.TC0ONETIME',
        pay_method: 'kakaopay',
        merchant_uid: 'merchant_' + new Date().getTime(),
        /* 
         *  merchant_uid에 경우 
         *  https://docs.iamport.kr/implementation/payment
         *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
         */
        name: '상품명 : ',
        // 결제창에서 보여질 이름
        // name: '주문명 : ${auction.a_title}',
        // 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
        amount: 100,
        // amount: ${bid.b_bid},
        buyer_email: 'user01@naver.com',  // 구매자 이메일
        buyer_name: 'NAME',
        // 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
        // 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
        buyer_tel: 'phone',  // 구매자 전화번호
        // buyer_postcode: '123-456',
    }, function (rsp) {
        console.log(rsp);
        if (rsp.success) {
            var msg = '결제가 완료되었습니다.';
            msg += '결제 금액 : ' + rsp.paid_amount;
            // success.submit();
            // 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
            // 자세한 설명은 구글링으로 보시는게 좋습니다.
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
         });
			});
    });

   