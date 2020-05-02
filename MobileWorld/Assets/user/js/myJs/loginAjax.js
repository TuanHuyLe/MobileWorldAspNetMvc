
var login = {
	init: function () {
		login.registerEvent();
	},
	registerEvent: function () {
		$('#login').off('click').on('click', function(e) {
			e.preventDefault();
			let txt = $(this).text();
			if (txt.localeCompare("Đăng nhập") == 0) {
				$('#linklogin')[0].click();
				$(this).text("Đăng xuất");
			} else {
                $.ajax({
                    url: '/login/logout',
                    data: { },
                    type: 'POST',
					success: res => {
						if (res.status) {
							$(this).text("Đăng nhập");
							$('#greeting').text("Xin chào");
                        }
                    }
                });
            }
		});
	}
};

login.init();