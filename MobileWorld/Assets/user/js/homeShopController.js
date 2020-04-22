var homeConfig = {
    pageSize: 9,
    pageIndex: 1,
    type: 1
}

var homeShopAjax = {
    init: function () {
        homeShopAjax.registerEvent();
        homeShopAjax.loadData();
    },
    registerEvent: function () {
    },
    loadData: function () {
        $.ajax({
            url: '/homeshop/loaddata',
            type: 'GET',
            dataType: 'json',
            data: {
                page: homeConfig.pageIndex,
                pageSize: homeConfig.pageSize,
                type: homeConfig.type
            },
            success: res => {
                if (res.status) {
                    var data = res.data;
                    var html = '';
                    var template = $('#data-template').html();
                    $.each(data, (i, item) => {
                        html += Mustache.render(template, {
                            pictureuri: item.pictureuri,
                            name: item.name,
                            price: item.price,
                            quantity: item.quantity,
                            id: item.id
                        });
                    });
                    $('#tblData').html(html);
                    homeShopAjax.paging(res.total, () => {
                        homeShopAjax.loadData();
                    });
                }
            },
            error: function (error) {
                console.log(error)
            }
        });
    },
    paging: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / homeConfig.pageSize);
        $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            onPageClick: (event, page) => {
                homeConfig.pageIndex = page;
                setTimeout(callback, 200);
                window.scrollTo(0, 100);
            }
        })
    }
   
};

homeShopAjax.init();
