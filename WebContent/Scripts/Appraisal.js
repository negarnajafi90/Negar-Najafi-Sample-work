$(function () {
  $('#CompletionDate').datepicker({
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

function simplePrintTRS(id) {
  const prtContent = document.getElementById(id);
  const WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
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
  WinPrint.onafterprint = function () {
    WinPrint.close();
  }
  // WinPrint.focus();
  setTimeout(function() {
      WinPrint.print();
  }, 200);


}

function TabsHandleler(evt, tabName, MytabsContent, tablink, tabID) {

  let i, tabcontent, tablinks;

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
  document.getElementById(tabID).classList.add("active");
}

function simplePrint(id) {
  const prtContent = document.getElementById(id);
  const WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
  WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
  WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
  WinPrint.document.write('<link href="../CSS/Appraisal.css" rel="stylesheet" type="text/css" />');
  WinPrint.document.write('<link href="../CSS/forPrintInvoice.css" rel="stylesheet" type="text/css" />');

  if (id == 'MainTRSsection') {
      WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
  }

  WinPrint.document.write(prtContent.innerHTML);
  WinPrint.document.close();
  // WinPrint.focus();
  // WinPrint.print();
  WinPrint.onafterprint = function () {
      // WinPrint.close();
  }

  setTimeout(function() {
      WinPrint.print();
  }, 400);

  // WinPrint.close();
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepTransaction(gonext) {

  if(document.getElementById('perpanentDeal')){
    if(document.getElementById('perpanentDeal').value == '1'){
      TabsHandleler(event, 'Parties', 'tabcontent', 'tablinks', 'PartiesTab');
      TabsHandleler(event, 'Client', 'tabcontent1', 'tablinks1', 'ClientTab');
      PropertyAddress("Propertyaddress2");
      PropertyAddress("Propertyaddress3");
      PropertyAddress("Propertyaddress4");
      PropertyAddress("Propertyaddress5");
      document.getElementById("ClientProcess").style.display = "none";
      document.getElementById("OwnerProcess").style.display = "none";
      return;
    }
  }

  let Error = 0;

  let variables = [];

  if (document.getElementById("DealType").value === "Consulting" || document.getElementById("DealType").value === "Other" ) {

    variables.push(document.getElementById("DealType"), document.getElementById("ServiceDescription"), document.getElementById("AppraisalFee"), 
      document.getElementById("AppraisalSource"), document.getElementById("CompletionDate"), 
      document.getElementById("PropertyType"));

    if(!(document.getElementById('StreetNumber').value == '' || document.getElementById('StreetName').value == '' || document.getElementById('City').value == '' || document.getElementById('PostalCode').value == '' || document.getElementById('UnitNumber').value == '')){
      variables.push(document.getElementById("StreetNumber"),
      document.getElementById("StreetName"), document.getElementById("City"),
      document.getElementById("PostalCode"), document.getElementById("PropertyProvince"),
      document.getElementById("Country"));
    }

  } else {
    variables.push(document.getElementById("DealType"), document.getElementById("AppraisalFee"),
      document.getElementById("AppraisalSource"), document.getElementById("CompletionDate"),
      document.getElementById("PropertyType"), document.getElementById("StreetNumber"),
      document.getElementById("StreetName"), document.getElementById("City"),
      document.getElementById("PostalCode"), document.getElementById("PropertyProvince"),
      document.getElementById("Country"));
  }

  if(document.getElementById("PropertyProvince").value == 'Other'){
    variables.push(document.getElementById("PropertyOtherProvince"));
  }


  for (let i = 0; i < variables.length; i++) {

    if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

      Error += 1

      if (i === 0) {
        document.getElementById("DealTypeCustom").style.borderColor = "red";
      }

      if (i === 1) {
        document.getElementById("AppraisalFeeDiv").style.borderColor = "red";
      }

      if (i === 2) {
        document.getElementById("AppraisalSourceCustom").style.borderColor = "red";
      }

      if (i === 3) {
        document.getElementById("CompletionDateLabel").style.borderColor = "red";
      }

      if (i === 4) {
        document.getElementById("PropertyType").parentElement.style.borderColor = "red";
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
        document.getElementById("DealTypeCustom").style.borderColor = "lightgrey";
      }
      if (i === 1) {
        document.getElementById("AppraisalFeeDiv").style.borderColor = "lightgrey";
      }
      if (i === 2) {
        document.getElementById("AppraisalSourceCustom").style.borderColor = "lightgrey";
      }
      if (i === 3) {
        document.getElementById("CompletionDateLabel").style.borderColor = "lightgrey";
      }
      if (i === 4) {
        document.getElementById("PropertyType").parentElement.style.borderColor = "lightgrey";
      }
      if (!(document.getElementById("SecondAgentDetailInformation").style.display === "none")) {
        if (i === variables.length - 1) {
          document.getElementById("SecondAgentID").parentElement.style.borderColor = "lightgrey";
        }
      }
    }
  }

  if(!(document.getElementById('PropertyProvince').value === "Other")){
  
  if(!(document.getElementById("DealType").value === "Consulting" || document.getElementById("DealType").value === "Other" )){

      if (!ValidatePostalCode("PostalCode")) {
        document.getElementById("PostalCode").style.borderColor = "red";
        Error = 1;
      } else {
        document.getElementById("PostalCode").style.borderColor = "lightgrey";
      }
    
  }else{

    if(!(document.getElementById('StreetNumber').value == '') || !(document.getElementById('StreetName').value == '') || !(document.getElementById('City').value == '') || !(document.getElementById('PostalCode').value == '') || !(document.getElementById('UnitNumber').value == '')){
      if (!ValidatePostalCode("PostalCode")) {
        document.getElementById("PostalCode").style.borderColor = "red";
        Error = 1;
      } else {
        document.getElementById("PostalCode").style.borderColor = "lightgrey";
      }
    }
  }

}

  if(document.getElementById("AppraisalFee").value < 0 || document.getElementById("AppraisalFee").value === " " || document.getElementById("AppraisalFee").value === null || !document.getElementById("AppraisalFee").value || document.getElementById("AppraisalFee").value === 0){
    Error = 1;
    document.getElementById("AppraisalFee").parentElement.style.borderColor = "red";
  }else{document.getElementById("AppraisalFee").parentElement.style.borderColor = "lightgrey";}

  if(!(document.getElementById("OfficeLeadCommisisonSection").style.display === "none")){
  if (document.getElementById("OfficeLeadAllocatonPercentage").value < 0 || document.getElementById("OfficeLeadAllocatonPercentage").value > 100) {
    Error = 1;
    document.getElementById("OfficeLeadAllocatonPercentage").parentElement.style.borderColor = "red";
    document.getElementById("ErrorEmpty1").style.display = "block";
  }else{
    document.getElementById("OfficeLeadAllocatonPercentage").parentElement.style.borderColor = "lightgrey";
    document.getElementById("ErrorEmpty1").style.display = "none";
  }
}

  if (!(document.getElementById("SecondAgentDetailInformation").style.display === "none")) {

    var agentEmpty =  document.getElementById("SecondAgentID");

    if(agentEmpty.value === " " || agentEmpty.value === null || !agentEmpty.value || agentEmpty.value === 0){
      Error = 1;
      document.getElementById("SecondAgentID").parentElement.style.borderColor = "red";
      document.getElementById("ErrorEmptySecondAgent").style.display = "block";
    }else{
      document.getElementById("SecondAgentID").parentElement.style.borderColor = "lightgrey";
      document.getElementById("ErrorEmptySecondAgent").style.display = "none";
    }

    if ( document.getElementById("FirstAgentCommissionPercentage").value <= 0 || document.getElementById("FirstAgentCommissionPercentage").value > 99.991) {
      Error = 1;
      document.getElementById("FirstAgentCommissionPercentage").parentElement.style.borderColor = "red";
      document.getElementById("ErrorEmptySecondAgentComission").style.display = "block";
    }else{
      document.getElementById("FirstAgentCommissionPercentage").parentElement.style.borderColor = "lightgrey";
      document.getElementById("ErrorEmptySecondAgentComission").style.display = "none";
    }

    if (document.getElementById("SecondAgentCommissionPercentage").value <= 0 || document.getElementById("SecondAgentCommissionPercentage").value >= 99.991) {
      Error = 1;
      document.getElementById("SecondAgentCommissionPercentage").parentElement.style.borderColor = "red";
      document.getElementById("ErrorEmptySecondAgentComission").style.display = "block";
    }else{
      document.getElementById("SecondAgentCommissionPercentage").parentElement.style.borderColor = "lightgrey";
      document.getElementById("ErrorEmptySecondAgentComission").style.display = "none";
    }
  }


  if(document.getElementById("DealType").value === "Consulting" || document.getElementById("DealType").value === "Other" ){
    if(!(document.getElementById("StreetNumber").value) || document.getElementById("StreetNumber").value == ''){
    
      document.getElementById('Propertyaddress2').style.visibility = 'hidden';
      document.getElementById('Propertyaddress3').style.visibility = 'hidden';
      document.getElementById('Propertyaddress4').style.visibility = 'hidden';
      document.getElementById('Propertyaddress5').style.visibility = 'hidden';

    }else{
      
      document.getElementById('Propertyaddress2').style.visibility = 'visible';
      document.getElementById('Propertyaddress3').style.visibility = 'visible';
      document.getElementById('Propertyaddress4').style.visibility = 'visible';
      document.getElementById('Propertyaddress5').style.visibility = 'visible';

    }
  }

  if (Error === 0) {

    document.getElementById('TransactionDetailsTabIMG').src = "../ImagesUsed/Accept.png";
    document.getElementById('TransactionDetailsTabIMG').classList.add('accepted');

    if(gonext){
      TabsHandleler(event, 'Parties', 'tabcontent', 'tablinks', 'PartiesTab');

      TabsHandleler(event, 'Client', 'tabcontent1', 'tablinks1', 'ClientTab');
    }

    PropertyAddress("Propertyaddress2");

    PropertyAddress("Propertyaddress3");

    PropertyAddress("Propertyaddress4");

    PropertyAddress("Propertyaddress5");

    document.getElementById("ErrorEmpty1").style.display = "none"

  } else {
    document.getElementById("ErrorEmpty1").style.display = "block"
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
      TabsHandleler(event, 'Owner', 'tabcontent1', 'tablinks1', 'OwnerTab');
      document.getElementById("ClientProcess").style.display = "none";
      document.getElementById("OwnerProcess").style.display = "none";
      return
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
  if( document.getElementById("ClientProvince1").value == 'Other'){
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

    if( document.getElementById("ClientProvince2").value == 'Other'){
      variables.push(document.getElementById("ClientOtherProvince2"));
    }
  }

  

  for (let i = 0; i < variables.length; i++) {

    if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

      Error = 1

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
  
  if(!(document.getElementById('ClientProvince1').value === "Other")){
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

  if(!(document.getElementById("client2").style.display === "none")){

    if(!(document.getElementById('ClientProvince2').value === "Other")){
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

    TabsHandleler(event, 'Owner', 'tabcontent1', 'tablinks1', 'OwnerTab');

    document.getElementById("ClientProcess").style.display = "none";

    document.getElementById("OwnerProcess").style.display = "";

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

function BackStepOwner() {

  TabsHandleler(event, 'Client', 'tabcontent1', 'tablinks1', 'ClientTab');

  document.getElementById("ClientProcess").style.display = "";

  document.getElementById("OwnerProcess").style.display = "none";

  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function NextStepOwner() {

  if(document.getElementById('perpanentDeal')){
    if(document.getElementById('perpanentDeal').value == '1'){
      TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks', 'InvoiceTab');
      document.getElementById("ClientProcess").style.display = "none";
      document.getElementById("OwnerProcess").style.display = "none";
      InvoiceCreation();
      return;
    }
  }
  var Error = 0;

  var variables = [];

  if (document.getElementById("OwnerType1").value === "Individual") {
    variables.push(document.getElementById("OwnerType1"), document.getElementById("OwnerFirstName1"), document.getElementById("OwnerLastName1"),
      document.getElementById("OwnerStreetNumber1"), document.getElementById("OwnerStreetName1"),
      document.getElementById("OwnerCity1"), document.getElementById("OwnerPostalCode1"),
      document.getElementById("OwnerCountry1"), document.getElementById("OwnerEmail1"),
      document.getElementById("OwnerPhone1"));

  } else {
    variables.push(document.getElementById("OwnerType1"), document.getElementById("OwnerBusinessName1"), document.getElementById("OwnerSigningOfficere1"),
      document.getElementById("OwnerStreetNumber1"), document.getElementById("OwnerStreetName1"),
      document.getElementById("OwnerCity1"), document.getElementById("OwnerPostalCode1"),
      document.getElementById("OwnerCountry1"), document.getElementById("OwnerEmail1"),
      document.getElementById("OwnerPhone1"));
  }

  if( document.getElementById("OwnerProvince1").value == 'Other'){
    variables.push(document.getElementById("OwnerOtherProvince1"));
  }

  if (!(document.getElementById("Owner2").style.display === "none")) {

    if (document.getElementById("OwnerType2").value === "Individual") {
      variables.push(document.getElementById("OwnerType2"), document.getElementById("OwnerFirstName2"), document.getElementById("OwnerLastName2"),
        document.getElementById("OwnerStreetNumber2"), document.getElementById("OwnerStreetName2"),
        document.getElementById("OwnerCity2"), document.getElementById("OwnerPostalCode2"),
        document.getElementById("OwnerCountry2"), document.getElementById("OwnerEmail2"),
        document.getElementById("OwnerPhone2"));

    } else {
      variables.push(document.getElementById("OwnerType2"), document.getElementById("OwnerBusinessName2"), document.getElementById("OwnerSigningOfficere2"),
        document.getElementById("OwnerStreetNumber2"), document.getElementById("OwnerStreetName2"),
        document.getElementById("OwnerCity2"), document.getElementById("OwnerPostalCode2"),
        document.getElementById("OwnerCountry2"), document.getElementById("OwnerEmail2"),
        document.getElementById("OwnerPhone2"));
    }

    if( document.getElementById("OwnerProvince2").value == 'Other'){
      variables.push(document.getElementById("OwnerOtherProvince2"));
    }
  }

  for (let i = 0; i < variables.length; i++) {


    if (variables[i].value === " " || variables[i].value === null || !variables[i].value || variables[i].value === 0) {

      Error = 1

      if (i === 0) {
        document.getElementById("OwnerType1Custom").style.borderColor = "red";
      }

      if (!(document.getElementById("Owner2").style.display === "none")) {
        if (i === 10) {
          document.getElementById("OwnerType2Custom").style.borderColor = "red";
        }
      }

      variables[i].style.borderColor = "red";

    } else {

      variables[i].style.borderColor = "lightgrey";

      if (i === 0) {
        document.getElementById("OwnerType1Custom").style.borderColor = "lightgrey";
      }

      if (!(document.getElementById("Owner2").style.display === "none")) {
        if (i === 10) {
          document.getElementById("OwnerType2Custom").style.borderColor = "lightgrey";
        }
      }
    }
  }
  if(!(document.getElementById('OwnerProvince1').value === "Other")){
    if (!ValidatePostalCode("OwnerPostalCode1")) {
      document.getElementById("OwnerPostalCode1").style.borderColor = "red";
      Error = 1;
    } else {
      document.getElementById("OwnerPostalCode1").style.borderColor = "lightgrey";
    }
  }


  if (!ValidateEmail("OwnerEmail1")) {
    document.getElementById("OwnerEmail1").style.borderColor = "red";
    Error = 1;
  } else {
    document.getElementById("OwnerEmail1").style.borderColor = "lightgrey";
  }

  if(!(document.getElementById("Owner2").style.display === "none")){
    if(!(document.getElementById('OwnerProvince2').value === "Other")){
      if (!ValidatePostalCode("OwnerPostalCode2")) {
        document.getElementById("OwnerPostalCode2").style.borderColor = "red";
        Error = 1;
      } else {
        document.getElementById("OwnerPostalCode2").style.borderColor = "lightgrey";
      }
    }

    if (!ValidateEmail("OwnerEmail2")) {
      document.getElementById("OwnerEmail2").style.borderColor = "red";
      Error = 1;
    } else {
      document.getElementById("OwnerEmail2").style.borderColor = "lightgrey";
    }

  }


  if (Error === 0) {

    document.getElementById('PartiesTabIMG').src = "../ImagesUsed/Accept.png";
    document.getElementById('PartiesTabIMG').classList.add('accepted');
    document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
    document.getElementById('InvoiceTabIMG').classList.add('accepted');

    TabsHandleler(event, 'Invoice', 'tabcontent', 'tablinks', 'InvoiceTab');

    document.getElementById("PartiesTab").disabled = false;

    document.getElementById("ErrorEmpty3").style.display = "none"

    InvoiceCreation();

  } else {
    document.getElementById("ErrorEmpty3").style.display = "block"
  }

  DisplayProperty();

  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function DisplayProperty(){
  if(!document.getElementById('StreetNumber').value.trim()){
    document.getElementById('propertyInfo2').style.marginTop = '0px';
    document.getElementById('propertyInfo').style.display = 'none';
  }else{
    document.getElementById('propertyInfo2').style.marginTop = '5px';
    document.getElementById('propertyInfo').style.display = '';
  }
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepInvoice(  Split1 , Split2 , UserSplit2, UserSplit3, Cap1, Cap2 , Cap3 , Balance   ) {

 fillHST();

 const HST1= document.getElementById('BreakdownGrossFeeAmountHSTPercent').value ; 
 const HST2= document.getElementById('BreakdownAgent1HSTPercent').value ; 
 const HST3= document.getElementById('BreakdownAgent2HSTPercent').value ;

	if(document.getElementById('AddSecondAgentCheckBox').checked === true){
    document.getElementById('BreakdownGrossAllocation1').value = parseFloat(document.getElementById('FirstAgentCommissionPercentage').value).toFixed(2) + '%';
    document.getElementById('BreakdownGrossAllocation2').value = parseFloat(document.getElementById('SecondAgentCommissionPercentage').value).toFixed(2) + '%';
		document.getElementById('AddSecondAgentCheckBox').style.display = '';
		document.getElementById('allocaionTd').style.display = '';
		document.getElementById('allocaionTd1').style.display = '';
		document.getElementById('allocaionTd2').style.display = '';
		document.getElementById('allocaionTd3').style.display = '';
		document.getElementById('allocaionTd4').style.display = '';
	}else{
    document.getElementById('BreakdownGrossAllocation1').value = parseFloat(0.00).toFixed(2) + '%';
    document.getElementById('BreakdownGrossAllocation2').value = parseFloat(0.00).toFixed(2) + '%';
		document.getElementById('AddSecondAgentCheckBox').style.display = 'none';
		document.getElementById('allocaionTd').style.display = 'none';
		document.getElementById('allocaionTd1').style.display = 'none';
		document.getElementById('allocaionTd2').style.display = 'none';
		document.getElementById('allocaionTd3').style.display = 'none';
		document.getElementById('allocaionTd4').style.display = 'none';
	}
	


  RecordSheet( Split1 , Split2 , HST1 , HST2 , HST3 , UserSplit2, UserSplit3, Cap1, Cap2 , Cap3 , Balance );
  
  

  document.getElementById("InvoiceTab").disabled = false;

  document.getElementById("ApprasialRecordSheetTab").disabled = false;

  TabsHandleler(event, 'ApprasialRecordSheet', 'tabcontent', 'tablinks', 'ApprasialRecordSheetTab');

  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });

  // This is function for coloring Record sheet section. Call it here to do it before data shows up.

  $(".visible").removeClass("visible");
  $(".newclass").removeClass("newclass");

  const tab1 = document.getElementById("tableOne");
  const tab2 = document.getElementById("tableTwo");

  const tr1 = tab1.getElementsByTagName("tr");
  const tr2 = tab2.getElementsByTagName("tr");

  for (let i = 0, max = tr1.length; i < max; i++) {
    if (!isHidden(tr1[i])) {
      tr1[i].classList.add('visible');
    }
  }

  for (let i = 0, max = tr2.length; i < max; i++) {
    if (!isHidden(tr2[i])) {
      tr2[i].classList.add('visible');
    }
  }

  const res1 = tab1.getElementsByClassName("visible");
  const res2 = tab2.getElementsByClassName("visible");


  for (let j = res1.length - 1; j > -1; j--) {
    if (j % 2 === 1) {
      res1[j].classList.add('newclass');
    }
  }

  for (let j = res2.length - 1; j > -1; j--) {
    if (j % 2 === 1) {
      res2[j].classList.add('newclass');
    }
  }
  document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
  document.getElementById('InvoiceTabIMG').classList.add('accepted');
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



function NextStepInvoiceUpdate(  Split1 , Split2 ,HST1, HST2 , HST3, UserSplit2, UserSplit3, Cap1, Cap2 , 
		
		Cap3 , Balance , Final ,  FinalHST1 , finalHST2, finalHST3 ,Payment1 , Payment2 , Payment3 , NetToBrokerage , NetHST , NetTotal , theSplit1, theSplit2) {
	
	fillHSTUpdate(HST1, HST2 ,HST3);

		if(document.getElementById('AddSecondAgentCheckBox').checked === true){
	    document.getElementById('BreakdownGrossAllocation1').value = parseFloat(document.getElementById('FirstAgentCommissionPercentage').value).toFixed(2) + '%';
	    document.getElementById('BreakdownGrossAllocation2').value = parseFloat(document.getElementById('SecondAgentCommissionPercentage').value).toFixed(2) + '%';
			document.getElementById('AddSecondAgentCheckBox').style.display = '';
			document.getElementById('allocaionTd').style.display = '';
			document.getElementById('allocaionTd1').style.display = '';
			document.getElementById('allocaionTd2').style.display = '';
			document.getElementById('allocaionTd3').style.display = '';
			document.getElementById('allocaionTd4').style.display = '';
		}else{
	    document.getElementById('BreakdownGrossAllocation1').value = parseFloat(0.00).toFixed(2) + '%';
	    document.getElementById('BreakdownGrossAllocation2').value = parseFloat(0.00).toFixed(2) + '%';
			document.getElementById('AddSecondAgentCheckBox').style.display = 'none';
			document.getElementById('allocaionTd').style.display = 'none';
			document.getElementById('allocaionTd1').style.display = 'none';
			document.getElementById('allocaionTd2').style.display = 'none';
			document.getElementById('allocaionTd3').style.display = 'none';
			document.getElementById('allocaionTd4').style.display = 'none';
		}
	
	if( Final==="1"){
		
	  FinalRecordSheet( HST1 , HST2, HST3 ,Payment1 , Payment2 , Payment3 , NetToBrokerage , NetHST , NetTotal , theSplit1, theSplit2 );
	  
	}else{
		
	  RecordSheet( Split1 , Split2 , HST1 , HST2 , HST3 , UserSplit2, UserSplit3, Cap1, Cap2 , Cap3 , Balance );
	  
	}

	  document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";

	  document.getElementById("InvoiceTab").disabled = false;

	  document.getElementById("ApprasialRecordSheetTab").disabled = false;

	  TabsHandleler(event, 'ApprasialRecordSheet', 'tabcontent', 'tablinks', 'ApprasialRecordSheetTab');

	  window.scrollTo({
	    top: 0,
	    behavior: 'smooth'
	  });



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
	    // if (j === 1) {
	    //   for (let k = 0; k < 3; k++) {
	    //     res2[j].getElementsByClassName("dollar")[k].innerHTML = "$";
	    //   }
	    // }
	    if (j % 2 === 1) {
	      res2[j].classList.add('newclass');
	    }
	  }
	  document.getElementById('InvoiceTabIMG').src = "../ImagesUsed/Accept.png";
	}








///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepDocuments() {

  TabsHandleler(event, 'AuditTrail', 'tabcontent', 'tablinks', 'AuditTrailTab');



}

function isHidden(el) {
  var style = window.getComputedStyle(el);
  return ((style.display === 'none') || (style.visibility === 'hidden'))
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function NextStepApprasialRecordSheet() {

  TabsHandleler(event, 'Documents', 'tabcontent', 'tablinks', 'DocumentsTab');

}

/////////////////////////////////////////////////////////////////////

function Empty(id) {

  var element = document.getElementById(id);

  var inputs = element.getElementsByTagName('input');
  
  var test = element.getElementsByTagName('select');

  var selects = element.getElementsByClassName('custom-select');

  for (let index = 0; index < inputs.length; ++index) {
    inputs[index].value = inputs[index].defaultValue; 
    inputs[index].style.borderColor = "lightgrey";
  } //Close For Loop

  for (let index = 0; index < selects.length; ++index) {
    selects[index].style.borderColor = "lightgrey";
  } //Close For Loop
  
  for (var index = 0; index < test.length; ++index) {
	  test[index].value="";
	  test[index].parentElement.getElementsByClassName('select-selected')[0].innerHTML=test[index].options[0].innerHTML;
	} //Close For Loop
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function RemoveOneParties(PartiesToRemove1, Section1, DeleteButton, AddButton) {

  if (document.getElementById(PartiesToRemove1).checked === true) {
    document.getElementById(Section1).style.display = "none";
    document.getElementById(AddButton).style.display = "";
  }

  if (document.getElementById(Section1).style.display === "none") {

    document.getElementById(DeleteButton).style.display = "none";
  } else {
    document.getElementById(DeleteButton).style.display = "";
  }
}





function RemoveOneParty(item2, AddButton) {

  document.getElementById(item2).style.display = "none";

  Empty(item2);

  
  if (document.getElementById(item2).style.display === "block") {

      document.getElementById(AddButton).style.visibility = "hidden";
  } 

  else {
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
    if(document.getElementById(PartyType).parentElement.parentElement.parentElement.getElementsByTagName('span')[0]){
      document.getElementById(PartyType).parentElement.parentElement.parentElement.getElementsByTagName('span')[0].style.display = '';
    }
    document.getElementById(OtherContent).style.display = "none";
    document.getElementById(OtherContent).getElementsByTagName('input')[0].value = '';
    document.getElementById(OtherContent).getElementsByTagName('input')[1].value = '';
    document.getElementById(IndividualContent).style.display = "";
  } else {
    if(document.getElementById(PartyType).parentElement.parentElement.parentElement.getElementsByTagName('span')[0]){
      document.getElementById(PartyType).parentElement.parentElement.parentElement.getElementsByTagName('span')[0].style.display = 'none';
    }
    document.getElementById(OtherContent).style.display = "";
    document.getElementById(IndividualContent).getElementsByTagName('input')[0].value = '';
    document.getElementById(IndividualContent).getElementsByTagName('input')[1].value = '';
    document.getElementById(IndividualContent).style.display = "none";
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function PropertyAddress(labelID) {

  var addressLabel = '';

  if(document.getElementById('PropertyProvince').value == "Other"){
    if (document.getElementById("UnitNumber").value === null || !document.getElementById("UnitNumber").value) {
      addressLabel = document.getElementById("StreetNumber").value + "&nbsp;" + document.getElementById("StreetName").value + ",&nbsp;" + document.getElementById("City").value + ",&nbsp;" + document.getElementById("PropertyOtherProvince").value + ",&nbsp;" + document.getElementById("PostalCode").value + ",&nbsp;" + document.getElementById("Country").value;
    } else {
      addressLabel = document.getElementById("UnitNumber").value + "&nbsp;-&nbsp;" + document.getElementById("StreetNumber").value + "&nbsp;" + document.getElementById("StreetName").value + ",&nbsp;" + document.getElementById("City").value + ",&nbsp;" + document.getElementById("PropertyOtherProvince").value + ",&nbsp;" + document.getElementById("PostalCode").value + ",&nbsp;" + document.getElementById("Country").value;
    }
  }else{
    if (document.getElementById("UnitNumber").value === null || !document.getElementById("UnitNumber").value) {
      addressLabel = document.getElementById("StreetNumber").value + "&nbsp;" + document.getElementById("StreetName").value + ",&nbsp;" + document.getElementById("City").value + ",&nbsp;" + document.getElementById("PropertyProvince").value + ",&nbsp;" + document.getElementById("PostalCode").value;
    } else {
      addressLabel = document.getElementById("UnitNumber").value + "&nbsp;-&nbsp;" + document.getElementById("StreetNumber").value + "&nbsp;" + document.getElementById("StreetName").value + ",&nbsp;" + document.getElementById("City").value + ",&nbsp;" + document.getElementById("PropertyProvince").value + ",&nbsp;" + document.getElementById("PostalCode").value;
    }
  }
  

  document.getElementById(labelID).innerHTML = addressLabel;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function PartiesForRecordSheet(Name, Company, Address, PhoneNumber, Individual, Unit, StreetName, StreetNumber, Province, City, PostalCode, Phone, Officer, BusinessName, FirstName, LastName, OtherProvince) {


  if (document.getElementById(Individual).style.display === "none") {
    document.getElementById(Name).value = document.getElementById(Officer).value.trim();
  } else {
    document.getElementById(Name).value = document.getElementById(FirstName).value.trim() + " " + document.getElementById(LastName).value.trim();
  }

  document.getElementById(Company).value = document.getElementById(BusinessName).value.trim();

  if(document.getElementById(Province).value == "Other"){
    if (document.getElementById(Unit).value) {
      var date2 = document.getElementById(Unit).value.trim() + " " + "-" + " " + document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", "+ document.getElementById(OtherProvince).value.trim() +', ' + document.getElementById(PostalCode).value.trim();
    } else {
      var date2 = document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", "+ document.getElementById(OtherProvince).value.trim() +', ' + document.getElementById(PostalCode).value.trim();
    }
  }else{
    if (document.getElementById(Unit).value) {
      var date2 = document.getElementById(Unit).value.trim() + " " + "-" + " " + document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(Province).value.trim() + ", " + document.getElementById(PostalCode).value.trim();
    } else {
      var date2 = document.getElementById(StreetNumber).value.trim() + " " + document.getElementById(StreetName).value.trim() + ", " + document.getElementById(City).value.trim() + ", " + document.getElementById(Province).value.trim() + ", " + document.getElementById(PostalCode).value.trim();
    }
  }
  

  document.getElementById(Address).value = date2;

  document.getElementById(PhoneNumber).value = document.getElementById(Phone).value;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function simplePrintOther(id) {
	// document.getElementById('invoiceButtonSection').style.display = 'none';
	let prtContent = document.getElementById(id);
	let WinPrint = window.open('', '', 'left=200,top=0,width=1000,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write('<link href="../CSS/TradeInRealestate.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/ButtonsAndFields.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/forPrintInvoice.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Appraisal.css" rel="stylesheet" type="text/css" />');
	WinPrint.document.write('<link href="../CSS/Deals.css" rel="stylesheet" type="text/css" />');
  
	if (document.getElementById(id).classList.contains('trsPrintSpecial')) {
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/forModals.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/TRSAndTable.css" rel="stylesheet" type="text/css" />');
		WinPrint.document.write('<link href="../CSS/Dashboard.css" rel="stylesheet" type="text/css" />');

	}
  
	WinPrint.document.write(prtContent.innerHTML);
	WinPrint.document.close();

	WinPrint.onafterprint = function () {
		WinPrint.close();
	}
  
	setTimeout(function() {
		WinPrint.print();
	}, 400);
  
  }
  
function RecordSheet(  Split1 , Split2 , HST1 , HST2 , HST3 , UserSplit2, UserSplit3, Cap1, Cap2 , Cap3 , Balance ) {



 //let HST1= document.getElementById('BreakdownGrossFeeAmountHSTPercent').value;
 
 //let HST2= document.getElementById('BreakdownAgent1HSTPercent').value;
 
 //let HST3 =document.getElementById('BreakdownAgent2HSTPercent').value;

  HST1= document.getElementById('BreakdownGrossFeeAmountHSTPercent').value;
  HST2=document.getElementById('BreakdownAgent1HSTPercent').value;
  HST3= document.getElementById('BreakdownAgent2HSTPercent').value;
  
  	alert("HST1"+" "+HST1);
  	
  	  
  	alert("HST2"+" "+HST2);
  	
  	  
  	alert("HST3"+" "+HST3);
	 
 
  document.getElementById("RecordsheetReportDate").value = document.getElementById("CompletionDate").value;

  document.getElementById("RecordsheetSource").value = document.getElementById("AppraisalSource").value.replace('-',' ');

  document.getElementById("RecordsheetAppraisalfee").value = "$  " + parseFloat(document.getElementById("AppraisalFee").value).toLocaleString(undefined, {
    minimumFractionDigits: 2, maximumFractionDigits: 2
  });


  PartiesForRecordSheet("RecordSheetClientName1", "RecordSheetClientCompany1", "RecordSheetClientAddress1", "RecordSheetClientPhone1", "Individusal1", "ClientUnitNumber1", "ClientStreetName1", "ClientStreetNumber1", "ClientProvince1", "ClientCity1", "ClientPostalCode1", "ClientPhone1", "ClientSigningOfficere1", "ClientBusinessName1", "ClientFirstName1", "ClientLastName1","ClientOtherProvince1");


  if (document.getElementById("client2").style.display === "block" || document.getElementById("client2").style.display === ""  || !(document.getElementById("client2").style.display === "none") ) {

    document.getElementById("DisplayClient2").style.display = "";

    PartiesForRecordSheet("RecordSheetClientName2", "RecordSheetClientCompany2", "RecordSheetClientAddress2", "RecordSheetClientPhone2", "Individusal2", "ClientUnitNumber2", "ClientStreetName2", "ClientStreetNumber2", "ClientProvince2", "ClientCity2", "ClientPostalCode2", "ClientPhone2", "ClientSigningOfficere2", "ClientBusinessName2", "ClientFirstName2", "ClientLastName2","ClientOtherProvince2");
  } else {
    document.getElementById("DisplayClient2").style.display = "none";
  }


  PartiesForRecordSheet("RecordSheetOwnerName1", "RecordSheetOwnerCompany1", "RecordSheetOwnerAddress1", "RecordSheetOwnerPhone1", "OwnerIndividusal1", "OwnerUnitNumber1", "OwnerStreetName1", "OwnerStreetNumber1", "OwnerProvince1", "OwnerCity1", "OwnerPostalCode1", "OwnerPhone1", "OwnerSigningOfficere1", "OwnerBusinessName1", "OwnerFirstName1", "OwnerLastName1","OwnerOtherProvince1");

  if (!(document.getElementById("Owner2").style.display == "none")) {

    document.getElementById("DisplayOwner2").style.display = "";

    PartiesForRecordSheet("RecordSheetOwnerName2", "RecordSheetOwnerCompany2", "RecordSheetOwnerAddress2", "RecordSheetOwnerPhone2", "OwnerIndividusal2", "OwnerUnitNumber2", "OwnerStreetName2", "OwnerStreetNumber2", "OwnerProvince2", "OwnerCity2", "OwnerPostalCode2", "OwnerPhone2", "OwnerSigningOfficere2", "OwnerBusinessName2", "OwnerFirstName2", "OwnerLastName2","OwnerOtherProvince2");
  } else {
    document.getElementById("DisplayOwner2").style.display = "none";
  }

  let GrossFee = parseFloat(document.getElementById("AppraisalFee").value.replace(/,/g, ''));

  let GrossFeeHST = (GrossFee * parseFloat( HST1.replace(/,/g, '')) ) / 100;

  let GrossFeeTotal = GrossFeeHST + GrossFee;

 
  

  let AgentSplit1;

  let AgentSplit2;

  let Source = document.getElementById("AppraisalSource").value;

  let office = parseFloat(document.getElementById("OfficeLeadAllocatonPercentage").value);

  if (Source === "Agent-lead") {
    AgentSplit1 = parseFloat(Split1);
    AgentSplit2 =parseFloat(Split2);
  } else {
    AgentSplit1 = 100 - office;
    AgentSplit2 = 100 - office;
  }
  
  
  //
  
  
  let Cap=0.00;
  let Split=0.00;
  let check=0;
  let BrokerPortion=0.00;
  let MyBroker=0.00;
  let RemainingBalance=0.00;//Cap1-Balance; //This is to check if the 
  let GrossFee1=GrossFee;
  let Agents=0.00;

	
    if (Source === "Office-lead") {

           Split = (100 - office);
           
           if ( parseFloat( Balance.replace(/\,/g,'') ) < parseFloat( Cap1.replace(/\,/g,'') ) ) {  Cap = parseFloat( Cap1.replace(/\,/g,'') ); check = 1;  } 
          
           else if (  parseFloat(Balance.replace(/\,/g,'') ) >= parseFloat(Cap1.replace(/\,/g,'') ) && parseFloat(Balance.replace(/\,/g,'') ) < parseFloat(Cap2).replace(/\,/g,'')) {  Cap = parseFloat(Cap2.replace(/\,/g,''));  check = 1;  } //Close if  ,   Checking if we have reached second cap 
          
           else if (  parseFloat(Balance.replace(/\,/g,'') ) >= parseFloat(Cap2.replace(/\,/g,'')) && parseFloat(Balance.replace(/\,/g,'')) < parseFloat(Cap3.replace(/\,/g,'')) ) {  Cap =parseFloat( Cap3.replace(/\,/g,'') );  check = 1;   } //Closing else if 
           
           else {   check = 0;   Cap = 0;    } 

    } //Close if Source === "Office-lead"

	
	else{

  
          //Checking if we have reached first cap  

          if( parseFloat(Balance.replace(/\,/g,'') )< parseFloat(Cap1.replace(/\,/g,'') ) ){  
            //alert("Cap1"); 
            Cap=parseFloat(Cap1.replace(/\,/g,''));  
            Split=parseFloat(Split1);   
            check=1; }//Closing if 

          else if( parseFloat(Balance.replace(/\,/g,'')) >= parseFloat(Cap1.replace(/\,/g,'') ) && parseFloat(Balance.replace(/\,/g,''))< parseFloat(Cap2.replace(/\,/g,'') ) ){  
            //alert("Cap2");   
            Cap=parseFloat(Cap2.replace(/\,/g,''));   Split=parseFloat(UserSplit2);  check=1;    } //Close if  ,   Checking if we have reached second cap 

          else if( parseFloat(Balance.replace(/\,/g,''))>= parseFloat(Cap2.replace(/\,/g,'')) && parseFloat(Balance.replace(/\,/g,''))< parseFloat( Cap3.replace(/\,/g,'') ) ){  
            //alert("Cap3");   
            Cap=parseFloat(Cap3.replace(/\,/g,''));  Split=parseFloat(UserSplit3);	  check=1; } //Closing else if 

          else {   
            //alert("No Cap");  
          check=0;   Cap=0;   Split=100; }// Closing else for when there is no other Cap
  
	}//none office lead
  
  RemainingBalance=Cap-Balance;
  
  
   //alert("RemainingBalance"+" "+RemainingBalance);

   //alert("Split"+" "+Split);
  
   //alert("Cap"+" "+Cap);

  if(check==1) {

  	      var myCommission=GrossFee1;

  	      MyBroker=(myCommission*(100-Split))/100;
   
          if(  MyBroker > RemainingBalance ) { 
          	
      	           var mySplit =(100-Split)/100;

                   var Temp=RemainingBalance/(mySplit);  
        
                   var TempCommission=GrossFee1-Temp;
        
                   var newTempCap = 0;
        
                   if(Cap==parseFloat( Cap1.replace(/\,/g,''))  ) {    
                	   
                	     if(parseFloat(Cap2.replace(/\,/g,''))>0) {newTempCap=(100-parseFloat(UserSplit2.replace(/\,/g,'')) )/100;   Cap= parseFloat(Cap2.replace(/\,/g,''));  BrokerPortion=(TempCommission*newTempCap)+RemainingBalance; }
                
                         else { BrokerPortion=RemainingBalance; }      }
                
          
                    else if(Cap==parseFloat(Cap2.replace(/\,/g,'') ) ) {   
              	  
              	         if( parseFloat(Cap3.replace(/\,/g,'')) > 0) { newTempCap=(100-parseFloat(UserSplit3.replace(/\,/g,'')) )/100; Cap=parseFloat( Cap3.replace(/\,/g,'') );  BrokerPortion=(TempCommission*newTempCap)+RemainingBalance; }

                         else { BrokerPortion=RemainingBalance; }   }
               
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
 
 //alert("check"+" "+check);
 
 //alert("GrossFee"+" "+GrossFee1);
 
 //alert("BrokerPortion"+" "+BrokerPortion);

 //alert("Agents"+" "+Agents);
 
 //alert("BrokerPortion"+" "+BrokerPortion);
 
 //alert("MySplit"+" "+MySplit);
  
  
  
	var FisrtAGentPercentage =MySplit;

	var SecondAgentPercentage = parseFloat(document.getElementById("SecondAgentCommissionPercentage").value.replace(/,/g, '').replace('$', ''));

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

  
  
	var Agentname1=document.getElementById("FirstAgentID").value;

	var arrayname=Agentname1.split(" ");

	document.getElementById("BreakdownAgent1Name").value = arrayname[1]+" "+arrayname[2];
  

  document.getElementById("BreakdownAgent1Split").value =parseFloat(MySplit).toFixed(2)+ "%";

  document.getElementById("BreakdownAgent1Amount").value = parseFloat(FirstAgentNet).toLocaleString(undefined, {
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


  var TotalPurNet = SecondAgentNet + FirstAgentNet;

  var TotalHST = SecondAgentNetHST + FirstAgentNetHST;

  var Total = FirstAgentNetTotal + SecondAgentNetTotal;


  var PurBrokerNetAmount = GrossFee - TotalPurNet;

  
  var BrokerHST = GrossFeeHST - TotalHST;

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
  

  
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function FinalRecordSheet( HST1 , HST2, HST3 ,Payment1 , Payment2 , Payment3 , NetToBrokerage , NetHST , NetTotal , Split1, Split2 ){
	
	

	  document.getElementById("RecordsheetReportDate").value = document.getElementById("CompletionDate").value;

	  document.getElementById("RecordsheetSource").value = document.getElementById("AppraisalSource").value.replace('-',' ');

	  document.getElementById("RecordsheetAppraisalfee").value = "$  " + parseFloat(document.getElementById("AppraisalFee").value).toLocaleString(undefined, {
	    minimumFractionDigits: 2, maximumFractionDigits: 2
	  });


	  PartiesForRecordSheet("RecordSheetClientName1", "RecordSheetClientCompany1", "RecordSheetClientAddress1", "RecordSheetClientPhone1", "Individusal1", "ClientUnitNumber1", "ClientStreetName1", "ClientStreetNumber1", "ClientProvince1", "ClientCity1", "ClientPostalCode1", "ClientPhone1", "ClientSigningOfficere1", "ClientBusinessName1", "ClientFirstName1", "ClientLastName1","ClientOtherProvince1");


	  if (document.getElementById("client2").style.display === "block" || document.getElementById("client2").style.display === ""  || !(document.getElementById("client2").style.display === "none") ) {

	    document.getElementById("DisplayClient2").style.display = "";

	    PartiesForRecordSheet("RecordSheetClientName2", "RecordSheetClientCompany2", "RecordSheetClientAddress2", "RecordSheetClientPhone2", "Individusal2", "ClientUnitNumber2", "ClientStreetName2", "ClientStreetNumber2", "ClientProvince2", "ClientCity2", "ClientPostalCode2", "ClientPhone2", "ClientSigningOfficere2", "ClientBusinessName2", "ClientFirstName2", "ClientLastName2","ClientOtherProvince2");
	  } else {
	    document.getElementById("DisplayClient2").style.display = "none";
	  }


	  PartiesForRecordSheet("RecordSheetOwnerName1", "RecordSheetOwnerCompany1", "RecordSheetOwnerAddress1", "RecordSheetOwnerPhone1", "OwnerIndividusal1", "OwnerUnitNumber1", "OwnerStreetName1", "OwnerStreetNumber1", "OwnerProvince1", "OwnerCity1", "OwnerPostalCode1", "OwnerPhone1", "OwnerSigningOfficere1", "OwnerBusinessName1", "OwnerFirstName1", "OwnerLastName1","OwnerOtherProvince1");

	  if (!(document.getElementById("Owner2").style.display == "none")) {

	    document.getElementById("DisplayOwner2").style.display = "";

	    PartiesForRecordSheet("RecordSheetOwnerName2", "RecordSheetOwnerCompany2", "RecordSheetOwnerAddress2", "RecordSheetOwnerPhone2", "OwnerIndividusal2", "OwnerUnitNumber2", "OwnerStreetName2", "OwnerStreetNumber2", "OwnerProvince2", "OwnerCity2", "OwnerPostalCode2", "OwnerPhone2", "OwnerSigningOfficere2", "OwnerBusinessName2", "OwnerFirstName2", "OwnerLastName2","OwnerOtherProvince2");
	  } else {
	    document.getElementById("DisplayOwner2").style.display = "none";
	  }

	

    	
    
    var Value1=( parseFloat(Payment1.replace(/\,/g,''))  * parseFloat(HST1.replace(/\,/g,'')) )/100;
	
	var Value2=( parseFloat(Payment2.replace(/\,/g,'')) * parseFloat(HST2.replace(/\,/g,'')) )/100;
	
    var Value3=( parseFloat(Payment3.replace(/\,/g,'')) * parseFloat(HST3.replace(/\,/g,'')) )/100;
    
    
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

  var Source = document.getElementById("AppraisalSource").value;

  if (Source === "Office-lead") {
    document.getElementById("OfficeLeadCommisisonSection").style.display = "";
  } else {
    document.getElementById("OfficeLeadCommisisonSection").style.display = "none";
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function AddSecondAgent() {

  if (document.getElementById("AddSecondAgentCheckBox").checked === true) {

    document.getElementById("SecondAgentDetailInformation").style.display = "";

  } else {
    document.getElementById('FirstAgentCommissionPercentage').value = 100.00;
    document.getElementById('SecondAgentCommissionPercentage').value = 0.00;
    document.getElementById("SecondAgentDetailInformation").style.display = "none";
  }

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function CommissionAllocations() {

  var Agent1Commission = parseFloat(document.getElementById("FirstAgentCommissionPercentage").value);

  document.getElementById("SecondAgentCommissionPercentage").value = parseFloat(100 - Agent1Commission).toFixed(2);
  
}

function HSTView(){

  if(  document.getElementById("HSTViewcheckmark").checked==true ){ document.getElementById("HSTSection").style.display ="inline"; }
  
  else{ document.getElementById("HSTSection").style.display ="none"; }	
  
  
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function CopyAddress(Unit, StreetNumber, StreetName, Province, PostalCode, City, Country, State) {

  document.getElementById(City).value = document.getElementById("City").value;

  document.getElementById(Unit).value = document.getElementById("UnitNumber").value;

  document.getElementById(StreetNumber).value = document.getElementById("StreetNumber").value;

  document.getElementById(Province).value = document.getElementById("PropertyProvince").value;

  //var a = document.getElementById("PropertyProvince").value;

  setProvince(Province);

  if(document.getElementById(Province).value == "Other"){
    document.getElementById(Country).readOnly = false;
    document.getElementById(State).getElementsByTagName('input')[0].value = document.getElementById("PropertyOtherProvince").value;
  }else{
    document.getElementById(Country).readOnly = true;
  }

  document.getElementById(StreetName).value = document.getElementById("StreetName").value;

  document.getElementById(PostalCode).value = document.getElementById("PostalCode").value;

  document.getElementById(Country).value = document.getElementById("Country").value;

  ifProvinceOther(Province,Country); 
  Display(Province, State)
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function InvoiceCreation() {

  const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
    "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  var invoiceAddress = '';

  if(document.getElementById("PropertyProvince").value == "Other"){
    if (document.getElementById("UnitNumber").value === null || !document.getElementById("UnitNumber").value) {

      invoiceAddress = document.getElementById("StreetNumber").value.trim() + "&nbsp;" + document.getElementById("StreetName").value.trim() + ",&nbsp;" + document.getElementById("City").value.trim() + ",&nbsp;" + document.getElementById("PostalCode").value.trim() + ",&nbsp;" + document.getElementById("Country").value.trim();
  
    } else {
  
      invoiceAddress = document.getElementById("UnitNumber").value.trim() + "&nbsp;-&nbsp;" + document.getElementById("StreetNumber").value.trim() + "&nbsp;" + document.getElementById("StreetName").value.trim() + ",&nbsp;" + document.getElementById("City").value.trim() + ",&nbsp;" + document.getElementById("PostalCode").value.trim() + ",&nbsp;" + document.getElementById("Country").value.trim();
  
    }
  }else{
    if (document.getElementById("UnitNumber").value === null || !document.getElementById("UnitNumber").value) {

      invoiceAddress = document.getElementById("StreetNumber").value.trim() + "&nbsp;" + document.getElementById("StreetName").value.trim() + ",&nbsp;" + document.getElementById("City").value.trim() + ",&nbsp;" + document.getElementById("PropertyProvince").value.trim() + ",&nbsp;" + document.getElementById("PostalCode").value.trim();
  
    } else {
  
      invoiceAddress = document.getElementById("UnitNumber").value.trim() + "&nbsp;-&nbsp;" + document.getElementById("StreetNumber").value.trim() + "&nbsp;" + document.getElementById("StreetName").value.trim() + ",&nbsp;" + document.getElementById("City").value.trim() + ",&nbsp;" + document.getElementById("PropertyProvince").value.trim() + ",&nbsp;" + document.getElementById("PostalCode").value.trim();
  
    }
  }

  document.getElementById("invoicePropertyAddress").innerHTML = invoiceAddress;

  document.getElementById("InvoicePropertyReportDate").innerHTML = document.getElementById("CompletionDate").value;

  var GrossFee = parseFloat(document.getElementById("AppraisalFee").value);

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

  if (document.getElementById("Individusal1").style.display === "none") {
    ReciverName = document.getElementById("ClientSigningOfficere1").value;
    document.getElementById("InvoiceReciverNameBusiness").style.display = '';
    document.getElementById("InvoiceReciverNameBusiness").innerHTML = document.getElementById("ClientBusinessName1").value;
  } else {
    document.getElementById("InvoiceReciverNameBusiness").style.display = 'none';
    ReciverName = document.getElementById("ClientFirstName1").value + " " + document.getElementById("ClientLastName1").value;
  }

  document.getElementById("InvoiceReciverName").innerHTML = ReciverName;



  var firstAdd = '';
  var secondAdd = '';

  

 
  if (document.getElementById("ClientUnitNumber1").value === null || !document.getElementById("ClientUnitNumber1").value) {

    firstAdd = document.getElementById("ClientStreetNumber1").value.trim() + "&nbsp;" + document.getElementById("ClientStreetName1").value.trim();

  } else {

    firstAdd = document.getElementById("ClientUnitNumber1").value.trim() + "&nbsp;-&nbsp;" + document.getElementById("ClientStreetNumber1").value.trim() + "&nbsp;" + document.getElementById("ClientStreetName1").value.trim();

  }

  

  document.getElementById("invoiceClientAddress").innerHTML = firstAdd;


  if(document.getElementById("ClientProvince1").value == "Other"){ 
    secondAdd = document.getElementById("ClientCity1").value.trim() + ",&nbsp;" + document.getElementById("ClientPostalCode1").value.trim() + ",&nbsp;" + document.getElementById("ClientCountry1").value.trim();
  }else{
    secondAdd = document.getElementById("ClientCity1").value.trim() + ",&nbsp;" + document.getElementById("ClientProvince1").value.trim() + ",&nbsp;" + document.getElementById("ClientPostalCode1").value.trim();
  }
  
  document.getElementById("invoiceClientAddressTwo").innerHTML = secondAdd;


  var CurrentDate = new Date().toJSON().slice(0, 10).replace(/-/g, '/');

  var invoiceDateVariable2 = CurrentDate;

  var res2 = invoiceDateVariable2.split("/"); // turn the date into a list format (Split by / if needed)

  document.getElementById("InvoiceCuttentDate").innerHTML = months[res2[1] - 1] + '&nbsp;' + res2[2] + ',&nbsp;' + res2[0];
  
  
  
  
  
	document.getElementById("HiddenBalanceInvoice").value=	document.getElementById("BalanceInvoice").innerHTML;parseFloat(GrossFeeTotal).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});
    document.getElementById("HiddenPropertyHSTInvoice").value=parseFloat(GrossFeeHST).toLocaleString(undefined, {
		minimumFractionDigits: 2, maximumFractionDigits: 2
	});

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function SetClients() {

  var selectClient = document.getElementById("SelectClients");

  var lenght = selectClient.options.length;

  while (lenght--) {
    selectClient.remove(lenght + 1);
  }

  var agents = 2;

  var FirstClient = "";

  var SecondClient = "";

  var Clients = [];


  if (document.getElementById("Individusal1").style.display === "none") {
    FirstClient = document.getElementById("ClientSigningOfficere1").value
  } else {
    FirstClient = document.getElementById("ClientFirstName1").value + " " + document.getElementById("ClientLastName1").value;
  }

  Clients.push(FirstClient);

  if (document.getElementById("client2").style.display === "none") {} else {
    agents = 3;
    if (document.getElementById("Individusal2").style.display === "none") {

      SecondClient = document.getElementById("ClientSigningOfficere2").value;
      Clients.push(SecondClient);
    } else {
      SecondClient = document.getElementById("ClientFirstName2").value + " " + document.getElementById("ClientLastName2").value;
      Clients.push(SecondClient);
    }

    Clients.push("Both");
  }

  for (var i = 0; i < Clients.length; i++) {
    var options = Clients[i];
    var singleElemet = document.createElement("option");
    singleElemet.textContent = options;
    singleElemet.value = options;
    selectClient.appendChild(singleElemet);
  } //Close for


  var mydiv = selectClient.parentElement;
  var elements = mydiv.getElementsByClassName('select-items');
  var divselect = elements[0];

  while(divselect.firstChild) {
    //The list is LIVE so it will re-index each call
    divselect.removeChild(divselect.firstChild);
  }

  for (var i = 0; i < Clients.length + 1; i++) {

    var a = document.createElement('DIV');
    a.innerHTML = selectClient.options[i].innerHTML;

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
    tt.innerHTML = '-- Please choose the client --';

    divselect.appendChild(a);
    //alert("Adding elemet"+" "+i);

  }


}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function AddOwnerInformation() {

  var CustomerOption = document.getElementById("SelectClients").selectedIndex;

  // alert("a=" + CustomerOption);

  var mydiv1 = document.getElementById("OwnerType1").parentElement;
  var mydiv2 = document.getElementById("OwnerType2").parentElement;
  var selVal1 = mydiv1.getElementsByClassName('select-selected')[0];
  var selVal2 = mydiv2.getElementsByClassName('select-selected')[0];

  if (CustomerOption === 1) {

    document.getElementById("OwnerType1").value = document.getElementById("ClientType1").value;

    ChecksPartiesType('OwnerType1', 'OwnerIndividusal1', 'OwnerNotAnIndividusal1');

    selVal1.innerHTML = document.getElementById("ClientType1").value;

    document.getElementById("OwnerBusinessName1").value = document.getElementById("ClientBusinessName1").value;

    document.getElementById("OwnerSigningOfficere1").value = document.getElementById("ClientSigningOfficere1").value;

    document.getElementById("OwnerFirstName1").value = document.getElementById("ClientFirstName1").value;

    document.getElementById("OwnerLastName1").value = document.getElementById("ClientLastName1").value;

    document.getElementById("OwnerUnitNumber1").value = document.getElementById("ClientUnitNumber1").value;

    document.getElementById("OwnerStreetNumber1").value = document.getElementById("ClientStreetNumber1").value;

    document.getElementById("OwnerStreetName1").value = document.getElementById("ClientStreetName1").value;

    document.getElementById("OwnerCity1").value = document.getElementById("ClientCity1").value;

    document.getElementById("OwnerPostalCode1").value = document.getElementById("ClientPostalCode1").value;

    document.getElementById("OwnerProvince1").value = document.getElementById("ClientProvince1").value;

    setProvinceFrom("OwnerProvince1", "ClientProvince1");

    document.getElementById("OwnerCountry1").value = document.getElementById("ClientCountry1").value;
    

    document.getElementById("OwnerEmail1").value = document.getElementById("ClientEmail1").value;

    document.getElementById("OwnerPhone1").value = document.getElementById("ClientPhone1").value;

    document.getElementById("OwnerExteraContactInformationLabel1").value = document.getElementById("ClientExteraContactInformationLabel1").value;

    setProvinceFrom("OwnerExteraContactInformationLabel1", "ClientExteraContactInformationLabel1");

    document.getElementById("OwnerExteraContact1").value = document.getElementById("ClientExteraContact1").value;
  } else if (CustomerOption === 2) {

    document.getElementById("OwnerType1").value = document.getElementById("ClientType2").value;

    ChecksPartiesType('OwnerType1', 'OwnerIndividusal1', 'OwnerNotAnIndividusal1');

    selVal1.innerHTML = document.getElementById("ClientType2").value;

    document.getElementById("OwnerBusinessName1").value = document.getElementById("ClientBusinessName2").value;

    document.getElementById("OwnerSigningOfficere1").value = document.getElementById("ClientSigningOfficere2").value;

    document.getElementById("OwnerFirstName1").value = document.getElementById("ClientFirstName2").value;

    document.getElementById("OwnerLastName1").value = document.getElementById("ClientLastName2").value;

    document.getElementById("OwnerUnitNumber1").value = document.getElementById("ClientUnitNumber2").value;

    document.getElementById("OwnerStreetNumber1").value = document.getElementById("ClientStreetNumber2").value;

    document.getElementById("OwnerStreetName1").value = document.getElementById("ClientStreetName2").value;

    document.getElementById("OwnerCity1").value = document.getElementById("ClientCity2").value;

    document.getElementById("OwnerPostalCode1").value = document.getElementById("ClientPostalCode2").value;

    document.getElementById("OwnerProvince1").value = document.getElementById("ClientProvince2").value;

    setProvinceFrom("OwnerProvince1", "ClientProvince2");
    
    document.getElementById("OwnerCountry1").value = document.getElementById("ClientCountry2").value;

    document.getElementById("OwnerEmail1").value = document.getElementById("ClientEmail2").value;

    document.getElementById("OwnerPhone1").value = document.getElementById("ClientPhone2").value;

    document.getElementById("OwnerExteraContactInformationLabel1").value = document.getElementById("ClientExteraContactInformationLabel2").value;

    setProvinceFrom("OwnerExteraContactInformationLabel1", "ClientExteraContactInformationLabel2");

    document.getElementById("OwnerExteraContact1").value = document.getElementById("ClientExteraContact2").value;
  } else if (CustomerOption === 3) {

    document.getElementById("OwnerType1").value = document.getElementById("ClientType1").value;

    ChecksPartiesType('OwnerType1', 'OwnerIndividusal1', 'OwnerNotAnIndividusal1');

    selVal1.innerHTML = document.getElementById("ClientType1").value;

    document.getElementById("OwnerBusinessName1").value = document.getElementById("ClientBusinessName1").value;

    document.getElementById("OwnerSigningOfficere1").value = document.getElementById("ClientSigningOfficere1").value;

    document.getElementById("OwnerFirstName1").value = document.getElementById("ClientFirstName1").value;

    document.getElementById("OwnerLastName1").value = document.getElementById("ClientLastName1").value;

    document.getElementById("OwnerUnitNumber1").value = document.getElementById("ClientUnitNumber1").value;

    document.getElementById("OwnerStreetNumber1").value = document.getElementById("ClientStreetNumber1").value;

    document.getElementById("OwnerStreetName1").value = document.getElementById("ClientStreetName1").value;

    document.getElementById("OwnerCity1").value = document.getElementById("ClientCity1").value;

    document.getElementById("OwnerPostalCode1").value = document.getElementById("ClientPostalCode1").value;

    document.getElementById("OwnerProvince1").value = document.getElementById("ClientProvince1").value;

    setProvinceFrom("OwnerProvince1", "ClientProvince1");

    document.getElementById("OwnerCountry1").value = document.getElementById("ClientCountry1").value;

    document.getElementById("OwnerEmail1").value = document.getElementById("ClientEmail1").value;

    document.getElementById("OwnerPhone1").value = document.getElementById("ClientPhone1").value;

    document.getElementById("OwnerExteraContactInformationLabel1").value = document.getElementById("ClientExteraContactInformationLabel1").value;

    setProvinceFrom("OwnerExteraContactInformationLabel1", "ClientExteraContactInformationLabel1");

    document.getElementById("OwnerExteraContact1").value = document.getElementById("ClientExteraContact1").value;

    document.getElementById("Owner2").style.display = '';

    selVal2.innerHTML = document.getElementById("ClientType2").value;

    document.getElementById("OwnerType2").value = document.getElementById("ClientType2").value;

        
    ChecksPartiesType('OwnerType2', 'OwnerIndividusal2', 'OwnerNotAnIndividusal2');

    document.getElementById("OwnerBusinessName2").value = document.getElementById("ClientBusinessName2").value;

    document.getElementById("OwnerSigningOfficere2").value = document.getElementById("ClientSigningOfficere2").value;

    document.getElementById("OwnerFirstName2").value = document.getElementById("ClientFirstName2").value;

    document.getElementById("OwnerLastName2").value = document.getElementById("ClientLastName2").value;

    document.getElementById("OwnerUnitNumber2").value = document.getElementById("ClientUnitNumber2").value;

    document.getElementById("OwnerStreetNumber2").value = document.getElementById("ClientStreetNumber2").value;

    document.getElementById("OwnerStreetName2").value = document.getElementById("ClientStreetName2").value;

    document.getElementById("OwnerCity2").value = document.getElementById("ClientCity2").value;

    document.getElementById("OwnerPostalCode2").value = document.getElementById("ClientPostalCode2").value;

    document.getElementById("OwnerProvince2").value = document.getElementById("ClientProvince2").value;

    setProvinceFrom("OwnerProvince2", "ClientProvince2");

    document.getElementById("OwnerCountry2").value = document.getElementById("ClientCountry2").value;

    document.getElementById("OwnerEmail2").value = document.getElementById("ClientEmail2").value;

    document.getElementById("OwnerPhone2").value = document.getElementById("ClientPhone2").value;

    document.getElementById("OwnerExteraContactInformationLabel2").value = document.getElementById("ClientExteraContactInformationLabel2").value;

    setProvinceFrom("OwnerExteraContactInformationLabel2", "ClientExteraContactInformationLabel2");

    document.getElementById("OwnerExteraContact2").value = document.getElementById("ClientExteraContact2").value;
  }


}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function SameOwerClient() {

  if (document.getElementById("OwnerDifferance1").checked === false) {

    document.getElementById("SelectClientsCustom").style.display = "none";

    document.getElementById("SelectClientsDiv").style.display = "none";

  } else {
    document.getElementById("SelectClientsCustom").style.display = "block";
    document.getElementById("SelectClientsDiv").style.display = "flex";
  }

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function DealTypeTitleSet() {

  var DealType = document.getElementById("DealType").value;

  if(document.getElementById('Title1').getElementsByTagName('span').length > 0){
    let id = document.getElementById('Title1').getElementsByTagName('span')[0].innerHTML;
    document.getElementById("Title1").innerHTML = DealType + '<span>'+id+'</span>';
  }else{
    document.getElementById("Title1").innerHTML = DealType;
  }

  document.getElementById("Title2").innerHTML = DealType;

  document.getElementById("Title3").innerHTML = DealType;

  document.getElementById("Title4").innerHTML = DealType;

  document.getElementById("Title5").innerHTML = DealType;

  document.getElementById("Title6").innerHTML = DealType;

  if(document.getElementById('ServiceDescription').value){

    document.getElementById("InvoiceFeeLabel").innerHTML = document.getElementById('ServiceDescription').value;
  
  }else{

    document.getElementById("InvoiceFeeLabel").innerHTML = DealType + " " + "Fee"

  }




  if (DealType === "Consulting" || DealType === "Other") {
    document.getElementById('ServiceDescription').value = '';
    document.getElementById('ServiceDescription').placeholder = "Provide service description";

    document.getElementById("field").className = 'NoMandatoryThree';

    document.getElementById("ServiceMandatory").className = "MandentorySign";

    document.getElementById("AddressField1").className = "NoMandatory";

    document.getElementById("AddressField2").className = "NoMandatory";

    document.getElementById("AddressField3").className = "NoMandatory";

    document.getElementById("AddressField4").className = "NoMandatory";

    document.getElementById("AddressField5").className = "NoMandatory";

    document.getElementById("AddressField6").className = "NoMandatory";

  document.getElementById("ServiceMandatory").style.borderColor = "lightgrey";
  document.getElementById("StreetNumber").style.borderColor = "lightgrey";
  document.getElementById("StreetName").style.borderColor = "lightgrey";
  document.getElementById("City").style.borderColor = "lightgrey";
  document.getElementById("PostalCode").style.borderColor = "lightgrey";
  document.getElementById("Country").style.borderColor = "lightgrey";

  } else {

    document.getElementById('ServiceDescription').placeholder = "";
    document.getElementById('ServiceDescription').value =  DealType;

    document.getElementById("field").className = 'MandentorySign';


    document.getElementById("AddressField6").className = "MandentorySign";

    document.getElementById("AddressField5").className = "MandentorySign";

    document.getElementById("AddressField4").className = "MandentorySign";

    document.getElementById("AddressField3").className = "MandentorySign";

    document.getElementById("AddressField2").className = "MandentorySign";

    document.getElementById("AddressField1").className = "MandentorySign";

    document.getElementById("ServiceMandatory").className = "NoMandatory";

  }

  // MandentpryFieldsSetup();

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// function MandentpryFieldsSetup() {

//   var DealType = document.getElementById("DealType").value;

//   if (DealType === "Consulting") {

//     document.getElementById("Owner1feild1").style.display = "none";

//     document.getElementById("Owner1feild2").style.display = "none";

//     document.getElementById("Owner1feild3").style.display = "none";

//     document.getElementById("Owner1feild4").style.display = "none";

//     document.getElementById("Owner1feild5").style.display = "none";

//     document.getElementById("Owner1feild6").style.display = "none";

//     document.getElementById("Owner1feild7").style.display = "none";

//     document.getElementById("Owner1feild8").style.display = "none";

//     document.getElementById("Owner1feild9").style.display = "none";

//     document.getElementById("Owner1feild10").style.display = "none";

//     document.getElementById("Owner1feild11").style.display = "none";

//     document.getElementById("Owner1feild12").style.display = "none";

//     document.getElementById("Owner1feild13").style.display = "none";

//     document.getElementById("Owner2feild1").style.display = "none";

//     document.getElementById("Owner2feild2").style.display = "none";

//     document.getElementById("Owner2feild3").style.display = "none";

//     document.getElementById("Owner2feild4").style.display = "none";

//     document.getElementById("Owner2feild5").style.display = "none";

//     document.getElementById("Owner2feild6").style.display = "none";

//     document.getElementById("Owner2feild7").style.display = "none";

//     document.getElementById("Owner2feild8").style.display = "none";

//     document.getElementById("Owner2feild9").style.display = "none";

//     document.getElementById("Owner2feild10").style.display = "none";

//     document.getElementById("Owner2feild11").style.display = "none";

//     document.getElementById("Owner2feild12").style.display = "none";

//     document.getElementById("Owner2feild13").style.display = "none";

//   } else {

//     document.getElementById("Owner1feild1").style.display = "";

//     document.getElementById("Owner1feild2").style.display = "";

//     document.getElementById("Owner1feild3").style.display = "";

//     document.getElementById("Owner1feild4").style.display = "";

//     document.getElementById("Owner1feild5").style.display = "";

//     document.getElementById("Owner1feild6").style.display = "";

//     document.getElementById("Owner1feild7").style.display = "";

//     document.getElementById("Owner1feild8").style.display = "";

//     document.getElementById("Owner1feild9").style.display = "";

//     document.getElementById("Owner1feild10").style.display = "";

//     document.getElementById("Owner1feild11").style.display = "";

//     document.getElementById("Owner1feild12").style.display = "";

//     document.getElementById("Owner1feild13").style.display = "";

//     document.getElementById("Owner2feild1").style.display = "";

//     document.getElementById("Owner2feild2").style.display = "";

//     document.getElementById("Owner2feild3").style.display = "";

//     document.getElementById("Owner2feild4").style.display = "";

//     document.getElementById("Owner2feild5").style.display = "";

//     document.getElementById("Owner2feild6").style.display = "";

//     document.getElementById("Owner2feild7").style.display = "";

//     document.getElementById("Owner2feild8").style.display = "";

//     document.getElementById("Owner2feild9").style.display = "";

//     document.getElementById("Owner2feild10").style.display = "";

//     document.getElementById("Owner2feild11").style.display = "";

//     document.getElementById("Owner2feild12").style.display = "";

//     document.getElementById("Owner2feild13").style.display = "";

//     // document.getElementById("OwnerCopyPropertyAddress2").style.display = "";

//     // document.getElementById("OwnerCopyPropertyAddress1").style.display = "";

//     // document.getElementById("CopyPropertyAddress2").style.display = "";

//     // document.getElementById("CopyPropertyAddress1").style.display = "";

//     // document.getElementById('ClientAddress').className = '';

//     // document.getElementById('ClientAddress2').className = '';
//   }

// }


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function ConfirmHST(){
	
//  alert("Hello");

 var Fee =parseFloat( document.getElementById("BreakdownGrossFeeAmount").value.replace(/,/g, '').replace('$', ''));
	 
 var agent1 =parseFloat( document.getElementById("BreakdownAgent1Amount").value.replace(/,/g, '').replace('$', ''));
	 
 var agent2 =0;//parseFloat( document.getElementById("BreakdownAgent2Amount").value.replace(/,/g, '').replace('$', ''));
 
	
 var HST1 =parseFloat( document.getElementById("BreakdownGrossFeeAmountHSTPercent").value.replace(/,/g, '').replace('$', ''));
 
 //document.getElementById("BreakdownGrossFeeAmountHSTPercent").value=HST1;
		 
 var HST2=parseFloat( document.getElementById("BreakdownAgent1HSTPercent").value.replace(/,/g, '').replace('$', ''));
			 
 var HST3=0;//parseFloat( document.getElementById("BreakdownAgent2HSTPercent").value.replace(/,/g, '').replace('$', ''));
 

 var HSTAmount1 =(Fee*HST1)/100;
		 
 var HSTAmount2=(agent1*HST2)/100;
					 
 var HSTAmount3=(agent2*HST3)/100;

	 
	 
 document.getElementById("BreakdownGrossFeeAmountHST").value = parseFloat(HSTAmount1).toLocaleString(undefined, {
  minimumFractionDigits: 2, maximumFractionDigits: 2
});
 
 document.getElementById("BreakdownAgent1HST").value=parseFloat(HSTAmount2).toLocaleString(undefined, {
  minimumFractionDigits: 2, maximumFractionDigits: 2
});
 
 document.getElementById("BreakdownAgent2HST").value=parseFloat(HSTAmount3).toLocaleString(undefined, {
  minimumFractionDigits: 2, maximumFractionDigits: 2
});
	 
 var TotalAmount1 = HSTAmount1+Fee;
		 
 var TotalAmount2=HSTAmount2+agent1;
							 
 var TotalAmount3=HSTAmount3+agent2;	
 
// alert("TotalAmount3"+" "+TotalAmount3);
 
//  var Total1 = Fee - HSTAmount1;

//  var Total2 = agent1 - HSTAmount2;

//  var Total3 = agent2 - HSTAmount3;


 var TotalNet = document.getElementById("BreakdownNetFee").value.replace(/,/g, '').replace('$', '');;

//  var TotalNetHST = document.getElementById("BreakdownNetHST").value;

 document.getElementById("BreakdownGrossFeeTotal").value=parseFloat(TotalAmount1).toLocaleString(undefined, {
  minimumFractionDigits: 2, maximumFractionDigits: 2
});

 document.getElementById("BreakdownAgent1Total").value=parseFloat(TotalAmount2).toLocaleString(undefined, {
  minimumFractionDigits: 2, maximumFractionDigits: 2
});

 document.getElementById("BreakdownAgent2Total").value=parseFloat(TotalAmount3).toLocaleString(undefined, {
  minimumFractionDigits: 2, maximumFractionDigits: 2
});

 var TotalNetHST = parseFloat(    (HSTAmount1-(HSTAmount2+HSTAmount3))    );
 
 document.getElementById("BreakdownNetHST").value =parseFloat(TotalNetHST).toLocaleString(undefined, {
  minimumFractionDigits: 2, maximumFractionDigits: 2
 });
	 
 document.getElementById("BreakdownNetTotal").value= parseFloat(TotalNet + +TotalNetHST).toLocaleString(undefined, {
  minimumFractionDigits: 2, maximumFractionDigits: 2
 });
 
// alert("test"+" "+ document.getElementById("BreakdownNetHST").value);
	
}

function addPercent(id){
    
  document.getElementById(id).value=parseFloat(document.getElementById(id).value).toFixed(2) + '%';

  // maxlengthCheckHST(obj);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*function PrintPDF(Content){

var doc = new jsPDF();  //create jsPDF object

 //doc.text(20, 20, document.getElementById(Content).innerHTML);
doc.fromHTML($(Content)[0], // page element which you want to print as PDF
15,
15, 
{
  'width': 170  //set width
},
function(SavePDF) 
 {
  doc.save("MasterProBroker.pdf"); // save file name as HTML2PDF.pdf
});
}*/

function onClick(id) {

  var element = document.getElementById(id);
  element.addEventListener("click", onClick);
  html2canvas(document.body, {
    onrendered: function (canvas) {

      var img = canvas.toDataURL("image/png");
      var doc = new jsPDF();
      doc.addImage(img, 'JPEG', 0, 0, 150, 100);
      doc.save('test.pdf');
    }

  });
}


function SetAgentsName() {

  document.getElementById('Agent1ID').innerHTML = document.getElementById('FirstAgentID').value;

  document.getElementById('Agent2ID').innerHTML = document.getElementById('SecondAgentID').value;
}

function ifProvinceOther(province, country){

  if(document.getElementById(province).value === "Other"){
    document.getElementById(country).readOnly = false;
  }else{
    document.getElementById(country).readOnly = true;
    document.getElementById(country).value = "Canada";
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

function after(value){
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



function ValidatePostalCode(id) {
  let b = document.getElementById(id).value;
  let check = 0;
  const regEx = /[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]/;
  let a = b.replace(/ /g, '').toUpperCase();

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

function Display(id1, id2){
  if(document.getElementById(id1).value === 'Other'){
      document.getElementById(id2).style.display = 'flex'
  }else{document.getElementById(id2).style.display = 'none'; Empty(id2)   }
}

function ProvinceCheck(){
	

	let Province= document.getElementById("PropertyProvince").value;

	let HST=0.00;

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

	HST=parseFloat( document.getElementById("HSTAMount").value ).toFixed(2);
	
	
	return HST;


}



function SetMyClients(id) {



  let mydiv = document.getElementById(id).parentElement;
  let elements = mydiv.getElementsByClassName('select-items');
  let divselect = elements[0];

  while (divselect.firstChild) {
    //The list is LIVE so it will re-index each call
    divselect.removeChild(divselect.firstChild);
  }



  let MyselectClient = document.getElementById(id);

  let lenght = MyselectClient.options.length;

  while (lenght--) {
    MyselectClient.remove(lenght);
  }

  let FirstClient = "";

  let SecondClient = "";

  let Clients = ['Negar', 'Hapo'];



  for (let i = 0; i < Clients.length; i++) {
   let options = Clients[i];
   let singleElemet = document.createElement("option");
    singleElemet.textContent = options;
    singleElemet.value = options;
    MyselectClient.appendChild(singleElemet);
  } //Close for

  for (let i = 0; i < Clients.length; i++) {

    let a = document.createElement('DIV');
    a.innerHTML = select2.options[i].innerHTML;

    // Adding event listener every time for new div element

    a.addEventListener("click", function (e) {
      /* When an item is clicked, update the original select box,
      and the selected item: */
      let y, i, k, s, h, sl, yl;
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
    tt.innerHTML = '-- Please choose an option --';

    divselect.appendChild(a);
    //alert("Adding elemet"+" "+i);

  }



}




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
    tt.innerHTML = '-- Please choose an option --';

    divselect.appendChild(a);
    //alert("Adding elemet"+" "+i);

  }

}

function fillHST(){

	
  var  HST=ProvinceCheck();

  document.getElementById('BreakdownGrossFeeAmountHSTPercent').value = HST+ '%';
  
  document.getElementById('BreakdownAgent1HSTPercent').value = HST+ '%';

  document.getElementById('BreakdownAgent2HSTPercent').value = HST + '%';

}




function fillHSTUpdate(HST1 ,HST2 ,HST3){

	
	console.log(HST1=='');
	
    if(  HST1==''){

      document.getElementById('BreakdownGrossFeeAmountHSTPercent').value = 0+ '%';
    }else{
    	

      document.getElementById('BreakdownGrossFeeAmountHSTPercent').value = HST1;
    }

    if(  HST2==''){

      document.getElementById('BreakdownAgent1HSTPercent').value = 0+ '%';
    }else{
    	

      document.getElementById('BreakdownAgent1HSTPercent').value = HST2;
    }

    if(  HST3==''){

      document.getElementById('BreakdownAgent2HSTPercent').value = 0 + '%';
    }else{
    	

      document.getElementById('BreakdownAgent2HSTPercent').value = HST3 ;
    }
	  


	}


function editHST(){

  let a = document.getElementById('tableTwo');
  let b = a.getElementsByClassName('withBorder');
  for(let i=0; i<b.length; i++){
      b[i].classList.remove("noBorder");
      b[i].readOnly = false;
  }
  
  document.getElementById('HSTHead1').style.display = '';
  document.getElementById('BreakdownGrossFeeAmountHSTPercentTD').style.display = '';
  document.getElementById('BreakdownAgent1HSTPercentTD').style.display = '';
  document.getElementById('BreakdownAgent2HSTPercentTD').style.display = '';
  document.getElementById('EmptyPercent').style.display = '';

  document.getElementById('EditSubmit').style.display = '';
  document.getElementById('EditDiscard').style.display = '';

  document.getElementById('Editbtn').style.display = 'none';
  
}

function submitHST(){
	
  //Add calculations
	
  ConfirmHST();
  
  let a = document.getElementById('tableTwo');
  let b = a.getElementsByClassName('withBorder');
  for(let i=0; i<b.length; i++){
      b[i].classList.add("noBorder");
      b[i].readOnly = true;
  }
  // .forEach(element => element.classList.add("noBorder"));

  document.getElementById('EditSubmit').style.display = 'none';
  document.getElementById('EditDiscard').style.display = 'none';

  document.getElementById('Editbtn').style.display = '';
  // document.getElementById('EditDelete').style.display = '';
  
  

  
	var HST1=parseFloat(document.getElementById('BreakdownGrossFeeAmountHSTPercent').value.replace(/,/g, ''));
	
	var HST2=parseFloat(document.getElementById('BreakdownAgent1HSTPercent').value.replace(/,/g, ''));
	
	var HST3=parseFloat(document.getElementById('BreakdownAgent2HSTPercent').value.replace(/,/g, ''));
	

	
	var amount1=parseFloat(document.getElementById('BreakdownGrossFeeAmount').value.replace(/,/g, ''));
	
  var amount2=parseFloat(document.getElementById('BreakdownAgent1Amount').value.replace(/,/g, ''));
			
	var amount3=0//document.getElementById('BreakdownAgent2Amount').value;
	

	
	// amount1=amount1.replace(/\,/g,''); 
	
	// amount1=parseFloat(amount1);
	

	// amount2=amount2.replace(/\,/g,''); 
	
	// amount2=parseFloat(amount2);
	

	//amount3=amount3.replace(/\,/g,''); 
	
	//amount3=parseFloat(amount3);

	var newHST1=(amount1*HST1)/100;
	
	var newHST2=(amount2*HST2)/100;
		
	var newHST3=(parseFloat(amount3)*HST3)/100;	


	document.getElementById('BreakdownGrossFeeAmountHST').value=(newHST1).toLocaleString(undefined, {
    minimumFractionDigits: 2, maximumFractionDigits: 2
  })
	document.getElementById('BreakdownAgent1HST').value=(newHST2).toLocaleString(undefined, {
    minimumFractionDigits: 2, maximumFractionDigits: 2
  });
	document.getElementById('BreakdownAgent2HST').value=(newHST3).toLocaleString(undefined, {
    minimumFractionDigits: 2, maximumFractionDigits: 2
  });
	var TotalValue1=parseFloat(newHST1)+parseFloat(amount1);
		
	var TotalValue2=parseFloat(newHST2)+parseFloat(amount2);
			
  var TotalValue3=0;//parseFloat(newHST3)+parseFloat(amount3);
  
  document.getElementById('BreakdownGrossFeeTotal').value=((TotalValue1).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  
  document.getElementById('BreakdownAgent1Total').value=((TotalValue2).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  
  document.getElementById('BreakdownAgent2Total').value=((TotalValue3).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  
  ////////////////////////////////////////////////////////////////
  
  document.getElementById('BreakdownNetTotal').value=( (TotalValue1-(TotalValue2+TotalValue3)).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  
  document.getElementById('BreakdownNetHST').value=(( newHST1-(newHST2+newHST3) ).toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  
}

function discardHST(){

  //Add clearing


      document.getElementById('HSTHead1').style.display = 'none';
      document.getElementById('BreakdownGrossFeeAmountHSTPercentTD').style.display = 'none';
      document.getElementById('BreakdownAgent1HSTPercentTD').style.display = 'none';
      document.getElementById('BreakdownAgent2HSTPercentTD').style.display = 'none';
      document.getElementById('EmptyPercent').style.display = 'none';
      
      document.getElementById('EditSubmit').style.display = 'none';
      document.getElementById('EditDiscard').style.display = 'none';
      // document.getElementById('EditDelete').style.display = 'none';
  
      document.getElementById('Editbtn').style.display = '';
      
      document.getElementById("myModalHST").style.display = 'none';
    
    
    
    var HST= ProvinceCheck();
    
	var HST1=HST;
	
	var HST2=HST;
	
	var HST3=HST;

	var amount1=parseFloat(document.getElementById('BreakdownGrossFeeAmount').value.replace(/,/g, ''));
	
  var amount2=parseFloat(document.getElementById('BreakdownAgent1Amount').value.replace(/,/g, ''));
			
	var amount3=0//document.getElementById('BreakdownAgent2Amount').value;
	
	
	// amount1=amount1.replace(/\,/g,''); 
	
	// amount1=parseFloat(amount1);
	

	// amount2=amount2.replace(/\,/g,''); 
	
	// amount2=parseFloat(amount2);
	

	//amount3=amount3.replace(/\,/g,''); 
	
	//amount3=parseFloat(amount3);
	
	
	var newHST1=(amount1*parseFloat(HST1) )/100;
	
	var newHST2=(amount2*parseFloat(HST2 ))/100;
		
	var newHST3=0//(parseFloat(amount3)* parseFloat( HST3) )/100;	
	
	//alert(newHST1);
	
	document.getElementById('BreakdownGrossFeeAmountHST').value= (newHST1).toLocaleString(undefined, {
    minimumFractionDigits: 2, maximumFractionDigits: 2
  });
	document.getElementById('BreakdownAgent1HST').value=(newHST2).toLocaleString(undefined, {
    minimumFractionDigits: 2, maximumFractionDigits: 2
  });
	document.getElementById('BreakdownAgent2HST').value=(newHST3).toLocaleString(undefined, {
    minimumFractionDigits: 2, maximumFractionDigits: 2
  });
	var TotalValue1= parseFloat(newHST1)+amount1 ;
		
	var TotalValue2= parseFloat(newHST2)+amount2 ;
			
    var TotalValue3=0;//parseFloat(newHST3)+parseFloat(amount3);
    
    document.getElementById('BreakdownGrossFeeTotal').value=(TotalValue1).toLocaleString(undefined, {
      minimumFractionDigits: 2, maximumFractionDigits: 2
    });
    document.getElementById('BreakdownAgent1Total').value=(TotalValue2).toLocaleString(undefined, {
      minimumFractionDigits: 2, maximumFractionDigits: 2
    });
    document.getElementById('BreakdownAgent2Total').value=(TotalValue3).toLocaleString(undefined, {
      minimumFractionDigits: 2, maximumFractionDigits: 2
    });

    ////////////////////////////////////////////////////////////////
    
    document.getElementById('BreakdownNetTotal').value=( (TotalValue1-(TotalValue2+TotalValue3)).toFixed(2) ).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    document.getElementById('BreakdownNetHST').value=( ( newHST1-(newHST2+newHST3) ).toFixed(2)  ).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    
    
	document.getElementById('BreakdownGrossFeeAmountHSTPercent').value = HST + '%';
	
	document.getElementById('BreakdownAgent1HSTPercent').value = HST + '%';
	
	document.getElementById('BreakdownAgent2HSTPercent').value = HST + '%';

}

function closeAllWindows() {

  $(".inlineButton").removeClass("inlineButton");

  $(".openSaveButton").removeClass("openSaveButton");

}


function openWindowFinalized(id1, id2, event) {
  if (!document.getElementById(id1).classList.contains('inlineButton')) {

      document.getElementById(id1).classList.add('inlineButton');   
      document.getElementById(id2).classList.add('openSaveButton');

  } else {

      document.getElementById(id1).classList.remove('inlineButton');
      document.getElementById(id2).classList.remove('openSaveButton');
  }
  event.stopPropagation();
}

function openWindow(id1, id2, id2_2, condition, id3, id4, idDiscard) {
  if (!document.getElementById(id1).classList.contains('inlineButton')) {

      document.getElementById(id1).classList.add('inlineButton');
      document.getElementById(id3).classList.add('inlineButton');

      if (condition) {
          document.getElementById(id2_2).classList.add('inlineButton');
      } else {
          document.getElementById(id2).classList.add('inlineButton');
      }

      document.getElementById(id4).classList.add('openSaveButton');

  } else {

      document.getElementById(id1).classList.remove('inlineButton');
      document.getElementById(id3).classList.remove('inlineButton');

      if (condition) {
          document.getElementById(id2_2).classList.remove('inlineButton');
      } else {
          document.getElementById(id2).classList.remove('inlineButton');
      }

      document.getElementById(id4).classList.remove('openSaveButton');

  }
}


function completeRecord(){
  if(document.getElementById('ConfirmationRecordSheet')){
    if(document.getElementById('ConfirmationRecordSheet').checked == true){
      document.getElementById('ApprasialRecordSheetTabIMG').src = "../ImagesUsed/Accept.png";
      document.getElementById('ApprasialRecordSheetTabIMG').classList.add('accepted');
      document.getElementById("ConfirmationRecordCheckbox").classList.add("bluecheck");

    }else{
      document.getElementById('ApprasialRecordSheetTabIMG').src = "../ImagesUsed/Didnotaccept.png";
      document.getElementById('ApprasialRecordSheetTabIMG').classList.remove('accepted');
      document.getElementById("ConfirmationRecordCheckbox").classList.remove("bluecheck");
    }
  }
}

function limiting(object){
  object.value = parseFloat(object.value).toFixed(2);
}

function clearing(id){
  if(document.getElementById(id).value > 0){
		document.getElementById(id).parentElement.style.borderColor = "lightgrey";
	}else{document.getElementById(id).parentElement.style.borderColor = "red";}
}

function clearingPercent(id){
  if(!(document.getElementById(id).value > 0 && document.getElementById(id).value < 100)){
		document.getElementById(id).parentElement.style.borderColor = "red";
	}else{document.getElementById(id).parentElement.style.borderColor = "lightgrey";}
}

function setProvince(id1) {
  const mydiv = document.getElementById(id1).parentElement;
  const tt = mydiv.getElementsByClassName('select-selected')[0];
  tt.innerHTML = document.getElementById("PropertyProvince").value;
}

function setProvinceFrom(id1, id2) {
  const mydiv = document.getElementById(id1).parentElement;
  const tt = mydiv.getElementsByClassName('select-selected')[0];
  tt.innerHTML = document.getElementById(id2).value;
}

function forSelects() {
  let x, i, j, l, ll, selElmnt, a, b, c;
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
        let y, i, k, s, h, sl, yl;
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

document.addEventListener("click", closeAllSelect);

function postalCorrect(id){

  document.getElementById(id).addEventListener('blur', postalCorrectAddon(id));

}

function postalCorrectAddon(id){

  if(document.getElementById(id).value != ''){
  const b = document.getElementById(id).value;
  const a = b.replace(/ /g, '').toUpperCase();
  const res = a.slice(0, 3) + " " + a.slice(3);
  document.getElementById(id).value = res;
  if(ValidatePostalCode(id)){
      document.getElementById(id).style.borderColor = "lightgrey";
  }else{document.getElementById(id).style.borderColor = "red";}
}

}

function emailCorrect(id){
  if(ValidateEmail(id)){
      document.getElementById(id).style.borderColor = "lightgrey";
  }else{document.getElementById(id).style.borderColor = "red";}
}

function maxLengthCheck(object){
	if (object.value >= 100){
		object.value = parseFloat(99.991).toFixed(2);
	}else if(object.value <= 0){
		object.value =  parseFloat(0.01).toFixed(2);
	}
}

function maxLengthCheck100(object){
	if (object.value >= 100){
		object.value = 100;
	}else if(object.value < 0){
		object.value = 0;
	}
  }


  function maxlengthCheckHST(object){

    var NoPercentobjValue = parseFloat(object.value).toFixed(2);
	if (NoPercentobjValue > 15){
		object.value = parseFloat(15.00).toFixed(2) + '%';
	}else if(NoPercentobjValue <= 0){
		object.value = parseFloat(0.00).toFixed(2) + '%';
	}

}

function fileOpened(agentName){

  var datenow = new Date().toLocaleTimeString([], {year: 'numeric', month: 'numeric', day: 'numeric', hour: '2-digit', minute: '2-digit'});
  // var agentName = 'James Bond';
  // var id = 'AuditTrail'+countTrail;

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

function validateSendInvoice(){
  var Error = 0;
  var recepient = 0;

  var arr = document.getElementById('Addressee').getElementsByTagName('input');

  document.getElementById('emptyEmailFields').style.display = 'none';
  for(let i = 0; i<arr.length; i++){
      if(arr[i].checked){recepient++}
  }
  console.log(recepient)
  if(recepient==0){
      document.getElementById('emptyAdresseeError').style.display = '';
      Error = 1;
  }else{
      document.getElementById('emptyAdresseeError').style.display = 'none';
  }

  if(document.getElementById('subjectLineEmail').value.trim()){
      document.getElementById('subjectLineEmail').style.borderColor = '';
  }else{
      document.getElementById('subjectLineEmail').style.borderColor = 'red';
      document.getElementById('emptyEmailFields').style.display = '';
      Error = 1;
  }
  if(document.getElementById('messageEmail').value.trim()){
      document.getElementById('messageEmail').style.borderColor = '';
  }else{
      document.getElementById('messageEmail').style.borderColor = 'red';
      document.getElementById('emptyEmailFields').style.display = '';
      Error = 1;
  }

  if(Error == 0){
      document.getElementById('SendEmailInvoice').type = 'submit';
      document.getElementById('comissionEmailed').style.display = '';
      fileEmailed("agentNameHidden");
      document.getElementById('myModalEmail').style.display = '';
      EmailedPopup();
  }else{
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

// var modalEmailSent = document.getElementById("myModalEmailSent");

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

function fileEmailed(id){
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
          if(elem2.length>0 && elem.length>0){
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

  var datenow = new Date().toLocaleTimeString([], {year: 'numeric', month: 'numeric', day: 'numeric', hour: '2-digit', minute: '2-digit'});
  var agentName = document.getElementById('agentNameHidden').value;


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
function fileUdated(id){
  const datenow = new Date().toLocaleTimeString([], {year: 'numeric', month: 'numeric', day: 'numeric', hour: '2-digit', minute: '2-digit'});
  const agentName = document.getElementById(id).value;

  let forAuditNote = document.createElement("DIV");
  forAuditNote.setAttribute("class", 'FileUpdated flexibleContainer');

  document.getElementById('AuditNotes').appendChild(forAuditNote);

  let forIconDiv = document.createElement("DIV");
  forIconDiv.setAttribute("class", 'flexible auditIcon');

  let forAuditBody = document.createElement("DIV");
  forAuditBody.setAttribute("class", 'flexible auditBody');

  forAuditNote.appendChild(forIconDiv);
  forAuditNote.appendChild(forAuditBody);

  let iconSpan = document.createElement("span");
  iconSpan.setAttribute("class", 'logoaudit');
  forIconDiv.appendChild(iconSpan);

  let BodyHeaderLabel = document.createElement("LABEL");
  BodyHeaderLabel.setAttribute("class", 'headline');
  BodyHeaderLabel.innerHTML = 'File was updated by ' + agentName;

  let BodyDateLabel = document.createElement("LABEL");
  BodyDateLabel.setAttribute("class", 'description');
  BodyDateLabel.innerHTML = datenow;

  let breakelem = document.createElement("br");

  forAuditBody.appendChild(BodyHeaderLabel);
  forAuditBody.appendChild(breakelem);

  forAuditBody.appendChild(BodyDateLabel);

  document.getElementById('allNotesInput').value = document.getElementById('AuditNotes').innerHTML;
}

function saveNotes(fname, lname){
let countNotes = 0;
if(document.getElementById('ExteraNotes').value.trim()){
	
  document.getElementById('allNotesDocuments').value=document.getElementById('ExteraNotes').value;	
  document.getElementById('ExteraNotes').parentElement.style.borderColor = '';
  let datenow = new Date().toLocaleTimeString([], {year: 'numeric', month: 'numeric', day: 'numeric', hour: '2-digit', minute: '2-digit'});
  let id = 'Note'+countNotes;
  let forNotesDIV = document.createElement("DIV");
  forNotesDIV.setAttribute("id", id);
  forNotesDIV.setAttribute("class", 'forNotesStyle');
  let NotesNameLabel = document.createElement("LABEL");
  NotesNameLabel.innerHTML =  fname + ' ' +lname;
  let NotesDateLabel = document.createElement("LABEL");
  NotesDateLabel.innerHTML = datenow;
  NotesDateLabel.setAttribute("class", 'floatDataRightSide');
  let NopeParagraph = document.createElement("P");
  NopeParagraph.innerHTML = document.getElementById('ExteraNotes').value;
  document.getElementById('ExteraNotes').value = '';
  let DeleteLabel = document.createElement("i");
  DeleteLabel.setAttribute("onclick", "deleteNote('"+id+"')");
  DeleteLabel.setAttribute("class", 'deleteImg bi bi-trash floatDataRightSide');
  
  document.getElementById('forNotes').appendChild(forNotesDIV);

  forNotesDIV.appendChild(NotesNameLabel);
  forNotesDIV.appendChild(NotesDateLabel);
  forNotesDIV.appendChild(NopeParagraph);
  NopeParagraph.appendChild(DeleteLabel);

  countNotes++;
}else{
  document.getElementById('ExteraNotes').parentElement.style.borderColor = 'red';
}
}
function deleteNote(id){
	
let element = document.getElementById(id);

element.style.display="none";

}
function emailonloadOther(){
  $.getScript("../Scripts/FillEmail.js").then(function() {
  CreateEmailsOther();
});
}