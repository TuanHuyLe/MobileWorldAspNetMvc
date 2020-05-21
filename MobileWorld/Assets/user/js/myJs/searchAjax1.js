
var search = {
    init: function () {
        search.taskSearch();
    },
    taskSearch: function () {
        $("#inpsearch").focus(function () {
            $('#ulresult').fadeIn();
            $('.greetingsearch').text("Chào mừng bạn đến với Mobile World");
            $('.greetingsearch').show();
        });
        $("#inpsearch").blur(function () {
            $('#ulresult').fadeOut();
        });

        $('#btnSearch').off('click').on('click', function (e) {
            e.preventDefault();
            if ($('#inpsearch').val() !== '') {
                console.log('abc');
                $('#formSearch').submit();
            } else {
                $('#inpsearch').focus();
            }
        });

        $("#inpsearch").on('keyup', function () {
            if ($(this).val() !== '') {
                $('.greetingsearch').hide();
                var g = $(this).val().toLowerCase();
                setTimeout(() => {
                    $.ajax({
                        url: '/homeshop/search',
                        method: "GET",
                        data: { keyword: g },
                        dataType: 'json',
                        success: res => {
                            if (res.status) {
                                if (res.data.length > 0) {
                                    $('.greetingsearch').hide();
                                    setTimeout(() => {
                                        $('#ulresult').empty();
                                        $.each(res.data, (i, item) => {
                                            $("#ulresult").append(`<li class="liresult"><a href="/product/index/${item.id}">${item.name}</a></li>`);
                                        });
                                    }, 500);
                                }
                            } else {
                                $('#ulresult').empty();
                                $("#ulresult").append(`<li class="liresult"></li>`);
                                $('.greetingsearch').show();
                                $('.greetingsearch').text($("#inpsearch").val());
                            }
                        }
                    });
                }, 500);
            }
            else {
                $('#ulresult').empty();
                $("#ulresult").append(`<li class="liresult greetingsearch">Chào mừng bạn đến với Mobile World</li>`);
                $('.greetingsearch').show();
            }
        });
    }
};

search.init();