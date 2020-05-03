var cartConfig = {
    quantity: 1,
    totalPrice: 0,
    priceCheckout: ''
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
                }
            }
        });
    },
    /*changeQuantity: (selector, opeator = 0) => {
        var catalogid = selector.data('catalogid');
        var price = parseInt(selector.data('price').split('.').join(''));
        var quantity = parseInt($(`#quantity${catalogid}`).val());
        if (opeator == 1) {
            if (quantity < 10) {
                $(`#quantity${catalogid}`).val(quantity += 1);
                $(`.cost${catalogid}`).html(formatCurrency(price * quantity) + ' VNĐ');
            }
        } else {
            if (quantity > 1) {
                $(`#quantity${catalogid}`).val(quantity -= 1);
                $(`.cost${catalogid}`).html(formatCurrency(price * quantity) + ' VNĐ');
            }
        }
        state.forEach((item) => {
            if (item.catalogid == catalogid) {
                item.unit = quantity;
            }
        });
        console.log(state);*/
    changeQuantity: function () {
        $('.btnRefresh').off('click').on('click', function () {
            var listPrice = $('.txtTotalPrice');
            sum = 0;
            $.each(listPrice, function (i, item) {
                sum += parseInt($(item).text().match(/\d+/g).toString().split(',').join(''));
            });
            cartConfig.priceCheckout = sum.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + ' VNĐ';
            $('#thanhtien').text(cartConfig.priceCheckout);
            $.ajax({
                url: '/cart/updateTotalPrice',
                data: {
                    totalPrice: cartConfig.priceCheckout
                },
                dataType: 'json',
                type: 'POST',
                success: res => {
                    if (res.status == true) {
                    }
                }
            });
        });
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