var stateHeader = {
    status: [-2, -2],
    count: 0,
    timeCD: '',
    dayCD: '',
    timeDH: '',
    dayDH: ''
};

function convertDateTime(time) {
    var dt = new Date(time);

    var day = dt.getDate(),
        month = dt.getMonth(),
        year = dt.getFullYear(),
        hours = dt.getHours(),
        minutes = dt.getMinutes(),
        seconds = dt.getSeconds();
    let dayFormat = `Ngày ${day} tháng ${(month + 1)} năm ${year}`;
    let timeFormat = hours + ':' + minutes + ':' + seconds;
    return [timeFormat, dayFormat];
}

function receiveMessage() {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let data = JSON.parse(this.response);
            stateHeader.status = data.status;
            stateHeader.count = data.count;

            stateHeader.timeCD = convertDateTime(data.timeCD)[0];
            stateHeader.dayCD = convertDateTime(data.timeCD)[1];
            stateHeader.timeDH = convertDateTime(data.timeDH)[0];
            stateHeader.dayDH = convertDateTime(data.timeDH)[1];

            postMessage(JSON.stringify(stateHeader));
        }
    };
    xmlhttp.open("GET", "/admin/Home/GetMessage", true);
    xmlhttp.send();
}

setInterval(receiveMessage, 300);

receiveMessage();