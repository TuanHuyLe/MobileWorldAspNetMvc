$('#description').off('click').on('click', function () {
    $('#specifications').removeClass('active');
    $('#description').addClass('active');
    $('#home').addClass('active');
    $('#profile').removeClass('active');
});
$('#specifications').off('click').on('click', function () {
    $('#description').removeClass('active');
    $('#specifications').addClass('active');
    $('#home').removeClass('active');
    $('#profile').addClass('active');
});