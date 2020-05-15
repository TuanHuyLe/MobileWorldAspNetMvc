var brandConfig = {
    id: -1
};

var brand = {
    init: function () {
        brand.registerEvent();
    },
    registerEvent: function () {
        $('.btnDel').off('click').on('click', function () {
            brandConfig.id = $(this).attr('data-id');
        });
        $('#btnDelBrand').off('click').on('click', function () {
            $.ajax({
                url: '/admin/brand/delete',
                data: { id: brandConfig.id },
                contentType: 'application/json',
                type: 'GET',
                success: res => {
                    if (res.status) {
                        let idtr = '#' + brandConfig.id.toString();
                        $(idtr).remove();
                        bootbox.alert("Xóa thương hiệu thành công!");
                        setTimeout(() => {
                            bootbox.hideAll();
                        }, 2000);
                    } else {
                        bootbox.alert("Không thể xóa thương hiệu này");
                        setTimeout(() => {
                            bootbox.hideAll();
                        }, 2000);
                    }
                },
                error: e => {
                    console.log(e);
                }
            });
        });
    }
}

brand.init();