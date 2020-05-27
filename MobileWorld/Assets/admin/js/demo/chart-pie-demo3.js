// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var chart = {
    slMobile: 0,
    slLaptop: 0
}

function loadData() {
    return new Promise(resolve => {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                chart.slMobile = JSON.parse(this.response).slMobile;
                chart.slLaptop = JSON.parse(this.response).slLaptop;
                drawChart2();
            }
        };
        xhttp.open("POST", "/admin/home/CatalogTypeChart", true);
        xhttp.send();
        resolve('resolved');
    });
};

// Pie Chart Example
function drawChart2() {
    var ctx = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["Điện thoại", "Laptop"],
            datasets: [{
                data: [chart.slMobile, chart.slLaptop],
                backgroundColor: ['#1cc88a', '#36b9cc'],
                hoverBackgroundColor: ['#17a673', '#2c9faf'],
                hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
            },
            legend: {
                display: false
            },
            cutoutPercentage: 80,
        },
    });
}
loadData();