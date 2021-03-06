﻿var profileConfig = {
    changeInfo: 0,
    historyIndex: 0
}
var profile = {
    init: function () {
        profileConfig.historyIndex = history.length;
        $('#btnBack').attr('historyIndex', profileConfig.historyIndex)
        profile.registerEvent();
    },
    registerEvent: function () {
        $('#btnBack').off('click').on('click', function () {
            window.history.back();
            return false;
            
            /*let x = history.length;
            console.log(x);
            console.log(profileConfig.historyIndex);*/
        });

        $("#file").change(function () {
            $('#changeAvatar').show();
            $('#cancelAvatar').show();
            profile.readURL(this);
        });
        $('#cancelAvatar').off('click').on('click', function () {
            let id = $(this).data('id');
            window.location.href = "/user/profile/" + id;
        });
        $('#cancelChangeInfo').off('click').on('click', function () {
            $('#info').show();
            $('#formInfo').hide();
            profileConfig.changeInfo = 0;
        });
        $('#btnChangeInfo').off('click').on('click', function () {
            if (profileConfig.changeInfo == 0) {
                $('#info').hide();
                $('#formInfo').show();
                profileConfig.changeInfo = 1;
            }
            else {
                $('#info').show();
                $('#formInfo').hide();
                profileConfig.changeInfo = 0;
            }
        });
        // Get the modal
        var modal = document.getElementById('id01');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    },
    readURL: function (input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#avatar').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
}

profile.init();