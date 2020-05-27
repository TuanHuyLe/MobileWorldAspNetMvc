var state = {
    page: 1,
    pageSize: 5,
    seach: '',
    status: 0,
    month: 0,
    uid: 0
}
controller = {
    init: () => {
        controller.loadData(true);
    },
    registerEvent: () => {
        $('#slStatus').off('change').on('change', function () {
            state.seach = $('#txtSeach').val();
            state.status = $(this).val();
            controller.loadData(true);
        });
        $('#slMonth').off('change').on('change', function () {
            state.seach = $('#txtSeach').val();
            state.month = $(this).val();
            controller.loadData(true);
        });

        $('#btnReset').off('click').on('click', function () {
            controller.resetState();
            controller.loadData(true);
        });
        $('.btnAccept').off('click').on('click', function () {
            if (state.status == 0) {
                let r = confirm("Hủy đơn hàng này ?");
                let id = parseInt($(this).data('id'));
                if (r == true) {
                    controller.cancelBill(id);
                    controller.resetState();
                    controller.loadData(true);
                }
            }
            else if (state.status == 1) {
                let r = confirm("Bạn đã nhận đơn hàng này ?");
                let id = parseInt($(this).data('id'));
                if (r == true) {
                    controller.receivedBill(id);
                    controller.resetState();
                    controller.loadData(true);
                }
            }
        });
    },
    loadData: (changePageSize) => {
        state.uid = parseInt(window.location.href.match(/\d+$/));
        $.ajax({
            url: '/user/LoadData',
            type: 'GET',
            data: {
                seach: state.seach,
                status: state.status,
                month: state.month,
                page: state.page,
                pageSize: state.pageSize,
                uid: state.uid
            },
            dataType: 'json',
            success: (res) => {
                var html = '';
                $('#total').html(`Tổng đơn hàng: ${res.totalRow}.`)
                var template = $('#data-template').html();
                if (state.status == -1) {
                    $('#tt').addClass('hidden');
                } else {
                    $('#tt').removeClass('hidden');
                }
                $.each(res.data, function (i, item) {
                    html += Mustache.render(template, {
                        id: item.id,
                        username: item.receivername,
                        name: item.name,
                        unit: item.unit,
                        cost: formatCurrency(item.unit * item.price),
                        status: item.status,
                        style: setStatus(item.status).colorStyle,
                        textStatus: setStatus(item.status).textStatus,
                        isHidden: setStatus(item.status).isHidden,
                        shiptoaddress: item.shiptoaddress,
                        createdAt: item.createdAt
                    });
                });
                $('#tblData').html(html);
                controller.registerEvent();
                controller.paging(res.totalRow, changePageSize);
            },
            error: (err) => {
                console.log(err);
            }
        });
    },
    cancelBill: id => {
        $.ajax({
            url: '/user/CancelBill',
            type: 'POST',
            data: { id: id },
            dataType: 'json',
            success: (res) => {
                var msg = '';
                if (res.status) {
                    alert('Hủy đơn hàng thành công!');
                    controller.loadData(true);
                } else {
                    alert('Không thể hủy đơn hàng này!');
                }
            },
            error: (err) => {
                console.log(err);
            }
        });
    },
    receivedBill: id => {
        $.ajax({
            url: '/user/ReceivedBill',
            type: 'POST',
            data: { id: id },
            dataType: 'json',
            success: (res) => {
                var msg = '';
                if (res.status) {
                    alert('Xác nhận nhận đơn hàng thành công!');
                    controller.loadData(true);
                } else {
                    alert('Có lỗi về đơn hàng này!');
                }
            },
            error: (err) => {
                console.log(err);
            }
        });
    },
    paging: function (totalRow, changePageSize) {
        var totalPage = Math.ceil(totalRow / state.pageSize);
        if ($('#pagination a').length === 0 || changePageSize === true) {
            $('#pagination').empty();
            $('#pagination').removeData("twbs-pagination");
            $('#pagination').unbind("page");
        }

        $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "Đầu",
            last: "Cuối",
            next: "Tiếp",
            prev: "Trước",
            onPageClick: function (event, page) {
                state.page = page;
                setTimeout(function () {
                    controller.loadData();
                }, 10);
            }
        });
    },
    resetState: function () {
        $('#txtSeach').val('');
        $('#slStatus').val('0');
        $('#slMonth').val('0');
        state.status = 0;
        state.seach = '';
        state.month = 0;
    }
}
controller.init();
const setStatus = (status) => {
    if (status == -1) {
        return {
            colorStyle: '',
            textStatus: '',
            isHidden: 'hidden'
        }
    } else if (status == 0) {
        return {
            colorStyle: 'danger',
            textStatus: 'Hủy',
            isHidden: ''
        }
    } else if (status == 1) {
        return {
            colorStyle: 'success',
            textStatus: 'Đã nhận',
            isHidden: ''
        }
    } else if (status == 2) {
        return {
            colorStyle: '',
            textStatus: '',
            isHidden: 'hidden'
        }
    }
}
function formatCurrency(n, separate = ".") {
    var s = n.toString();
    var regex = /\B(?=(\d{3})+(?!\d))/g;
    var ret = s.replace(regex, separate);
    return ret;
}