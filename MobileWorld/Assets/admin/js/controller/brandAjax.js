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
                    } else {
                        alert("Xóa thất bại");
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