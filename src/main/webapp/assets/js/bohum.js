$(document).ready(function() {
    $('input[name="option"]').on('change', function() {
        // 모든 li를 회색으로 설정
        $('.bohum-list li').removeClass('active').css('color', 'gray');
        
        // 선택된 값에 따라 li의 색상 변경
        if ($('#bronze').is(':checked')) {
						 $('.bohum-list li:eq(0)').addClass('active').css('color', 'black');
            $('.bohum-list li:eq(0)').addClass('active').css('color', 'black');
        } else if ($('#silver').is(':checked')) {
            $('.bohum-list li:lt(2)').addClass('active').css('color', 'black');
        } else if ($('#gold').is(':checked')) {
            $('.bohum-list li:lt(3)').addClass('active').css('color', 'black');
        } else if ($('#diamond').is(':checked')) {
            $('.bohum-list li').addClass('active').css('color', 'black');
        }
    });
});