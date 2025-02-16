
$(document).ready(function () {
    var txtPassword = $("#ContentPlaceHolder1_txt_password");
    var txtConfirmPassword = $("#ContentPlaceHolder1_txt_confirmPassword");
    var rfv_txtConfirmPassword = $("#ContentPlaceHolder1_rfv_txt_confirmPassword");

    txtConfirmPassword.on('keyup', function () {
        if ($(txtPassword).val().length > 0) {
            if ($(txtPassword).val() == $(txtConfirmPassword).val())
                rfv_txtConfirmPassword.html("Password match!").css({ "display": "block", "color": "green" });
            else
                rfv_txtConfirmPassword.html("Password does not match!").css({ "display": "block", "color": "red" });
        }
    });
});

function validateEmail() {
    var txtEmail = $("#ContentPlaceHolder1_txt_emailID");
    var rfv_txtEmail = $("#ContentPlaceHolder1_rfv_txt_emailID");
    const email = $(txtEmail).val();
    const regex = /^[a-zA-Z0-9_.+\-]+[\x40][a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$/;
    const isValid = regex.test(email);

    !isValid ? $(rfv_txtEmail).html("Invalid Email Address!").css({ "display": "block", "color": "red" }) : '';
    return isValid;
}

function validateDOB() {
    var txtDOB = $("#ContentPlaceHolder1_txt_dob");
    var rfv_txtDOB = $("#ContentPlaceHolder1_rfv_txt_dob");
    const dateString = txtDOB.val();
    const dob = new Date(dateString);
    const dobPlus18 = new Date(dob.getFullYear() + 18, dob.getMonth(), dob.getDate());
    const isAbove18 = dobPlus18.valueOf() <= Date.now();

    !isAbove18 ? $(rfv_txtDOB).html("Must be 18 years old!").css({ "display": "block", "color": "red" }) : $('#ContentPlaceHolder1_Button1').removeAttr('disabled');
    return isAbove18;
}