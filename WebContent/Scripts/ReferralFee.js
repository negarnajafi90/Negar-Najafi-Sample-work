$(function () {
	$('#ReferralDate').datepicker({
		format: "dd M yyyy",
		endDate: '-0d'
	}).on('changeDate', function (e) {
		$(this).datepicker('hide');
		document.getElementById(this.id).style.borderColor =
			"lightgrey";
		document.getElementById(this.id).nextElementSibling.style
			.borderColor = "lightgrey";
	});

});

function docNameFill(fileId){
    if(document.getElementById(fileId).value){
           var fullPath = document.getElementById(fileId).value;
           if (fullPath) {
                  var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
                  var filename = fullPath.substring(startIndex);
           if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
                  filename = filename.substring(1);
           }
                  document.getElementById('EXtraDocumentName1').value = filename;
           }
    }else{
           document.getElementById('EXtraDocumentName1').value = '';
    }
    

    

  
}




function getdocName(){     document.getElementById('FileName').value =  document.getElementById('EXtraDocumentName1').value ; }




function TabsHandleler(evt, tabName, MytabsContent, tablink, tabID) {

	var i, tabcontent, tablinks;

	//The Following line will get the tabs information by their class name we assigned to them on the HTML code 	  

	tabcontent = document.getElementsByClassName(MytabsContent);

	//The following for loop will deactivate all the tabs 	    

	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}

	//The following tablink variable contains the tabs been clicked 	    

	tablinks = document.getElementsByClassName(tablink);

	//The following for loop will activate the tab been clicked 	    

	for (i = 0; i < tablinks.length; i++) {

		tablinks[i].className = tablinks[i].className.replace("active", "");
	} //Close for Loop

	document.getElementById(tabName).style.display = "block";

	//document.getElementById(tabName +"-tab").classList.add("active");

	//evt.currentTarget.className += " active";

	document.getElementById(tabID).classList.add("active");
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepTransaction(gonext) {

	if(document.getElementById('perpanentDeal')){
        if(document.getElementById('perpanentDeal').value == '1'){
			let reftype = document.getElementsByClassName('reftypedisp');
			for(let i = 0; i<reftype.length; i++){
				if(!(document.getElementById('ReferralDealType').value == 'Other')){
					reftype[i].innerHTML = document.getElementById('ReferralDealType').value;
				}
			}
			TabsHandleler(event, 'Parties', 'tabcontent', 'tablinks', 'PartiesTab');
			TabsHandleler(event, 'Client', 'tabcontent1', 'tablinks1', 'ClientTab');
			document.getElementById("ClientProcess").style.display = "none";
		return;
	  }
	}
	var Error = 0;

	var variables = [];

	variables.push(document.getElementById("ReferralDealType"), document.getElementById("ReferralFee"),
		document.getElementById("ReferralSource"), document.getElementById("ReferralDate"),
		document.getElementById("ReferralPropertyType"));

	for (let i = 0; i < variables.length; i++) {


		if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

			Error = 1;

			if (i === 0) {
				document.getElementById("ReferralDealTypeCustom").style.borderColor = "red";
			}

			if (i === 1) {
				document.getElementById("ReferralFee").style.borderColor = "red";
			}

			if (i === 2) {
				document.getElementById("ReferralSourceCustom").style.borderColor = "red";
			}

			if (i === 3) {
				document.getElementById("ReferralDateLabel").style.borderColor = "red";
			}

			if (i === 4) {
				document.getElementById("ReferralPropertyType").parentElement.style.borderColor = "red";
			}

			if (!(document.getElementById("SecondAgentDetailInformation").style.display === "none")) {
				if (i === variables.length - 1) {
					document.getElementById("SecondAgentID").parentElement.style.borderColor = "red";
				}
			}

			variables[i].style.borderColor = "red";

		} else {
			variables[i].style.borderColor = "lightgrey";
			if (i === 0) {
				document.getElementById("ReferralDealTypeCustom").style.borderColor = "lightgrey";
			}
			if (i === 1) {
				document.getElementById("ReferralFeeDiv").style.borderColor = "lightgrey";
			}
			if (i === 2) {
				document.getElementById("ReferralSourceCustom").style.borderColor = "lightgrey";
			}
			if (i === 3) {
				document.getElementById("ReferralDateLabel").style.borderColor = "lightgrey";
			}
			if (i === 4) {
				document.getElementById("ReferralPropertyType").parentElement.style.borderColor = "lightgrey";
			}
			if (!(document.getElementById("SecondAgentDetailInformation").style.display === "none")) {
				if (i === variables.length - 1) {
					document.getElementById("SecondAgentID").parentElement.style.borderColor = "lightgrey";
				}
			}
		}
	}

	if (document.getElementById("ReferralFee").value <= 0) {
		Error = 1;
		document.getElementById("ReferralFee").parentElement.style.borderColor = "red";
	} else {
		document.getElementById("ReferralFee").parentElement.style.borderColor = "lightgrey";
	}

	if (document.getElementById('ReferralDiscloseYES').checked === false && document.getElementById('ReferralDiscloseNo').checked === false) {
		Error = 1;
		document.getElementById('ReferralDiscloseYES').parentElement.getElementsByClassName('checkmark')[0].style.borderColor = 'red';
		document.getElementById('ReferralDiscloseNo').parentElement.getElementsByClassName('checkmark')[0].style.borderColor = 'red';
		// document.getElementById('ReferralDiscloseNO')
	} else {
		document.getElementById('ReferralDiscloseYES').parentElement.getElementsByClassName('checkmark')[0].style.borderColor = '';
		document.getElementById('ReferralDiscloseNo').parentElement.getElementsByClassName('checkmark')[0].style.borderColor = '';
	}

	if (document.getElementById('ReferralDiscloseYES').checked === true) {
		if (document.getElementById('ReferralDisclosureAgreementDocument').files.length || !(document.getElementById('ReferralDisclosureAgreementDocument').style.display == 'none')) {
			document.getElementById('ReferralDisclosureAgreementDocument').parentElement.getElementsByClassName('inlineInput')[0].style.borderColor = '';
		} else {
			Error = 1;
			document.getElementById('ReferralDisclosureAgreementDocument').parentElement.getElementsByClassName('inlineInput')[0].style.borderColor = 'red';
		}
	} else if (document.getElementById('ReferralDiscloseNo').checked === true) {
		if (document.getElementById('ReferralExplanation').value.replace(/\s/g, '')) {
			document.getElementById('ReferralExplanation').style.borderColor = '';
		} else {
			Error = 1;
			document.getElementById('ReferralExplanation').style.borderColor = 'red';
		}
	}

	if (!(document.getElementById("SecondAgentDetailInformation").style.display === "none")) {

		var agentEmpty = document.getElementById("SecondAgentID");

		if (agentEmpty.value === " " || agentEmpty.value === null || !agentEmpty.value || agentEmpty.value === 0) {
			Error = 1;
			document.getElementById("SecondAgentID").parentElement.style.borderColor = "red";
			document.getElementById("ErrorEmptySecondAgent").style.display = "block";
		} else {
			document.getElementById("SecondAgentID").parentElement.style.borderColor = "lightgrey";
			document.getElementById("ErrorEmptySecondAgent").style.display = "none";
		}

		if (document.getElementById("FirstAgentCommissionPercentage").value <= 0 || document.getElementById("FirstAgentCommissionPercentage").value > 99.991) {
			Error = 1;
			document.getElementById("FirstAgentCommissionPercentage").parentElement.style.borderColor = "red";
			document.getElementById("ErrorEmptySecondAgentComission").style.display = "block";
		} else {
			document.getElementById("FirstAgentCommissionPercentage").parentElement.style.borderColor = "lightgrey";
			document.getElementById("ErrorEmptySecondAgentComission").style.display = "none";
		}

		if (document.getElementById("SecondAgentCommissionPercentage").value <= 0 || document.getElementById("SecondAgentCommissionPercentage").value >= 99.991) {
			Error = 1;
			document.getElementById("SecondAgentCommissionPercentage").parentElement.style.borderColor = "red";
			document.getElementById("ErrorEmptySecondAgentComission").style.display = "block";
		} else {
			document.getElementById("SecondAgentCommissionPercentage").parentElement.style.borderColor = "lightgrey";
			document.getElementById("ErrorEmptySecondAgentComission").style.display = "none";
		}
	}

	if (Error === 0) {
		if (gonext) {
			document.getElementById('TransactionDetailsTabIMG').src = "../ImagesUsed/Accept.png";
			document.getElementById('TransactionDetailsTabIMG').classList.add('accepted');

			let reftype = document.getElementsByClassName('reftypedisp');
			for(let i = 0; i<reftype.length; i++){
				if(!(document.getElementById('ReferralDealType').value == 'Other')){
					reftype[i].innerHTML = document.getElementById('ReferralDealType').value;
				}
			}

			TabsHandleler(event, 'Parties', 'tabcontent', 'tablinks', 'PartiesTab');

			TabsHandleler(event, 'Client', 'tabcontent1', 'tablinks1', 'ClientTab');
		}

		document.getElementById("ErrorEmpty1").style.display = "none";
	} else {
		document.getElementById("ErrorEmpty1").style.display = "block";
	}

	window.scrollTo({
		top: 0,
		behavior: 'smooth'
	});
	return Error;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepClient() {
	if(document.getElementById('perpanentDeal')){
        if(document.getElementById('perpanentDeal').value == '1'){
			TabsHandleler(event, 'ReferralSourceContent', 'tabcontent1', 'tablinks1', 'ReferralSourceTab');
			document.getElementById("ClientProcess").style.display = "none";
			return;
		}
	}

	var Error = 0;

	var variables = [];

	if (document.getElementById("ClientType1").value === "Individual") {
		variables.push(document.getElementById("ClientType1"), document.getElementById("ClientFirstName1"), document.getElementById("ClientLastName1"),
			document.getElementById("ClientStreetNumber1"), document.getElementById("ClientStreetName1"),
			document.getElementById("ClientCity1"), document.getElementById("ClientPostalCode1"),
			document.getElementById("ClientCountry1"), document.getElementById("ClientEmail1"),
			document.getElementById("ClientPhone1"));

	} else {
		variables.push(document.getElementById("ClientType1"), document.getElementById("ClientBusinessName1"), document.getElementById("ClientSigningOfficere1"),
			document.getElementById("ClientStreetNumber1"), document.getElementById("ClientStreetName1"),
			document.getElementById("ClientCity1"), document.getElementById("ClientPostalCode1"),
			document.getElementById("ClientCountry1"), document.getElementById("ClientEmail1"),
			document.getElementById("ClientPhone1"));
	}

	if (document.getElementById("ClientProvince1").value == 'Other') {
		variables.push(document.getElementById("ClientOtherProvince1"));
	}

	if (!(document.getElementById("client2").style.display === "none")) {

		if (document.getElementById("ClientType2").value === "Individual") {
			variables.push(document.getElementById("ClientType2"), document.getElementById("ClientFirstName2"), document.getElementById("ClientLastName2"),
				document.getElementById("ClientStreetNumber2"), document.getElementById("ClientStreetName2"),
				document.getElementById("ClientCity2"), document.getElementById("ClientPostalCode2"),
				document.getElementById("ClientCountry2"), document.getElementById("ClientEmail2"),
				document.getElementById("ClientPhone2"));

		} else {
			variables.push(document.getElementById("ClientType2"), document.getElementById("ClientBusinessName2"), document.getElementById("ClientSigningOfficere2"),
				document.getElementById("ClientStreetNumber2"), document.getElementById("ClientStreetName2"),
				document.getElementById("ClientCity2"), document.getElementById("ClientPostalCode2"),
				document.getElementById("ClientCountry2"), document.getElementById("ClientEmail2"),
				document.getElementById("ClientPhone2"));
		}
	}

	for (let i = 0; i < variables.length; i++) {

		if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

			Error += 1

			if (i === 0) {
				document.getElementById("ClientType1Custom").style.borderColor = "red";
			}

			if (!(document.getElementById("client2").style.display === "none")) {
				if (i === 10) {
					document.getElementById("ClientType2Custom").style.borderColor = "red";
				}
			}

			variables[i].style.borderColor = "red";

		} else {

			variables[i].style.borderColor = "lightgrey";

			if (i === 0) {
				document.getElementById("ClientType1Custom").style.borderColor = "lightgrey";
			}

			if (!(document.getElementById("client2").style.display === "none")) {
				if (i === 10) {
					document.getElementById("ClientType2Custom").style.borderColor = "lightgrey";
				}
			}
		}
	}
	if (!(document.getElementById('ClientProvince1').value === "Other")) {
		if (!ValidatePostalCode("ClientPostalCode1")) {
			document.getElementById("ClientPostalCode1").style.borderColor = "red";
			Error = 1;
		} else {
			document.getElementById("ClientPostalCode1").style.borderColor = "lightgrey";
		}
	}


	if (!ValidateEmail("ClientEmail1")) {
		document.getElementById("ClientEmail1").style.borderColor = "red";
		Error = 1;
	} else {
		document.getElementById("ClientEmail1").style.borderColor = "lightgrey";
	}

	if (!(document.getElementById("client2").style.display === "none")) {

		if (!(document.getElementById('ClientProvince2').value === "Other")) {
			if (!ValidatePostalCode("ClientPostalCode2")) {
				document.getElementById("ClientPostalCode2").style.borderColor = "red";
				Error = 1;
			} else {
				document.getElementById("ClientPostalCode2").style.borderColor = "lightgrey";
			}
		}


		if (!ValidateEmail("ClientEmail2")) {
			document.getElementById("ClientEmail2").style.borderColor = "red";
			Error = 1;
		} else {
			document.getElementById("ClientEmail2").style.borderColor = "lightgrey";
		}

	}

	if (Error === 0) {
		TabsHandleler(event, 'ReferralSourceContent', 'tabcontent1', 'tablinks1', 'ReferralSourceTab');
		document.getElementById("ClientProcess").style.display = "none";
		document.getElementById("ErrorEmpty2").style.display = "none"

	} else {
		document.getElementById("ErrorEmpty2").style.display = "block"
	}

	window.scrollTo({
		top: 0,
		behavior: 'smooth'
	});

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function BackStepReferralSource() {

	TabsHandleler(event, 'Client', 'tabcontent1', 'tablinks1', 'ClientTab');

	document.getElementById("ClientProcess").style.display = "";

	//document.getElementById("ReferralSourceProcess").style.display = "none";
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepReferralSource() {
	if(document.getElementById('perpanentDeal')){
        if(document.getElementById('perpanentDeal').value == '1'){
		document.getElementById("PartiesTab").disabled = false;
		TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks', 'InvoiceTab');
		document.getElementById("ClientProcess").style.display = "none";
		InvoiceCreation();
		return;
	  }
	}
	var Error = 0;

	var variables = [];

	if (document.getElementById("ReferralSourceType1").value === "Individual") {
		variables.push(document.getElementById("ReferralSourceType1"), document.getElementById("ReferralSourceFirstName1"), document.getElementById("ReferralSourceLastName1"),
			document.getElementById("ReferralSourceStreetNumber1"), document.getElementById("ReferralSourceStreetName1"),
			document.getElementById("ReferralSourceCity1"), document.getElementById("ReferralSourcePostalCode1"),
			document.getElementById("ReferralSourceCountry1"), document.getElementById("ReferralSourceEmail1"),
			document.getElementById("ReferralSourcePhone1"));

	} else {
		variables.push(document.getElementById("ReferralSourceType1"), document.getElementById("ReferralSourceBusinessName1"), document.getElementById("ReferralSourceSigningOfficere1"),
			document.getElementById("ReferralSourceStreetNumber1"), document.getElementById("ReferralSourceStreetName1"),
			document.getElementById("ReferralSourceCity1"), document.getElementById("ReferralSourcePostalCode1"),
			document.getElementById("ReferralSourceCountry1"), document.getElementById("ReferralSourceEmail1"),
			document.getElementById("ReferralSourcePhone1"));
	}

	for (let i = 0; i < variables.length; i++) {

		if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

			Error += 1

			if (i === 0) {
				document.getElementById("ReferralSourceType1Custom").style.borderColor = "red";
			}

			variables[i].style.borderColor = "red";

		} else {

			variables[i].style.borderColor = "lightgrey";

			if (i === 0) {
				document.getElementById("ReferralSourceType1Custom").style.borderColor = "lightgrey";
			}
		}
	}
	if (!(document.getElementById('ReferralSourceProvince1').value === "Other")) {
		if (!ValidatePostalCode("ReferralSourcePostalCode1")) {
			document.getElementById("ReferralSourcePostalCode1").style.borderColor = "red";
			Error = 1;
		} else {
			document.getElementById("ReferralSourcePostalCode1").style.borderColor = "lightgrey";
		}
	}


	if (!ValidateEmail("ReferralSourceEmail1")) {
		document.getElementById("ReferralSourceEmail1").style.borderColor = "red";
		Error = 1;
	} else {
		document.getElementById("ReferralSourceEmail1").style.borderColor = "lightgrey";
	}


	if (Error === 0) {

		document.getElementById('PartiesTabIMG').src = "../ImagesUsed/Accept.png";
		document.getElementById('PartiesTabIMG').classList.add('accepted');
		document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
		document.getElementById('InvoiceTabIMG').classList.add('accepted');

		document.getElementById("PartiesTab").disabled = false;

		document.getElementById("ErrorEmpty3").style.display = "none";

		TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks', 'InvoiceTab');

		InvoiceCreation();
	} else {
		document.getElementById("ErrorEmpty3").style.display = "block"
	}

	window.scrollTo({
		top: 0,
		behavior: 'smooth'
	});

}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepInvoice( AgentSplit1 , AgentSplit2 ,province ,UserSplit2, UserSplit3, Cap1, Cap2 , Cap3 , Balance ) {


    
	fillHST( province );
	
	var HST1=document.getElementById('BreakdownGrossFeeAmountHSTPercent').value ;
	var HST2=document.getElementById('BreakdownAgent1HSTPercent').value;
	var HST3=document.getElementById('BreakdownAgent2HSTPercent').value;

	document.getElementById("InvoiceTab").disabled = false;

	document.getElementById("ReferralFeeRecordSheetTab").disabled = false;

	if (document.getElementById('AddSecondAgentCheckBox').checked === true) {
		document.getElementById('Allocation2Input').value = parseFloat(document.getElementById('FirstAgentCommissionPercentage').value).toFixed(2) + '%';
		document.getElementById('Allocation3Input').value = parseFloat(document.getElementById('SecondAgentCommissionPercentage').value).toFixed(2) + '%';
		document.getElementById('AddSecondAgentCheckBox').style.display = '';
		document.getElementById('allocation').style.display = '';
		document.getElementById('Allocation1').style.display = '';
		document.getElementById('Allocation2').style.display = '';
		document.getElementById('Allocation3').style.display = '';
		document.getElementById('Allocation4').style.display = '';
	} else {
		document.getElementById('AddSecondAgentCheckBox').style.display = 'none';
		document.getElementById('Allocation2Input').value = parseFloat(100).toFixed(2) + '%';
		document.getElementById('Allocation3Input').value = parseFloat(0).toFixed(2) + '%';
		document.getElementById('allocation').style.display = 'none';
		document.getElementById('Allocation1').style.display = 'none';
		document.getElementById('Allocation2').style.display = 'none';
		document.getElementById('Allocation3').style.display = 'none';
		document.getElementById('Allocation4').style.display = 'none';

	}

	TabsHandleler(event, 'ReferralFeeRecordSheet', 'tabcontent', 'tablinks', 'ReferralFeeRecordSheetTab');

	RecordSheet( AgentSplit1 , AgentSplit2 , HST1 , HST2 , HST3 ,UserSplit2, UserSplit3, Cap1, Cap2 , Cap3 , Balance);

	// This is function for coloring Record sheet section. Call it here to do it before data shows up.

	$(".visible").removeClass("visible");
	$(".newclass").removeClass("newclass");

	var tab1 = document.getElementById("tableOne");
	var tab2 = document.getElementById("tableTwo");

	var tr1 = tab1.getElementsByTagName("tr");
	var tr2 = tab2.getElementsByTagName("tr");

	for (var i = 0, max = tr1.length; i < max; i++) {
		if (!isHidden(tr1[i])) {
			tr1[i].classList.add('visible');
		}
	}

	for (var i = 0, max = tr2.length; i < max; i++) {
		if (!isHidden(tr2[i])) {
			tr2[i].classList.add('visible');
		}
	}

	var res1 = tab1.getElementsByClassName("visible");
	var res2 = tab2.getElementsByClassName("visible");


	for (var j = res1.length - 1; j > -1; j--) {
		if (j % 2 === 1) {
			res1[j].classList.add('newclass');
		}
	}

	for (var j = res2.length - 1; j > -1; j--) {

		if (j % 2 === 1) {
			res2[j].classList.add('newclass');
		}
	}
}




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepInvoiceUpdate( AgentSplit1 , AgentSplit2 ,province, HST1, HST2, HST3 , UserSplit2, UserSplit3, Cap1, Cap2 , Cap3 , Balance , Final ,HST1 , HST2, HST3 ,Payment1 , Payment2 , Payment3 , NetToBrokerage , NetHST , NetTotal , Split1, Split2 ) {

	//fillHST( province );
	
  HST1= document.getElementById('BreakdownGrossFeeAmountHSTPercent').value;
  HST2=document.getElementById('BreakdownAgent1HSTPercent').value;
  HST3= document.getElementById('BreakdownAgent2HSTPercent').value;

	document.getElementById("InvoiceTab").disabled = false;

	document.getElementById("ReferralFeeRecordSheetTab").disabled = false;

	if (document.getElementById('AddSecondAgentCheckBox').checked === true) {
		document.getElementById('Allocation2Input').value = parseFloat(document.getElementById('FirstAgentCommissionPercentage').value).toFixed(2) + '%';
		document.getElementById('Allocation3Input').value = parseFloat(document.getElementById('SecondAgentCommissionPercentage').value).toFixed(2) + '%';
		document.getElementById('AddSecondAgentCheckBox').style.display = '';
		document.getElementById('allocation').style.display = '';
		document.getElementById('Allocation1').style.display = '';
		document.getElementById('Allocation2').style.display = '';
		document.getElementById('Allocation3').style.display = '';
		document.getElementById('Allocation4').style.display = '';
	} else {
		document.getElementById('AddSecondAgentCheckBox').style.display = 'none';
		document.getElementById('Allocation2Input').value = parseFloat(100).toFixed(2) + '%';
		document.getElementById('Allocation3Input').value = parseFloat(0).toFixed(2) + '%';
		document.getElementById('allocation').style.display = 'none';
		document.getElementById('Allocation1').style.display = 'none';
		document.getElementById('Allocation2').style.display = 'none';
		document.getElementById('Allocation3').style.display = 'none';
		document.getElementById('Allocation4').style.display = 'none';

	}

	TabsHandleler(event, 'ReferralFeeRecordSheet', 'tabcontent', 'tablinks', 'ReferralFeeRecordSheetTab');
	
	if (Final=="1"){   FinalRecordSheet( HST1 , HST2, HST3 ,Payment1 , Payment2 , Payment3 , NetToBrokerage , NetHST , NetTotal , Split1, Split2 );  }
	
	else{

	RecordSheet( AgentSplit1 , AgentSplit2 , HST1 , HST2 , HST3 ,UserSplit2, UserSplit3, Cap1, Cap2 , Cap3 , Balance);
	
	}

	// This is function for coloring Record sheet section. Call it here to do it before data shows up.

	$(".visible").removeClass("visible");
	$(".newclass").removeClass("newclass");

	var tab1 = document.getElementById("tableOne");
	var tab2 = document.getElementById("tableTwo");

	var tr1 = tab1.getElementsByTagName("tr");
	var tr2 = tab2.getElementsByTagName("tr");

	document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
	document.getElementById('InvoiceTabIMG').classList.add('accepted');

	for (var i = 0, max = tr1.length; i < max; i++) {
		if (!isHidden(tr1[i])) {
			tr1[i].classList.add('visible');
		}
	}

	for (var i = 0, max = tr2.length; i < max; i++) {
		if (!isHidden(tr2[i])) {
			tr2[i].classList.add('visible');
		}
	}

	var res1 = tab1.getElementsByClassName("visible");
	var res2 = tab2.getElementsByClassName("visible");


	for (var j = res1.length - 1; j > -1; j--) {
		if (j % 2 === 1) {
			res1[j].classList.add('newclass');
		}
	}

	for (var j = res2.length - 1; j > -1; j--) {

		if (j % 2 === 1) {
			res2[j].classList.add('newclass');
		}
	}
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Documents() {

	TabsHandleler(event, 'Documents', 'tabcontent', 'tablinks', 'DocumentsTab');

}

function isHidden(el) {
	var style = window.getComputedStyle(el);
	return ((style.display === 'none') || (style.visibility === 'hidden'))
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepApprasialRecordSheet() {


}




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



function ProvinceCheck( Province ){

	//alert("Province"+" "+Province);

	var HST=0.00;

	if(Province==="AB" || Province==="BC"  || Province==="MB"  || Province==="NWT" || Province==="NU" || Province==="QC" || Province==="SK"|| Province==="YT"){ 

		document.getElementById("HSTAMount").value=parseFloat(5.00).toFixed(2);

	}

	else if(Province==="ON"){ 

		document.getElementById("HSTAMount").value=parseFloat(13.00).toFixed(2);}
	

	else if(Province==="PE" || Province==="NC"  || Province==="NB"  || Province==="NL" ){ 


		document.getElementById("HSTAMount").value = parseFloat(15.00).toFixed(2); }

  else if(Province==="Other" ){ 

    document.getElementById("HSTAMount").value=parseFloat(0.00).toFixed(2);

  }

	HST=parseFloat(document.getElementById("HSTAMount").value).toFixed(2);

	return HST;

}




/////////////////////////////////////////////////////////////////////

function Empty(id) {

	var element = document.getElementById(id);

	var inputs = element.getElementsByTagName('input');

	var test = element.getElementsByTagName('select');

	var selects = element.getElementsByClassName('custom-select');

	for (var index = 0; index < inputs.length; ++index) {
		inputs[index].value = inputs[index].defaultValue;
		inputs[index].style.borderColor = "lightgrey";
	} //Close For Loop

	for (var index = 0; index < selects.length; ++index) {
		selects[index].style.borderColor = "lightgrey";
	} //Close For Loop

  	for (var index = 0; index < test.length; ++index) {
	  test[index].value="";
	  test[index].parentElement.getElementsByClassName('select-selected')[0].innerHTML=test[index].options[0].innerHTML;
	} //Close For Loop
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function RemoveOneParties(PartiesToRemove1, Section1, DeleteButton, AddButton, id1, id2, id3) {

	if (document.getElementById(PartiesToRemove1).checked === true) {

		document.getElementById(Section1).style.display = "none";
		document.getElementById(AddButton).style.display = "";

		var element = document.getElementById(Section1);

		var inputs = element.getElementsByTagName('input');

		for (var index = 0; index < inputs.length; ++index) {
			inputs[index].value = inputs[index].defaultValue;
		}

		document.getElementById(id1).selectedIndex = 0;

		document.getElementById(id2).selectedIndex = 0;

		document.getElementById(id3).selectedIndex = 0;
	}

	if (document.getElementById(Section1).style.display === "none") {

		document.getElementById(DeleteButton).style.display = "none";
	} else {
		document.getElementById(DeleteButton).style.display = "";
	}


	document.getElementById(PartiesToRemove1).checked = false;
}


function RemoveOneParty(item2, AddButton) {

	document.getElementById(item2).style.display = "none";

	Empty(item2);

	if (document.getElementById(item2).style.display === "block") {

		document.getElementById(AddButton).style.visibility = "hidden";
	} else {
		document.getElementById(AddButton).style.visibility = "visible";
	}

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function AddOneParties(Section1, Delete, Add) {

	if (document.getElementById(Section1).style.display === "none") {
		document.getElementById(Section1).style.display = "block";
		document.getElementById(Delete).style.display = "";
	}

	if (document.getElementById(Section1).style.display === "block") {
		document.getElementById(Add).style.display = "none";
	} else {
		document.getElementById(Add).style.display = "";
	}

}

function AddOneParty(Section1, Add) {

	if (document.getElementById(Section1).style.display === "none") {
		document.getElementById(Section1).style.display = "block";
		document.getElementById(Add).style.visibility = "hidden";
	}

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////دزفهخد

function ChecksPartiesType(PartyType, IndividualContent, OtherContent) {

	var Type = document.getElementById(PartyType).value;

	if (Type === "Individual") {
		document.getElementById(OtherContent).style.display = "none";
		document.getElementById(IndividualContent).style.display = "";
		Empty(OtherContent);
		
		
	} else {
		document.getElementById(OtherContent).style.display = "";
		document.getElementById(IndividualContent).style.display = "none";
		Empty(IndividualContent);
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function PartiesForRecordSheet(Name, Company, Address, PhoneNumber, Individual, Unit, StreetName, StreetNumber, Province, City, PostalCode, Phone, Officer, BusinessName, FirstName, LastName, OtherProvince) {


	if (document.getElementById(Individual).style.display === "none") {
		document.getElementById(Name).innerHTML = document.getElementById(Officer).value.trim();
	} else {
		document.getElementById(Name).innerHTML = document.getElementById(FirstName).value.trim() + " " + document.getElementById(LastName).value.trim();
	}

	document.getElementById(Company).innerHTML = document.getElementById(BusinessName).value.trim();

	if (document.getElementById(Province).value == "Other") {
		if (document.getElementById(Unit).value) {
			document.getElementById(Address).innerHTML = document.getElementById(Unit).value.trim() + " - " + document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(OtherProvince).value.trim() + ', ' + document.getElementById(PostalCode).value.trim();
		} else {
			document.getElementById(Address).innerHTML = document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(OtherProvince).value.trim() + ', ' + document.getElementById(PostalCode).value.trim();
		}
	} else {
		if (document.getElementById(Unit).value) {
			document.getElementById(Address).innerHTML = document.getElementById(Unit).value.trim() + " - " + document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(Province).value.trim() + ", " + document.getElementById(PostalCode).value.trim();
		} else {
			document.getElementById(Address).innerHTML = document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(Province).value.trim() + ", " + document.getElementById(PostalCode).value.trim();
		}
	}

	document.getElementById(PhoneNumber).innerHTML = document.getElementById(Phone).value;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function RecordSheet( Split1 , Split2 , HST1 , HST2 , HST3 , UserSplit2, UserSplit3, Cap1, Cap2 , Cap3 , Balance  ) {


  HST1= document.getElementById('BreakdownGrossFeeAmountHSTPercent').value;
  HST2=document.getElementById('BreakdownAgent1HSTPercent').value;
  HST3= document.getElementById('BreakdownAgent2HSTPercent').value;
alert( HST1);

alert( HST2);

alert(HST3);	
    
	document.getElementById("ReferralFeeRecordSheetDate").value = document.getElementById("ReferralDate").value;

	document.getElementById("ReferralFeeRecordSheetSource").value = document.getElementById("ReferralSource").value.replace('-', ' ');

	document.getElementById("ReferralFeeRecordSheetfee").value = "$  " + parseFloat(document.getElementById("ReferralFee").value).toLocaleString(undefined, {
		
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});


	PartiesForRecordSheet("RecordSheetClientName1", "RecordSheetClientCompany1", "RecordSheetClientAddress1", "RecordSheetClientPhone1", "Individusal1", "ClientUnitNumber1", "ClientStreetName1", "ClientStreetNumber1", "ClientProvince1", "ClientCity1", "ClientPostalCode1", "ClientPhone1", "ClientSigningOfficere1", "ClientBusinessName1", "ClientFirstName1", "ClientLastName1", "ClientOtherProvince1");


	if (document.getElementById("client2").style.display === "block" || document.getElementById("client2").style.display === "") {

		document.getElementById("DisplayClient2").style.display = "";

		PartiesForRecordSheet("RecordSheetClientName2", "RecordSheetClientCompany2", "RecordSheetClientAddress2", "RecordSheetClientPhone2", "Individusal2", "ClientUnitNumber2", "ClientStreetName2", "ClientStreetNumber2", "ClientProvince2", "ClientCity2", "ClientPostalCode2", "ClientPhone2", "ClientSigningOfficere2", "ClientBusinessName2", "ClientFirstName2", "ClientLastName2", "ClientOtherProvince2");
	} else {
		document.getElementById("DisplayClient2").style.display = "none";
	}



	PartiesForRecordSheet("RecordSheetReferralSourceName1", "RecordSheetReferralSourceCompany1", "RecordSheetReferralSourceAddress1", "RecordSheetReferralSourcePhone1", "ReferralSourceIndividusal1", "ReferralSourceUnitNumber1", "ReferralSourceStreetName1", "ReferralSourceStreetNumber1", "ReferralSourceProvince1", "ReferralSourceCity1", "ReferralSourcePostalCode1", "ReferralSourcePhone1", "ReferralSourceSigningOfficere1", "ReferralSourceBusinessName1", "ReferralSourceFirstName1", "ReferralSourceLastName1", "ReferralOtherProvince1");


	var GrossFee = parseFloat(document.getElementById("ReferralFee").value.replace(/,/g, '').replace('$', ''));

	//var HST = document.getElementById("HSTAMount").value.replace(/,/g, '').replace('$', '');



	var GrossFeeHST = (GrossFee * parseFloat(HST1) ) / 100;

	var GrossFeeTotal = GrossFeeHST + GrossFee;

	var AgentSplit1;

	var AgentSplit2;

	var Source = document.getElementById("ReferralSource").value;

	var office = parseFloat(document.getElementById("ReferralOfficeLeadAllocatonPercentage").value.replace(/,/g, '').replace('$', ''));

	if (Source === "Agent-lead") {

		var AgentSplit1 =parseFloat(Split1);

		var AgentSplit2 = Split2;
	} else {

		AgentSplit1 = 100 - office;

		AgentSplit2 = 100 - office;

	}

	
	//alert(Split1);
	
	
	//Calculations
	
	
    var Cap=0.00;

    var Split=0.00;
    
    var check=0;
   
    var  BrokerPortion=0.00;
    
    var  MyBroker=0.00;
    
    var  RemainingBalance=0.00;//Cap1-Balance; //This is to check if the 
    
    var  GrossFee1=GrossFee;
    
    var  Agents=0.00;
    
	// alert("Balance"+" "+Balance);
	
	// alert("Cap1"+" "+parseFloat( Cap1.replace(/\,/g,'')) );
	
	// alert("Cap2"+" "+parseFloat( Cap2.replace(/\,/g,'')) );
	
	// alert("Cap3"+" "+parseFloat( Cap3.replace(/\,/g,'')) );
    
	// alert("GrossFee"+" "+GrossFee1);
	
	// alert("Source");
	
	// alert(Source);
	
    if (Source === "Office-lead") {

    	//alert("Office-lead"); 
    	
           Split = (100 - office);
           
           if ( parseFloat( Balance.replace(/\,/g,'') ) < parseFloat( Cap1.replace(/\,/g,'') ) ) {  Cap = parseFloat( Cap1.replace(/\,/g,'') ); check = 1;  } 
          
           else if (  parseFloat(Balance.replace(/\,/g,'') ) >= parseFloat(Cap1.replace(/\,/g,'') ) && parseFloat(Balance.replace(/\,/g,'') ) < parseFloat(Cap2).replace(/\,/g,'')) {  Cap = parseFloat(Cap2.replace(/\,/g,''));  check = 1;  } //Close if  ,   Checking if we have reached second cap 
          
           else if (  parseFloat(Balance.replace(/\,/g,'') ) >= parseFloat(Cap2.replace(/\,/g,'')) && parseFloat(Balance.replace(/\,/g,'')) < parseFloat(Cap3.replace(/\,/g,'')) ) {  Cap =parseFloat( Cap3.replace(/\,/g,'') );  check = 1;   } //Closing else if 
           
           else {   check = 0;   Cap = 0;    } 
           
           
       	//alert("done"); 

    } //Close if Source === "Office-lead"

	
	else{
    
          //Checking if we have reached first cap  

          if( parseFloat(Balance.replace(/\,/g,'')) <  parseFloat(Cap1.replace(/\,/g,'')) ){
	  
                 //alert("Cap1");  
				  Cap=Cap1.replace(/\,/g,'');   Split=parseFloat(Split1.replace(/\,/g,''));    check=1; }//Closing if 

          else if( parseFloat(Balance.replace(/\,/g,''))>=parseFloat(Cap1.replace(/\,/g,'')) && parseFloat(Balance.replace(/\,/g,''))< parseFloat(Cap2.replace(/\,/g,'')) ){

                 //alert("Cap2");    
				 Cap=Cap2.replace(/\,/g,'');   Split=parseFloat(UserSplit2.replace(/\,/g,''));	   check=1;    } //Close if  ,   Checking if we have reached second cap 

         else if( parseFloat(Balance.replace(/\,/g,''))>= parseFloat( Cap2.replace(/\,/g,'') ) && parseFloat(Balance.replace(/\,/g,''))<parseFloat(Cap3.replace(/\,/g,'')) ){
    	
                 //alert("Cap3");    
				 Cap=Cap3.replace(/\,/g,'');   Split=parseFloat( UserSplit3.replace(/\,/g,''));	  check=1; } //Closing else if 
  
    
           else {   //alert("No Cap");   
			check=0;  	 Cap=0;   Split=100; }// Closing else for when there is no other Cap
    
    
	}//none office lead 
    
    // alert("Split"+" "+Split);
    
    // alert("Cap"+" "+Cap);
    
    RemainingBalance= Cap - Balance;
    

    
    //alert("RemainingBalance"+" "+RemainingBalance);

    if(check==1) {

    	    var myCommission=GrossFee1;

    	    MyBroker=(myCommission*(100-Split))/100;
    	    
    	    //alert("MyBroker"+" "+MyBroker);
     
            if(  MyBroker > RemainingBalance ) { 
            	
        	      var mySplit =(100-Split)/100;

                  var Temp=RemainingBalance/(mySplit);  
          
                  var TempCommission=GrossFee1-Temp;
          
                  var newTempCap = 0;
          
                  if( Cap==parseFloat( Cap1.replace(/\,/g,'') ) ) {     if(  parseFloat(Cap2.replace(/\,/g,''))>0) { newTempCap=(100-parseFloat(UserSplit2.replace(/\,/g,'')))/100;   Cap=parseFloat(Cap2.replace(/\,/g,'') );  BrokerPortion=(TempCommission*newTempCap)+RemainingBalance; }
                  
                  else { BrokerPortion=RemainingBalance; }
                  
            
                      }
                  
            
                  else if(Cap==parseFloat(Cap2.replace(/\,/g,'')) ) {   
                	  
                	  if( parseFloat(Cap3.replace(/\,/g,''))> 0) { newTempCap=( 100-parseFloat(UserSplit3.replace(/\,/g,'')) )/100; Cap=parseFloat(Cap3.replace(/\,/g,''));  BrokerPortion=(TempCommission*newTempCap)+RemainingBalance; }

                       else { BrokerPortion=RemainingBalance; }
                  
                  }
                 
                  else { }

        	      }//Closing if  MyBroker > RemainingBalance   
  
          if(  MyBroker <= RemainingBalance) {  
        	  
        	  BrokerPortion=MyBroker; 
        	  
          
          }

	     
	     // RemainingBalance=Cap-Balance;

    }// Close if check==1
    
    
    else {
      
      MyBroker=0;
    	
      BrokerPortion = MyBroker; 
    
      Brokers=MyBroker; 

      //Balance=Balance+BrokerPortion;
     
      RemainingBalance=0;    }

    Agents=(GrossFee1-BrokerPortion);  
    
   var  MySplit=  ( Agents*100 ) / GrossFee ;
   
//    alert("check"+" "+check);
   
//    alert("GrossFee"+" "+GrossFee1);
   
//    alert("BrokerPortion"+" "+BrokerPortion);

//    alert("Agents"+" "+Agents);
   
//    alert("BrokerPortion"+" "+BrokerPortion);
   
//    alert("MySplit"+" "+MySplit);
   
	

	
	
	var FisrtAGentPercentage =MySplit;

	var SecondAgentPercentage =0; //parseFloat(document.getElementById("SecondAgentCommissionPercentage").value.replace(/,/g, '').replace('$', ''));

	var FirstAgentCommission = Agents

	var SecondAgentCommission = (GrossFee1 * SecondAgentPercentage) / 100;

	var FirstAgentNet = Agents;

	var SecondAgentNet = (SecondAgentCommission * AgentSplit2) / 100;

	var FirstAgentNetHST = (Agents *parseFloat( HST2) ) / 100;

	var SecondAgentNetHST = (SecondAgentNet * parseFloat(HST3)) / 100;

	var FirstAgentNetTotal = FirstAgentNetHST + FirstAgentNet;

	var SecondAgentNetTotal = SecondAgentNetHST + SecondAgentNet;

	document.getElementById("BreakdownGrossFeeAmount").value = parseFloat(GrossFee).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

	document.getElementById("BreakdownGrossFeeAmountHST").value = parseFloat(GrossFeeHST).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

	document.getElementById("BreakdownGrossFeeTotal").value = parseFloat(GrossFeeTotal).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});
	
	//alert(	document.getElementById("BreakdownGrossFeeAmount").value);
	
	var Agentname1=document.getElementById("FirstAgentID").value;

	var arrayname=Agentname1.split(" ");

	document.getElementById("BreakdownAgent1Name").value = arrayname[1]+" "+arrayname[2];
	


	document.getElementById("BreakdownAgent1Split").value = parseFloat( MySplit ).toFixed(2) + "%";

	document.getElementById("BreakdownAgent1Amount").value = parseFloat(Agents).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

	document.getElementById("BreakdownAgent1HST").value = parseFloat(FirstAgentNetHST).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

	document.getElementById("BreakdownAgent1Total").value = parseFloat(FirstAgentNetTotal).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});


	if (document.getElementById("AddSecondAgentCheckBox").checked === false) {

		document.getElementById("DisplayBreakdownAgent2").style.display = "none";

	} else {

		document.getElementById("DisplayBreakdownAgent2").style.display = "";

		document.getElementById("BreakdownAgent2Name").value = document.getElementById("SecondAgentID").value;
		

		document.getElementById("BreakdownAgent2Split").value = parseFloat(AgentSplit2).toFixed(2) + "%";

		document.getElementById("BreakdownAgent2Amount").value = parseFloat(SecondAgentNet).toLocaleString(undefined, {
			minimumFractionDigits: 2, maximumFractionDigits: 2
		});

		document.getElementById("BreakdownAgent2HST").value = parseFloat(SecondAgentNetHST).toLocaleString(undefined, {
			minimumFractionDigits: 2, maximumFractionDigits: 2
		});

		document.getElementById("BreakdownAgent2Total").value = parseFloat(SecondAgentNetTotal).toLocaleString(undefined, {
			minimumFractionDigits: 2, maximumFractionDigits: 2
		});
	} //Close else


	var TotalPurNet = 0 + FirstAgentNet;

	var TotalHST = 0 + FirstAgentNetHST;

	var Total = FirstAgentNetTotal + 0;


	var PurBrokerNetAmount = GrossFee - TotalPurNet;

	var BrokerHST = GrossFeeHST - TotalHST;
	
	alert("FirstAgentNetTotal"+" "+FirstAgentNetTotal);
	
    alert("SecondAgentNetTotal"+" "+SecondAgentNetTotal);
		
    alert("TotalHST"+" "+TotalHST);

	var TotalBrokerFee = GrossFeeTotal - Total;

	document.getElementById("BreakdownNetFee").value = parseFloat(PurBrokerNetAmount).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

	document.getElementById("BreakdownNetHST").value = parseFloat(BrokerHST).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

	document.getElementById("BreakdownNetTotal").value = parseFloat(TotalBrokerFee).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});



alert( HST1);

alert( HST2);

alert(HST3);	
	
alert( "BreakdownNetTotal"+" "+document.getElementById("BreakdownNetTotal").value );

alert("BreakdownNetHST"+" "+ document.getElementById("BreakdownNetHST").value );

alert( "BreakdownNetFee"+" "+document.getElementById("BreakdownNetFee").value );

alert( document.getElementById("BreakdownAgent1Split").value );

alert( document.getElementById("BreakdownAgent1Amount").value );

alert( document.getElementById("BreakdownAgent1HST").value );



fillHSTUpdate( document.getElementById('BreakdownGrossFeeAmountHSTPercent').value , document.getElementById('BreakdownAgent1HSTPercent').value ,	  document.getElementById('BreakdownAgent2HSTPercent').value );


}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function    FinalRecordSheet( HST1 , HST2, HST3 ,Payment1 , Payment2 , Payment3 , NetToBrokerage , NetHST , NetTotal , Split1, Split2 ){
	
	
	
	
	document.getElementById("ReferralFeeRecordSheetDate").value = document.getElementById("ReferralDate").value;

	document.getElementById("ReferralFeeRecordSheetSource").value = document.getElementById("ReferralSource").value.replace('-', ' ');

	document.getElementById("ReferralFeeRecordSheetfee").value = "$  " + parseFloat(document.getElementById("ReferralFee").value).toLocaleString(undefined, {
		
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});


	PartiesForRecordSheet("RecordSheetClientName1", "RecordSheetClientCompany1", "RecordSheetClientAddress1", "RecordSheetClientPhone1", "Individusal1", "ClientUnitNumber1", "ClientStreetName1", "ClientStreetNumber1", "ClientProvince1", "ClientCity1", "ClientPostalCode1", "ClientPhone1", "ClientSigningOfficere1", "ClientBusinessName1", "ClientFirstName1", "ClientLastName1", "ClientOtherProvince1");


	if (document.getElementById("client2").style.display === "block" || document.getElementById("client2").style.display === "") {

		document.getElementById("DisplayClient2").style.display = "";

		PartiesForRecordSheet("RecordSheetClientName2", "RecordSheetClientCompany2", "RecordSheetClientAddress2", "RecordSheetClientPhone2", "Individusal2", "ClientUnitNumber2", "ClientStreetName2", "ClientStreetNumber2", "ClientProvince2", "ClientCity2", "ClientPostalCode2", "ClientPhone2", "ClientSigningOfficere2", "ClientBusinessName2", "ClientFirstName2", "ClientLastName2", "ClientOtherProvince2");
	} else {
		document.getElementById("DisplayClient2").style.display = "none";
	}



	PartiesForRecordSheet("RecordSheetReferralSourceName1", "RecordSheetReferralSourceCompany1", "RecordSheetReferralSourceAddress1", "RecordSheetReferralSourcePhone1", "ReferralSourceIndividusal1", "ReferralSourceUnitNumber1", "ReferralSourceStreetName1", "ReferralSourceStreetNumber1", "ReferralSourceProvince1", "ReferralSourceCity1", "ReferralSourcePostalCode1", "ReferralSourcePhone1", "ReferralSourceSigningOfficere1", "ReferralSourceBusinessName1", "ReferralSourceFirstName1", "ReferralSourceLastName1", "ReferralOtherProvince1");


	
	
    var Value1=( parseFloat(Payment1.replace(/\,/g,''))  * parseFloat(HST1.replace(/\,/g,'')) )/100;
	
	var Value2=( parseFloat(Payment2.replace(/\,/g,'')) * parseFloat(HST2.replace(/\,/g,'')) )/100;
	
    var Value3=( parseFloat(Payment3.replace(/\,/g,'')) * parseFloat(HST3.replace(/\,/g,'')) )/100;
    

	//alert(parseFloat(Payment1.replace(/\,/g,'')));
	
	//alert(HST1);
	
	//alert(Value1);
    	
    
    var Total1=Value1+parseFloat(Payment1.replace(/\,/g,'') ) ;
    		
    var Total2=Value2+parseFloat(Payment2.replace(/\,/g,'') );
    		
    var Total3=Value3+parseFloat(Payment3.replace(/\,/g,'') );
    
    
    
    document.getElementById("BreakdownNetFee").value = parseFloat(NetToBrokerage).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});

    document.getElementById("BreakdownNetHST").value = parseFloat(NetHST).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2 });

    document.getElementById("BreakdownNetTotal").value = parseFloat(NetTotal).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
      
      
    document.getElementById("BreakdownGrossFeeAmount").value = parseFloat(Payment1).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2 });

    document.getElementById("BreakdownGrossFeeAmountHST").value = parseFloat(Value1).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2 });

    document.getElementById("BreakdownGrossFeeTotal").value = parseFloat(Total1).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});


    var Agentname1=document.getElementById("FirstAgentID").value;

    var arrayname=Agentname1.split(" ");

    document.getElementById("BreakdownAgent1Name").value = arrayname[1]+" "+arrayname[2];

    document.getElementById("BreakdownAgent1Split").value =parseFloat(Split1).toFixed(2)+ "%";

    document.getElementById("BreakdownAgent1Amount").value = parseFloat(Payment2).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });

    document.getElementById("BreakdownAgent1HST").value = parseFloat(Value2).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });

    document.getElementById("BreakdownAgent1Total").value = parseFloat(Total2).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});

    if (document.getElementById("AddSecondAgentCheckBox").checked === false) {

    	    document.getElementById("DisplayBreakdownAgent2").style.display = "none"; } 
    else {

    	    document.getElementById("DisplayBreakdownAgent2").style.display = "";
    	    
    	    var Agentname1=document.getElementById("SecondAgentID").value;

    	    var arrayname=Agentname1.split(" ");

    	    document.getElementById("BreakdownAgent2Name").value = arrayname[1]+" "+arrayname[2];

    	    //document.getElementById("BreakdownAgent2Name").value = document.getElementById("SecondAgentID").value;

    	    document.getElementById("BreakdownAgent2Split").value = parseFloat(Split2).toFixed(2) + "%";

    	    document.getElementById("BreakdownAgent2Amount").value = parseFloat(Payment3).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2  });

    	    document.getElementById("BreakdownAgent2HST").value = parseFloat(Value3).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});

    	    document.getElementById("BreakdownAgent2Total").value = parseFloat(Total3).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
    	    
    	  } //Close else


	
}






///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function PropertySource() {

	var Source = document.getElementById("ReferralSource").value;

	if (Source === "Office-lead") {
		document.getElementById("ReferralOfficeLeadCommisisonSection").style.display = "";
	} //Close If
	else {

		document.getElementById("ReferralOfficeLeadCommisisonSection").style.display = "none";

		document.getElementById('ReferralOfficeLeadAllocatonPercentage').value = 50;

		document.getElementById('ReferralOfficeLeadAgainstCap').checked = true;

	} //Close If

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function AddSecondAgent() {

	if (document.getElementById("AddSecondAgentCheckBox").checked === true) {

		document.getElementById("SecondAgentDetailInformation").style.display = "";

	} else {

		document.getElementById("SecondAgentDetailInformation").style.display = "none";

		document.getElementById("FirstAgentCommissionPercentage").value = parseFloat(100.00).toFixed(2);

		document.getElementById("SecondAgentCommissionPercentage").value = parseFloat(0.00).toFixed(2);

		document.getElementById("SecondAgentID").selectedIndex = 0;


	}

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function CommissionAllocations() {

	var Agent1Commission = parseFloat(document.getElementById("FirstAgentCommissionPercentage").value);

	document.getElementById("SecondAgentCommissionPercentage").value = parseFloat(100 - Agent1Commission).toFixed(2);
}

function HSTView() {

	if (document.getElementById("HSTViewcheckmark").checked == true) {
		document.getElementById("HSTSection").style.display = "inline";
	} else {
		document.getElementById("HSTSection").style.display = "none";
	}

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function InvoiceCreation() {
	

	const months = ["Jan", "Feb", "March", "April", "May", "June", "July",
		"August", "September", "October", "November", "December"
	];


	var client1;

	if (document.getElementById("Individusal1").style.display === "none") {
		
		client1 = document.getElementById("ClientSigningOfficere1").value;
	} else {
		client1 = document.getElementById("ClientFirstName1").value + " " + document.getElementById("ClientLastName1").value;
	}

	var client2;

	if (document.getElementById("client2").style.display === "none") {
		client2 = "";
	} else {

		if (document.getElementById("Individusal2").style.display === "none") {
			client2 = document.getElementById("ClientSigningOfficere2").value;
		} else {
			client2 = document.getElementById("ClientFirstName2").value + " " + document.getElementById("ClientLastName2").value;
		}

	}

	document.getElementById("InvoiceReferralType").innerHTML = document.getElementById('ReferralDealType').value;

	if (document.getElementById("client2").style.display === "none") {
		document.getElementById("InvoiceClients").innerHTML = client1
	} else {
		document.getElementById("InvoiceClients").innerHTML = client1 + " and " + client2;
	}
	document.getElementById("InvoicePropertyReportDate").innerHTML = document.getElementById("ReferralDate").value;

	var GrossFee = parseFloat(document.getElementById("ReferralFee").value);
	
	var HST = document.getElementById("HSTAMount").value;

	var GrossFeeHST = (GrossFee * HST) / 100;

	var GrossFeeTotal = GrossFeeHST + GrossFee;

	document.getElementById("PropertyFeeInvoice").innerHTML = parseFloat(GrossFee).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

	document.getElementById("PropertyHSTInvoice").innerHTML = parseFloat(GrossFeeHST).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

	document.getElementById("BalanceInvoice").innerHTML = parseFloat(GrossFeeTotal).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

	var ReciverName;

	if (document.getElementById("ReferralSourceIndividusal1").style.display === "none") {
		ReciverName = document.getElementById("ReferralSourceSigningOfficere1").value.trim();
	} else {
		ReciverName = document.getElementById("ReferralSourceFirstName1").value.trim() + " " + document.getElementById("ReferralSourceLastName1").value.trim();
	}

	if (document.getElementById("ReferralSourceIndividusal1").style.display === "none") {
		// ReciverName = document.getElementById("ClientSigningOfficere1").value;
		document.getElementById("InvoiceReciverNameBusiness").style.display = '';
		document.getElementById("InvoiceReciverNameBusiness").innerHTML = document.getElementById("ReferralSourceBusinessName1").value.trim();
	} else {
		document.getElementById("InvoiceReciverNameBusiness").style.display = 'none';
		// ReciverName = document.getElementById("ClientFirstName1").value + " " + document.getElementById("ClientLastName1").value;
	}

	document.getElementById("InvoiceReciverName").innerHTML = ReciverName;


	if (document.getElementById("ReferralSourceUnitNumber1").value === null || !document.getElementById("ReferralSourceUnitNumber1").value) {
		var addressLabel = document.getElementById("ReferralSourceStreetNumber1").value.trim() + "&nbsp;" + document.getElementById("ReferralSourceStreetName1").value.trim();
	} else {
		var addressLabel = document.getElementById("ReferralSourceUnitNumber1").value.trim() + "&nbsp;-&nbsp;" + document.getElementById("ReferralSourceStreetNumber1").value.trim() + "&nbsp;" + document.getElementById("ReferralSourceStreetName1").value.trim();
	}

	document.getElementById("addressFirst").innerHTML = addressLabel;


	// document.getElementById("addressFirst").innerHTML = document.getElementById("ReferralSourceUnitNumber1").value;

	// document.getElementById("InvoiceReciverUnit").innerHTML = document.getElementById("ReferralSourceUnitNumber1").value;

	// document.getElementById("InvoiceReciverStreetNumber").innerHTML = document.getElementById("ReferralSourceStreetNumber1").value;

	// document.getElementById("InvoiceReciverStreetName").innerHTML = document.getElementById("ReferralSourceStreetName1").value;

	if (document.getElementById("ReferralSourceProvince1").value == 'Other') {
		var addressLabel2 = document.getElementById("ReferralSourceCity1").value.trim() + ",&nbsp;" + document.getElementById("ReferralSourcePostalCode1").value.trim() + ",&nbsp;" + document.getElementById("ReferralSourceCountry1").value.trim();
	} else {
		var addressLabel2 = document.getElementById("ReferralSourceCity1").value.trim() + ",&nbsp;" + document.getElementById("ReferralSourceProvince1").value.trim() + ",&nbsp;" + document.getElementById("ReferralSourcePostalCode1").value.trim() + ",&nbsp;" + document.getElementById("ReferralSourceCountry1").value.trim();
	}


	document.getElementById("addressSecond").innerHTML = addressLabel2;

	// document.getElementById("InvoiceReciverCity").innerHTML = document.getElementById("ReferralSourceCity1").value;

	// document.getElementById("InvoiceReciverProvince").innerHTML = document.getElementById("ReferralSourceProvince1").value;

	// document.getElementById("InvoiceReciverPostalCode").innerHTML = document.getElementById("ReferralSourcePostalCode1").value;

	// document.getElementById("InvoiceReciverCountry").innerHTML = document.getElementById("ReferralSourceCountry1").value;

	var CurrentDate = new Date().toJSON().slice(0, 10).replace(/-/g, '/');

	var invoiceDateVariable2 = CurrentDate;

	var res2 = invoiceDateVariable2.split("/"); // turn the date into a list format (Split by / if needed)

	document.getElementById("InvoiceCuttentDate").innerHTML = months[res2[1] - 1] + '&nbsp;' + res2[2] + ',&nbsp;' + res2[0];

	//document.getElementById("InvoiceCuttentDate").value=CurrentDate;  }
	
	
	
	
	document.getElementById("HiddenBalanceInvoice").value=	document.getElementById("BalanceInvoice").innerHTML;parseFloat(GrossFeeTotal).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});
    document.getElementById("HiddenPropertyHSTInvoice").value=parseFloat(GrossFeeHST).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});
	
	
	
	document.getElementById("HiddenInvoiceClients").value=document.getElementById("InvoiceClients").innerHTML ;	
	
	alert(CurrentDate);
	
	document.getElementById("hiddenInvoiceDate").value=CurrentDate ;	
	
		alert(document.getElementById("hiddenInvoiceDate").value);
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function PrintPage(id) {

	var element = document.getElementById(id);

	element.addEventListener("click", PrintPage);

	html2canvas(document.body, {

		onrendered: function (canvas) {

			var img = canvas.toDataURL("image/png");

			var doc = new jsPDF();

			doc.addImage(img, 'JPEG', 0, 0, 150, 100);

			doc.save('test.pdf');
		}

	});
}

function simplePrintTRS(id) {
	// document.getElementById('invoiceButtonSection').style.display = 'none';
	var prtContent = document.getElementById(id);
	var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Appraisal.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/forModals.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/forPrintTRS.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Fonts.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/forDateField.css" rel="stylesheet" type="text/css" />');

	WinPrint.document.write(prtContent.innerHTML);
	WinPrint.document.close();
	// WinPrint.focus();
	WinPrint.onafterprint = function () {
		WinPrint.close();
	}
	setTimeout(function () {
		WinPrint.print();
	}, 200);

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Checkdisclosure(id) {

	document.getElementById('ReferralDiscloseYES').parentElement.getElementsByClassName('checkmark')[0].style.borderColor = '';
	document.getElementById('ReferralDiscloseNo').parentElement.getElementsByClassName('checkmark')[0].style.borderColor = '';

	if (id === "ReferralDiscloseYES") {

		document.getElementById("DisclosureNO").style.display = "none";

		document.getElementById("DisclosureYes").style.display = "";

		document.getElementById("ReferralDiscloseNo").checked = false;

		document.getElementById("ReferralExplanation").value = " ";

	} else {

		document.getElementById("DisclosureYes").style.display = "none";

		document.getElementById("DisclosureNO").style.display = "";

		document.getElementById("ReferralDiscloseYES").checked = false;

		document.getElementById("ReferralDisclosureAgreementDocument").value = null;
	}
}

function formatPhoneNumber(value) {
	// if input value is falsy eg if the user deletes the input, then just return
	if (!value) return value;

	// clean the input for any non-digit values.
	const phoneNumber = value.replace(/[^\d]/g, "");

	// phoneNumberLength is used to know when to apply our formatting for the phone number
	const phoneNumberLength = phoneNumber.length;

	// we need to return the value with no formatting if its less then four digits
	// this is to avoid weird behavior that occurs if you  format the area code to early
	if (phoneNumberLength < 4) return phoneNumber;

	// if phoneNumberLength is greater than 4 and less the 7 we start to return
	// the formatted number
	if (phoneNumberLength < 7) {
		return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(3)}`;
	}

	// finally, if the phoneNumberLength is greater then seven, we add the last
	// bit of formatting and return it.
	return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(
	3,
	6
  )}-${phoneNumber.slice(6, 10)}`;
}

function after(value) {
	if (!value) return value;

	// clean the input for any non-digit values.
	const phoneNumber = value.replace(/[^\d]/g, "");

	// phoneNumberLength is used to know when to apply our formatting for the phone number
	const phoneNumberLength = phoneNumber.length;

	// we need to return the value with no formatting if its less then four digits
	// this is to avoid weird behavior that occurs if you  format the area code to early
	if (phoneNumberLength < 4) return phoneNumber;

	// if phoneNumberLength is greater than 4 and less the 7 we start to return
	// the formatted number
	if (phoneNumberLength < 7) {
		return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(3)}`;
	}

	// finally, if the phoneNumberLength is greater then seven, we add the last
	// bit of formatting and return it.
	return `(${phoneNumber.slice(0, 3)}) ${phoneNumber.slice(
	3,
	6
  )}-${phoneNumber.slice(6, 10)}`;
}

function phoneNumberFormatter(id) {
	const inputField = document.getElementById(id);
	const formattedInputValue = formatPhoneNumber(inputField.value);
	inputField.value = formattedInputValue;
}

function phoneNumberFormatterAfter(id) {
	const inputField = document.getElementById(id);
	const formattedInputValue = after(inputField.value);
	inputField.value = formattedInputValue;
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

function fillHST( Province ) {
	
	
	var HST=ProvinceCheck( Province );

    parseFloat(document.getElementById("HSTAMount").value).toFixed(2);
	document.getElementById('BreakdownGrossFeeAmountHSTPercent').value = HST + '%';
	document.getElementById('BreakdownAgent1HSTPercent').value = HST + '%';
	document.getElementById('BreakdownAgent2HSTPercent').value = HST + '%';

}





function fillHSTUpdate(HST1 ,HST2 ,HST3){
	

	  document.getElementById('BreakdownGrossFeeAmountHSTPercent').value = HST1+ '%';
	  
	  document.getElementById('BreakdownAgent1HSTPercent').value = HST2+ '%';

	  document.getElementById('BreakdownAgent2HSTPercent').value = HST3 + '%';

	}





function editHST() {

	let a = document.getElementById('tableTwo');
	let b = a.getElementsByClassName('withBorder');
	for (let i = 0; i < b.length; i++) {
		b[i].classList.remove("noBorder");
		b[i].readOnly = false;
	}

	document.getElementById('HSTHead1').style.display = '';
	document.getElementById('BreakdownNetHSTPercentTD').style.display = '';
	document.getElementById('BreakdownAgent1HSTPercentTD').style.display = '';
	document.getElementById('BreakdownAgent2HSTPercentTD').style.display = '';
	document.getElementById('EmptyPercent').style.display = '';

	document.getElementById('EditSubmit').style.display = '';
	document.getElementById('EditDiscard').style.display = '';

	document.getElementById('Editbtn').style.display = 'none';

}

function submitHST() {

	

	
	//Add calculations

	let a = document.getElementById('tableTwo');
	let b = a.getElementsByClassName('withBorder');
	for (let i = 0; i < b.length; i++) {
		b[i].classList.add("noBorder");
		b[i].readOnly = true;
	}
	// .forEach(element => element.classList.add("noBorder"));

	document.getElementById('EditSubmit').style.display = 'none';
	document.getElementById('EditDiscard').style.display = 'none';

	document.getElementById('Editbtn').style.display = '';

	//Getting the Current data

		var HST1=document.getElementById('BreakdownGrossFeeAmountHSTPercent').value;
		
		var HST2=document.getElementById('BreakdownAgent1HSTPercent').value;
		
		var HST3=document.getElementById('BreakdownAgent2HSTPercent').value;
		

		
		var amount1=document.getElementById('BreakdownGrossFeeAmount').value;
		
	    var amount2=document.getElementById('BreakdownAgent1Amount').value;
				
		var amount3=0//document.getElementById('BreakdownAgent2Amount').value;
		

		
		amount1=amount1.replace(/\,/g,''); 
		
		amount1=parseFloat(amount1);
		

		amount2=amount2.replace(/\,/g,''); 
		
		amount2=parseFloat(amount2);
		

		//amount3=amount3.replace(/\,/g,''); 
		
		//amount3=parseFloat(amount3);

		var newHST1=( ( parseFloat(amount1) ) * ( parseFloat(HST1) ) )/100;
		
		var newHST2=(parseFloat(amount2)*parseFloat(HST2 ))/100;
			
		var newHST3=0;//(parseFloat(amount3)* parseFloat( HST3) )/100;	


		document.getElementById('BreakdownGrossFeeAmountHST').value=((newHST1).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");

		document.getElementById('BreakdownAgent1HST').value=((newHST2).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		document.getElementById('BreakdownAgent2HST').value=((newHST3).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		var TotalValue1=parseFloat(newHST1)+parseFloat(amount1);
			
		var TotalValue2=parseFloat(newHST2)+parseFloat(amount2);
				
	    var TotalValue3=0;//parseFloat(newHST3)+parseFloat(amount3);
	    
	    document.getElementById('BreakdownGrossFeeTotal').value=((TotalValue1).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    
	    document.getElementById('BreakdownAgent1Total').value=((TotalValue2).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    
	    document.getElementById('BreakdownAgent2Total').value=((TotalValue3).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    
	    ////////////////////////////////////////////////////////////////
	    
	    document.getElementById('BreakdownNetTotal').value=( (TotalValue1-(TotalValue2+TotalValue3)).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    
	    document.getElementById('BreakdownNetHST').value=(( newHST1-(newHST2+newHST3) ).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    
	   alert( ((newHST1).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	   alert( ((newHST2).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",")); 
      alert( ((newHST1-(newHST2+newHST3) ).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}

function discardHST( Province ) {

	//Add clearing

	document.getElementById('HSTHead1').style.display = 'none';
	document.getElementById('BreakdownNetHSTPercentTD').style.display = 'none';
	document.getElementById('BreakdownAgent1HSTPercentTD').style.display = 'none';
	document.getElementById('BreakdownAgent2HSTPercentTD').style.display = 'none';
	document.getElementById('EmptyPercent').style.display = 'none';

	document.getElementById('EditSubmit').style.display = 'none';
	document.getElementById('EditDiscard').style.display = 'none';
	// document.getElementById('EditDelete').style.display = 'none';

	document.getElementById('Editbtn').style.display = '';

	document.getElementById("myModalHST").style.display = 'none';
	
	
    var HST= ProvinceCheck( Province );
    
    //alert(HST);
    
	var HST1=HST;
	
	var HST2=HST;
	
	var HST3=HST;

	var amount1=document.getElementById('BreakdownGrossFeeAmount').value;
	
    var amount2=document.getElementById('BreakdownAgent1Amount').value;
			
	var amount3=0//document.getElementById('BreakdownAgent2Amount').value;
	
	
	amount1=amount1.replace(/\,/g,''); 
	
	amount1=parseFloat(amount1);
	

	amount2=amount2.replace(/\,/g,''); 
	
	amount2=parseFloat(amount2);
	

	//amount3=amount3.replace(/\,/g,''); 
	
	//amount3=parseFloat(amount3);
	
	
	var newHST1=(parseFloat(amount1)* parseFloat(HST1) )/100;
	
	var newHST2=(parseFloat(amount2)*parseFloat(HST2 ))/100;
		
	var newHST3=0//(parseFloat(amount3)* parseFloat( HST3) )/100;	
	
	//alert(newHST1);
	
	document.getElementById('BreakdownGrossFeeAmountHST').value= ( (newHST1).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	document.getElementById('BreakdownAgent1HST').value=( (newHST2).toFixed(2) ) .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	document.getElementById('BreakdownAgent2HST').value=( (newHST3).toFixed(2) ) .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	var TotalValue1= parseFloat(newHST1)+parseFloat(amount1) ;
		
	var TotalValue2= parseFloat(newHST2)+parseFloat(amount2) ;
			
    var TotalValue3=0;//parseFloat(newHST3)+parseFloat(amount3);
    
    document.getElementById('BreakdownGrossFeeTotal').value=( (TotalValue1).toFixed(2) ).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    document.getElementById('BreakdownAgent1Total').value=( (TotalValue2).toFixed(2) ).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    document.getElementById('BreakdownAgent2Total').value=( (TotalValue3).toFixed(2) ).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    

    ////////////////////////////////////////////////////////////////
    
    document.getElementById('BreakdownNetTotal').value=( (TotalValue1-(TotalValue2+TotalValue3)).toFixed(2) ).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    document.getElementById('BreakdownNetHST').value=( ( newHST1-(newHST2+newHST3) ).toFixed(2)  ).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    
	document.getElementById('BreakdownGrossFeeAmountHSTPercent').value = HST + '%';
	
	document.getElementById('BreakdownAgent1HSTPercent').value = HST + '%';
	
	document.getElementById('BreakdownAgent2HSTPercent').value = HST + '%';


}


function openWindowFinalized(id1, id2, event) {
    //console.log(1);
    if (!document.getElementById(id1).classList.contains('inlineButton')) {

        document.getElementById(id1).classList.add('inlineButton');   
        document.getElementById(id2).classList.add('openSaveButton');

    } else {

        document.getElementById(id1).classList.remove('inlineButton');
        document.getElementById(id2).classList.remove('openSaveButton');
    }
    event.stopPropagation();
}



function openWindow(id1, id2, id3, id4, idDiscard, condition, event) {
	// alert(1);
	if (!document.getElementById(id1).classList.contains('inlineButton')) {

		document.getElementById(id1).classList.add('inlineButton');
		document.getElementById(id3).classList.add('inlineButton');

		if (condition) {
			document.getElementById(idDiscard).classList.add('inlineButton');
		} else {
			document.getElementById(id2).classList.add('inlineButton');
		}

		document.getElementById(id4).classList.add('openSaveButton');

	} else {

		document.getElementById(id1).classList.remove('inlineButton');
		document.getElementById(id3).classList.remove('inlineButton');

		if (condition) {
			document.getElementById(idDiscard).classList.remove('inlineButton');
		} else {
			document.getElementById(id2).classList.remove('inlineButton');
		}

		document.getElementById(id4).classList.remove('openSaveButton');

	}
	event.stopPropagation();
}



////////////////////////////////////////////////////////////////////////////////////////////////////

function SetSecondAgentLists(id) {

	//alert("Here"+" "+document.getElementById("SecondAgentID").value);

	var mydiv = document.getElementById(id).parentElement;
	var elements = mydiv.getElementsByClassName('select-items');
	var divselect = elements[0];

	while (divselect.firstChild) {
		//The list is LIVE so it will re-index each call
		divselect.removeChild(divselect.firstChild);
	}


	var select2 = document.getElementById(id); //This is the First sets of agents  

	var lenght = select2.options.length;

	while (lenght--) {
		select2.remove(lenght);
	}



	for (var i = 0; i < agents.length; i++) {

		// alert( IDs[i]+" "+agents[i] );

		if (IDs[i] + " " + agents[i] == document.getElementById("FirstAgentID").value) {
			i++;
		}

		//alert("There");

		var opt2 = agents[i]; //Setting the data for an option

		var el2 = document.createElement("option");

		el2.textContent = opt2;

		el2.value = IDs[i] + " " + opt2;

		select2.appendChild(el2);

		// alert("Adding elemet"+" "+i);

	} //Closing the for loop 

	for (var i = 0; i < agents.length; i++) {

		var a = document.createElement('DIV');
		a.innerHTML = select2.options[i].innerHTML;

		// Adding event listener every time for new div element

		a.addEventListener("click", function (e) {
			/* When an item is clicked, update the original select box,
			and the selected item: */
			var y, i, k, s, h, sl, yl;
			s = this.parentNode.parentNode.getElementsByTagName("select")[0];
			sl = s.length;
			h = this.parentNode.previousSibling;
			for (i = 0; i < sl; i++) {
				if (s.options[i].innerHTML == this.innerHTML) {
					s.selectedIndex = i;
					h.innerHTML = this.innerHTML;
					y = this.parentNode.getElementsByClassName(
						"same-as-selected");
					yl = y.length;
					for (k = 0; k < yl; k++) {
						y[k].removeAttribute("class");
					}
					this.setAttribute("class", "same-as-selected");

					break;
				}
			}
			h.click();
		});


		var tt = mydiv.getElementsByClassName('select-selected')[0];
		tt.innerHTML = '--Please select an option--';

		divselect.appendChild(a);
		//alert("Adding elemet"+" "+i);

	}

}

function simplePrint(id) {
	// document.getElementById('invoiceButtonSection').style.display = 'none';
	var prtContent = document.getElementById(id);
	var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/forPrintInvoice.css" rel="stylesheet" type="text/css" />');

	// if (id == 'MainTRSsection') {
	// 	WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
	// }

	WinPrint.document.write(prtContent.innerHTML);
	WinPrint.document.close();
	// WinPrint.focus();
	// WinPrint.print();
	WinPrint.onafterprint = function () {
		WinPrint.close();
	}

	setTimeout(function () {
		WinPrint.print();
	}, 400);

	// WinPrint.close();
	// document.getElementById('invoiceButtonSection').style.display = '';

}

function simplePrintReferral(id) {
	// document.getElementById('invoiceButtonSection').style.display = 'none';
	var prtContent = document.getElementById(id);
	var WinPrint = window.open('', '', 'left=200,top=0,width=1000,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Appraisal.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Deals.css" rel="stylesheet" type="text/css" />');

	WinPrint.document.write('<link href="../CSS/forPrintInvoice.css" rel="stylesheet" type="text/css" />');


	if (document.getElementById(id).classList.contains('trsPrintSpecial')) {
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/forModals.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/Dashboard.css" rel="stylesheet" type="text/css" />');

	}

	WinPrint.document.write(prtContent.innerHTML);
	WinPrint.document.close();

	WinPrint.onafterprint = function () {
		WinPrint.close();
	}

	setTimeout(function () {
		WinPrint.print();
	}, 400);


}




function completeRecord() {
	if (document.getElementById('ConfirmationRecordSheet').checked == true) {
		// alert(1);
		document.getElementById('ReferralFeeRecordSheetTabIMG').src = "../ImagesUsed/Accept.png";
		document.getElementById('ReferralFeeRecordSheetTabIMG').classList.add('accepted');
		document.getElementById("ConfirmationRecordCheckbox").classList.add("bluecheck");

	} else {
		document.getElementById('ReferralFeeRecordSheetTabIMG').src = "../ImagesUsed/Didnotaccept.png";
		document.getElementById('ReferralFeeRecordSheetTabIMG').classList.remove('accepted');
		document.getElementById("ConfirmationRecordCheckbox").classList.remove("bluecheck");

		// alert(2);
	}
}

function addPercent(id) {

	document.getElementById(id).value = parseFloat(document.getElementById(id).value).toFixed(2) + '%';

	// maxlengthCheckHST(obj);
}

/////////////////////////////////////////////////////////////////////// 


function clearing(id) {
	if (document.getElementById(id).value > 0) {
		document.getElementById(id).parentElement.style.borderColor = "lightgrey";
	} else {
		document.getElementById(id).parentElement.style.borderColor = "red";
	}
}

function limiting(object) {
	object.value = parseFloat(object.value.replace('$','')).toFixed(2);
}

function maxLengthCheck(object) {
	if (object.value >= 100) {
		object.value = parseFloat(99.991).toFixed(2);
	} else if (object.value <= 0) {
		object.value = parseFloat(0.01).toFixed(2);
	}
}

function maxLengthCheck100(object) {
	if (object.value >= 100) {
		object.value = 100;
	} else if (object.value < 0) {
		object.value = 0;
	}
}

function ifProvinceOther(province, country) {

	if (document.getElementById(province).value === "Other") {
		document.getElementById(country).readOnly = false;
	} else {
		document.getElementById(country).readOnly = true;
		document.getElementById(country).value = "Canada";
	}
}

function forSelects() {
	var x, i, j, l, ll, selElmnt, a, b, c;
	/* Look for any elements with the class "custom-select": */
	x = document.getElementsByClassName("custom-select");
	l = x.length;
	for (i = 0; i < l; i++) {
		selElmnt = x[i].getElementsByTagName("select")[0];
		ll = selElmnt.length;
		/* For each element, create a new DIV that will act as the selected item: */
		a = document.createElement("DIV");
		a.setAttribute("class", "select-selected");
		a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
		x[i].appendChild(a);
		/* For each element, create a new DIV that will contain the option list: */
		b = document.createElement("DIV");
		b.setAttribute("class", "select-items select-hide");
		for (j = 1; j < ll; j++) {
			/* For each option in the original select element,
			create a new DIV that will act as an option item: */
			c = document.createElement("DIV");
			c.innerHTML = selElmnt.options[j].innerHTML;
			c.addEventListener("click", function (e) {
				/* When an item is clicked, update the original select box,
				and the selected item: */
				var y, i, k, s, h, sl, yl;
				s = this.parentNode.parentNode.getElementsByTagName("select")[
					0];
				sl = s.length;
				h = this.parentNode.previousSibling;
				for (i = 0; i < sl; i++) {
					if (s.options[i].innerHTML == this.innerHTML) {
						s.selectedIndex = i;
						h.innerHTML = this.innerHTML;
						y = this.parentNode.getElementsByClassName(
							"same-as-selected");
						yl = y.length;
						for (k = 0; k < yl; k++) {
							y[k].removeAttribute("class");
						}
						this.setAttribute("class", "same-as-selected");

						switch (this.parentNode.parentNode.id) {


							case 'ClientType1Custom':
								ChecksPartiesType('ClientType1', 'Individusal1',
									'NotAnIndividusal1');
								break;

							case 'ClientType2Custom':
								ChecksPartiesType('ClientType2', 'Individusal2',
									'NotAnIndividusal2');
								break;

							case 'ReferralSourceType1Custom':
								ChecksPartiesType('ReferralSourceType1',
									'ReferralSourceIndividusal1',
									'ReferralSourceNotAnIndividusal1');
								break;


						}

						break;
					}
					this.parentNode.parentNode.style.borderColor = "lightgrey";
				}
				h.click();
			});
			b.appendChild(c);
		}
		x[i].appendChild(b);
		a.addEventListener("click", function (e) {
			/* When the select box is clicked, close any other select boxes,
			and open/close the current select box: */
			e.stopPropagation();
			closeAllSelect(this);
			this.nextSibling.classList.toggle("select-hide");
			this.classList.toggle("select-arrow-active");

		});
	}
}

function closeAllSelect(elmnt) {
	/* A function that will close all select boxes in the document,
	except the current select box: */
	var x, y, i, xl, yl, arrNo = [];
	x = document.getElementsByClassName("select-items");
	y = document.getElementsByClassName("select-selected");
	xl = x.length;
	yl = y.length;
	for (i = 0; i < yl; i++) {
		if (elmnt == y[i]) {
			arrNo.push(i)
		} else {
			y[i].classList.remove("select-arrow-active");
		}
	}
	for (i = 0; i < xl; i++) {
		if (arrNo.indexOf(i)) {
			x[i].classList.add("select-hide");
		}
	}
}

/* If the user clicks anywhere outside the select box,
then close all select boxes: */
document.addEventListener("click", closeAllSelect);

function maxlengthCheckHST(object) {

	if (object.value > 15) {
		object.value = parseFloat(15.00).toFixed(2);
	} else if (object.value <= 0) {
		object.value = parseFloat(0.00).toFixed(2);
	}

}

function Display(id1, id2) {
	if (document.getElementById(id1).value === 'Other') {
		document.getElementById(id2).style.display = 'flex'
	} else {
		document.getElementById(id2).style.display = 'none';
		Empty(id2);
	}
}

function fileOpened(agentName) {

	var datenow = new Date().toLocaleTimeString([], {
		year: 'numeric',
		month: 'numeric',
		day: 'numeric',
		hour: '2-digit',
		minute: '2-digit'
	});

	var forAuditNote = document.createElement("DIV");
	// forAuditNote.setAttribute("id", id);
	forAuditNote.setAttribute("class", 'fileOpened flexibleContainer');

	document.getElementById('AuditNotes').appendChild(forAuditNote);

	var forIconDiv = document.createElement("DIV");
	forIconDiv.setAttribute("class", 'flexible auditIcon');

	var forAuditBody = document.createElement("DIV");
	forAuditBody.setAttribute("class", 'flexible auditBody');

	forAuditNote.appendChild(forIconDiv);
	forAuditNote.appendChild(forAuditBody);

	var iconSpan = document.createElement("span");
	iconSpan.setAttribute("class", 'logoaudit');
	forIconDiv.appendChild(iconSpan);

	var BodyHeaderLabel = document.createElement("LABEL");
	BodyHeaderLabel.setAttribute("class", 'headline');
	BodyHeaderLabel.innerHTML = 'File created by ' + agentName;

	var BodyDateLabel = document.createElement("LABEL");
	BodyDateLabel.setAttribute("class", 'description');
	BodyDateLabel.innerHTML = datenow;

	var breakelem = document.createElement("br");

	forAuditBody.appendChild(BodyHeaderLabel);
	forAuditBody.appendChild(breakelem);

	forAuditBody.appendChild(BodyDateLabel);
	// forAuditBody.appendChild(breakelem);

	// countTrail++;
	document.getElementById('allNotesInput').value = document.getElementById('AuditNotes').innerHTML;
}

function closeAllWindows() {

	$(".inlineButton").removeClass("inlineButton");

	$(".openSaveButton").removeClass("openSaveButton");

}

function validateSendInvoice() {
	var Error = 0;
	var recepient = 0;

	var arr = document.getElementById('Addressee').getElementsByTagName('input');

	document.getElementById('emptyEmailFields').style.display = 'none';
	for (let i = 0; i < arr.length; i++) {
		if (arr[i].checked) {
			recepient++
		}
	}
	console.log(recepient)
	if (recepient == 0) {
		document.getElementById('emptyAdresseeError').style.display = '';
		Error = 1;
	} else {
		document.getElementById('emptyAdresseeError').style.display = 'none';
	}

	if (document.getElementById('subjectLineEmail').value.trim()) {
		document.getElementById('subjectLineEmail').style.borderColor = '';
	} else {
		document.getElementById('subjectLineEmail').style.borderColor = 'red';
		document.getElementById('emptyEmailFields').style.display = '';
		Error = 1;
	}
	if (document.getElementById('messageEmail').value.trim()) {
		document.getElementById('messageEmail').style.borderColor = '';
	} else {
		document.getElementById('messageEmail').style.borderColor = 'red';
		document.getElementById('emptyEmailFields').style.display = '';
		Error = 1;
	}

	if (Error == 0) {
		document.getElementById('SendEmailInvoice').type = 'submit';
		document.getElementById('comissionEmailed').style.display = '';
		fileEmailed("agentNameHidden");
		document.getElementById('myModalEmail').style.display = '';
		EmailedPopup();
	} else {
		document.getElementById('SendEmailInvoice').type = 'button';
	}

	return Error;
}

function EmailedPopup(){
	document.getElementById('myModalEmailSent').style.display = "block";
	setTimeout(
		function () {
			document.getElementById('myModalEmailSent').style.marginTop = '20px';
			// myModalSave.style.display = ""; 
		}, 200 /// milliseconds 
	);

	setTimeout(
		function () {

			document.getElementById('myModalEmailSent').style.marginTop = '-45px'; 
		}, 2000 /// milliseconds
	);

	setTimeout(
		function () {
		  document.getElementById('myModalEmailSent').style.display = "";
		}, 2500 /// milliseconds
	);
}

function fileEmailed(id) {

	var datenow = new Date().toLocaleTimeString([], {
		year: 'numeric',
		month: 'numeric',
		day: 'numeric',
		hour: '2-digit',
		minute: '2-digit'
	});
	var agentName = document.getElementById(id).value;
	var recepientName = '';

	var elem = document.getElementById('optionalDIV').getElementsByClassName('flexibleContainer')[0].getElementsByClassName('flexibleContainer');
	var elem2 =  document.getElementsByClassName('Addressee')[0].getElementsByClassName('flexibleContainer')[0].getElementsByClassName('flexibleContainer');
	// console.log(elem);
	if(elem2.length>0){
		for(let i = 0; i< elem2.length; i++){
			if(elem2[i].getElementsByClassName('inlineInput')[0].checked){
			recepientName += elem2[i].getElementsByClassName('names')[0].getElementsByTagName('label')[1].innerHTML.trim();
			if(i==elem2.length-1){
				recepientName+=' ';
			}else{
				recepientName+=', ';
			}
			}
		}
	}

	if(elem.length>0){
		for(let i = 0; i< elem.length; i++){
			if(elem2.length>0){
				recepientName = recepientName.trim() + ', ';
			}
			if(elem[i].getElementsByClassName('inlineInput')[0].checked){
				recepientName += elem[i].getElementsByClassName('names')[0].getElementsByTagName('label')[1].innerHTML.trim();
				if(i==elem.length-1){
				recepientName+=' ';
				}else{
				recepientName+=', ';
				}
			}
			// console.log(elem[i]);
		}
	}

	var forAuditNote = document.createElement("DIV");
	forAuditNote.setAttribute("class", 'Emailed flexibleContainer');

	document.getElementById('AuditNotes').appendChild(forAuditNote);

	var forIconDiv = document.createElement("DIV");
	forIconDiv.setAttribute("class", 'flexible auditIcon');

	var forAuditBody = document.createElement("DIV");
	forAuditBody.setAttribute("class", 'flexible auditBody');

	forAuditNote.appendChild(forIconDiv);
	forAuditNote.appendChild(forAuditBody);

	var iconSpan = document.createElement("span");
	iconSpan.setAttribute("class", 'logoaudit');
	forIconDiv.appendChild(iconSpan);

	var BodyHeaderLabel = document.createElement("LABEL");
	BodyHeaderLabel.setAttribute("class", 'headline');
	BodyHeaderLabel.innerHTML = 'Commission statement was emailed by ' + agentName +'to ' + recepientName;

	var BodyDateLabel = document.createElement("LABEL");
	BodyDateLabel.setAttribute("class", 'description');
	BodyDateLabel.innerHTML = datenow;

	var breakelem = document.createElement("br");

	forAuditBody.appendChild(BodyHeaderLabel);
	forAuditBody.appendChild(breakelem);

	forAuditBody.appendChild(BodyDateLabel);

	document.getElementById('allNotesInput').value = document.getElementById('AuditNotes').innerHTML;
}

function fileUdated(id) {
	var datenow = new Date().toLocaleTimeString([], {
		year: 'numeric',
		month: 'numeric',
		day: 'numeric',
		hour: '2-digit',
		minute: '2-digit'
	});
	var agentName = document.getElementById(id).value;

	var forAuditNote = document.createElement("DIV");
	forAuditNote.setAttribute("class", 'FileUpdated flexibleContainer');

	document.getElementById('AuditNotes').appendChild(forAuditNote);

	var forIconDiv = document.createElement("DIV");
	forIconDiv.setAttribute("class", 'flexible auditIcon');

	var forAuditBody = document.createElement("DIV");
	forAuditBody.setAttribute("class", 'flexible auditBody');

	forAuditNote.appendChild(forIconDiv);
	forAuditNote.appendChild(forAuditBody);

	var iconSpan = document.createElement("span");
	iconSpan.setAttribute("class", 'logoaudit');
	forIconDiv.appendChild(iconSpan);

	var BodyHeaderLabel = document.createElement("LABEL");
	BodyHeaderLabel.setAttribute("class", 'headline');
	BodyHeaderLabel.innerHTML = 'File was updated by ' + agentName;

	var BodyDateLabel = document.createElement("LABEL");
	BodyDateLabel.setAttribute("class", 'description');
	BodyDateLabel.innerHTML = datenow;

	var breakelem = document.createElement("br");

	forAuditBody.appendChild(BodyHeaderLabel);
	forAuditBody.appendChild(breakelem);

	forAuditBody.appendChild(BodyDateLabel);

	document.getElementById('allNotesInput').value = document.getElementById('AuditNotes').innerHTML;

}

function fileFinalized(){
	var datenow = new Date().toLocaleTimeString([], {
		year: 'numeric',
		month: 'numeric',
		day: 'numeric',
		hour: '2-digit',
		minute: '2-digit'
	});

	var forAuditNote = document.createElement("DIV");
	// forAuditNote.setAttribute("id", id);
	forAuditNote.setAttribute("class", 'fileFinalized flexibleContainer');

	document.getElementById('AuditNotes').appendChild(forAuditNote);

	var forIconDiv = document.createElement("DIV");
	forIconDiv.setAttribute("class", 'flexible auditIcon');

	var forAuditBody = document.createElement("DIV");
	forAuditBody.setAttribute("class", 'flexible auditBody');

	forAuditNote.appendChild(forIconDiv);
	forAuditNote.appendChild(forAuditBody);

	var iconSpan = document.createElement("span");
	iconSpan.setAttribute("class", 'logoaudit');
	forIconDiv.appendChild(iconSpan);

	var BodyHeaderLabel = document.createElement("LABEL");
	BodyHeaderLabel.setAttribute("class", 'headline');
	BodyHeaderLabel.innerHTML = 'File finalized by ' + document.getElementById('agentNameHidden').value;

	var BodyDateLabel = document.createElement("LABEL");
	BodyDateLabel.setAttribute("class", 'description');
	BodyDateLabel.innerHTML = datenow;

	var breakelem = document.createElement("br");

	forAuditBody.appendChild(BodyHeaderLabel);
	forAuditBody.appendChild(breakelem);

	forAuditBody.appendChild(BodyDateLabel);
	// forAuditBody.appendChild(breakelem);

	// countTrail++;
	document.getElementById('allNotesInput').value = document.getElementById('AuditNotes').innerHTML;
}

function saveNotes(fname, lname) {
	if (document.getElementById('ExteraNotes').value.trim()) {
		
		document.getElementById('allNotesDocuments').value=document.getElementById('ExteraNotes').value;
		
		document.getElementById('ExteraNotes').parentElement.style.borderColor = '';
		var datenow = new Date().toLocaleTimeString([], {
			year: 'numeric',
			month: 'numeric',
			day: 'numeric',
			hour: '2-digit',
			minute: '2-digit'
		});
		var id = 'Note' + countNotes;
		var forNotesDIV = document.createElement("DIV");
		forNotesDIV.setAttribute("id", id);
		forNotesDIV.setAttribute("class", 'forNotesStyle');
		var NotesNameLabel = document.createElement("LABEL");
		NotesNameLabel.innerHTML = fname + ' ' +lname;
		var NotesDateLabel = document.createElement("LABEL");
		NotesDateLabel.innerHTML = datenow;
		NotesDateLabel.setAttribute("class", 'floatDataRightSide');
		var NopeParagraph = document.createElement("P");
		NopeParagraph.innerHTML = document.getElementById('ExteraNotes').value;
		document.getElementById('ExteraNotes').value = '';
		var DeleteLabel = document.createElement("i");
		DeleteLabel.setAttribute("onclick", "deleteNote('" + id + "')");
		DeleteLabel.setAttribute("class", 'deleteImg bi bi-trash floatDataRightSide');

		document.getElementById('forNotes').appendChild(forNotesDIV);

		forNotesDIV.appendChild(NotesNameLabel);
		forNotesDIV.appendChild(NotesDateLabel);
		forNotesDIV.appendChild(NopeParagraph);
		NopeParagraph.appendChild(DeleteLabel);

		countNotes++;
		
		
		
	} else {
		document.getElementById('ExteraNotes').parentElement.style.borderColor = 'red';
	}
	
	
	
}

function notesToInput(){
	let notes = document.getElementById('AuditNotes').getElementsByClassName('flexibleContainer');
	var Res = '';
	for(let i = 0; i<notes.length; i++){
		let icon = notes[i].getElementsByClassName('auditIcon')[0].getElementsByTagName('span')[0].className;
		let name = notes[i].getElementsByClassName('auditBody')[0].getElementsByClassName('headline')[0].innerHTML;
		let time = notes[i].getElementsByClassName('auditBody')[0].getElementsByClassName('description')[0].innerHTML;
		Res += icon + '/&' + name+ '/&' + time+ '|&';
	}
	// console.log(Res);
	document.getElementById('AuditNotes').value = Res;
}

function deleteNote(id) {
	let element = document.getElementById(id);
	// console.log(element);
	element.style.display="none";
	



}

function emailonloadReferral(){
	$.getScript("../Scripts/FillEmail.js").then(function() {
	CreateEmailsReferral();
});
}

function changeFormTarget(el) {
  el.form.setAttribute('target', '_self')
}