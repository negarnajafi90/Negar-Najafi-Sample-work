const months = ["Jan", "Feb", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"
];

function checkCurrentPass(){
	
   //alert( document.getElementById('AccessFinalize').type );
	

	
	var Error=0;
	
	//alert(CurrentPassword)
	
	
	
	   //alert( document.getElementById('passwordchange').type );
		  
	   CurrectCurrentPassword=Error;
	   
	   return Error;
	
}
// function FormatNumber(id) {

//     var n = document.getElementById(id).value.replace(/,/g, '');

//     // var x = n.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '');

//     document.getElementById(id).type = 'text';
//     console.log(n)
//     document.getElementById(id).value = (parseFloat(n).toLocaleString(undefined, {
//         minimumFractionDigits: 2
//     }));
//     document.getElementById(id).type = 'number';
// }

function lockComissions(){
    let split1 = document.getElementById('CommissionSplit1');
    let cap1 = document.getElementById('CommissionCap1');
    let split2 = document.getElementById('CommissionSplit2');
    let cap2 = document.getElementById('CommissionCap2');
    let split3 = document.getElementById('CommissionSplit3');
    let cap3 = document.getElementById('CommissionCap3');
    if(split1.value.trim() && cap1.value.trim()){
        split2.readOnly = false;
        cap2.readOnly = false;
        split2.parentElement.classList.remove('disabled');
        cap2.parentElement.classList.remove('disabled');
    }else{
        split2.readOnly = true;
        cap2.readOnly = true;
        split2.value = '';
        cap2.value = '';
        split2.parentElement.classList.add('disabled');
        cap2.parentElement.classList.add('disabled');
    }
    if(split2.value.trim() && cap2.value.trim()){
            
        split3.readOnly = false;
        cap3.readOnly = false;
        split3.parentElement.classList.remove('disabled');
        cap3.parentElement.classList.remove('disabled');
    }else{
        split3.readOnly = true;
        cap3.readOnly = true;
        split3.value = '';
        cap3.value = '';
        split3.parentElement.classList.add('disabled');
        cap3.parentElement.classList.add('disabled');
    }
}

function checkPercent(id, val){
    if (!(isNaN(document.getElementById(id).value) || document.getElementById(id).value.trim() == '' )) {
        if(parseFloat(document.getElementById(id).value) > val){
            var inputNumber = parseFloat(val);
        }else if(parseFloat(document.getElementById(id).value) < 0){
            var inputNumber = '';
        }else{
            var inputNumber = parseFloat(document.getElementById(id).value.replace(/,/g, ''));
        }
    } else {
        var inputNumber = '';
    }
    let addedCommas = inputNumber.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
    document.getElementById(id).value = addedCommas;
}

function FormatNumber(id) {
    if (!(isNaN(document.getElementById(id).value.replace(/,/g, '')) || document.getElementById(id).value.trim() == '')) {
        var inputNumber = parseFloat(document.getElementById(id).value.valueOf().replace(/,/g, ''));
    } else {
        var inputNumber = '';
    }
    let addedCommas = inputNumber.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
    document.getElementById(id).value = addedCommas;
}

function checktoSubmit(Password){
    var Error = 0;
    var CurrentPassword=document.getElementById("CurrentPassword").value;
    document.getElementById('CurrentPassword').style.borderColor = '';
    if(!document.getElementById('CurrentPassword').value){
        Error = 1;
        document.getElementById('CurrentPasswordErrorEmpty').style.display = 'block';
        document.getElementById('CurrentPassword').style.borderColor = 'red';
    }else{
        document.getElementById('CurrentPasswordErrorEmpty').style.display = '';
        document.getElementById('CurrentPassword').style.borderColor = '';
    }

    if(!document.getElementById('NewPassword').value){
        Error = 1;
        document.getElementById('NewPasswordErrorEmpty').style.display = 'block';
        document.getElementById('NewPassword').style.borderColor = 'red';
    }else{
        document.getElementById('NewPasswordErrorEmpty').style.display = '';
        document.getElementById('NewPassword').style.borderColor = '';
        Error += ValidatePassword();
    }

    if(!document.getElementById('ConfirmNewPassword').value){
        Error = 1;
        document.getElementById('ConfirmNewPasswordErrorEmpty').style.display = 'block';
        document.getElementById('ConfirmNewPassword').style.borderColor = 'red';
    }else{
        document.getElementById('ConfirmNewPasswordErrorEmpty').style.display = '';
        document.getElementById('ConfirmNewPassword').style.borderColor = '';
    }

    if(!(document.getElementById('NewPassword').value==document.getElementById('ConfirmNewPassword').value)){
        Error = 1;
        document.getElementById('ConfirmNewPasswordNoMatch').style.display = 'block';
        document.getElementById('ConfirmNewPasswordErrorEmpty').style.display = '';
        document.getElementById('ConfirmNewPassword').style.borderColor = 'red';
    }else{
        if(document.getElementById('NewPassword').value){
        document.getElementById('ConfirmNewPasswordNoMatch').style.display = '';
        document.getElementById('ConfirmNewPassword').style.borderColor = '';
        }
    }

    if( CurrentPassword === Password  && CurrentPassword){
		
		document.getElementById('ErrorEmpty6').style.display="none";
		
		document.getElementById('passwordchange').type = 'submit';  
		
	}else{
		
		Error=1;
	   
		document.getElementById('passwordchange').type = 'button';    
		
		document.getElementById('ErrorEmpty6').style.display="block";
		
	}

    // if(Error==0){
    //    document.getElementById('SaveButton2').type = 'submit';
    // }else{
    //    document.getElementById('SaveButton2').type = 'button';
    // }
    
    return Error
}

function ValidatePassword(){
	
    var Error=0;

    Error=isAllPresent('NewPassword', 'ConfirmNewPassword');

    return Error;
}

function cleasPasswordError(condition){
    if(condition == 1){
        document.getElementById('NewPassword').style.borderColor = '';
        document.getElementById('NewPasswordErrorEmpty').style.display = '';
    }else{
        document.getElementById('ConfirmNewPassword').style.borderColor = '';
        document.getElementById('ConfirmNewPasswordErrorEmpty').style.display = '';
        document.getElementById('ConfirmNewPasswordNoMatch').style.display = '';
    }
}

function isAllPresent(id, id2) {

    var str = document.getElementById(id).value;
    var str2 = document.getElementById(id2).value;
    
    var Error=0;
    var Error1=0;
    var Error2=0;
    var Error3=0;
    var Error4=0;
    var Error5=0;
    var Error6=0;
    
    // Regex 
    var pattern = new RegExp(
      "^(?=.*[a-z]).+$"
    );
    var pattern2 = new RegExp(
      "^(?=.*[A-Z]).+$"
    );
    var pattern3 = new RegExp(
      "^(?=.*\\d).+$"
    );
    var pattern4 = new RegExp(
      "^(?=.*[-+_!@#$%^&*.,?]).+$"
    );

    // If the string is empty
    
    if (!str || str.length < 8 ) {
        document.getElementById('opt5').className = "list notCompleted";
        Error=1;
    }else{
        document.getElementById('opt5').className = "list completed";
        Error1=0;
    }
    // Yes If the string matches with the Regex

    if (pattern.test(str)) {
        document.getElementById('opt2').className = "list completed"; Error2=0;
    }else{
        document.getElementById('opt2').className = "list notCompleted"; Error2=1;
    }

    if(pattern2.test(str)) {
      document.getElementById('opt1').className = "list completed"; Error3=0;
    }else{
        document.getElementById('opt1').className = "list notCompleted"; Error3=1;
    }

    if(pattern3.test(str)){
        document.getElementById('opt3').className = "list completed"; Error4=0;
    }else{
        document.getElementById('opt3').className = "list notCompleted"; Error4=1;
    }

    if(pattern4.test(str)){
        document.getElementById('opt4').className = "list completed"; Error5=0;
    }else{
        document.getElementById('opt4').className = "list notCompleted"; Error5=1;
    }

    if(str === str2){
        document.getElementById('opt6').className = "list completed"; Error6=0;
    }else{       
        document.getElementById('opt6').className = "list notCompleted"; Error6=1;
    }

    if( Error6===1 ||  Error5===1 || Error4==1 || Error3===1 ||  Error2===1 || Error1===1 ){ Error=1; }else{ Error=0; }
    
    return Error;
  }


function checkPrec() {
    var isHere;
    var PREC = document.getElementById('PRECNum').value;
    if (!PREC.replace(/\s/g, '')) {
        isHere = true;
        document.getElementById('SINMandatory').className = 'MandentorySign';
    } else {
        isHere = false;
        document.getElementById('SINMandatory').className = 'NoMandatory';
    }
    return isHere;
}

function SaveCommission(){
    var Error = 0;
    var Fields = [];

    Fields.push(document.getElementById('AnniversaryDate'), document.getElementById('StartDate'),
    document.getElementById('CommissionSplit1'),
    document.getElementById('CommissionCap1'));

    Error = CheckEmpty(Fields);
    
    Error += chackEmptyNumbers(Fields);
    if(Error == 0){
        document.getElementById('Commissions&DisclosureNext').type = 'submit';
    }
    else{
        document.getElementById('Commissions&DisclosureNext').type = 'button';
    }
}

var myModalSave = document.getElementById("myModalSave");
var btnsavePersonal = document.getElementById('SaveButton1');
var btnsaveCommissions = document.getElementById('SaveButton2');
var btnsaveBank = document.getElementById('SaveButton3');
var btnsaveAudit = document.getElementById('SaveButton4');

var myModalSaveClose = document.getElementById("myModalSaveClose");
var spanx = myModalSaveClose.getElementsByClassName("close")[0];
var accept = myModalSaveClose.getElementsByClassName("submitButton")[0];
// var BtnSaveCP = document.getElementById('SaveButtom1');
// var BtnSaveBR = document.getElementById('SaveButtom2');
// var BtnSaveTB= document.getElementById('SaveButtom3');
// var BtnSavePD = document.getElementById('SaveButtom4');
spanx.onclick = function () {
	myModalSaveClose.style.display = "none";
}
accept.onclick = function () {
    createNewTab();
    SaveAlert();
	myModalSaveClose.style.display = "none";
}


btnsavePersonal.onclick = function (event) {
    if (!CheckPersonal()) {
        // savePreview();
        myModalSaveClose.style.display = "block";
        document.getElementById('ErrorEmpty1').style.display = 'none';
    } else {
        document.getElementById('ErrorEmpty1').style.display = '';
    }
}
btnsaveCommissions.onclick = function (event) {

    if (!CheckComissions()) {
        // savePreview();
        myModalSaveClose.style.display = "block";
        document.getElementById('ErrorEmpty2').style.display = 'none';
    } else {
        document.getElementById('ErrorEmpty2').style.display = '';
    }
}
btnsaveBank.onclick = function (event) {
    if (CheckBank()) {
        // savePreview();
        myModalSaveClose.style.display = "block";
        document.getElementById('ErrorEmpty3').style.display = 'none';
    } else {
        document.getElementById('ErrorEmpty3').style.display = '';
    }
}
btnsaveAudit.onclick = function (event) {
    if (1) {
        myModalSaveClose.style.display = "block";
        // savePreview();
        document.getElementById('ErrorEmpty4').style.display = 'none';
    } else {
        document.getElementById('ErrorEmpty4').style.display = '';
    }
}

document.onclick = function (event) {
    if (event.target == myModalSave) {
        myModalSave.style.display = "none";
    }
    event.stopPropagation();
}

function CheckPersonal() {
    var variables = [];
    var Errors = 0;

    variables.push(document.getElementById("Title"), document.getElementById("Firstname"),
        document.getElementById("Lastname"), document.getElementById("DateOfBirth"),
        document.getElementById("StreetNumber"), document.getElementById("StreetName"),
        document.getElementById("City"), document.getElementById("PostalCode"),
        document.getElementById("Country"), document.getElementById("Email"),
        document.getElementById("Phone"));

    if(document.getElementById('Province').value == 'Other'){
        variables.push(document.getElementById("OtherProvince"));
    }

    for (let i = 0; i < variables.length; i++) {
        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value ===
            0) {
            Errors = 1;
            variables[i].style.borderColor = "red";
        } else {
            variables[i].style.borderColor = "";
        }

        if (!ValidateEmail("Email")) {
            document.getElementById("Email").style.borderColor = "red";
            Errors = 1;
        } else {
            document.getElementById("Email").style.borderColor = "lightgrey";
        }
    }
    return Errors;
}

function ifBOR() {
    var BOR = 1;
    if (BOR) {
        document.getElementById('splitForBor').className = 'MandentorySign';
        document.getElementById('capForBor').className = 'MandentorySign';
        document.getElementById('date1ForBor').className = 'MandentorySign';
        document.getElementById('date2ForBor').className = 'MandentorySign';

        document.getElementById('AnniversaryDate').disabled = false;
        document.getElementById('StartDate').disabled = false;

        document.getElementById('CommissionSplit1').disabled = false;
        document.getElementById('CommissionSplit2').disabled = false;
        document.getElementById('CommissionSplit3').disabled = false;
        document.getElementById('CommissionCap1').disabled = false;
        document.getElementById('CommissionCap2').disabled = false;
        document.getElementById('CommissionCap3').disabled = false;

        document.getElementById('SaveButton2').style.display = '';
    } else {
        document.getElementById('splitForBor').className = 'NoMandatory';
        document.getElementById('capForBor').className = 'NoMandatory';
        document.getElementById('date1ForBor').className = 'NoMandatory';
        document.getElementById('date2ForBor').className = 'NoMandatory';

        document.getElementById('AnniversaryDate').disabled = true;
        document.getElementById('StartDate').disabled = true;

        document.getElementById('CommissionSplit1').disabled = true;
        document.getElementById('CommissionSplit2').disabled = true;
        document.getElementById('CommissionSplit3').disabled = true;
        document.getElementById('CommissionCap1').disabled = true;
        document.getElementById('CommissionCap2').disabled = true;
        document.getElementById('CommissionCap3').disabled = true;

        document.getElementById('SaveButton2').style.display = 'none';
    }
}

function CheckComissions() {
    var Error = 0;
    var ErrorCap = 0;
    let firstBig = 0;
    let secondBig = 0;
    var Fields = [];
    var Fields1 = [];
    var Fields2 = [];

    var cap1 = parseFloat(document.getElementById('CommissionCap1').value.replace(/,/g, ''));
    var cap2 = parseFloat(document.getElementById('CommissionCap2').value.replace(/,/g, ''));
    var cap3 = parseFloat(document.getElementById('CommissionCap3').value.replace(/,/g, ''));

    // console.log(cap1)
    // console.log(cap2)
    // console.log(cap3)

    Fields.push(document.getElementById('AnniversaryDate'), document.getElementById('StartDate'),
    document.getElementById('CommissionSplit1'), document.getElementById('CommissionCap1'));

    Error = CheckEmpty(Fields);

	Fields1.push(document.getElementById('CommissionSplit1'))
	Fields2.push(document.getElementById('CommissionCap1'))

	if((document.getElementById('CommissionSplit2').value && (document.getElementById('CommissionSplit2').value > 0)) || !(document.getElementById('CommissionCap2').value.trim() === '')){
		Fields1.push(document.getElementById('CommissionSplit2'))
		Fields2.push(document.getElementById('CommissionCap2'))

        if(cap2<=cap1){
            Error+=1;
            ErrorCap +=1;
            firstBig = 1;
        }
	}else{
		document.getElementById('CommissionSplit2').parentElement.style.borderColor = ''
		document.getElementById('CommissionCap2').parentElement.style.borderColor = ''
	}
    
	if(document.getElementById('CommissionSplit3').value||document.getElementById('CommissionCap3').value){
		Fields1.push(document.getElementById('CommissionSplit3'))
		Fields2.push(document.getElementById('CommissionCap3'))

        if(cap3<=cap2||!document.getElementById('CommissionCap2').value||cap3<=cap1){
            Error+=1;
            ErrorCap +=1;
            secondBig = 1; 
        }
	}else{
		document.getElementById('CommissionSplit3').parentElement.style.borderColor = ''
		document.getElementById('CommissionCap3').parentElement.style.borderColor = ''
	}

    Error += chackEmptyNumbers(Fields1, 1);
    Error += chackEmptyNumbers(Fields2, 0);

    if(firstBig == 1){
        document.getElementById('CommissionCap2').parentElement.style.borderColor = 'red';
        document.getElementById('CommissionSplit2').parentElement.style.borderColor = 'red';
    }else{
        if(!chackEmptyNumbers(Fields1, 1)){
            document.getElementById('CommissionCap2').parentElement.style.borderColor = '';
            document.getElementById('CommissionSplit2').parentElement.style.borderColor = '';
        }
        
    }

    if(secondBig == 1){
        document.getElementById('CommissionCap3').parentElement.style.borderColor = 'red';
        document.getElementById('CommissionSplit3').parentElement.style.borderColor = 'red';
    }else{
        if(!chackEmptyNumbers(Fields2, 0)){
            document.getElementById('CommissionCap3').parentElement.style.borderColor = '';
            document.getElementById('CommissionSplit3').parentElement.style.borderColor = '';
        }
       
    }
    
    if(ErrorCap == 0){
        document.getElementById('ErrorCap').style.display = 'none';
    }else{
        document.getElementById('ErrorCap').style.display = '';
    }

    Error +=firstBig;
    Error +=secondBig;
    Error +=ErrorCap;

    // console.log(ErrorCap)
    // console.log(Error)
    // console.log(firstBig)
    // console.log(secondBig)

    return Error;
}

function CheckBank() {
    var variables;
    var Errors = 1;

    if (checkPrec()) {
        variables = document.getElementById("SinNumber");
        if (variables.value === " " || variables.value === null || !variables.value || variables.value === 0) {
            Errors = 0;
            variables.style.borderColor = "red";
        } else {
            variables.style.borderColor = "";
        }
    }

    return Errors;
}

function CheckAccess() {
    var variables = [];
    var Errors = 1;

    variables.push(document.getElementById("LoginEmail"), document.getElementById("CurrentPassword"));

    for (let i = 0; i < variables.length; i++) {
        if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {
            Errors = 1;
            variables[i].style.borderColor = "red";
        } else {
            variables[i].style.borderColor = "";
        }
    }

var Error=isAllPresent('NewPassword', 'ConfirmNewPassword') ;

// alert(Error);

    if(Error == 0){

        document.getElementById('passwordchange').type = 'submit';  	
    }
    else{

        document.getElementById('passwordchange').type = 'button';  	
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



function savePreview(){
}

function SaveAlert() {

    myModalSave.style.display = "block";

    setTimeout(
        function () {
            document.getElementById('myModalSave').style.marginTop = '20px';
        }, 200
    );

    setTimeout(
        function () {
            document.getElementById('myModalSave').style.marginTop = '-45px';
        }, 2000
    );

    setTimeout(
        function () {
            myModalSave.style.display = "";
        }, 2500 /// milliseconds 
    );
}



function uploadCheque(id1, idLabel) {
    
    var file = document.getElementById(id1);
    var label = document.getElementById(idLabel);
    if (file.value) {
        var CurrentDate = new Date().toJSON().slice(0, 10).replace(/-/g, '/');
        var curr = CurrentDate.split("/"); // turn the date into a list format (Split by / if needed)
        var year = curr[0];
        label.innerHTML = 'Uploaded '+ months[curr[1] - 1] + '&nbsp;' + curr[2] + ',&nbsp;' + year; 
        document.getElementsByClassName('chequeDelete')[0].style.display = '';
    }
}

function deleteCheque(id1, idLabel) {

    var file = document.getElementById(id1);
    var label = document.getElementById(idLabel);

    if (file.value) {
            label.innerHTML = 'Not Uploaded';
            file.value = ''; //for IE11, latest Chrome/Firefox/Opera...
            document.getElementsByClassName('chequeDelete')[0].style.display = 'none';
    }

};

function showCheque(fileid){
    var file = document.getElementById(fileid);
    if(file.value){
        var ImgUrl = window.URL.createObjectURL(file.files[0]);
        document.getElementById('chequePicturePreview').src = ImgUrl;
    }else{
        document.getElementById('chequePicturePreview').src = '../ImagesUsed/Cheque.png';
    }
   
}

var modal2 = document.getElementById("myModalChequePreview");
var span2 = modal2.getElementsByClassName("close")[0];
var setofBtn = document.getElementsByClassName('viewCheque');
span2.onclick = function (event) {
    modal2.style.display = "none";
    event.stopPropagation();
}
for (let i = 0; i < setofBtn.length; i++) {
    setofBtn[i].onclick = function (event) {
        var input = event.target.parentNode.parentNode.parentNode.getElementsByClassName('inlineInput')[0].id;
        showCheque(input);
        let value =  event.target.parentNode.parentNode.parentNode.getElementsByClassName('inlineInput')[0].value;
        if(value){
            modal2.style.display = "block";
        }
        event.stopPropagation();
    }
}

document.onclick = function (event) {
    if (event.target == modal2) {
        modal2.style.display = "none";
    } 
    event.stopPropagation();
}

function checkHST(){
    let val = document.getElementById('HSTNumber').value;
    let isnum = /\d{9}[RT]{2}\d{4}/.test(val);
    if(isnum && val.length == 15){
        return true;
    }else{
        return false;
    }
}
// lockComissions();

FormatNumber('CommissionCap1');
FormatNumber('CommissionCap2');
FormatNumber('CommissionCap3');
checkPercent('CommissionSplit1', 100);
checkPercent('CommissionSplit2', 100);
checkPercent('CommissionSplit3', 100);