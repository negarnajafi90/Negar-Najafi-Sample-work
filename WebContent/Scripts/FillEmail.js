
function createElementsWExtraFields(amount, section, startid){
  var box = document.getElementById('Addressee').getElementsByClassName(section)[0].getElementsByClassName('flexibleContainer')[0];
  var counter = startid;

  for(let i=0; i<amount; i++){
    // create div for email 
    let body = document.createElement("DIV");
    body.setAttribute('class', 'flexible flexibleContainer');

    // create div for checkbox
    let checkboxdiv = document.createElement("DIV");
    checkboxdiv.setAttribute('class', 'flexible check');

    // create div for names and email
    let namesDiv = document.createElement("DIV");
    namesDiv.setAttribute('class', 'flexible names');

    // put them in
    body.appendChild(checkboxdiv);
    body.appendChild(namesDiv);

    // fill in checkbox with input
    let checklabel = document.createElement("label");
    checklabel.setAttribute('class', 'container flexible');
    checkboxdiv.appendChild(checklabel);
    let checkinput = document.createElement("input");
    checkinput.setAttribute('class', 'inlineInput');
    checkinput.setAttribute('type', 'checkbox');
    checkinput.setAttribute('id', section+counter);
    checkinput.setAttribute('name', section+counter);
    let checkspan = document.createElement("span");
    checkspan.setAttribute('class', 'checkmark');
    checklabel.appendChild(checkinput);
    checklabel.appendChild(checkspan);

    // fill in namesDiv with labels and input
    let headline = document.createElement("label");
    headline.setAttribute('class', 'heavyfont');
    headline.setAttribute('for', section+counter);
    let nameLine = document.createElement("label");
    nameLine.setAttribute('for', section+counter);
    let busNameLine = document.createElement("label");
    busNameLine.setAttribute('for', section+counter);
    let emailInput = document.createElement("input");
    emailInput.setAttribute('class', 'ref');
    emailInput.setAttribute('id', 'emailValue'+section+counter);
    emailInput.setAttribute('name', 'emailValue'+section+counter);
    emailInput.readOnly = true;

    namesDiv.appendChild(headline);
    namesDiv.appendChild(nameLine);
    namesDiv.appendChild(busNameLine);
    namesDiv.appendChild(emailInput);

    box.appendChild(body);

    counter++;
  }

}

function createElements(amount, section, startid){
    var box = document.getElementById('Addressee').getElementsByClassName(section)[0].getElementsByClassName('flexibleContainer')[0];
    var counter = startid;

    for(let i=0; i<amount; i++){
      // create div for email 
      let body = document.createElement("DIV");
      body.setAttribute('class', 'flexible flexibleContainer');

      // create div for checkbox
      let checkboxdiv = document.createElement("DIV");
      checkboxdiv.setAttribute('class', 'flexible check');

      // create div for names and email
      let namesDiv = document.createElement("DIV");
      namesDiv.setAttribute('class', 'flexible names');

      // put them in
      body.appendChild(checkboxdiv);
      body.appendChild(namesDiv);

      // fill in checkbox with input
      let checklabel = document.createElement("label");
      checklabel.setAttribute('class', 'container flexible');
      checkboxdiv.appendChild(checklabel);
      let checkinput = document.createElement("input");
      checkinput.setAttribute('class', 'inlineInput');
      checkinput.setAttribute('type', 'checkbox');
      checkinput.setAttribute('id', section + counter);
      checkinput.setAttribute('name', section + counter);
      let checkspan = document.createElement("span");
      checkspan.setAttribute('class', 'checkmark');
      checklabel.appendChild(checkinput);
      checklabel.appendChild(checkspan);

      // fill in namesDiv with labels and input
      let headline = document.createElement("label");
      headline.setAttribute('class', 'heavyfont');
      headline.setAttribute('for', section+counter);
      let nameLine = document.createElement("label");
      nameLine.setAttribute('for', section+counter);
      let emailInput = document.createElement("input");
      emailInput.setAttribute('class', 'ref');
      emailInput.setAttribute('id', 'emailValue'+section + counter);
      emailInput.setAttribute('name', 'emailValue'+section + counter);
      emailInput.readOnly = true;

      namesDiv.appendChild(headline);
      namesDiv.appendChild(nameLine);
      namesDiv.appendChild(emailInput);

      box.appendChild(body);

      counter++;
    }


  }

  function clearEmails(){
    let addressee = document.getElementById('Addressee').getElementsByClassName('Addressee')[0];
    let optional = document.getElementById('Addressee').getElementsByClassName('optional')[0];

    addressee.getElementsByClassName('flexibleContainer')[0].innerHTML = '';
    optional.getElementsByClassName('flexibleContainer')[0].innerHTML = '';
  }


  function fillElement(number,section, Name, idAddress, stringName){
    var box = document.getElementById('Addressee').getElementsByClassName(section)[0];
    // console.log(box);
    var elements = box.getElementsByClassName('names');

    elements[number].getElementsByTagName('label')[0].innerHTML = stringName;
    elements[number].getElementsByTagName('label')[1].innerHTML = Name;
    elements[number].getElementsByTagName('input')[0].value = document.getElementById(idAddress).value;;

  };

  function fillElementWExtraField(number,section, Name, Name2, idAddress, stringName){
    var box = document.getElementById('Addressee').getElementsByClassName(section)[0];
    // console.log(box);
    var elements = box.getElementsByClassName('names');

    elements[number].getElementsByTagName('label')[0].innerHTML = stringName;
    elements[number].getElementsByTagName('label')[1].innerHTML = Name;
    elements[number].getElementsByTagName('label')[2].innerHTML = Name2;
    elements[number].getElementsByTagName('input')[0].value = document.getElementById(idAddress).value;;

  };

  function createEmails(){

    if(document.getElementById('AuditNotes').getElementsByClassName('Emailed').length>=1){
      document.getElementById('comissionEmailed').style.display = '';
    }

    var subject = '';

    if(document.getElementById('PropertyUnit').value.trim()){
      subject = document.getElementById('PropertyUnit').value.trim() + ' - ';
    }
      subject += document.getElementById('PropertyStreetNumber').value.trim() + ' ' +  document.getElementById('PropertyStreetName').value.trim() + ', ' +  document.getElementById('PropertyCity').value.trim() + ', ' +  document.getElementById('PropertyProvince').value.trim() + ', ' +  document.getElementById('PropertyPostalCode').value.trim();

    document.getElementById('subjectLineEmail').value = 'Commission statement for ' + subject;
    document.getElementById('messageEmail').value = 'Please see attached our commission statement.' + '\r\n\r\n\r\n\r\n' + 'Kind regards,' + '\r\n\r\n' + document.getElementById('bnHidden').value;


    clearEmails();
    var listingType = document.getElementById('PropertyListingType').value;
    var counter = 0;
    var counter2 = 0;

    document.getElementById('dueTo').innerHTML = document.getElementById('BalanceLabel').innerHTML;
    document.getElementById('paysumEmail').innerHTML = document.getElementById('InvoiceRemaingBalance').innerHTML;

    if(listingType == 'Buyer-Side'){

      createElements(1, 'Addressee', 0);
      let name = document.getElementById('CooperatingAgentName').value;
      fillElement(0, 'Addressee', name, 'CO-OPERATINGBROKERAGEEmail', 'Co-operating brokerage');
      
      if(document.getElementById('VendorLawyerFirm').value.trim()){
        let name = document.getElementById('VendorLawyerName').value;
        let name2 = document.getElementById('VendorLawyerFirm').value;
        createElementsWExtraFields(1, 'optional', counter2);
        fillElementWExtraField(counter2, 'optional', name, name2, 'VendorLawyerEmail', "Vendor's Lawyer");
        counter2++;
      }

      if(document.getElementById('ClerkFullName').value.trim()){
        let name = document.getElementById('ClerkFullName').value;
        createElements(1, 'optional', counter2);
        fillElement(counter2, 'optional', name, 'ClerkEmail', 'Law Clerk');
        counter2++;
      }

      if(document.getElementById('PurchaserLawyerFirm').value.trim()){
        let name = document.getElementById('PurchaserLawyerName').value;
        let name2 = document.getElementById('PurchaserLawyerFirm').value;
        createElementsWExtraFields(1, 'optional', counter2);
        fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserLawyerEmail', "Purchaser's Lawyer");
        counter2++;
      }

     
      if(document.getElementById('VendorType1').value == 'Individual'){
        createElements(1, 'optional', counter2);
        let name = document.getElementById('VendorFirstName1').value + ' ' + document.getElementById('VendorLastName1').value;
        fillElement(counter2, 'optional', name, 'VendorEmail1', 'Vendor');
      }else{
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('VendorAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('VendorBusinessName1').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail1', 'Vendor');
      }
      
      counter2++;

      if(document.getElementById('Vendor2').style.display == 'block' || document.getElementById('Vendor2').style.display == ''){
        if(document.getElementById('VendorType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName2').value + ' ' + document.getElementById('VendorLastName2').value;
          fillElement(counter2, 'optional', name, 'VendorEmail2', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('VendorBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail2', 'Vendor');
        }
        
        counter2++;
      }

      if(document.getElementById('Vendor3').style.display == 'block' || document.getElementById('Vendor3').style.display == ''){
        if(document.getElementById('VendorType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName3').value + ' ' + document.getElementById('VendorLastName3').value;
          fillElement(counter2, 'optional', name, 'VendorEmail3', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('VendorBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail3', 'Vendor');
        }
        counter2++;
      }

      if(document.getElementById('Vendor4').style.display == 'block' || document.getElementById('Vendor4').style.display == ''){
        // createElements(1, 'optional', counter2);
        if(document.getElementById('VendorType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName4').value + ' ' + document.getElementById('VendorLastName4').value;
          fillElement(counter2, 'optional', name, 'VendorEmail4', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('VendorBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail4', 'Vendor');

        }
        counter2++;
      }

      if(document.getElementById('PurchaserType1').value == 'Individual'){
        createElements(1, 'optional', counter2); 
        let name = document.getElementById('PurchaserFirstName1').value + ' ' + document.getElementById('PurchaserLastName1').value; 
        fillElement(counter2, 'optional', name, 'PurchaserEmail1', 'Purchaser');
      }else{
         createElementsWExtraFields(1, 'optional', counter2); 
         let name = document.getElementById('PurchaserAuthorizedSigningOfficer1').value;
         let name2 = document.getElementById('PurchaserBusinessName1').value;  
         fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail1', 'Purchaser');
      }
     
      counter2++;

      if(document.getElementById('puchaser2').style.display == 'block' || document.getElementById('puchaser2').style.display == ''){
        if(document.getElementById('PurchaserType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName2').value + ' ' + document.getElementById('PurchaserLastName2').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail2', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('PurchaserBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail2', 'Purchaser');
        }
        counter2++;
      }
      if(document.getElementById('puchaser3').style.display == 'block' || document.getElementById('puchaser3').style.display == ''){
        if(document.getElementById('PurchaserType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName3').value + ' ' + document.getElementById('PurchaserLastName3').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail3', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('PurchaserBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail3', 'Purchaser');
        }
        counter2++;
      }
      if(document.getElementById('puchaser4').style.display == 'block' || document.getElementById('puchaser4').style.display == ''){
        if(document.getElementById('PurchaserType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName4').value + ' ' + document.getElementById('PurchaserLastName4').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail4', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('PurchaserBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail4', 'Purchaser');
        }

        counter2++;
      }

      // if(document.getElementById('DepositAmount1').value.trim() && document.getElementById('DepositReceivedFrom1').value == ){
      //   createElements(1, 'optional', counter2);
      //   if(document.getElementById('PurchaserType4').value == 'Individual'){
      //     name = document.getElementById('PurchaserFirstName4').value + ' ' + document.getElementById('PurchaserLastName4').value;
      //   }else{
      //     name = document.getElementById('PurchaserAuthorizedSigningOfficer4').value;
      //   }
      //   fillElement(counter2, 'optional', name, 'PurchaserEmail4', 'Purchaser');
      //   counter2++;
      // }

    }else if(listingType == 'Listing-Side'){

      let name = document.getElementById('VendorLawyerName').value;
      let name2 = document.getElementById('VendorLawyerFirm').value;
      createElementsWExtraFields(1, 'Addressee', 0);
      fillElementWExtraField(0, 'Addressee', name, name2, 'VendorLawyerEmail', "Vendor's Lawyer");

      if(document.getElementById('ClerkFullName').value.trim()){
        let name = document.getElementById('ClerkFullName').value;
        createElements(1, 'Addressee', 1);
        fillElement(1, 'Addressee', name, 'ClerkEmail', 'Law Clerk');
      }

      createElements(1, 'optional', counter2);
      name = document.getElementById('CooperatingAgentName').value;
      fillElement(counter2, 'optional', name, 'CO-OPERATINGBROKERAGEEmail', 'Co-operating brokerage');
      counter2++;

      if(document.getElementById('PurchaserLawyerFirm').value.trim()){
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('PurchaserLawyerName').value;
        let name2 = document.getElementById('PurchaserLawyerFirm').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserLawyerEmail', "Purchaser's Lawyer");
        counter2++;
      }

      if(document.getElementById('VendorType1').value == 'Individual'){
        createElements(1, 'optional', counter2);
        let name = document.getElementById('VendorFirstName1').value + ' ' + document.getElementById('VendorLastName1').value;
        fillElement(counter2, 'optional', name, 'VendorEmail1', 'Vendor');
      }else{
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('VendorAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('VendorBusinessName1').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail1', 'Vendor');
      }
      counter2++;

      if(document.getElementById('Vendor2').style.display == 'block' || document.getElementById('Vendor2').style.display == ''){
       if(document.getElementById('VendorType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName2').value + ' ' + document.getElementById('VendorLastName2').value;
          fillElement(counter2, 'optional', name, 'VendorEmail2', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('VendorBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail2', 'Vendor');
        }
        counter2++;
      }

      if(document.getElementById('Vendor3').style.display == 'block' || document.getElementById('Vendor3').style.display == ''){
        
        if(document.getElementById('VendorType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let ame = document.getElementById('VendorFirstName3').value + ' ' + document.getElementById('VendorLastName3').value;
          fillElement(counter2, 'optional', name, 'VendorEmail3', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('VendorBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail3', 'Vendor');
        }
        counter2++;
      }


      if(document.getElementById('Vendor4').style.display == 'block'|| document.getElementById('Vendor4').style.display == ''){
        if(document.getElementById('VendorType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName4').value + ' ' + document.getElementById('VendorLastName4').value;
          fillElement(counter2, 'optional', name, 'VendorEmail4', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('VendorBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail4', 'Vendor');
        }
        counter2++;
      }

      if(document.getElementById('PurchaserType1').value == 'Individual'){
        createElements(1, 'optional', counter2); 
        let name = document.getElementById('PurchaserFirstName1').value + ' ' + document.getElementById('PurchaserLastName1').value; 
        fillElement(counter2, 'optional', name, 'PurchaserEmail1', 'Purchaser');
      }else{
         createElementsWExtraFields(1, 'optional', counter2); 
         let name = document.getElementById('PurchaserAuthorizedSigningOfficer1').value;
         let name2 = document.getElementById('PurchaserBusinessName1').value;  
         fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail1', 'Purchaser');
      }
     
      counter2++;

      if(document.getElementById('puchaser2').style.display == 'block'|| document.getElementById('puchaser2').style.display == ''){
        if(document.getElementById('PurchaserType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName2').value + ' ' + document.getElementById('PurchaserLastName2').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail2', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('PurchaserBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail2', 'Purchaser');
        }
        counter2++;
      }
      if(document.getElementById('puchaser3').style.display == 'block'|| document.getElementById('puchaser3').style.display == ''){
        if(document.getElementById('PurchaserType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName3').value + ' ' + document.getElementById('PurchaserLastName3').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail3', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('PurchaserBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail3', 'Purchaser');
        }
        counter2++;
      }

      if(document.getElementById('puchaser4').style.display == 'block'|| document.getElementById('puchaser4').style.display == ''){
        if(document.getElementById('PurchaserType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName4').value + ' ' + document.getElementById('PurchaserLastName4').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail4', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('PurchaserBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail4', 'Purchaser');
        }
        counter2++;
      }

      if(document.getElementById('DepositAmount1').value.trim() && document.getElementById('DepositReceivedFrom1').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName1').value + ' ' + document.getElementById('DepositRecivedFromLastName1').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail1', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount2').value.trim() && document.getElementById('DepositRecivedFrom2').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName2').value + ' ' + document.getElementById('DepositRecivedFromLastName2').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail2', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount3').value.trim() && document.getElementById('DepositRecivedFrom3').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName3').value + ' ' + document.getElementById('DepositRecivedFromLastName3').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail3', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount4').value.trim() && document.getElementById('DepositRecivedFrom4').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName4').value + ' ' + document.getElementById('DepositRecivedFromLastName4').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail4', 'Third party');
        counter2++;
      }
    }else if(listingType == 'Sale-Double-Sided'){

      let name = document.getElementById('VendorLawyerName').value;
      let name2 = document.getElementById('VendorLawyerFirm').value;
      createElementsWExtraFields(1, 'Addressee', 0);
      fillElementWExtraField(0, 'Addressee', name, name2, 'VendorLawyerEmail', "Vendor's Lawyer");

      if(document.getElementById('ClerkFullName').value.trim()){
        let name = document.getElementById('ClerkFullName').value;
        createElements(1, 'Addressee', 1);
        fillElement(1, 'Addressee', name, 'ClerkEmail', 'Law Clerk');
      }

      if(document.getElementById('PurchaserLawyerFirm').value.trim()){
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('PurchaserLawyerName').value;
        let name2 = document.getElementById('PurchaserLawyerFirm').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserLawyerEmail', "Purchaser's Lawyer");
        counter2++;
      }

      if(document.getElementById('VendorType1').value == 'Individual'){
        createElements(1, 'optional', counter2);
        let name = document.getElementById('VendorFirstName1').value + ' ' + document.getElementById('VendorLastName1').value;
        fillElement(counter2, 'optional', name, 'VendorEmail1', 'Vendor');
      }else{
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('VendorAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('VendorBusinessName1').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail1', 'Vendor');
      }
      counter2++;

      if(document.getElementById('Vendor2').style.display == 'block' || document.getElementById('Vendor2').style.display == ''){
       if(document.getElementById('VendorType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName2').value + ' ' + document.getElementById('VendorLastName2').value;
          fillElement(counter2, 'optional', name, 'VendorEmail2', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('VendorBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail2', 'Vendor');
        }
        counter2++;
      }

      if(document.getElementById('Vendor3').style.display == 'block' || document.getElementById('Vendor3').style.display == ''){
        
        if(document.getElementById('VendorType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName3').value + ' ' + document.getElementById('VendorLastName3').value;
          fillElement(counter2, 'optional', name, 'VendorEmail3', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('VendorBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail3', 'Vendor');
        }
        counter2++;
      }

      if(document.getElementById('Vendor4').style.display == 'block' || document.getElementById('Vendor4').style.display == ''){
        if(document.getElementById('VendorType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName4').value + ' ' + document.getElementById('VendorLastName4').value;
          fillElement(counter2, 'optional', name, 'VendorEmail4', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('VendorBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail4', 'Vendor');
        }
        counter2++;
      }

      if(document.getElementById('PurchaserType1').value == 'Individual'){
        createElements(1, 'optional', counter2); 
        let name = document.getElementById('PurchaserFirstName1').value + ' ' + document.getElementById('PurchaserLastName1').value; 
        fillElement(counter2, 'optional', name, 'PurchaserEmail1', 'Purchaser');
      }else{
        createElementsWExtraFields(1, 'optional', counter2); 
        let name = document.getElementById('PurchaserAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('PurchaserBusinessName1').value;  
        fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail1', 'Purchaser');
      }
      counter2++;

      if(document.getElementById('puchaser2').style.display == 'block' || document.getElementById('puchaser2').style.display == ''){
        if(document.getElementById('PurchaserType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName2').value + ' ' + document.getElementById('PurchaserLastName2').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail2', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('PurchaserBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail2', 'Purchaser');
        }
        counter2++;
      }
      if(document.getElementById('puchaser3').style.display == 'block' || document.getElementById('puchaser3').style.display == ''){
        if(document.getElementById('PurchaserType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName3').value + ' ' + document.getElementById('PurchaserLastName3').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail3', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('PurchaserBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail3', 'Purchaser');
        }
        counter2++;
      }

      if(document.getElementById('puchaser4').style.display == 'block' || document.getElementById('puchaser4').style.display == ''){
        if(document.getElementById('PurchaserType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName4').value + ' ' + document.getElementById('PurchaserLastName4').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail4', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('PurchaserBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail4', 'Purchaser');
        }
        counter2++;
      }

      if(document.getElementById('DepositAmount1').value.trim() && document.getElementById('DepositReceivedFrom1').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName1').value + ' ' + document.getElementById('DepositRecivedFromLastName1').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail1', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount2').value.trim() && document.getElementById('DepositRecivedFrom2').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName2').value + ' ' + document.getElementById('DepositRecivedFromLastName2').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail2', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount3').value.trim() && document.getElementById('DepositRecivedFrom3').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName3').value + ' ' + document.getElementById('DepositRecivedFromLastName3').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail3', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount4').value.trim() && document.getElementById('DepositRecivedFrom4').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName4').value + ' ' + document.getElementById('DepositRecivedFromLastName4').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail4', 'Third party');
        counter2++;
      }

    }else if(listingType == 'Landlord-Side'){

      let name = '';

      if(document.getElementById('VendorType1').value == 'Individual'){
        createElements(1, 'Addressee', counter);
        let name = document.getElementById('VendorFirstName1').value + ' ' + document.getElementById('VendorLastName1').value;
        fillElement(counter, 'Addressee', name, 'VendorEmail1', 'Landlord');
      }else{
        createElementsWExtraFields(1, 'Addressee', counter);
        let name = document.getElementById('VendorAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('VendorBusinessName1').value;
        fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail1', 'Landlord');
      }
      counter++;

      if(document.getElementById('Vendor2').style.display == 'block' || document.getElementById('Vendor2').style.display == ''){
        if(document.getElementById('VendorType2').value == 'Individual'){
          createElements(1, 'Addressee', counter);
          let name = document.getElementById('VendorFirstName2').value + ' ' + document.getElementById('VendorLastName2').value;
          fillElement(counter, 'Addressee', name, 'VendorEmail2', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'Addressee', counter);
          let name = document.getElementById('VendorAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('VendorBusinessName2').value;
          fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail2', 'Landlord');
        }
        counter++;
      }

      if(document.getElementById('Vendor3').style.display == 'block' || document.getElementById('Vendor3').style.display == ''){
        if(document.getElementById('VendorType3').value == 'Individual'){
          createElements(1, 'Addressee', counter);
          let name = document.getElementById('VendorFirstName3').value + ' ' + document.getElementById('VendorLastName3').value;
          fillElement(counter, 'Addressee', name, 'VendorEmail3', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'Addressee', counter);
          let name = document.getElementById('VendorAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('VendorBusinessName3').value;
          fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail3', 'Landlord');
        }
        counter++;
      }

      if(document.getElementById('Vendor4').style.display == 'block' || document.getElementById('Vendor4').style.display == ''){
        if(document.getElementById('VendorType4').value == 'Individual'){
          createElements(1, 'Addressee', counter);
          name = document.getElementById('VendorFirstName4').value + ' ' + document.getElementById('VendorLastName4').value;
          fillElement(counter, 'Addressee', name, 'VendorEmail4', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'Addressee', counter);
          let name = document.getElementById('VendorAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('VendorBusinessName4').value;
          fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail4', 'Landlord');
        }
        counter++;
      }

      createElements(1, 'optional', counter2);
      name = document.getElementById('CooperatingAgentName').value;
      fillElement(counter2, 'optional', name, 'CO-OPERATINGBROKERAGEEmail', 'Co-operating brokerage');
      counter2++;

      if(document.getElementById('PurchaserType1').value == 'Individual'){
        createElements(1, 'optional', counter2);
        let name = document.getElementById('PurchaserFirstName1').value + ' ' + document.getElementById('PurchaserLastName1').value;
        fillElement(counter2, 'optional', name, 'PurchaserEmail1', 'Tenant');
      }else{
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('PurchaserAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('PurchaserBusinessName1').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail1', 'Tenant');
      }
      counter2++;

      if(document.getElementById('puchaser2').style.display == 'block' || document.getElementById('puchaser2').style.display == ''){
        if(document.getElementById('PurchaserType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          name = document.getElementById('PurchaserFirstName2').value + ' ' + document.getElementById('PurchaserLastName2').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail2', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('PurchaserBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail2', 'Tenant');
        }
        counter2++;
      }

       if(document.getElementById('puchaser3').style.display == 'block' || document.getElementById('puchaser3').style.display == ''){
        if(document.getElementById('PurchaserType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          name = document.getElementById('PurchaserFirstName3').value + ' ' + document.getElementById('PurchaserLastName3').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail3', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('PurchaserBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail3', 'Tenant');
        }
        counter2++;
      }

      if(document.getElementById('puchaser4').style.display == 'block' || document.getElementById('puchaser4').style.display == ''){
        if(document.getElementById('PurchaserType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName4').value + ' ' + document.getElementById('PurchaserLastName4').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail4', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('PurchaserBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail4', 'Tenant');
        }
        counter2++;
      }

      if(document.getElementById('DepositAmount1').value.trim() && document.getElementById('DepositReceivedFrom1').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName1').value + ' ' + document.getElementById('DepositRecivedFromLastName1').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail1', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount2').value.trim() && document.getElementById('DepositRecivedFrom2').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName2').value + ' ' + document.getElementById('DepositRecivedFromLastName2').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail2', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount3').value.trim() && document.getElementById('DepositRecivedFrom3').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName3').value + ' ' + document.getElementById('DepositRecivedFromLastName3').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail3', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount4').value.trim() && document.getElementById('DepositRecivedFrom4').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName4').value + ' ' + document.getElementById('DepositRecivedFromLastName4').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail4', 'Third party');
        counter2++;
      }

    }else if(listingType == 'Tenant-Side'){
      
      createElements(1, 'Addressee', 0);
      let name = document.getElementById('CooperatingAgentName').value;
      fillElement(0, 'Addressee', name, 'CO-OPERATINGBROKERAGEEmail', 'Co-operating brokerage');

      
      if(document.getElementById('VendorType1').value == 'Individual'){
        createElements(1, 'optional', counter2);
        let name = document.getElementById('VendorFirstName1').value + ' ' + document.getElementById('VendorLastName1').value;
        fillElement(counter2, 'optional', name, 'VendorEmail1', 'Landlord');
      }else{
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('VendorAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('VendorBusinessName1').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail1', 'Landlord');
      }
      counter2++;

      if(document.getElementById('Vendor2').style.display == 'block' || document.getElementById('Vendor2').style.display == ''){
        if(document.getElementById('VendorType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName2').value + ' ' + document.getElementById('VendorLastName2').value;
          fillElement(counter2, 'optional', name, 'VendorEmail2', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('VendorBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail2', 'Landlord');
        }
        counter2++;
      }

      if(document.getElementById('Vendor3').style.display == 'block' || document.getElementById('Vendor3').style.display == ''){
        if(document.getElementById('VendorType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName3').value + ' ' + document.getElementById('VendorLastName3').value;
          fillElement(counter2, 'optional', name, 'VendorEmail3', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('VendorBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail3', 'Landlord');
        } 
        counter2++;
      }

      if(document.getElementById('Vendor4').style.display == 'block' || document.getElementById('Vendor4').style.display == ''){
        if(document.getElementById('VendorType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName4').value + ' ' + document.getElementById('VendorLastName4').value;
          fillElement(counter2, 'optional', name, 'VendorEmail4', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('VendorBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail4', 'Landlord');
        }
        counter2++;
      }

      if(document.getElementById('PurchaserType1').value == 'Individual'){
        createElements(1, 'optional', counter2);
        let name = document.getElementById('PurchaserFirstName1').value + ' ' + document.getElementById('PurchaserLastName1').value;
        fillElement(counter2, 'optional', name, 'PurchaserEmail1', 'Tenant');
      }else{
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('PurchaserAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('PurchaserBusinessName1').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail1', 'Tenant');
      }
      counter2++;

      if(document.getElementById('puchaser2').style.display == 'block' || document.getElementById('puchaser2').style.display == ''){
        if(document.getElementById('PurchaserType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          name = document.getElementById('PurchaserFirstName2').value + ' ' + document.getElementById('PurchaserLastName2').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail2', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('PurchaserBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail2', 'Tenant');
        }
        counter2++;
      }
       if(document.getElementById('puchaser3').style.display == 'block' || document.getElementById('puchaser3').style.display == ''){
        if(document.getElementById('PurchaserType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          name = document.getElementById('PurchaserFirstName3').value + ' ' + document.getElementById('PurchaserLastName3').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail3', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('PurchaserBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail3', 'Tenant');
        }
        counter2++;
      }

      if(document.getElementById('puchaser4').style.display == 'block' || document.getElementById('puchaser4').style.display == ''){
        if(document.getElementById('PurchaserType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName4').value + ' ' + document.getElementById('PurchaserLastName4').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail4', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('PurchaserBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail4', 'Tenant');
        }
        counter2++;
      }

    }else if(listingType == 'Lease-DoubleSided'){

      let name = '';
      if(document.getElementById('VendorType1').value == 'Individual'){
        createElements(1, 'Addressee', counter);
        let name = document.getElementById('VendorFirstName1').value + ' ' + document.getElementById('VendorLastName1').value;
        fillElement(counter, 'Addressee', name, 'VendorEmail1', 'Landlord');
      }else{
        createElementsWExtraFields(1, 'Addressee', counter);
        let name = document.getElementById('VendorAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('VendorBusinessName1').value;
        fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail1', 'Landlord');
      }
      counter++;

      if(document.getElementById('Vendor2').style.display == 'block' || document.getElementById('Vendor2').style.display == ''){
        if(document.getElementById('VendorType2').value == 'Individual'){
          createElements(1, 'Addressee', counter);
          let name = document.getElementById('VendorFirstName2').value + ' ' + document.getElementById('VendorLastName2').value;
          fillElement(counter, 'Addressee', name, 'VendorEmail2', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'Addressee', counter);
          let name = document.getElementById('VendorAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('VendorBusinessName2').value;
          fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail2', 'Landlord');
        }
        counter++;
      }

      if(document.getElementById('Vendor3').style.display == 'block' || document.getElementById('Vendor3').style.display == ''){
        if(document.getElementById('VendorType3').value == 'Individual'){
          createElements(1, 'Addressee', counter);
          let name = document.getElementById('VendorFirstName3').value + ' ' + document.getElementById('VendorLastName3').value;
          fillElement(counter, 'Addressee', name, 'VendorEmail3', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'Addressee', counter);
          let name = document.getElementById('VendorAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('VendorBusinessName3').value;
          fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail3', 'Landlord');
        }
        counter++;
      }

      if(document.getElementById('Vendor4').style.display == 'block' || document.getElementById('Vendor4').style.display == ''){
        if(document.getElementById('VendorType4').value == 'Individual'){
          createElements(1, 'Addressee', counter);
          name = document.getElementById('VendorFirstName4').value + ' ' + document.getElementById('VendorLastName4').value;
          fillElement(counter, 'Addressee', name, 'VendorEmail4', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'Addressee', counter);
          let name = document.getElementById('VendorAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('VendorBusinessName4').value;
          fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail4', 'Landlord');
        }
        counter++;
      }

      if(document.getElementById('PurchaserType1').value == 'Individual'){
        createElements(1, 'optional', counter2);
        let name = document.getElementById('PurchaserFirstName1').value + ' ' + document.getElementById('PurchaserLastName1').value;
        fillElement(counter2, 'optional', name, 'PurchaserEmail1', 'Tenant');
      }else{
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('PurchaserAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('PurchaserBusinessName1').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail1', 'Tenant');
      }
      counter2++;

      if(document.getElementById('puchaser2').style.display == 'block' || document.getElementById('puchaser2').style.display == ''){
        if(document.getElementById('PurchaserType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          name = document.getElementById('PurchaserFirstName2').value + ' ' + document.getElementById('PurchaserLastName2').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail2', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('PurchaserBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail2', 'Tenant');
        }
        counter2++;
      }
       if(document.getElementById('puchaser3').style.display == 'block' || document.getElementById('puchaser3').style.display == ''){
        if(document.getElementById('PurchaserType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          name = document.getElementById('PurchaserFirstName3').value + ' ' + document.getElementById('PurchaserLastName3').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail3', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('PurchaserBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail3', 'Tenant');
        }
        counter2++;
      }

      if(document.getElementById('puchaser4').style.display == 'block' || document.getElementById('puchaser4').style.display == ''){
        if(document.getElementById('PurchaserType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName4').value + ' ' + document.getElementById('PurchaserLastName4').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail4', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('PurchaserBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail4', 'Tenant');
        }
        counter2++;
      }

      if(document.getElementById('DepositAmount1').value.trim() && document.getElementById('DepositReceivedFrom1').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName1').value + ' ' + document.getElementById('DepositRecivedFromLastName1').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail1', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount2').value.trim() && document.getElementById('DepositRecivedFrom2').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName2').value + ' ' + document.getElementById('DepositRecivedFromLastName2').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail2', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount3').value.trim() && document.getElementById('DepositRecivedFrom3').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName3').value + ' ' + document.getElementById('DepositRecivedFromLastName3').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail3', 'Third party');
        counter2++;
      }

      if(document.getElementById('DepositAmount4').value.trim() && document.getElementById('DepositRecivedFrom4').value == 'Third Party'){
        createElements(1, 'optional', counter2);
        name = document.getElementById('DepositRecivedFromFirstName4').value + ' ' + document.getElementById('DepositRecivedFromLastName4').value;
        fillElement(counter2, 'optional', name, 'DepositRecivedEmail4', 'Third party');
        counter2++;
      }
      
    }else if(listingType == 'BuyerSide-Self-Represented-Vendor'){

      let name = document.getElementById('VendorLawyerName').value;
      let name2 = document.getElementById('VendorLawyerFirm').value;
      createElementsWExtraFields(1, 'Addressee', 0);
      fillElementWExtraField(0, 'Addressee', name, name2, 'VendorLawyerEmail', "Vendor's Lawyer");

      if(document.getElementById('ClerkFullName').value.trim()){
        let name = document.getElementById('ClerkFullName').value;
        createElements(1, 'Addressee', 1);
        fillElement(1, 'Addressee', name, 'ClerkEmail', 'Law Clerk');
      }

      if(document.getElementById('PurchaserLawyerFirm').value.trim()){
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('PurchaserLawyerName').value;
        let name2 = document.getElementById('PurchaserLawyerFirm').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserLawyerEmail', "Purchaser's Lawyer");
        counter2++;
      }

      if(document.getElementById('VendorType1').value == 'Individual'){
        createElements(1, 'optional', counter2);
        let name = document.getElementById('VendorFirstName1').value + ' ' + document.getElementById('VendorLastName1').value;
        fillElement(counter2, 'optional', name, 'VendorEmail1', 'Vendor');
      }else{
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('VendorAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('VendorBusinessName1').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail1', 'Vendor');
      }
      counter2++;

      if(document.getElementById('Vendor2').style.display == 'block' || document.getElementById('Vendor2').style.display == ''){
       if(document.getElementById('VendorType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName2').value + ' ' + document.getElementById('VendorLastName2').value;
          fillElement(counter2, 'optional', name, 'VendorEmail2', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('VendorBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail2', 'Vendor');
        }
        counter2++;
      }

      if(document.getElementById('Vendor3').style.display == 'block' || document.getElementById('Vendor3').style.display == ''){
        
        if(document.getElementById('VendorType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName3').value + ' ' + document.getElementById('VendorLastName3').value;
          fillElement(counter2, 'optional', name, 'VendorEmail3', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('VendorBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail3', 'Vendor');
        }
        counter2++;
      }

      if(document.getElementById('Vendor4').style.display == 'block' || document.getElementById('Vendor4').style.display == ''){
        if(document.getElementById('VendorType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('VendorFirstName4').value + ' ' + document.getElementById('VendorLastName4').value;
          fillElement(counter2, 'optional', name, 'VendorEmail4', 'Vendor');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('VendorAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('VendorBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'VendorEmail4', 'Vendor');
        }
        counter2++;
      }

      if(document.getElementById('PurchaserType1').value == 'Individual'){
        createElements(1, 'optional', counter2); 
        let name = document.getElementById('PurchaserFirstName1').value + ' ' + document.getElementById('PurchaserLastName1').value; 
        fillElement(counter2, 'optional', name, 'PurchaserEmail1', 'Purchaser');
      }else{
         createElementsWExtraFields(1, 'optional', counter2); 
         let name = document.getElementById('PurchaserAuthorizedSigningOfficer1').value;
         let name2 = document.getElementById('PurchaserBusinessName1').value;  
         fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail1', 'Purchaser');
      }

      counter2++;

      if(document.getElementById('puchaser2').style.display == 'block' || document.getElementById('puchaser2').style.display == ''){
        if(document.getElementById('PurchaserType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName2').value + ' ' + document.getElementById('PurchaserLastName2').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail2', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('PurchaserBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail2', 'Purchaser');
        }
        counter2++;

      }
      if(document.getElementById('puchaser3').style.display == 'block' || document.getElementById('puchaser3').style.display == ''){
        if(document.getElementById('PurchaserType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName3').value + ' ' + document.getElementById('PurchaserLastName3').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail3', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('PurchaserBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail3', 'Purchaser');
        }
        counter2++;
      }

      if(document.getElementById('puchaser4').style.display == 'block' || document.getElementById('puchaser4').style.display == ''){
        if(document.getElementById('PurchaserType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName4').value + ' ' + document.getElementById('PurchaserLastName4').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail4', 'Purchaser');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('PurchaserBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail4', 'Purchaser');
        }
        counter2++;
      }

      
    }else if(listingType == 'TenantSide-Self-Represented-Landlord'){
      let name = '';

      if(document.getElementById('VendorType1').value == 'Individual'){
        createElements(1, 'Addressee', counter);
        let name = document.getElementById('VendorFirstName1').value + ' ' + document.getElementById('VendorLastName1').value;
        fillElement(counter, 'Addressee', name, 'VendorEmail1', 'Landlord');
      }else{
        createElementsWExtraFields(1, 'Addressee', counter);
        let name = document.getElementById('VendorAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('VendorBusinessName1').value;
        fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail1', 'Landlord');
      }
      counter++;

      if(document.getElementById('Vendor2').style.display == 'block' || document.getElementById('Vendor2').style.display == ''){
        if(document.getElementById('VendorType2').value == 'Individual'){
          createElements(1, 'Addressee', counter);
          let name = document.getElementById('VendorFirstName2').value + ' ' + document.getElementById('VendorLastName2').value;
          fillElement(counter, 'Addressee', name, 'VendorEmail2', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'Addressee', counter);
          let name = document.getElementById('VendorAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('VendorBusinessName2').value;
          fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail2', 'Landlord');
        }
        counter++;
      }

      if(document.getElementById('Vendor3').style.display == 'block' || document.getElementById('Vendor3').style.display == ''){
        if(document.getElementById('VendorType3').value == 'Individual'){
          createElements(1, 'Addressee', counter);
          let name = document.getElementById('VendorFirstName3').value + ' ' + document.getElementById('VendorLastName3').value;
          fillElement(counter, 'Addressee', name, 'VendorEmail3', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'Addressee', counter);
          let name = document.getElementById('VendorAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('VendorBusinessName3').value;
          fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail3', 'Landlord');
        }
        counter++;
      }

      if(document.getElementById('Vendor4').style.display == 'block' || document.getElementById('Vendor4').style.display == ''){
        if(document.getElementById('VendorType4').value == 'Individual'){
          createElements(1, 'Addressee', counter);
          name = document.getElementById('VendorFirstName4').value + ' ' + document.getElementById('VendorLastName4').value;
          fillElement(counter, 'Addressee', name, 'VendorEmail4', 'Landlord');
        }else{
          createElementsWExtraFields(1, 'Addressee', counter);
          let name = document.getElementById('VendorAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('VendorBusinessName4').value;
          fillElementWExtraField(counter, 'Addressee', name, name2, 'VendorEmail4', 'Landlord');
        }
        counter++;
      }

      if(document.getElementById('PurchaserType1').value == 'Individual'){
        createElements(1, 'optional', counter2);
        let name = document.getElementById('PurchaserFirstName1').value + ' ' + document.getElementById('PurchaserLastName1').value;
        fillElement(counter2, 'optional', name, 'PurchaserEmail1', 'Tenant');
      }else{
        createElementsWExtraFields(1, 'optional', counter2);
        let name = document.getElementById('PurchaserAuthorizedSigningOfficer1').value;
        let name2 = document.getElementById('PurchaserBusinessName1').value;
        fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail1', 'Tenant');
      }
      counter2++;

      if(document.getElementById('puchaser2').style.display == 'block' || document.getElementById('puchaser2').style.display == ''){
        if(document.getElementById('PurchaserType2').value == 'Individual'){
          createElements(1, 'optional', counter2);
          name = document.getElementById('PurchaserFirstName2').value + ' ' + document.getElementById('PurchaserLastName2').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail2', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer2').value;
          let name2 = document.getElementById('PurchaserBusinessName2').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail2', 'Tenant');
        }
        counter2++;
      }
       if(document.getElementById('puchaser3').style.display == 'block' || document.getElementById('puchaser3').style.display == ''){
        if(document.getElementById('PurchaserType3').value == 'Individual'){
          createElements(1, 'optional', counter2);
          name = document.getElementById('PurchaserFirstName3').value + ' ' + document.getElementById('PurchaserLastName3').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail3', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer3').value;
          let name2 = document.getElementById('PurchaserBusinessName3').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail3', 'Tenant');
        }
        counter2++;
      }

      if(document.getElementById('puchaser4').style.display == 'block' || document.getElementById('puchaser4').style.display == ''){
        if(document.getElementById('PurchaserType4').value == 'Individual'){
          createElements(1, 'optional', counter2);
          let name = document.getElementById('PurchaserFirstName4').value + ' ' + document.getElementById('PurchaserLastName4').value;
          fillElement(counter2, 'optional', name, 'PurchaserEmail4', 'Tenant');
        }else{
          createElementsWExtraFields(1, 'optional', counter2);
          let name = document.getElementById('PurchaserAuthorizedSigningOfficer4').value;
          let name2 = document.getElementById('PurchaserBusinessName4').value;
          fillElementWExtraField(counter2, 'optional', name, name2, 'PurchaserEmail4', 'Tenant');
        }
        counter2++;
      }

    }
  }
  
  function CreateEmailsOther(){

    let subject = '';
    if(document.getElementById('DealType').value == 'Consulting' || document.getElementById('DealType').value == 'Other'){
      subject = document.getElementById('ServiceDescription').value;
    }else{
      if(document.getElementById('UnitNumber').value.trim()){
        subject = document.getElementById('UnitNumber').value.trim() + ' - ';
      }
      if(document.getElementById('PropertyProvince').value == 'Other'){
        subject += document.getElementById('StreetNumber').value.trim() + ' ' +  document.getElementById('StreetName').value.trim() + ', ' +  document.getElementById('City').value.trim() + ', ' +  document.getElementById('PropertyOtherProvince').value.trim() + ', ' +  document.getElementById('PostalCode').value.trim() + ', ' +  document.getElementById('Country').value.trim();
      }else{
        subject += document.getElementById('StreetNumber').value.trim() + ' ' +  document.getElementById('StreetName').value.trim() + ', ' +  document.getElementById('City').value.trim() + ', ' +  document.getElementById('PropertyProvince').value.trim() + ', ' +  document.getElementById('PostalCode').value.trim();
      }
    }
    

    document.getElementById('subjectLineEmail').value = 'Commission statement for ' + subject;
    document.getElementById('messageEmail').value = 'Please see attached our commission statement.' + '\r\n\r\n\r\n\r\n' + 'Kind regards,' + '\r\n\r\n' + document.getElementById('bnHidden').value;

    document.getElementById('paysumEmail').innerHTML = document.getElementById('BalanceInvoice').innerHTML;

    clearEmails();
 
    if(document.getElementById('ClientType1').value == 'Individual'){
      createElements(1, 'Addressee', 0);
      let name = document.getElementById('ClientFirstName1').value + ' ' + document.getElementById('ClientLastName1').value;
      fillElement(0, 'Addressee', name, 'ClientEmail1', 'Client');
    }else{
      createElementsWExtraFields(1, 'Addressee', 0);
      let name = document.getElementById('ClientSigningOfficere1').value;
      let name2 = document.getElementById('ClientBusinessName1').value;
      fillElementWExtraField(0, 'Addressee', name, name2, 'ClientEmail1', 'Client');
    }

    if(document.getElementById('client2').style.display == 'block' || document.getElementById('client2').style.display == ''){
      if(document.getElementById('ClientType2').value == 'Individual'){
        createElements(1, 'Addressee', 1);
        let name = document.getElementById('ClientFirstName2').value + ' ' + document.getElementById('ClientLastName2').value;
        fillElement(1, 'Addressee', name, 'ClientEmail2', 'Client');
      }else{
        createElementsWExtraFields(1, 'Addressee', 1);
        let name = document.getElementById('ClientSigningOfficere2').value;
        let name2 = document.getElementById('ClientBusinessName2').value;
        fillElementWExtraField(1, 'Addressee', name, name2, 'ClientEmail2', 'Client');
      }
    }

    if(document.getElementById('OwnerDifferance1').checked){
      if(!(document.getElementById('SelectClients').value == 'Both')){
        if(document.getElementById('Owner2').style.display == 'block' || document.getElementById('Owner2').style.display == ''){
          
          if(document.getElementById('OwnerType2').value == 'Individual'){
            createElements(1, 'optional', 0);
            let name = document.getElementById('OwnerFirstName2').value + ' ' + document.getElementById('OwnerLastName2').value;
            fillElement(0, 'optional', name, 'OwnerEmail2', 'Owner');
          }else{
            createElementsWExtraFields(1, 'optional', 0);
            let name = document.getElementById('OwnerSigningOfficere2').value;
            let name2 = document.getElementById('OwnerBusinessName2').value;
            fillElementWExtraField(0, 'optional', name, name2, 'OwnerEmail2', 'Owner');
          }
        }
      }
    }else{
      
      if(document.getElementById('OwnerType1').value == 'Individual'){
        createElements(1, 'optional', 0);
        let name = document.getElementById('OwnerFirstName1').value + ' ' + document.getElementById('OwnerLastName1').value;
        fillElement(0, 'optional', name, 'OwnerEmail1', 'Owner');
      }else{
        createElementsWExtraFields(1, 'optional', 0);
        let name = document.getElementById('OwnerSigningOfficere1').value;
        let name2 = document.getElementById('OwnerBusinessName1').value;
        fillElementWExtraField(0, 'optional', name, name2, 'OwnerEmail1', 'Owner');
      }

      if(document.getElementById('Owner2').style.display == 'block' || document.getElementById('Owner2').style.display == ''){
        if(document.getElementById('OwnerType2').value == 'Individual'){
          createElements(1, 'optional', 1);
          let name = document.getElementById('OwnerFirstName2').value + ' ' + document.getElementById('OwnerLastName2').value;
          fillElement(1, 'optional', name, 'OwnerEmail2', 'Owner');
        }else{
          createElementsWExtraFields(1, 'optional', 1);
          let name = document.getElementById('OwnerSigningOfficere2').value;
          let name2 = document.getElementById('OwnerBusinessName2').value;
          fillElementWExtraField(1, 'optional', name, name2, 'OwnerEmail2', 'Owner');
        }
      }
    }

    // createElements(1, 'optional', 0);
    // if(document.getElementById('ClientType1').value == 'Individual'){
    //   name = document.getElementById('ClientFirstName1').value + ' ' + document.getElementById('ClientLastName1').value;
    // }else{
    //   name = document.getElementById('ClientSigningOfficere1').value;
    // }
    // fillElement(0, 'optional', name, 'ClientEmail1', 'Owner');
  }
  
  function CreateEmailsReferral(){



    document.getElementById('subjectLineEmail').value = 'Commission statement for referral receipt';
    document.getElementById('messageEmail').value = 'Please see attached our commission statement.' + '\r\n\r\n\r\n\r\n' + 'Kind regards,' + '\r\n\r\n' + document.getElementById('bnHidden').value;

    document.getElementById('paysumEmail').innerHTML = document.getElementById('BalanceInvoice').innerHTML;

    clearEmails();

    if(document.getElementById('ReferralSourceType1').value == 'Individual'){
      createElements(1, 'Addressee', 0);
      let name = document.getElementById('ReferralSourceFirstName1').value + ' ' + document.getElementById('ReferralSourceLastName1').value;
      fillElement(0, 'Addressee', name, 'ReferralSourceEmail1', 'Referral Recipient');
    }else{
      createElementsWExtraFields(1, 'Addressee', 0);
      let name = document.getElementById('ReferralSourceSigningOfficere1').value;
      let name2 = document.getElementById('ReferralSourceBusinessName1').value;
      fillElementWExtraField(0, 'Addressee', name, name2, 'ReferralSourceEmail1', 'Referral Recipient');
    }

    if(document.getElementById('ClientType1').value == 'Individual'){
      createElements(1, 'optional', 0);
      let name = document.getElementById('ClientFirstName1').value + ' ' + document.getElementById('ClientLastName1').value;
      fillElement(0, 'optional', name, 'ClientEmail1', 'Client');
    }else{
      createElementsWExtraFields(1, 'optional', 0);
      let name = document.getElementById('ClientSigningOfficere1').value;
      let name2 = document.getElementById('ClientBusinessName1').value;
      fillElementWExtraField(0, 'optional', name, name2, 'ClientEmail1', 'Client');
    }

    if(document.getElementById('client2').style.display == 'block' || document.getElementById('client2').style.display == ''){
      if(document.getElementById('ClientType2').value == 'Individual'){
        createElements(1, 'optional', 1);
        let name = document.getElementById('ClientFirstName2').value + ' ' + document.getElementById('ClientLastName2').value;
        fillElement(1, 'optional', name, 'ClientEmail2', 'Tenant');
      }else{
        createElementsWExtraFields(1, 'optional', 1);
        let name = document.getElementById('ClientSigningOfficere2').value;
        let name2 = document.getElementById('ClientBusinessName2').value;
        fillElementWExtraField(1, 'optional', name, name2, 'ClientEmail2', 'Tenant');
      }
      
    }

  }

  function closeEmailPopup(){
    document.getElementById('myModalEmail').style.display = '';
  }