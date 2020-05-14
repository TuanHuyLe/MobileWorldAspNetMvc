var catalogConfig = {
    pageSize: 12,
    pageIndex: 1,
    typeid: 1,
    minP: -1,
    maxP: -1,
    html: '',
    brand: []
}

var catalogAjax = {
    init: function () {
        catalogAjax.registerEvent();
        catalogAjax.loadData();
    },
    registerEvent: function () {
        catalogAjax.filterPrice();
        catalogAjax.filterBrand();
    },
    filterPrice: function () {
        $('.choose-price').off('click').on('click', function () {
            let choosePrice = $(this).attr('data-id').split('-');
            $('.choose-price').css('font-weight', '100');
            $(this).css('font-weight', 'bold');
            catalogConfig.minP = choosePrice[0];
            catalogConfig.maxP = choosePrice[1];
            catalogConfig.pageIndex = 1;
            catalogConfig.html = '';
            if (catalogConfig.minP == "") catalogConfig.minP = 0;
            if (catalogConfig.maxP == "") catalogConfig.maxP = 500;
            setTimeout(catalogAjax.loadData, 200);
        });
    },
    filterBrand: function () {
        $('.chooseBrand').off('click').on('click', function () {
            let brandId = $(this).attr('data-id');
            if (catalogConfig.brand.includes(brandId.toString())) {
                let index = catalogConfig.brand.indexOf(brandId.toString());
                if (index > -1) {
                    catalogConfig.brand.splice(index, 1);
                }
                $(this).removeClass('check');
            } else {
                catalogConfig.brand.push(brandId);
                $(this).addClass('check');
            }
            catalogConfig.html = '';
            catalogConfig.pageIndex = 1;
            setTimeout(catalogAjax.loadData, 200);
        });
    },
    loadData: function () {
        let typeName = $('#typeName').text();
        catalogConfig.typeid = typeName == "Laptop" ? 2 : 1;
        $.ajax({
            url: '/homeshop/loaddata',
            type: 'GET',
            data: {
                page: catalogConfig.pageIndex,
                pageSize: catalogConfig.pageSize,
                typeid: catalogConfig.typeid,
                minP: catalogConfig.minP,
                maxP: catalogConfig.maxP,
                brand: JSON.stringify(catalogConfig.brand)
            },
            dataType: 'json',
            success: res => {
                if (res.status) {
                    let data = res.data;
                    let template = $('#data-template').html();
                    $.each(data, (i, item) => {
                        catalogConfig.html += Mustache.render(template, {
                            pictureuri: item.pictureuri,
                            name: item.name,
                            price: item.price.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"),
                            quantity: item.quantity,
                            id: item.id
                        });
                    });
                    let loadMore = $('#data-btnLoadMore').html();
                    let htmlLoadMore = '';
                    htmlLoadMore += Mustache.render(loadMore, {
                        soluong: res.soluong,
                        loai: res.loai
                    });
                    $('#product-pagination').html(htmlLoadMore);
                    $('#tblData').html(catalogConfig.html);
                    if (res.soluong <= 0) {
                        $('#btnXemThem').hide();
                    } else {
                        $('#btnXemThem').show();
                    }
                    $('#btnXemThem').off('click').on('click', () => {
                        if (catalogConfig.pageIndex < res.total / catalogConfig.pageSize) {
                            catalogConfig.pageIndex = catalogConfig.pageIndex + 1;
                            setTimeout(catalogAjax.loadData, 200);
                        }
                    });
                }
            },
            error: e => {
                alert(e);
            }
        });
    }
};

catalogAjax.init();