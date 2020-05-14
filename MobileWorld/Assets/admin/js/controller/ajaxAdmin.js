var user = {
    init: function () {
        user.registerEvent();
    },
    registerEvent: function () {
        var idbtn = -1;
        var self = undefined;

        $('.lockup').off('click').on('click', function (e) {
            e.preventDefault();
            idbtn = this.getAttribute('data-id');
            let lock = this.getAttribute('data-lock');
            if (lock.localeCompare("True") == 0) {
                $('#mess').text("Xác nhận khóa tài khoản này ?");
            } else if (lock.localeCompare("False") == 0) {
                $('#mess').text("Xác nhận mở khóa tài khoản này ?");
            }
            self = this;
        });

        $('.oke').off('click').on('click', function (e) {
            e.preventDefault();
            let cl = '.lock_' + idbtn;
            let cl2 = '.status_' + idbtn;

            let btn = $(cl);
            let btnStatus = $(cl2);

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
        $('.view-details-link').on('dblclick', function () {
            let idCatalog = this.getAttribute('data-id');
            let idLink = "#catalog_" + idCatalog;
            $(idLink)[0].click();
        });
        // them moi san pham
        $('#btnAdd').off('click').on('click', function () {
            $('.mobileInput').show();
            $('.laptopInput').hide();
            $('.slType').prop('disabled', false);
            $('#exampleModal').modal('show');
        });
        $('.slType').off('change').on('change', () => {
            if ($('.slType').val() == 2) {
                $('.mobileInput').hide();
                $('.laptopInput').show();
            }
            else if ($('.slType').val() == 1) {
                $('.laptopInput').hide();
                $('.mobileInput').show();
            }
        });

        $('#formData').validate({
            rules: {
                name: {
                    required: true,
                    minlength: 5
                },
                pictureuri: {
                    required: true
                },
                price: {
                    required: true
                },
                quantity: {
                    required: true
                },
                cpu: {
                    required: true
                },
                ram: {
                    required: true
                },
                screen: {
                    required: true
                },
                os: {
                    required: true
                }
            },
            messages: {
                name: {
                    required: "Hãy nhập tên sản phẩm!",
                    minlength: "Tên sản phẩm phải trên 5 kí tự!"
                },
                pictureuri: {
                    required: "Hãy nhập link ảnh!"
                },
                price: {
                    required: "Hãy nhập giá!"
                },
                quantity: {
                    required: "Hãy nhập số lượng!"
                },
                cpu: {
                    required: "Hãy nhập số hiệu CPU!"
                },
                ram: {
                    required: "Hãy nhập thông số Ram!"
                },
                screen: {
                    required: "Hãy nhập loại màn hình!"
                },
                os: {
                    required: "Hãy nhập hệ điều hành!"
                }
            }
        });

        $('#btnSave').off('click').on('click', () => {
            if ($('#formData').valid()) {
                user.saveCatalog();
                $('#exampleModal').modal('hide');
            }
        });
    },
    resetForm: function () {
        $('#id').val('0');
        $('#name').val('');
        $('#pictureuri').val('');
        $('#price').val('');
        $('#description').val('');
        $('#noidung').val('');
        $('#quantity').val('');
        $('#slBrand').val('0');
        $('#slType').val('0');
        $('.slBrand').val('1');
        $('.slType').val('1');
        $('#cpu').val('');
        $('#ram').val('');
        $('#screen').val('');
        $('#os').val('');
        $('#backcamera').val('');
        $('#frontcamera').val('');
        $('#internalmemory').val('');
        $('#memorystick').val('');
        $('#sim').val('');
        $('#batery').val('');
        $('#cardscreen').val('');
        $('#connector').val('');
        $('#harddrive').val('');
        $('#design').val('');
        $('#size').val('');
        $('#release').val('');
    },
    saveCatalog: function () {
        const formToObject = (form) =>
            Array.from(new FormData(form)).reduce(
                (acc, [key, value]) => ({
                    ...acc,
                    [key]: value,
                }),
                {}
            );
        let model = formToObject(document.querySelector("#formData"));
        console.log(model);
        $.ajax({
            url: '/admin/catalog/add',
            type: 'POST',
            data: {
                type: $('.slType').val(),
                model: JSON.stringify(model)
            },
            dataType: 'json',
            success: function (res) {
                if (res.status) {
                    alert('Thêm thành công');
                    let type = res.type == 1 ? 'Điện thoại' : 'Laptop';
                    let typeId = $("#loadData").attr('href').split('=');
                    let type2 = typeId + "?type=" + type;
                    $("#loadData").attr("href", type2);
                    $('#loadData')[0].click();
                    user.resetForm();
                } else {
                    alert('Thêm thất bại');
                }
            }
        });
    }
}
user.init();
