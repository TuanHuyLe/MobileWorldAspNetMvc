var user = {
    init: function () {
        user.registerEvent();
    },
    registerEvent: function () {
        var idbtn = -1;
        var self = undefined;

        $('.lockup').on('click', function (e) {
            e.preventDefault();
            idbtn = this.getAttribute('data-id');
            var lock = this.getAttribute('data-lock');
            if (lock.localeCompare("True") == 0) {
                $('#mess').text("Xác nhận khóa tài khoản này ?");
            } else if (lock.localeCompare("False") == 0) {
                $('#mess').text("Xác nhận mở khóa tài khoản này ?");
            }
            self = this;
        });

        $('.oke').on('click', function (e) {
            e.preventDefault();
            var cl = '.lock_' + idbtn;
            var cl2 = '.status_' + idbtn;

            var btn = $(cl);
            var btnStatus = $(cl2);


            $.ajax({
                url: '/admin/users/lockup',
                data: { id: idbtn },
                dataType: 'json',
                type: 'POST',
                success: res => {
                    if (res.status == true) {
                        btn.text('Mở khóa');
                        self.setAttribute('data-lock', 'False');
                        btn.removeClass("btn-warning").addClass("btn-info");
                        btnStatus.removeClass("fa-check-circle").addClass("fa-user-lock");
                        btnStatus.css("color", "#fc544b");
                    } else {
                        btn.text('Khóa');
                        self.setAttribute('data-lock', 'True');
                        btn.removeClass("btn-info").addClass("btn-warning");
                        btnStatus.removeClass("fa-user-lock").addClass("fa-check-circle");
                        btnStatus.css("color", "#66bb6a");
                    }
                }
            });
        });
    }
}
user.init();
