function ValidatePostalCode(id) {
    var b = document.getElementById(id).value;
    var check = 0;
    //regular expression for ca postal code
    var regEx = /[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]/;
    var a = b.replace(/ /g, '').toUpperCase();

    if (regEx.test(a)) {
        if (a.length === 6) {

            check = true;
        } else {

            check = false;
        }
    } else {

        check = false;
    }
    return check;
}

function ValidateEmail(id) {
    var a = document.getElementById(id);
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (a.value.match(mailformat)) {
        return true;
    } else {
        return false;
    }
}

function validate() {
    var variables = [];
    var Errors = 0;
    variables.push(document.getElementById('UserType'));
    if (document.getElementById('UserType').value == 'LawFirm' || document.getElementById('UserType').value ==
        'Brokerage') {
        variables.push(document.getElementById('NewLawyerFirmORBrokerage'))
    } else if (document.getElementById('UserType').value == 'Client') {
        if (document.getElementById('ClientType').value == 'Individual') {
            variables.push(document.getElementById('ClientType'), document.getElementById('NewFirstName'), document
                .getElementById('NewLastName'))
        } else {
            variables.push(document.getElementById('ClientType'), document.getElementById('NewBusinessName'), document
                .getElementById('NewOfficerName'))
        }

    }
    if (document.getElementById('UserType').value == 'LawFirm') {
        if (document.getElementById('AddClerckInformation').checked) {
            variables.push(document.getElementById('ClerkFullName'));
        }
    }

    if (document.getElementById('newClientStreetNumber').value.trim() || document.getElementById('newClientStreetName').value.trim() || document.getElementById('newClientCity').value.trim() || document.getElementById('newClientPostalCode').value.trim()) {
        variables.push(document.getElementById('newClientStreetNumber'),
            document.getElementById('newClientStreetName'),
            document.getElementById('newClientCity'),
            document.getElementById('newClientPostalCode'), document.getElementById('newClientCountry'));
        if (document.getElementById('newClientProvince').value == 'Other') {
            variables.push(document.getElementById('newClientOtherProvince'));
        }
        if (!ValidatePostalCode('newClientPostalCode')) {
            Errors = 1;
            document.getElementById('newClientPostalCode').style.borderColor = "red";
        } else {
            document.getElementById('newClientPostalCode').style.borderColor = "";
        }
    } else {
        document.getElementById('newClientStreetNumber').style.borderColor = '';
        document.getElementById('newClientStreetName').style.borderColor = '';
        document.getElementById('newClientCity').style.borderColor = '';
        document.getElementById('newClientPostalCode').style.borderColor = '';
        document.getElementById('newClientCountry').style.borderColor = '';
    }

    for (let i = 0; i < variables.length; i++) {
        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value ===
            0) {
            Errors = 1;
            variables[i].style.borderColor = "red";
            console.log(variables[i].type);
            if (variables[i].type == 'select-one') {
                variables[i].parentElement.style.borderColor = "red";
            }
        } else {
            if (variables[i].type == 'select-one') {
                variables[i].parentElement.style.borderColor = "";
            }
            variables[i].style.borderColor = "";
        }
    }



    if (document.getElementById('UserType').value == 'LawFirm') {
        if (document.getElementById('AddClerckInformation').checked) {
            if (!ValidateEmail("ClerkEmail")) {
                document.getElementById("ClerkEmail").style.borderColor = "red";
                Errors = 1;
            } else {
                document.getElementById("ClerkEmail").style.borderColor = "";
            }
        }
    }

    if (document.getElementById('Email').value.trim()) {
        if (!ValidateEmail("Email")) {
            document.getElementById("Email").style.borderColor = "red";
            Errors = 1;
        } else {
            document.getElementById("Email").style.borderColor = "";
        }
    } else {
        document.getElementById('Email').style.borderColor = '';
    }

    if (Errors == 0) {
        return true;
    } else {
        return false;
    }
}

function contactType() {

    //alert(UserType);

    // document.getElementById('noheight').style.height = '';
    if (document.getElementById('UserType').value == 'LawFirm') {
        document.getElementById('NewLawerORAgentLabel').innerHTML = 'Lawyer';
        document.getElementById('NewLawyerFirmORBrokerageLabel').innerHTML = 'Law Firm';

        document.getElementById('FirstNameBlock').style.display = 'none';
        document.getElementById('LastNameBlock').style.display = 'none';
        document.getElementById('ClientBlock').style.display = 'none';
        document.getElementById('buffer').style.display = 'none';

        document.getElementById('NewLawyerFirmORBrokerageBlock').style.display = '';
        document.getElementById('NewLawyerFirmORBrokerageBlockStyle').style.display = '';
        document.getElementById('LawyerBlock').style.display = '';
        document.getElementById('LawClerkBlock').style.display = '';

        document.getElementById('NewFirstName').value = "";
        document.getElementById('NewLastName').value = "";
        document.getElementById('NewOfficerName').value = "";
        document.getElementById('NewBusinessName').value = "";


    } else if (document.getElementById('UserType').value == 'Brokerage') {
        document.getElementById('NewLawerORAgentLabel').innerHTML = 'Agent';
        document.getElementById('NewLawyerFirmORBrokerageLabel').innerHTML = 'Brokerage Name';

        document.getElementById('FirstNameBlock').style.display = 'none';
        document.getElementById('LastNameBlock').style.display = 'none';
        document.getElementById('ClientBlock').style.display = 'none';
        document.getElementById('LawClerkBlock').style.display = 'none';
        document.getElementById('buffer').style.display = 'none';


        document.getElementById('NewLawyerFirmORBrokerageBlock').style.display = '';
        document.getElementById('NewLawyerFirmORBrokerageBlockStyle').style.display = '';
        document.getElementById('LawyerBlock').style.display = '';


        document.getElementById('NewFirstName').value = "";
        document.getElementById('NewLastName').value = "";
        document.getElementById('NewOfficerName').value = "";
        document.getElementById('NewBusinessName').value = "";


    } else if (document.getElementById('UserType').value == 'Client') {

        document.getElementById('FirstNameBlock').style.display = '';
        document.getElementById('LastNameBlock').style.display = '';
        document.getElementById('ClientBlock').style.display = '';
        document.getElementById('buffer').style.display = 'none';


        document.getElementById('NewLawyerFirmORBrokerageBlock').style.display = 'none';
        document.getElementById('NewLawyerFirmORBrokerageBlockStyle').style.display = 'none';
        document.getElementById('LawyerBlock').style.display = 'none';
        document.getElementById('LawClerkBlock').style.display = 'none';

        // document.getElementById('').value = "";
        // document.getElementById('').value = "";
        // document.getElementById('').value = "";
        // document.getElementById('').value = "";


    }
}

function ClientType() {


    if (document.getElementById('ClientType').value == 'Individual') {

        document.getElementById('OfficerNameBlock').style.display = 'none';

        document.getElementById('BusinessNameBlock').style.display = 'none';

        document.getElementById('FirstNameBlock').style.display = '';

        document.getElementById('LastNameBlock').style.display = '';

        document.getElementById('NewBusinessName').value = '';
        document.getElementById('NewOfficerName').value = '';
    } else {

        document.getElementById('OfficerNameBlock').style.display = '';

        document.getElementById('BusinessNameBlock').style.display = '';

        document.getElementById('FirstNameBlock').style.display = 'none';

        document.getElementById('LastNameBlock').style.display = 'none';

        document.getElementById('NewFirstName').value = '';
        document.getElementById('NewLastName').value = '';
    }

}

