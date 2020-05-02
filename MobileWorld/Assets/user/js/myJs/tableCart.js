var cartConfig = {
    quantity: 1
}

var tableCart = {
    init: function () {
        cartConfig.quantity = $('#soluong').val();
        tableCart.registerEvent();
    },
    registerEvent: function () {
        tableCart.changeQuantity();
    },
    changeQuantity: function () {
        $('.minus').off('click').on('click', function () {
            let dataid = $(this).attr('data-id');
            let idquantity = '#soluong-' + dataid;
            let idplus = '#plus-' + dataid;
            let idminus = '#minus-' + dataid;
            let soluong = parseInt($(idquantity).val());
            if (soluong > 1) {
                cartConfig.quantity = soluong - 1;
                if (cartConfig.quantity <= 1) $(idminus).hide();
                $(idplus).show();
                $(idquantity).val(cartConfig.quantity);
            }
        });
        $('.plus').off('click').on('click', function () {
            let dataid = $(this).attr('data-id');
            let idquantity = '#soluong-' + dataid;
            let idplus = '#plus-' + dataid;
            let idminus = '#minus-' + dataid;
            let soluong = parseInt($(idquantity).val());
            if (soluong < 10) {
                cartConfig.quantity = soluong + 1;
                if (cartConfig.quantity >= 10) $(idplus).hide();
                $(idminus).show();
                $(idquantity).val(cartConfig.quantity);
            }
        });
       
    }
}

tableCart.init();