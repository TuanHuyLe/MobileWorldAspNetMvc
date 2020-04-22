$('#login').on('click', function (e) {
    e.preventDefault();
    let name = $('#login').text();
    if (name.localeCompare("Đăng nhập") == 0) {
        $('#linklogin')[0].click();
    } else {
        $.ajax({
            url: "/login/removesession",
            type: "POST",
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: res => {
                $('#login').text("Đăng nhập");
                $('#hellouser').text('Xin chào');
            }
        });
    }
});


$(document).ready(function () {
    $(".scroll-top").click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        return false;
    });
});