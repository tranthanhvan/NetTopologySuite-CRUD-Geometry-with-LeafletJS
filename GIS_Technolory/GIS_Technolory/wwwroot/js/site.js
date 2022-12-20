// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function UpdateIcon() {
    let image = $('#icon-upload-btn').val();
    if (image == null || image == '') {
        return;
    }
    let formData = new FormData();

    formData.append("file", $('#icon-upload-btn').get(0).files[0]);

    $.ajax(
        {
            url: "/icon/upload",
            data: formData,
            processData: false,
            contentType: false,
            type: "POST",
            success: function (data) {
                $('#ImageUpload').val(null);
                $('#Icon').val(data.Data);
                let icon = document.getElementById('icon-display');
                icon.src = data.Data;
            }
        }
    );
}


$(document).ready(function () {
    $('#click').click(function () {
        $("#panel").animate({ width: 'toggle' }, 500);
        if ($('#click').hasClass('to-left')) {
            $('#click').removeClass('to-left').addClass('to-right');
        } else {
            $('#click').removeClass('to-right').addClass('to-left');
        }
    });
});