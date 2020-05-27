var stateHeader = {
    status: [-2, -2],
    count: 0,
    timeCD: '',
    dayCD: '',
    timeDH: '',
    dayDH: ''
};

var header = {
    init: function () {
        header.registerEvent();
    },
    registerEvent: function () {
        header.eventClick();
        header.myworker();
    },
    myworker: function () {
        var w;
        if (typeof Worker !== "undefined") {
            if (typeof w == "undefined") {
                w = new Worker("/assets/admin/js/controller/receiveMsgWorkers.js");
            }
            w.onmessage = function (event) {
                if (JSON.stringify(stateHeader) != event.data) {
                    stateHeader = JSON.parse(event.data);
                    if (stateHeader.status[0] == 0) {
                        $('#msgNewBill').addClass('font-weight-bold');
                    }
                    else {
                        $('#msgNewBill').removeClass('font-weight-bold');
                    }
                    if (stateHeader.status[1] == -1) {
                        $('#msgHuyBill').addClass('font-weight-bold');
                    }
                    else {
                        $('#msgHuyBill').removeClass('font-weight-bold');
                    }
                    if (stateHeader.count != 0) {
                        $('#msgCount').text(`+${stateHeader.count}`);
                    }
                    $('.timeNewBill1').text(stateHeader.dayCD);
                    $('.timeNewBill2').text(stateHeader.timeCD);
                    $('.timeHuyBill1').text(stateHeader.dayDH);
                    $('.timeHuyBill2').text(stateHeader.timeDH);
                }
            };
        } else {
            console.log("Sorry! No Web Worker support.");
        }
    },
    eventClick: function () {
        $('#msgNewBill').on('click', () => {
            if (stateHeader.status[0] == 0) {
                $.ajax({
                    url: '/admin/home/SeenMessage',
                    type: 'get',
                    data: { typeMsg: 0 },
                    dataType: 'json',
                    success: res => {
                        if (res.status) {
                            window.location.href = '/admin/bill';
                        }
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
        $('#msgHuyBill').on('click', () => {
            if (stateHeader.status[1] == -1) {
                $.ajax({
                    url: '/admin/home/SeenMessage',
                    type: 'get',
                    data: { typeMsg: -1 },
                    dataType: 'json',
                    success: res => {
                        if (res.status) {
                            window.location.href = '/admin/bill';
                        }
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
