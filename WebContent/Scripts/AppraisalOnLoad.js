var ourForm = document.getElementById('EmailForm');
var defaultTarget = 'hiddenFrame';

var docsBlock = document.getElementById('storedDocuments');
var count = 0;
var countNotes = 0;
const inputElement = document.getElementById("documentSubmitbtn");
inputElement.addEventListener("click", handleFiles, false);

function submitted() {
    document.getElementById('EmailForm').classList.toggle("loading");

    setTimeout(
        function () {
            document.getElementById('EmailForm').classList.toggle("loading");

            document.getElementById('beforeApproved').style.display = 'none';
            document.getElementById('afterApproved').style.display = '';
        }, 5000 /// milliseconds 
    );

}

function displayUploaded(id){
    document.getElementById(id).style.display = '';
  }

function handleFiles() {
    var datenow = new Date().toLocaleTimeString([], {year: 'numeric', month: 'numeric', day: 'numeric', hour: '2-digit', minute: '2-digit'});
  
    var id = 'FileName'+count;
    if(document.getElementById(id).value){
      if(document.getElementById('EXtraDocumentName1').value.trim()){
        var id2 = 'FileName'+ parseFloat(count+1);
  
        const fileList = document.getElementById(id).files; /* now you can work with the file list */
        
        const numFiles = fileList.length;

        var blob = new Blob(document.getElementById(id).files, { type: document.getElementById(id).files[0].type });
        var url = window.URL.createObjectURL(blob);
  
        for (let i = 0; i < numFiles; i++) {
          
          var oneDocumentDiv = document.createElement("DIV");
          oneDocumentDiv.setAttribute("class", 'oneDocument');

          var oneDocumentInput= document.createElement("INPUT");

          oneDocumentInput.setAttribute("id", id2);
          oneDocumentInput.setAttribute("type", "file");
          oneDocumentInput.setAttribute("accept", ".pdf");
          oneDocumentInput.addEventListener("change", function (e) {
            docNameFill(id2);
          });

  
          var nameLabel = document.createElement("LABEL");
          nameLabel.innerHTML = document.getElementById('EXtraDocumentName1').value;
          var createdAtLabel = document.createElement("LABEL");
          createdAtLabel.innerHTML = 'Uploaded on: '+datenow;
          document.getElementById('storedDocuments').appendChild(oneDocumentDiv);
  
          var closeImgDoc = document.createElement("button");
          var uploadImgDoc = document.createElement("img");
          var linkdoc = document.createElement("a");
          var breakElem = document.createElement("br");
  
          closeImgDoc.setAttribute("class", 'deleteDoc bi bi-trash floatDataRightSide');
          closeImgDoc.setAttribute("onclick", "deleteDocument('"+id2+"')");
          uploadImgDoc.src = '../ImagesUsed/Upload.png';
          uploadImgDoc.setAttribute("class", 'uploadImgDoc');

          linkdoc.target = "_blank";
          linkdoc.href = url;
          linkdoc.appendChild(uploadImgDoc);
        //   element.appendChild(a);
  
          oneDocumentDiv.appendChild(oneDocumentInput);
          oneDocumentDiv.appendChild(nameLabel);
          oneDocumentDiv.appendChild(breakElem);
          oneDocumentDiv.appendChild(createdAtLabel);
          oneDocumentDiv.appendChild(closeImgDoc);
          oneDocumentDiv.appendChild(linkdoc);
  
          document.getElementById('doclab').htmlFor = id2;
          document.getElementById('EXtraDocumentName1').value = '';
        }
        count++;
        document.getElementById('noNameDocumentError').style.display = 'none';
        document.getElementById('EXtraDocumentName1').style.borderColor = '';
      }else{
        document.getElementById('noNameDocumentError').style.display = '';
        document.getElementById('EXtraDocumentName1').style.borderColor = 'red';
      }
      document.getElementById('noDocumentError').style.display = 'none';
        document.getElementById('doclab').style.borderColor = '';
    }else{
      document.getElementById('noDocumentError').style.display = '';
      document.getElementById('doclab').style.borderColor = 'red';
    }

    setTimeout(function() {
        document.getElementById('DocumentsSave').click();
    }, 1000);
    
  }
  
  function changeDateLabel(sectionId){
    document.getElementById(sectionId).style.display = '';
    document.getElementById(sectionId).getElementsByTagName('label')[1].innerHTML = 'Uploaded on: ' + new Date().toLocaleString();
  }
  
  function deleteDocument(documentId){
    let file = document.getElementById(documentId);
    file.value = '';
    file.parentElement.style.display = 'none';
  }

var modal2 = document.getElementById("myModalExit");
var span2 = modal2.getElementsByClassName("close")[0];
var setofBtn = document.getElementsByClassName('dropBtn2');
span2.onclick = function (event) {
    $(document).unbind('keyup');

    modal2.style.display = "none";
    event.stopPropagation();
}
for (let i = 0; i < setofBtn.length; i++) {
    setofBtn[i].onclick = function (event) {
        $(document).bind('keyup', function(e){
            if(e.which==27) {//esc
                modal2.style.display = "none";
            }
            if(e.which==13) {//enter
                document.getElementById("ExitwithNosaving").click();
            }
        });
        modal2.style.display = "block";
        event.stopPropagation();
    }
}

var myModalDiscard = document.getElementById("myModalDiscard");
var spanx = myModalDiscard.getElementsByClassName("close")[0];
var setofBtnDis = document.getElementsByClassName('dropbtnDiscard');
spanx.onclick = function () {
    myModalDiscard.style.display = "none";
    $(document).unbind('keyup');
}
for (let i = 0; i < setofBtnDis.length; i++) {
    
    setofBtnDis[i].onclick = function (event) {
        $(document).bind('keyup', function(e){
            if(e.which==27) {//esc
                myModalDiscard.style.display = "none";
            }
            if(e.which==13) {//enter
                document.getElementById("Discard").click();
            }
        });
        myModalDiscard.style.display = "block";
        event.stopPropagation();
    }
}

var myModalDelete = document.getElementById("myModalDelete");
var spanx = myModalDelete.getElementsByClassName("close")[0];
var setofBtnDel = document.getElementsByClassName('dropBtn1');
spanx.onclick = function () {
    ourForm.target = defaultTarget;
    myModalDelete.style.display = "none";
    $(document).unbind('keyup');
}
for (let i = 0; i < setofBtnDel.length; i++) {
    setofBtnDel[i].onclick = function (event) {
        $(document).bind('keyup', function(e){
            if(e.which==27) {
                ourForm.target = defaultTarget;
                myModalDelete.style.display = "none";
            }
            if(e.which==13) {
                document.getElementById("Delete").click();
            }
        });
        ourForm.target = '';
        myModalDelete.style.display = "block";
        event.stopPropagation();
    }
}
var setofBtnDel4 = document.getElementsByClassName('dropBtn4');
for (let i = 0; i < setofBtnDel4.length; i++) {
    if(setofBtnDel4[i]){
        setofBtnDel4[i].onclick = function (event) {
            $(document).bind('keyup', function(e){
                if(e.which==27) {
                    ourForm.target = defaultTarget;
                    myModalDelete.style.display = "none";
                }
                if(e.which==13) {
                    document.getElementById("Delete").click();
                }
            });
            myModalDelete.style.display = "block";
            ourForm.target = '';
            event.stopPropagation();
        }
    }
}


var myModalSave = document.getElementById("myModalSave");
// var spanx = myModalSave.getElementsByClassName("close")[0];
var setofBtnSave = document.getElementsByClassName('buttonSaveOne');
// spanx.onclick = function () {
//   myModalSave.style.display = "none";
// }
for (let i = 0; i < setofBtnSave.length; i++) {
    setofBtnSave[i].onclick = function (event) {
        document.getElementById('progressMarks').value = document.getElementsByClassName('accepted').length;
        if(!NextStepTransaction(0)){
            setofBtnSave[i].type='submit';
            document.getElementById('EmailForm').classList.toggle("loading");
            myModalSave.style.display = "block";

            setTimeout(
                function () {
                    document.getElementById('EmailForm').classList.toggle("loading");
                    

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
                    fileUdated("agentNameHidden");
                    
                    document.getElementById('saveError').style.display = 'none';
                    document.getElementById('saveError2').style.display = 'none';

                }, 5000 /// milliseconds 
            );

            
        }else{
            document.getElementById('saveError').style.display = '';
            document.getElementById('saveError2').style.display = '';
            TabsHandleler(event,'TransactionDetails','tabcontent','tablinks','TransactionDetailsTab');
        }
        closeAllWindows();

        event.stopPropagation();

        
    }
}



var myModalSaveClose = document.getElementById("myModalSaveClose");
var spanx = myModalSaveClose.getElementsByClassName("close")[0];
var setofBtnSaveClose = document.getElementsByClassName('dropBtn3');
spanx.onclick = function () {
    ourForm.target = defaultTarget;
    myModalSaveClose.style.display = "none";
    $(document).unbind('keyup');
}
for (const element of setofBtnSaveClose) {
    element.onclick = function (event) {
        if(!NextStepTransaction(0)){
            $(document).bind('keyup', function(e){
                if(e.which==27) {//esc
                    ourForm.target = defaultTarget;
                    myModalSaveClose.style.display = "none";
                }
                if(e.which==13) {//enter
                    document.getElementById("SaveExit").click();
                }
            });
            
            if(element.id=="Savebtn5"){
                document.querySelector("#myModalSaveClose > div > div.popUpContainer > button").id="SaveExitTRS";
                document.querySelector("#myModalSaveClose > div > div.popUpContainer > button").name="SaveExitTRS";
            }else{
                document.querySelector("#myModalSaveClose > div > div.popUpContainer > button").id="SaveExit";
                document.querySelector("#myModalSaveClose > div > div.popUpContainer > button").name="SaveExit";
            }

            ourForm.target = '';
            myModalSaveClose.style.display = "block";
            event.stopPropagation();
            document.getElementById('saveError').style.display = 'none';
            document.getElementById('saveError2').style.display = 'none';
            document.getElementById('progressMarks').value = document.getElementsByClassName('accepted').length;
        }else{
            $(document).unbind('keyup');
            document.getElementById('saveError').style.display = '';
            document.getElementById('saveError2').style.display = '';
            TabsHandleler(event,'TransactionDetails','tabcontent','tablinks','TransactionDetailsTab');
        }
    }
}

var myModalHST = document.getElementById("myModalHST");
var spanx = myModalHST.getElementsByClassName("close")[0];
var resetHSTbtn = document.getElementById('EditDiscard');
spanx.onclick = function () {
    myModalHST.style.display = "none";
    $(document).unbind('keyup');
}
resetHSTbtn.onclick = function (event) {
    $(document).bind('keyup', function(e){
        if(e.which==27) {//esc
            myModalHST.style.display = "none";
        }
        if(e.which==13) {//enter
            document.getElementById("ResetHSTbutton").click();
        }
    });
    myModalHST.style.display = "block";
    event.stopPropagation();
}

const modalEmail = document.getElementById("myModalEmail");
const spanEmail = modalEmail.getElementsByClassName("close")[0];
spanEmail.onclick = function () {
    modalEmail.style.display = "";
    $(document).unbind('keyup');
}
const emailbtn = document.getElementById("emailInvoicebtn");
emailbtn.onclick = function () {
    $(document).bind('keyup', function(e){
        if(e.which==27) {//esc
            modalEmail.style.display = "none";
        }
    });
    modalEmail.style.display = "block";
    emailonloadOther();
}

document.onclick = function (event) {
    if(!(event.target.className == 'buttonSaveTwo' || event.target.className == 'buttonSaveOne')){
        closeAllWindows();
    }
    if (event.target == modal2) {
        modal2.style.display = "none";
    } else if (event.target == modal) {
        // modal.style.display = "none";
    } else if (event.target == myModalSaveClose) {
        ourForm.target = defaultTarget;
        myModalSaveClose.style.display = "none";
    } else if (event.target == myModalSave) {
        myModalSave.style.display = "none";
    } else if (event.target == myModalDelete) {
        ourForm.target = defaultTarget;
        myModalDelete.style.display = "none";
    } else if (event.target == myModalDiscard) {
        myModalDiscard.style.display = "none";
    } else if (event.target == myModalHST) {
        myModalHST.style.display = "none";
    } else if (event.target == myModalTRSPreview) {
        myModalTRSPreview.style.display = "none";
    }else if(event.target == modalEmail){
        modalEmail.style.display = "none";
    }else if(event.target ==  document.getElementById('myModalReopen')){
        document.getElementById('myModalReopen').style.display = "none";
    }
    event.stopPropagation();
}

// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("ApprasialRecordSheetNext");

// Get the <span> element that closes the modal
var spanclose = modal.getElementsByClassName("close")[0];
var span = modal.getElementsByClassName("closeSign")[0];
// var span2 = modal.getElementsByClassName("closeSign")[1];
// When the user clicks the button, open the modal 
if(!(btn==null)){
    btn.onclick = function (event) {
        if(document.getElementById('ConfirmationRecordSheet')){
            if (document.getElementById('ConfirmationRecordSheet').checked == true) {
                $(document).bind('keyup', function(e){
                    if(e.which==27) {//esc
                        modal.style.display = "none";
                    }
                    if(e.which==13) {//enter
                        document.getElementById("Finalized").click();
                        $(document).unbind('keyup');
                    }
                });
                document.getElementById('progressMarks').value = document.getElementsByClassName('accepted').length;
                modal.style.display = "block";
                event.stopPropagation();
                document.getElementById('TermsError').style.display = 'none';

            } else {
                $(document).unbind('keyup');
                document.getElementById('TermsError').style.display = 'block';
                window.scrollTo({
                    top: 900,
                    behavior: 'smooth'
                });
            }
        }else{
            $(document).bind('keyup', function(e){
                if(e.which==27) {//esc
                    modal.style.display = "none";
                }
                if(e.which==13) {//enter
                    document.getElementById("Finalized").click();
                    $(document).unbind('keyup');
                }
            });
            document.getElementById('progressMarks').value = document.getElementsByClassName('accepted').length;
            modal.style.display = "block";
            event.stopPropagation();
        }
    }
}


// When the user clicks on <span> (x), close the modal
spanclose.onclick = function (event) {
    modal.style.display = "none";
    event.stopPropagation();
    $(document).unbind('keyup');
}
span.onclick = function (event) {
    modal.style.display = "none";
    event.stopPropagation();
    $(document).unbind('keyup');
}

// span2.onclick = function (event) {
//     modal.style.display = "none";
//     event.stopPropagation();
//     $(document).unbind('keyup');
// }

// When the user clicks anywhere outside of the modal, close it
// window.onclick = function (event) {
//     if (event.target == modal) {
//         modal.style.display = "none";
//     }
//     event.stopPropagation();
// }

var myModalTRSPreview;
var spanx;
var PrintTRSBtn = document.getElementById('PrintTRS');


let mypromise = function functionOne(testInput){
    // console.log("Entered function");
    return new Promise((resolve ,reject)=>{
        if(!document.getElementById('PreviewTRS').innerHTML){
            var resolvedFlag = loadPreviewFile();
        }else{
            var resolvedFlag = true;
        }
        setTimeout(
            ()=>{
                console.log("Inside the promise");
                if(resolvedFlag==true){
                   
                    resolve("Resolved");
                }else{
                    reject("Rejected")
                }     
            } , 200
        );
    });
};

PrintTRSBtn.onclick = function (event) {

    mypromise().then((res)=>{
        fillTRS();
        document.getElementById('AgentNamePrepared').innerHTML = document.getElementById('agentNameHidden').value;
        document.getElementById('printedDate1').innerHTML = document.getElementById('timenow').value;
        document.getElementById('printedDate2').innerHTML = document.getElementById('timenow').value;
        // console.log(`The function recieved with value ${res}`)
        return 'Success';
    }).then((res)=>{
        myModalTRSPreview = document.getElementById("myModalTRS");
        spanx = document.getElementById("closeTRS");
        spanx.onclick = function () {
            myModalTRSPreview.style.display = "none";
        }
        myModalTRSPreview.style.display = "block";
        document.getElementById("onclickfield2").style.display="none";
        document.getElementById("onclickfield").style.display="none";
        // console.log(res);
    }).catch((error)=>{
        // console.log(`Handling error as we received ${error}`);
    });

    // event.stopPropagation();
}

function loadPreviewFile(){
    $("#PreviewTRS").load("../popupshtml/TRSPreviewPrintAppraisal.html");
    return true; 
}

function chackWarnings(){
    var WarningTab = document.getElementById('warnings');
    var WarningTabError = 0;

    // Closing Date Check
    var CurrentDate = new Date()
    var WarningDate = document.getElementById('WarningClosingDate');
    var closingDate = new Date(document.getElementById('CompletionDate').value);
    diff = CurrentDate - closingDate;
    if (diff > 5184082837) {
        WarningDate.style.display = '';
        WarningTabError = 1;
    } else if(diff<5184082837){
        WarningDate.style.display = 'none';
    }

    // Edited HST Warning
    var WarningHST = document.getElementById('WarningHST');
    if(document.getElementsByClassName('ChangedHST')[0].style.display == 'none'){
        WarningHST.style.display = 'none';
    }else{
        WarningHST.style.display = ''; WarningTabError = 1;;
    }

    if( WarningTabError == 1){
        WarningTab.style.display = '';
    }else{
        WarningTab.style.display = 'none';
    }
}

function fillTRS(){
    try{
        document.getElementById('dealID').innerHTML =  document.getElementsByClassName('forAddressTop')[0].getElementsByTagName('label')[1].innerHTML;
    }catch(err){
        document.getElementById('dealID').innerHTML = '-';
    }
    //Head part
    document.getElementById('RecordsheetReportDatePreview').innerHTML =  document.getElementById('RecordsheetReportDate').value;
    document.getElementById('RecordsheetSourcePreview').innerHTML = document.getElementById('RecordsheetSource').value;
    document.getElementById('RecordsheetAppraisalfeePreview').innerHTML = document.getElementById('RecordsheetAppraisalfee').value;

    //Table Parts
    var tables = []; var tablesOriginal = []; var rows = []; var rowsOriginal = []; var labels = []; var inputs = [];
    var table1 = document.getElementById("tablePartiesPreview");
    var table2 = document.getElementById("tableComissionsPreview");
    var table1Original = document.getElementById("tableOne");
    var table2Original = document.getElementById("tableTwo");

    chackWarnings();

    PropertyAddress("PropertyPreview");

    tables.push(table1, table2);
    tablesOriginal.push(table1Original, table2Original);

    var hideHST = document.getElementsByClassName('ChangedHST');
    if(hideHST[0].style.display == 'none'){
        for(let i = 0; i<hideHST.length;i++){
            hideHST[i].style.display = 'none';
        }
    }else{
        for(let i = 0; i<hideHST.length;i++){
            hideHST[i].style.display = '';
        }
    }

    for(let i = 0; i<tables.length; i++){
        rows = tables[i].getElementsByTagName('tr');
        rowsOriginal = tablesOriginal[i].getElementsByTagName('tr');
        for(let j = 0; j<rows.length; j++){
            if(rowsOriginal[j].classList.contains('visible')){
                rows[j].classList.add('visible');
            }else{
                rows[j].classList.add('hidden');
            }
           labels = rows[j].getElementsByClassName('inlineInput');
           inputs = rowsOriginal[j].getElementsByClassName('inlineInput');
            for(let k=0; k<labels.length; k++){
                if(inputs[k].value){
                    if(labels[k].tagName == 'LABEL'){
                        labels[k].innerHTML = inputs[k].value;
                    }else{
                        labels[k].value = inputs[k].value;
                    }
                }else{
                    if(labels[k].tagName == 'LABEL'){
                        labels[k].innerHTML = '';
                    }else{
                        labels[k].value = '';
                    }
                }
            }
        }   
    }
}

function reopen(){
    var modal = document.getElementById('myModalReopen');
    modal.style.display = 'block';
    ourForm.target = '';
    modal.getElementsByClassName('close')[0].onclick = function () {
        modal.style.display = "";
        ourForm.target = defaultTarget;
    }
}

function showAddParties(){
    var div =  document.getElementById('optionalDIV')
    if(div.classList.contains('remove')){
      document.getElementById('optionalDIV').style.maxHeight = '2400px';
     div.classList.remove('remove');
      document.getElementById('iconEmailPreview').classList.add('rotate');
    }else{
      document.getElementById('optionalDIV').style.maxHeight = '0px';
      div.classList.add('remove');
      document.getElementById('iconEmailPreview').classList.remove('rotate');
    }
  }
// On load of page

document.querySelectorAll('input').forEach((input) => {
    input.addEventListener('input', function () {
           this.style.borderColor = "lightgrey";
    });
});
forSelects();

TabsHandleler(event, 'TransactionDetails', 'tabcontent', 'tablinks', 'TransactionDetailsTab');