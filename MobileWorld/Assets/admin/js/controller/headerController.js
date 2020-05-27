var stateHeader = {
    status: [-2, -2],
    count: 0
};

var header = {
    init: function () {
        header.registerEvent();
    },
    registerEvent: function () {
        header.receiveMessage();
        var intervalID = setInterval(header.receiveMessage, 300);
        header.eventClick();
        // clearInterval(intervalID);
    },
    receiveMessage: function () {
        $.ajax({
            url: '/admin/Home/GetMessage',
            type: 'GET',
            data: {},
            dataType: 'json',
            success: res => {
                stateHeader.status = res.status;
                stateHeader.count = res.count;
                if (res.status[0] == 0) {
                    $('#msgNewBill').addClass('font-weight-bold');
                }
                else {
                    $('#msgNewBill').removeClass('font-weight-bold');
                }
                if (res.status[1] == -1) {
                    $('#msgHuyBill').addClass('font-weight-bold');
                }
                else {
                    $('#msgHuyBill').removeClass('font-weight-bold');
                }
                if (stateHeader.count != 0) {
                    $('#msgCount').text(`+${stateHeader.count}`);
                }
            },
            error: e => {
                bootbox.alert('Error 404');
                setTimeout(() => {
                    bootbox.hideAll();
                }, 2000);
            }
        });
    },
    eventClick: function () {
        $('#msgNewBill').off('click').on('click', () => {
            if (stateHeader.status[0] == 0) {
                $.ajax({
                    url: '/admin/home/SeenMessage',
                    type: 'get',
                    data: { typeMsg: 0 },
                    dataType: 'json',
                    success: res => {
                        window.location.href = '/admin/bill';
                    },
                    error: e => {
                        bootbox.alert('Error 404');
                        setTimeout(() => {
                            bootbox.hideAll();
                        }, 2000);
                    }
                });

            }
        });
        $('#msgHuyBill').off('click').on('click', () => {
            if (stateHeader.status[1] == -1) {
                $.ajax({
                    url: '/admin/home/SeenMessage',
                    type: 'get',
                    data: { typeMsg: -1 },
                    dataType: 'json',
                    success: res => {
                        window.location.href = '/admin/bill';
                    },
                    error: e => {
                        bootbox.alert('Error 404');
                        setTimeout(() => {
                            bootbox.hideAll();
                        }, 2000);
                    }
                });
            }
        });
    }

};

header.init();
