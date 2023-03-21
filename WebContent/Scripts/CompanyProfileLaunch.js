function SearchTable() {
    var input, filter, table, tr, td, i, txtValue, span;

    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("tableOne");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];

        if (td) {

            // txtValue = td.textContent || td.innerText;
            var a = td.getElementsByTagName('label')[0].innerHTML;

            var b = a.replaceAll('<span class="orange">', '');

            var c = b.replaceAll('</span>', '');

            a = '';
            b = '';

            // td.getElementsByTagName('label')[0].innerHTML = c;

            txtValue = c;

            if (txtValue.toUpperCase().indexOf(filter) > -1) {

                span = c.substring(0, c.toUpperCase().indexOf(filter)) + '<span class="orange">' + c.substring(c
                        .toUpperCase().indexOf(filter), +c.toUpperCase().indexOf(filter) + +filter.length) +
                    '</span>' + c.substring(+c.toUpperCase().indexOf(filter) + +filter.length);

                c = '';

                td.getElementsByTagName('label')[0].innerHTML = span;

                tr[i].style.display = "";

                // span='';
            } else {

                tr[i].style.display = "none";
            }
        }
    }
}

function SortTable(id) {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("tableOne");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            // txtValue = td.textContent || td.innerText;

            // console.log(td.getElementsByTagName('input')[0].value);
            // console.log(td.getElementsByTagName('input')[0].value );

            txtValue = td.getElementsByTagName('input')[0].value
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
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

function TESTpath(id, id2) {

    let url = null;
    let fileObj = document.getElementById(id).files[0];
    if (window.createObjcectURL != undefined) {
        url = window.createOjcectURL(fileObj);
    } else if (window.URL != undefined) {
        url = window.URL.createObjectURL(fileObj);
    } else if (window.webkitURL != undefined) {
        url = window.webkitURL.createObjectURL(fileObj);


    }

    document.getElementById(id2).value = url;

}

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

function checkHST1() {
    let val = document.getElementById('CompanyHSTNumber').value;
    let isnum = /^\d+$/.test(val);
    if (isnum && val.length == 9) {
        return true;
    } else {
        return false;
    }
}

function checkHST2() {
    let val = document.getElementById('CompanyHSTNumberRT').value;
    let isnum = /^\d+$/.test(val);
    if (isnum && val.length == 4) {
        return true;
    } else {
        return false;
    }
}

function validationCP() {
    var variables = [];
    var Errors = 0;
    variables.push(document.getElementById('CompanyBusinessName'), document.getElementById('CompanyFiscalyearend'),
        document.getElementById('CompanyStreetNumber'),
        document.getElementById('CompanyStreetName'), document.getElementById('CompanyCity'),
        document.getElementById('CompanyPostalcode'), document.getElementById('CompanyPhone'),
        document.getElementById('CompanyEmail'));

    for (let i = 0; i < variables.length; i++) {
        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {
            Errors = 1;
            variables[i].style.borderColor = "red";
        } else {
            variables[i].style.borderColor = "lightgrey";
        }
    }

    if (!ValidatePostalCode('CompanyPostalcode')) {
        Errors = 1;
        document.getElementById('CompanyPostalcode').style.borderColor = "red";
    } else {
        document.getElementById('CompanyPostalcode').style.borderColor = "lightgrey";
    }

    if (!ValidateEmail("CompanyEmail")) {
        document.getElementById("CompanyEmail").style.borderColor = "red";
        Errors = 1;
    } else {
        document.getElementById("CompanyEmail").style.borderColor = "lightgrey";
    }
    if (Errors == 0) {
        return true;
    } else {
        return false;
    }
}

function validationBR() {
    return true;
}

function logotype() {
    var type = document.getElementById('Logotype').value;
    if (type == 'wide') {
        document.getElementById('wideId').style.display = '';
        document.getElementById('squareId').style.display = 'none';
    } else if (type == 'square') {
        document.getElementById('wideId').style.display = 'none';
        document.getElementById('squareId').style.display = '';
    }
}

function validationTB() {
    var variables = [];
    var Errors = 0;
    variables.push(document.getElementById('CompanyHSTNumber'), document.getElementById('CompanyHSTNumberRT'),
        document.getElementById('CommissionTrustCompanyBankNumber'), document.getElementById('CommissionTrustCompanyTransitNumber'),
        document.getElementById('CommissionTrustCompanyAccountNumber'));

    for (let i = 0; i < variables.length; i++) {
        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {
            Errors = 1;
            variables[i].style.borderColor = "red";
        } else {
            variables[i].style.borderColor = "lightgrey";
        }
    }

    if (checkHST1()) {
        document.getElementById('CompanyHSTNumber').style.borderColor = "lightgrey";
    } else {
        document.getElementById('CompanyHSTNumber').style.borderColor = "red";
        Errors = 1;
    }

    if (checkHST2()) {
        document.getElementById('CompanyHSTNumberRT').style.borderColor = "lightgrey";
    } else {
        document.getElementById('CompanyHSTNumberRT').style.borderColor = "red";
        Errors = 1;
    }

    if (Errors == 0) {
        document.getElementById('ErrorEmpty2').style.display = 'none';
        return true;
    } else {
        document.getElementById('ErrorEmpty2').style.display = 'block';
        return false;
    }
}

// function validationPD(){
// 	return false;
// }


var myModalSaveClose = document.getElementById("myModalSaveClose");
var spanx = myModalSaveClose.getElementsByClassName("close")[0];
var BtnSaveCP = document.getElementById('SaveButtom1');
var BtnSaveBR = document.getElementById('SaveButtom2');
var BtnSaveTB = document.getElementById('SaveButtom3');
var BtnSavePD = document.getElementById('SaveButtom4');
spanx.onclick = function () {
    myModalSaveClose.style.display = "none";
}

BtnSaveCP.onclick = function (event) {
    if (validationCP()) {
        myModalSaveClose.style.display = "block";
        document.getElementById('ErrorEmpty1').style.display = 'none';
    } else {
        document.getElementById('ErrorEmpty1').style.display = 'block';
    }
    // event.stopPropagation();
}

BtnSaveBR.onclick = function (event) {
    if (validationBR()) {
        myModalSaveClose.style.display = "block";
        document.getElementById().style.display = 'none';
    } else {
        document.getElementById().style.display = 'block';
    }
    event.stopPropagation();
}

BtnSaveTB.onclick = function (event) {
    if (validationTB()) {
        myModalSaveClose.style.display = "block";
        document.getElementById().style.display = 'none';
    } else {
        document.getElementById().style.display = 'block';
    }
    // event.stopPropagation();
}

BtnSavePD.onclick = function (event) {
    if (validationPD()) {
        myModalSaveClose.style.display = "block";
        document.getElementById().style.display = 'none';
    } else {
        document.getElementById().style.display = 'block';
    }
    // event.stopPropagation();
}


var myModalSave = document.getElementById("myModalSave");
var setofBtnSave = document.getElementsByClassName('submitButton')[0];


setofBtnSave.onclick = function (event) {
    myModalSave.style.display = "block";
    myModalSaveClose.style.display = "";
    setTimeout(
        function () {
            document.getElementById('myModalSave').style.marginTop = '20px';
            // myModalSave.style.display = ""; 
        }, 200 /// milliseconds 
    );
    setTimeout(
        function () {
            document.getElementById('myModalSave').style.marginTop = '-45px';
        }, 2000 /// milliseconds 
    );
    setTimeout(
        function () {
            myModalSave.style.display = "";
        }, 2500 /// milliseconds 
    );
    event.stopPropagation();
}


// When the user clicks anywhere outside of the modal, close it
document.onclick = function (event) {
    if (event.target == myModalSaveClose) {
        myModalSaveClose.style.display = "none";
    }
    event.stopPropagation();
}

function checkSecondComTrust() {
    if (document.getElementById('RealEstateTrustCompanyAccountName2').value || document.getElementById('RealEstateTrustCompanyAccountNickName2').value) {
        document.getElementById('SecondRealEstateTrust').style.display = '';
        document.getElementById('PurcharerProcess').style.display = 'none';
    }
}
checkSecondComTrust();

checkNavBar();

forSelects();
TabsHandleler(event, 'CorporateDetails', 'tabcontent2', 'tablinks', 'CorporateDetailsTab');