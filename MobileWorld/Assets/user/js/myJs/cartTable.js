var cartConfig = {
    quantity: 1,
    totalPrice: 0
}

var tableCart = {
    init: function () {
        tableCart.registerEvent();
    },
    registerEvent: function () {
        tableCart.changeQuantity();
        tableCart.eventDelete();
    },
    eventDelete: function () {
        $('.remove').off('click').on('click', function (e) {
            e.preventDefault();
            let catalogId = $(this).data('id');
            $.ajax({
                url: '/cart/deletecart',
                data: {
                    catalogid: catalogId
                },
                dataType: 'json',
                type: 'POST',
                success: res => {
                    if (res.status == true) {
                        $(`#line-${catalogId}`).remove();
                        window.location.href = '/cart';
                    }
                }
            });
        });
    },
    eventUpdate: function () {
        var listProduct = $('.txtQuantity');
        var state = [];
        $.each(listProduct, function (i, item) {
            state.push({
                quantity: $(item).val(),
                catalog: {
                    id: $(item).data('id')
                }
            });
        });
        $.ajax({
            url: '/cart/update',
            data: {
                cartModel: JSON.stringify(state)
            },
            dataType: 'json',
            type: 'POST',
            success: res => {
                if (res.status == true) {
                    window.location.href('/cart');
                }
            }
        });
    },
    changeQuantity: function () {
        $('.minus').off('click').on('click', function () {

            let dataid = $(this).attr('data-id');

            let price = $(`#price-${dataid}`).attr('data-price');

            let soluong = parseInt($(`#soluong-${dataid}`).val());
            if (soluong > 1) {
                cartConfig.quantity = soluong - 1;
                if (cartConfig.quantity <= 1) $(`#minus-${dataid}`).prop('disabled', true);
                $(`#plus-${dataid}`).prop('disabled', false);
                $(`#soluong-${dataid}`).val(cartConfig.quantity);
                cartConfig.totalPrice = parseInt(price) * parseInt(cartConfig.quantity);
                $(`#totalcart-${dataid}`).text(cartConfig.totalPrice.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + ' VNĐ');
            }
            tableCart.eventUpdate();
        });
        $('.plus').off('click').on('click', function () {
            let dataid = $(this).attr('data-id');

            let price = $(`#price-${dataid}`).attr('data-price');

            let soluong = parseInt($(`#soluong-${dataid}`).val());
            if (soluong < 10) {
                cartConfig.quantity = soluong + 1;
                if (cartConfig.quantity >= 10) $(`#plus-${dataid}`).prop('disabled', true);
                $(`#minus-${dataid}`).prop('disabled', false);
                $(`#soluong-${dataid}`).val(cartConfig.quantity);
                cartConfig.totalPrice = parseInt(price) * parseInt(cartConfig.quantity);
                $(`#totalcart-${dataid}`).text(cartConfig.totalPrice.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + ' VNĐ');
            }
            tableCart.eventUpdate();
        });
    }
}

tableCart.init();