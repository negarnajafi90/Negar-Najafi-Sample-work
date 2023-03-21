function PersonalDetailsStepSubmit(){

    var Error = 0;
    var Fields = [];

    Fields.push(document.getElementById('Title'), document.getElementById('Firstname'),
    document.getElementById('Lastname'), document.getElementById('DateOfBirth'), 
    document.getElementById('StreetNumber'), document.getElementById('StreetName'), 
    document.getElementById('City'), document.getElementById('PostalCode'),
    document.getElementById('Country'), document.getElementById('Email'),
    document.getElementById('Phone') );

    
    if(!(document.getElementById('Province').value == 'Other')){
        if(!ValidatePostalCode('PostalCode')){
            Error = 1;
        }else{
            document.getElementById('PostalCode').style.borderColor = '';
        }
    }else{
        document.getElementById('PostalCode').style.borderColor = '';
        Fields.push(document.getElementById('OtherProvince'));
    }
    
    Error += CheckEmptyNoColor(Fields);

    if(!ValidateEmail('Email')){
        Error = 1;
    }else{
        document.getElementById('Email').style.borderColor = '';
    }

    if(Error == 0){
        document.getElementById('PersonalDetailsNext').type = 'submit';
    }
    else{
        document.getElementById('PersonalDetailsNext').type = 'button';
    }
}

function PersonalDetailsStep(){
	
	document.getElementById('LoginEmail').value=document.getElementById('Email').value;
	
    var Error = 0;
    var Fields = [];

    Fields.push(document.getElementById('Title'), document.getElementById('Firstname'),
    document.getElementById('Lastname'), document.getElementById('DateOfBirth'), 
    document.getElementById('StreetNumber'), document.getElementById('StreetName'), 
    document.getElementById('City'), document.getElementById('PostalCode'),
    document.getElementById('Country'), document.getElementById('Email'),
    document.getElementById('Phone') );

    if((document.getElementById('Province').value == 'Other')){
        Fields.push(document.getElementById('OtherProvince'));
    }

    Error = CheckEmpty(Fields);

    if(!document.getElementById('DateOfBirth').value){
        document.getElementById('DateOfBirth').parentElement.getElementsByTagName('label')[0].style.borderColor = 'red';
    }else{
        document.getElementById('DateOfBirth').parentElement.getElementsByTagName('label')[0].style.borderColor = '';
    }

    if(ValidatePostalCode('PostalCode')){
        document.getElementById('PostalCode').style.borderColor = '';
    }else{
        document.getElementById('PostalCode').style.borderColor = 'red';
        Error = 1;
    }

    if(ValidateEmail('Email')){
        document.getElementById('Email').style.borderColor = '';
    }else{
        document.getElementById('Email').style.borderColor = 'red';
        Error = 1;
    }

    if(Error == 0){
        document.getElementById('ErrorEmpty').style.display = 'none';
        TabsHandleler(event,'Commissions&Disclosure', 'tabcontent', 'tablinks2', 'Commissions&DisclosureTab'); 
    }
    else{
        document.getElementById('ErrorEmpty').style.display = ''
    }

}


function NextStepComissionSubmit(){
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

    Fields.push(document.getElementById('AnniversaryDate'), document.getElementById('StartDate'),
    document.getElementById('CommissionSplit1'), document.getElementById('CommissionCap1'));

    Error = CheckEmptyNoColor(Fields);

	Fields1.push(document.getElementById('CommissionSplit1'))
	Fields2.push(document.getElementById('CommissionCap1'))

	if(document.getElementById('CommissionSplit2').value||document.getElementById('CommissionCap2').value){
		Fields1.push(document.getElementById('CommissionSplit2'))
		Fields2.push(document.getElementById('CommissionCap2'))

        if(cap2<=cap1){
            Error+=1;
            ErrorCap +=1;
            firstBig = 1;
        }
	}else{
		document.getElementById('CommissionSplit2').parentElement.style.borderColor = '';
		document.getElementById('CommissionCap2').parentElement.style.borderColor = '';
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
		document.getElementById('CommissionSplit3').parentElement.style.borderColor = '';
		document.getElementById('CommissionCap3').parentElement.style.borderColor = '';
	}

    Error += checkEmptyNumbersReg(Fields1, 1);
    Error += checkEmptyNumbersReg(Fields2, 0);

    console.log(checkEmptyNumbersReg(Fields1, 1));
    console.log(Fields1);
    console.log(checkEmptyNumbersReg(Fields2, 0));
    console.log(Fields2);
    
    if(ErrorCap == 0){
        document.getElementById('ErrorCap').style.display = 'none';
    }else{  
        document.getElementById('ErrorCap').style.display = '';
    }

    if(Error == 0){
        document.getElementById('Commissions&DisclosureNext').type = 'submit';
        document.getElementById('Commissions&DisclosureNext').disabled = false;
    }
    else{
        document.getElementById('Commissions&DisclosureNext').type = 'button';
        document.getElementById('Commissions&DisclosureNext').disabled = true;

    }
}


function NextStepComission(){
    var Error = 0;
    var Fields = [];
    let firstBig = 0;
    let secondBig = 0;
    var cap1 = parseFloat(document.getElementById('CommissionCap1').value.replace(/,/g, ''));
    var cap2 = parseFloat(document.getElementById('CommissionCap2').value.replace(/,/g, ''));
    var cap3 = parseFloat(document.getElementById('CommissionCap3').value.replace(/,/g, ''));


    Fields.push(document.getElementById('AnniversaryDate'), document.getElementById('StartDate'),
    document.getElementById('CommissionSplit1'), document.getElementById('CommissionCap1'));

    Error = CheckEmpty(Fields);

    var ifValue = [];

    ifValue.push(document.getElementById('CommissionSplit1'), document.getElementById('CommissionCap1'));

    if(!(document.getElementById('CommissionSplit2').value.trim() == '' || document.getElementById('CommissionCap2').value.trim() == '')){
		ifValue.push(document.getElementById('CommissionSplit2'))
		ifValue.push(document.getElementById('CommissionCap2'))
        if(cap2<=cap1){
            Error+=1;
            ErrorCap +=1;
            firstBig = 1;
        }
	}
    
	if(!(document.getElementById('CommissionSplit3').value.trim() == '' ||document.getElementById('CommissionCap3').value.trim() == '' )){
		ifValue.push(document.getElementById('CommissionSplit3'))
		ifValue.push(document.getElementById('CommissionCap3'))
        if(cap3<=cap2||!document.getElementById('CommissionCap2').value||cap3<=cap1){
            Error+=1;
            ErrorCap +=1;
            secondBig = 1; 
        }
	}

    for(let i = 0; i<ifValue.length;i++){
        str = parseFloat(ifValue[i].value.replace(/\s+/g, ''));
        if(ifValue[i].value){
            if(str < 0||isNaN(str)){
                console.log(1)
                ifValue[i].parentElement.style.borderColor = 'red';
                Error = 1;
            }else{
                ifValue[i].parentElement.style.borderColor = '';
            }
        }else{
            ifValue[i].parentElement.style.borderColor = 'red';
            Error = 1;
        }
    }

    if(firstBig == 1){
        document.getElementById('CommissionCap2').parentElement.style.borderColor = 'red';
    }else{
        document.getElementById('CommissionCap2').parentElement.style.borderColor = '';
    }

    if(secondBig == 1){
        document.getElementById('CommissionCap3').parentElement.style.borderColor = 'red';
    }else{
        document.getElementById('CommissionCap3').parentElement.style.borderColor = '';
    }

    if(!document.getElementById('AnniversaryDate').value){
        document.getElementById('AnniversaryDate').nextElementSibling.style.borderColor = 'red';
    }else{
        document.getElementById('AnniversaryDate').nextElementSibling.style.borderColor = '';
    }

    if(!document.getElementById('StartDate').value){
        document.getElementById('StartDate').nextElementSibling.style.borderColor = 'red';
    }else{
        document.getElementById('StartDate').nextElementSibling.style.borderColor = '';
    }

    if(Error == 0){
        TabsHandleler(event,'Tax&Banking','tabcontent', 'tablinks2', 'Tax&BankingTab'); 
        NextStepTaxSubmit();
        if(document.getElementById('PRECNum').value){
            document.getElementById('sinNumber').className = 'NoMandatory';
        }else{
            document.getElementById('sinNumber').className = 'MandentorySign';
        }
    }
    else{
        
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

function NextStepTaxSubmit(){

    var Fields = [];
    if(!document.getElementById('PRECNum').value){
        Fields.push(document.getElementById('SinNumber'));
    }
    
    var Error = CheckEmptyNoColor(Fields);

    Fields = [];

    if(Error == 0){
        document.getElementById('Tax&BankingNext').type = 'submit';
    }
    
    else{
        document.getElementById('Tax&BankingNext').type = 'button';
    }
}







function openDirect(){
    if(document.getElementById('void').style.display === 'none'){
        document.getElementById('void').style.display = '';
    }else{
        document.getElementById('void').style.display = 'none'
        document.getElementById('Bank').style.borderColor = '';
        document.getElementById('Transit').style.borderColor = '';
        document.getElementById('AccountNumber').style.borderColor = '';
        document.getElementById('AccountName').style.borderColor = '';
    }
}

function NextStepTax(){
    var Fields = [];

    if(!document.getElementById('PRECNum').value){
        Fields.push(document.getElementById('SinNumber'));
    }

    if(!(document.getElementById('DirectDeposit').style.display === 'none')){
       Fields.push(document.getElementById('Bank'), document.getElementById('Transit'),
       document.getElementById('AccountNumber'), document.getElementById('AccountName'));
    }

    var Error = CheckEmpty(Fields);
    if(!document.getElementById('PRECNum').value){
        if(!(document.getElementById('SinNumber').value.length == 9)){
            Error = 1;
            document.getElementById('SinNumber').style.borderColor = 'red';
            document.getElementById('ErrorSIN9').style.display = '';
        }else{
            document.getElementById('SinNumber').style.borderColor = '';
            document.getElementById('ErrorSIN9').style.display = 'none';
        }
    }

    Fields = [];

    if(Error == 0){ 
    // document.getElementById('ErrorEmpty3').style.display = 'none';
    TabsHandleler(event,'Access','tabcontent', 'tablinks2', 'AccessTab'); 
    }
    else{
        // document.getElementById('ErrorEmpty3').style.display = ''
    }
}

function CheckEmptyNoColor(arr){
    var isEmpty = 0;

    for(let i = 0; i<arr.length;i++){
        str = arr[i].value.replace(/\s+/g, '')
        if(!str || str ==''){
            isEmpty = 1;
        }
    }
    return isEmpty;
}

function checkEmptyNumbersReg(arr, option){
    var isEmpty = 0; var num;
    for(let i = 0; i<arr.length;i++){
        num = arr[i].value.replace(/,/g, '').replace(/\s+/g, '');
        
        if(!num || num =='' || isNaN(num)||num<0){
            isEmpty = 1;
            arr[i].parentElement.style.borderColor = 'red';
        }else{
            arr[i].parentElement.style.borderColor = '';
        }
        if(option){
            if(num>100){
                isEmpty = 1;
                arr[i].parentElement.style.borderColor = 'red';
            }else{
            }
        }
    }
    return isEmpty;
}

function CheckEmpty(arr){
    var isEmpty = 0;

    for(let i = 0; i<arr.length;i++){
        str = arr[i].value.replace(/\s+/g, '')
        if(!str || str ==''){
            // alert('Empty: ' + arr[i] );
            arr[i].style.borderColor = 'red';
            if(arr[i].type == 'file'){
                arr[i].parentElement.getElementsByTagName('img')[0].style.border = '2px solid red';
            }
            isEmpty = 1;
        }else{
            arr[i].style.borderColor = '';
        };
    }

    return isEmpty;
}

function ValidatePostalCode(id) {
    var b = document.getElementById(id).value;
    var check = 0;
    //regular expression for ca postal code
    var regEx = /[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]/;
    var a = b.replace(/ /g, '').toUpperCase();

    if(regEx.test(a)){
        if(a.length === 6){
            
            check = true;
        }else{
        
        check = false;}
    }
    else{
        
        check = false;
    }
    return check;
}



function ValidateEmail(id) {
	var a = document.getElementById(id);
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if (a.value.match(mailformat)) {
		//console.log("Valid email address!");
		//document.form1.text1.focus();
		return true;
	} else {
		//console.log("You have entered an invalid email address!");
		//document.form1.text1.focus();
		return false;
	}
}

function CheckEmail(email){
    var check;
    if(email == '12345'){
        check = true;
    }else{check = false}
    return check;
}




function ValidatePassword(){
	
    var Error=0;

    Error=isAllPresent('NewPassword', 'ConfirmNewPassword');

    return Error;
}





function ComparePasswords(passOne, passTwo){
    if(passOne ){

    }

    if(passOne == passTwo){
        return true;
        // alert('Great!');
    }else{
        return false;
        // alert('nooooo')
    }
}



function isAllPresent(id, id2) {
    // Regex to check if a string
    // contains uppercase, lowercase
    // special character & numeric value
    var str = document.getElementById(id).value;
    var str2 = document.getElementById(id2).value;
    
    var Error=0;
    
    var Error1=0;
    
    var Error2=0;
    
    var Error3=0;
    
    var Error4=0;
    
    var Error5=0;
    
    var Error6=0;
    
    

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
    // then print No
    
    if (!str || str.length < 8 ) {
    	
        console.log("No");
        
        document.getElementById('opt5').className = "list notCompleted";
        
        Error=1;
        
    //   return;
    }else{
        document.getElementById('opt5').className = "list completed";
        
        Error1=0;
    }

    // Print Yes If the string matches
    // with the Regex
    
    
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
        document.getElementById('opt6').className = "list notCompleted"; Erro6=1;
    }


    
    
    
    if( Error6===1 ||  Error5===1 || Error4==1 || Error3===1 ||  Error2===1 || Error1===1 ){ Error=1; }else{ Error=0; }
    
    
    return Error;
    
  }


// Registration Company profile

function CopyAddress(Unit, StreetNumber, StreetName, Province, PostalCode, City) {
    if(document.getElementById('CopyAddressBox').checked == true){
        document.getElementById(City).readOnly = true;
        document.getElementById(Unit).readOnly = true;
        document.getElementById(StreetNumber).readOnly = true;
        document.getElementById(StreetName).readOnly = true;
        document.getElementById(PostalCode).readOnly = true;
document.getElementById(Province).parentElement.style.pointerEvents = 'none';
}else{
    document.getElementById(City).readOnly = false;
    document.getElementById(Unit).readOnly = false;
    document.getElementById(StreetNumber).readOnly = false;
    document.getElementById(StreetName).readOnly = false;
    document.getElementById(PostalCode).readOnly = false;
    document.getElementById(Province).parentElement.style.pointerEvents = '';
}
    document.getElementById(City).value = document.getElementById("CompanyCity").value.trim();
    document.getElementById(Unit).value = document.getElementById("CompanyUnitNumber").value.trim();
    document.getElementById(StreetNumber).value = document.getElementById("CompanyStreetNumber").value.trim();
    document.getElementById(StreetName).value = document.getElementById("CompanyStreetName").value.trim();
    document.getElementById(PostalCode).value = document.getElementById("CompanyPostalcode").value.trim();
    document.getElementById(Province).value = document.getElementById("CompanyProvince").value.trim();
    setProvinceCopy(Province);
}

function setProvinceCopy(id) {
    var mydiv = document.getElementById(id).parentElement;
    var tt = mydiv.getElementsByClassName('select-selected')[0];
    tt.innerHTML = document.getElementById("CompanyProvince").value;
}

function postalCorrect(id) {
    var b = document.getElementById(id).value;
    var a = b.replace(/ /g, '').toUpperCase();
    var res = a.slice(0, 3) + " " + a.slice(3);
    document.getElementById(id).value = res;
    if (ValidatePostalCode(id)) {
        document.getElementById(id).style.borderColor = "lightgrey";
    } else {
        document.getElementById(id).style.borderColor = "red";
    }

}

function emailCorrect(id) {
	if (ValidateEmail(id)) {
		document.getElementById(id).style.borderColor = "lightgrey";
	} else {
		document.getElementById(id).style.borderColor = "red";
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

function CorporateDetailsCheckSubmit(){
    var Fields = [];
    var Error = 0;

    Fields.push(document.getElementById('CompanyBusinessName'), document.getElementById('CompanyFiscalyearend'), 
    document.getElementById('CompanyStreetNumber'), document.getElementById('CompanyStreetName'), 
    document.getElementById('CompanyCity'), document.getElementById('CompanyPostalcode'),
    document.getElementById('CompanyEmail'), document.getElementById('CompanyPhone'));

    Error = CheckEmptyNoColor(Fields);
    
    if(!ValidatePostalCode('CompanyPostalcode')){
        Error = 1;
        // document.getElementById('CompanyPostalcode').style.borderColor = '';
    }else{
        // document.getElementById('CompanyPostalcode').style.borderColor = 'red';
       
    }

    if (!ValidateEmail("CompanyEmail")) {
        // document.getElementById("CompanyEmail").style.borderColor = "red";
        Error = 1;
    } else {
        // document.getElementById("CompanyEmail").style.borderColor = "lightgrey";
    }

    if(Error == 0){
        document.getElementById('Nextbutton1').type = 'submit';
    }
    else{
        document.getElementById('Nextbutton1').type = 'button';
    }
}


function CorporateDetailsStep(){
    var Fields = [];
    var Error = 0;

    Fields.push(document.getElementById('CompanyBusinessName'), document.getElementById('CompanyFiscalyearend'), 
    document.getElementById('CompanyStreetNumber'), document.getElementById('CompanyStreetName'), 
    document.getElementById('CompanyCity'), document.getElementById('CompanyPostalcode'),
    document.getElementById('CompanyEmail'), document.getElementById('CompanyPhone'));

    Error = CheckEmpty(Fields);

    if(document.getElementById('CompanyLogo').value == ''){
        document.getElementById('ErrorEmptyLogo').style.display='';
        Error=1;
    }else{
        document.getElementById('ErrorEmptyLogo').style.display='none';
    }

    if(!document.getElementById('CompanyFiscalyearend').value){
        document.getElementById('CompanyFiscalyearend').nextElementSibling.style.borderColor = 'red';
        document.getElementById('CompanyFiscalyearend').nextElementSibling.nextElementSibling.style.borderColor = 'red';
    }else{
        document.getElementById('CompanyFiscalyearend').nextElementSibling.style.borderColor = '';
        document.getElementById('CompanyFiscalyearend').nextElementSibling.nextElementSibling.style.borderColor = '';
    }

    if(ValidatePostalCode('CompanyPostalcode')){
        document.getElementById('CompanyPostalcode').style.borderColor = '';
    }else{
        document.getElementById('CompanyPostalcode').style.borderColor = 'red';
        Error = 1;
    }

    if (!ValidateEmail("CompanyEmail")) {
        document.getElementById("CompanyEmail").style.borderColor = "red";
        Error = 1;
    } else {
        document.getElementById("CompanyEmail").style.borderColor = "lightgrey";
    }

    if(Error == 0){
        document.getElementById('Nextbutton1').type = 'submit';
        document.getElementById('ErrorEmpty').style.display = 'none';
        // phoneNumberFormatter('PrimaryBrokerPhone');
        TabsHandleler(event,'BrokerofRecord', 'tabcontent2', 'tablinks2', 'BrokerofRecordTab');
    }
    else{
        document.getElementById('ErrorEmpty').style.display = '';
        document.getElementById('Nextbutton1').type = 'button';
    }

}

function BrokerOfRecordStepSubmit(){
    var Fields = [];
    var Error = 0;

    Fields.push(document.getElementById('PrimaryBrokerFirstName'), document.getElementById('PrimaryBrokerLastName'), 
    document.getElementById('PrimaryBrokerStreetNumber'), document.getElementById('PrimaryBrokerStreetName'), 
    document.getElementById('PrimaryBrokerCity'), document.getElementById('PrimaryBrokerPostalcode'), 
    document.getElementById('PrimaryBrokerEmail'), document.getElementById('PrimaryBrokerPhone') );

    Error = CheckEmptyNoColor(Fields);

    if(!ValidatePostalCode('PrimaryBrokerPostalcode')){
        Error = 1;
    }

    if(!ValidateEmail('PrimaryBrokerEmail')){
        Error = 1;
    }

    if(Error == 0){
        document.getElementById('Nextbutton2').type = 'submit';
    }
    else{
        document.getElementById('Nextbutton2').type = 'button';
    }


}

function BrokerOfRecordStep(){
    var Fields = [];
    var Error = 0;

    Fields.push(document.getElementById('PrimaryBrokerFirstName'), document.getElementById('PrimaryBrokerLastName'), 
    document.getElementById('PrimaryBrokerStreetNumber'), document.getElementById('PrimaryBrokerStreetName'), 
    document.getElementById('PrimaryBrokerCity'), document.getElementById('PrimaryBrokerPostalcode'), 
    document.getElementById('PrimaryBrokerEmail'), document.getElementById('PrimaryBrokerPhone') );

    Error = CheckEmpty(Fields);

    if(ValidatePostalCode('PrimaryBrokerPostalcode')){
        document.getElementById('PrimaryBrokerPostalcode').style.borderColor = '';
    }else{
        document.getElementById('PrimaryBrokerPostalcode').style.borderColor = 'red';
        Error = 1;
    }

    if(ValidateEmail('PrimaryBrokerEmail')){
        document.getElementById('PrimaryBrokerEmail').style.borderColor = '';
    }else{
        document.getElementById('PrimaryBrokerEmail').style.borderColor = 'red';
        Error = 1;
    }

    if(Error == 0){
        document.getElementById('Nextbutton2').type = 'submit';
        document.getElementById('ErrorEmpty2').style.display = 'none';
        TabsHandleler(event,'Tax&Banking','tabcontent2', 'tablinks2', 'Tax&BankingTab'); 
    }
    else{
        document.getElementById('Nextbutton2').type = 'button';
        document.getElementById('ErrorEmpty2').style.display = ''
    }

}; 

function CompanyTaxStepSubmit(){
    var Fields = [];
    var Error = 0;

    Fields.push(document.getElementById('CompanyHSTNumber'), document.getElementById('CompanyHSTNumberRT'),
     document.getElementById('CommissionTrustCompanyBankNumber'), 
    document.getElementById('CommissionTrustCompanyTransitNumber'), document.getElementById('CommissionTrustCompanyAccountNumber'));

    if(!(document.getElementById('SecondRealEstateTrust').style.display == 'none')){
        Fields.push(document.getElementById('RealEstateTrustCompanyAccountName2'), document.getElementById('RealEstateTrustCompanyBankNumberAccountNickNeame2'),
        document.getElementById('RealEstateTrustCompanyBankNumber2'), document.getElementById('RealEstateTrustCompanyTransitNumber2'),
        document.getElementById('RealEstateTrustCompanyAccountNumber2'));
    }

    Error = CheckEmptyNoColor(Fields);

    Fields = [];

    if(Error == 0){
        document.getElementById('Finalized').type = 'submit';
        document.getElementById('CompanyDetailInformationRegistration').target = '';
    }
    else{
        document.getElementById('Finalized').type = 'button';
        document.getElementById('CompanyDetailInformationRegistration').target = 'hiddenFrame';
    }
}

function CompanyTaxStep(){
    var Fields = [];

    Fields.push(document.getElementById('CompanyHSTNumber'), document.getElementById('CompanyHSTNumberRT'),  document.getElementById('CommissionTrustCompanyBankNumber'), 
    document.getElementById('CommissionTrustCompanyTransitNumber'), document.getElementById('CommissionTrustCompanyAccountNumber') );

    if(!(document.getElementById('SecondRealEstateTrust').style.display == 'none')){
        Fields.push(document.getElementById('RealEstateTrustCompanyAccountName2'), document.getElementById('RealEstateTrustCompanyBankNumberAccountNickNeame2'),
        document.getElementById('RealEstateTrustCompanyBankNumber2'), document.getElementById('RealEstateTrustCompanyTransitNumber2'),
        document.getElementById('RealEstateTrustCompanyAccountNumber2'));
    }

    var Error = CheckEmpty(Fields);

    Fields = [];

    if(Error == 0){
        document.getElementById('Finalized').type = 'submit';
        document.getElementById('ErrorEmpty3').style.display = 'none';
    }
    else{
        document.getElementById('Finalized').type = 'button';
        document.getElementById('ErrorEmpty3').style.display = ''
    }

}; 

function checktoSubmit(Password){
    var Error = 0;
    if(!document.getElementById('LoginEmail').value){
        Error = 1;
    }
    

    if(document.getElementById('CurrentPassword').value!==Password && document.getElementById('CurrentPassword').value ){
        Error = 1;
        document.getElementById('CurrentPassword').style.borderColor = 'red';
        document.getElementById('CurrentPasswordErrorEmpty').style.display = '';
        document.getElementById('CurrentIncorrentPassword').style.display = 'block';
    }else{
        document.getElementById('CurrentIncorrentPassword').style.display = '';
        document.getElementById('CurrentPassword').style.borderColor = '';
    }

    if(!document.getElementById('CurrentPassword').value){
        Error = 1;
        document.getElementById('CurrentPasswordErrorEmpty').style.display = 'block';
        document.getElementById('CurrentPassword').style.borderColor = 'red';
    }else{
        document.getElementById('CurrentPasswordErrorEmpty').style.display = '';
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
        document.getElementById('ConfirmNewPasswordNoMatch').style.display = '';
        document.getElementById('ConfirmNewPassword').style.borderColor = 'red';
    }else{
        document.getElementById('ConfirmNewPasswordErrorEmpty').style.display = '';
        document.getElementById('ConfirmNewPassword').style.borderColor = '';
    }

    if(!(document.getElementById('NewPassword').value==document.getElementById('ConfirmNewPassword').value)){

        if(document.getElementById('ConfirmNewPassword').value){
            Error = 1;
            document.getElementById('ConfirmNewPasswordNoMatch').style.display = 'block';
            document.getElementById('ConfirmNewPasswordErrorEmpty').style.display = '';
            document.getElementById('ConfirmNewPassword').style.borderColor = 'red';
        }

    }else if(document.getElementById('NewPassword').value){
        document.getElementById('ConfirmNewPasswordNoMatch').style.display = '';
        document.getElementById('ConfirmNewPassword').style.borderColor = '';
        
    }

    if(!document.getElementById('PersonalInformationConfirmation').checked==true){
        Error = 1;
        document.getElementById('PersonalInformationConfirmation').parentElement.getElementsByTagName('span')[0].style.borderColor = 'red';
    }else{
        document.getElementById('PersonalInformationConfirmation').parentElement.getElementsByTagName('span')[0].style.borderColor = '';
    }
    //alert(Error)
    if(Error==0){
       document.getElementById('BrokerDetailInfo').target = '';
       document.getElementById('AccessFinalize').type = 'submit';
    }else{
       document.getElementById('BrokerDetailInfo').target = 'hiddenFrame';
       document.getElementById('AccessFinalize').type = 'button';
    }
}

function lockComissions(){
    let split1 = document.getElementById('CommissionSplit1');
    let cap1 = document.getElementById('CommissionCap1');
    let split2 = document.getElementById('CommissionSplit2');
    let cap2 = document.getElementById('CommissionCap2');
    let split3 = document.getElementById('CommissionSplit3');
    let cap3 = document.getElementById('CommissionCap3');
    if(split1.value.trim() && cap1.value.trim()){
        split2.disabled = false;
        cap2.disabled = false;
        split2.parentElement.classList.remove('disabled');
        cap2.parentElement.classList.remove('disabled');
    }else{
        split2.disabled = true;
        cap2.disabled = true;
        split2.value = '';
        cap2.value = '';
        split2.parentElement.classList.add('disabled');
        cap2.parentElement.classList.add('disabled');
    }
    if(split2.value.trim() && cap2.value.trim()){
            
        split3.disabled = false;
        cap3.disabled = false;
        split3.parentElement.classList.remove('disabled');
        cap3.parentElement.classList.remove('disabled');
    }else{
        split3.disabled = true;
        cap3.disabled = true;
        split3.value = '';
        cap3.value = '';
        split3.parentElement.classList.add('disabled');
        cap3.parentElement.classList.add('disabled');
    }
}