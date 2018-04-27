function validateBeforeRegist() {
    var profileType = $("#profileType").val();
    if (profileType == '1' || profileType == '2') {
        if (isEmpty($("#name").val())) {
            alert('please, fill out your name.');
            $("#name").focus();
            return false;
        } else {
            /*if (regexName.test($("#name").val())) {
                alert('You can fill out your name using only text.');
                $("#name").focus();
                return false;
            }*/
        }

        if (profileType == '1') {
            if (isEmpty($("#catId2").val())) {
                alert('please, choice your main position.');
                $("#catId2").focus();
                return false;
            }
        }

        if (isEmpty($("#height").val())) {
            alert('please, fill out your height.');
            $("#height").focus();
            return false;
        } else {
            if (!regexDecimalPoint.test($("#height").val())) {
                alert('You can fill out your height using number and point.');
                $("#height").focus();
                return false;
            }
        }

        if (isEmpty($("#weight").val())) {
            alert('please, fill out your weight.');
            $("#weight").focus();
            return false;
        } else {
            if (!regexDecimalPoint.test($("#weight").val())) {
                alert('You can fill out your weight using number and point.');
                $("#weight").focus();
                return false;
            }
        }

        if (isEmpty($("#birthDate").val())) {
            alert('please, fill out your birth date.');
            $("#birthDate").focus();
            return false;
        }

        if (isEmpty($("#birthPlace").val())) {
            alert('please, fill out your birth place.');
            $("#birthPlace").focus();
            return false;
        }

        if (isEmpty($("#education").val())) {
            alert('please, fill out your education.');
            $("#education").focus();
            return false;
        }

        if (isEmpty($("#hobbies").val())) {
            alert('please, fill out your hobbies.');
            $("#hobbies").focus();
            return false;
        }

        if (isEmpty($("#favoriteFood").val())) {
            alert('please, fill out your favorite food.');
            $("#favoriteFood").focus();
            return false;
        }

        if (isEmpty($("#language").val())) {
            alert('please, search your language.');
            $("#languageSearch").focus();
            return false;
        }

        if (isEmpty($("#nationality").val())) {
            alert('please, search your nationality.');
            $("#nationalitySearch").focus();
            return false;
        }

        if (isEmpty($("#introduce").val())) {
            alert('please, introduce yourself.');
            $("#introduce").focus();
            return false;
        }

        if (isEmpty($("#email").val())) {
            alert('please, fill out your email.');
            $("#email").focus();
            return false;
        } else {
            if (regexEmail.test($("#email").val())) {
                alert('It is invalid email address. please check out your email again.');
                $("#email").focus();
                return false;
            }
        }

        if (isEmpty($("#phoneNo").val())) {
            alert('please, fill out your phone no.');
            $("#phoneNo").focus();
            return false;
        }

        if (isEmpty($("#cellPhoneNo").val())) {
            alert('please, fill out your cell Phone No.');
            $("#cellPhoneNo").focus();
            return false;
        }

        if (isEmpty($("#address").val())) {
            alert('please, fill out your address.');
            $("#address").focus();
            return false;
        }
    } else {
        if (isEmpty($("#name").val())) {
            alert('please, fill out your name.');
            $("#name").focus();
            return false;
        } else {
            /*if (!regexName.test($("#name").val())) {
                alert('You can fill out your name using only text.');
                $("#name").focus();
                return false;
            }*/
        }

        if (isEmpty($("#introduce").val())) {
            alert('please, introduce yourself.');
            $("#introduce").focus();
            return false;
        }

        if (isEmpty($("#city").val())) {
            alert('please, fill out your city.');
            $("#city").focus();
            return false;
        }

        if (isEmpty($("#establishedDate").val())) {
            alert('please, fill out your established date.');
            $("#establishedDate").focus();
            return false;
        }

        if (isEmpty($("#email").val())) {
            alert('please, fill out your email.');
            $("#email").focus();
            return false;
        } else {
            if (regexEmail.test($("#email").val())) {
                alert('It is invalid email address. please check out your email again.');
                $("#email").focus();
                return false;
            }
        }

        if (isEmpty($("#address").val())) {
            alert('please, fill out your address.');
            $("#address").focus();
            return false;
        }
    }
    return true;
}

function isEmpty(val){
    return (val == '' || val == null || val == 'undefined') ? true : false;
}