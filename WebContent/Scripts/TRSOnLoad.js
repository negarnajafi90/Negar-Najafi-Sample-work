var ourForm = document.getElementById('EmailForm');
var defaultTarget = 'hiddenFrame';

var docsBlock = document.getElementById('storedDocuments');
var count = 0;
var countNotes = 0;
const inputElement = document.getElementById("documentSubmitbtn");
inputElement.addEventListener("click", handleFiles, false);

const dealStatus = document.getElementById('PropertyListingStatus').value;


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

function loadPreviewFile() {
    $("#PreviewTRS").load("../popupshtml/TRSPreviewPrint.html");
    return true;
}

function chackWarnings() {
    var WarningTab = document.getElementById('warnings');
    var WarningTabError = 0;

    // Closing Date Check
    var CurrentDate = new Date()
    var WarningDate = document.getElementById('WarningClosingDate');
    var closingDate = new Date(document.getElementById('PropertyClosingDate').value);
    diff = CurrentDate - closingDate;
    if (diff > 5184082837) {
        WarningDate.style.display = '';
        WarningTabError = 1;
    } else if (diff < 5184082837) {
        WarningDate.style.display = 'none';
    }

    // Deposits Check
    var ErrorDeposit = 0;
    var ErrorThirdParty = 0;
    var WarningDeposit = document.getElementById('WarningDeposit');
    var WarningThirdParty = document.getElementById('WarningThirdParty');

    var deposits = [document.getElementById('DepositType1').value, document.getElementById('DepositType2').value, document.getElementById('DepositType3').value, document.getElementById('DepositType4').value];
    var received = [document.getElementById('DepositReceivedFrom1').value, document.getElementById('DepositRecivedFrom2').value, document.getElementById('DepositRecivedFrom3').value, document.getElementById('DepositReceivedFrom4').value];

    for (let i = 0; i < deposits.length; i++) {
        if (deposits[i] == 'Cash') {
            ErrorDeposit = 1;
        }
        if (received[i] == 'Third Party') {
            ErrorThirdParty = 1;
        }
    }
    if (ErrorDeposit == 1) {
        WarningDeposit.style.display = '';
        WarningTabError = 1;
    } else {
        WarningDeposit.style.display = 'none'
    }
    if (ErrorThirdParty == 1) {
        WarningThirdParty.style.display = '';
        WarningTabError = 1;
    } else {
        WarningThirdParty.style.display = 'none'
    }

    // Edited HST Warning
    var WarningHST = document.getElementById('WarningHST');
    if (document.getElementsByClassName('ChangedHST')[0].style.display == 'none') {
        WarningHST.style.display = 'none';
    } else {
        WarningHST.style.display = '';
        WarningTabError = 1;;
    }

    // Commissions Check
    var WarningLeaseCommission = document.getElementById('WarningLeaseCommission');
    var WarningCommission = document.getElementById('WarningCommission');

    var Price = parseFloat(document.getElementById("ProPertyListingPrice").value);
    var list = parseFloat(document.getElementById("PropertyListingComission").value);
    var sell = parseFloat(document.getElementById("PropertySellingComission").value);
    var finalList = 0
    var finalSell = 0

    if (document.getElementById("ListingComiissionFixedAmount").checked == true) {
        finalList = (list * 100) / Price;
    } else {
        finalList = list;
    }
    if (document.getElementById("SellingComiissionFixedAmount").checked === true) {
        finalSell = (sell * 100) / Price;
    } else {
        finalSell = sell;
    }

    var Total = finalList + finalSell;

    var ListingType = document.getElementById("PropertyListingType").value;

    if (ListingType === "Buyer-Side" || ListingType === "Listing-Side" || ListingType === "Sale-Double-Sided" || ListingType === "BuyerSide-Self-Represented-Vendor") {

        WarningLeaseCommission.style.display = "none";
        if ((document.getElementById('ComissionError').style.display === 'none')) {
            if (Total > 5) {
                WarningCommission.style.display = "";
                WarningTabError = 1;;
                warning = 1;
            } else {
                WarningCommission.style.display = "none";
            }
        } else {
            WarningCommission.style.display = "none";
        }
    } else {
        WarningCommission.style.display = "none";
        if (Total > 100) {
            WarningLeaseCommission.style.display = "";
            WarningTabError = 1;;
            warning = 1;
        } else {
            WarningLeaseCommission.style.display = "none";
        }
    }

    if (WarningTabError == 1) {
        WarningTab.style.display = '';
    } else {
        WarningTab.style.display = 'none';
    }
}

function fillTRS() {
    // var TRSPreview = document.getElementById("myModalTRS");
    // var TRSSection = document.getElementById("MainTRSPreviewsection")
    try{
        document.getElementById('dealID').innerHTML = document.getElementById('dealtypeSpan').innerHTML;
    }catch(err){
        document.getElementById('dealID').innerHTML = '-';
    }

    //Head part
    document.getElementById('TRSPricePreview').innerHTML = document.getElementById('TRSPrice').innerHTML;
    document.getElementById('TRSListCommissionPercentPreview').innerHTML = document.getElementById('TRSListCommissionPercent').innerHTML;
    document.getElementById('TRSSellCommissionPercentPreview').innerHTML = document.getElementById('TRSSellCommissionPercent').innerHTML;
    document.getElementById('TRSListingSidePreview').innerHTML = document.getElementById('TRSListingSide').innerHTML;
    document.getElementById('TRSStatusPreview').innerHTML = document.getElementById('TRSStatus').innerHTML;
    document.getElementById('TRSSourcePreview').innerHTML = document.getElementById('TRSSource').innerHTML;
    document.getElementById('TRSClosingDatePreview').innerHTML = document.getElementById('TRSClosingDate').innerHTML;
    document.getElementById('TRSMLSPreview').innerHTML = document.getElementById('TRSMLS').innerHTML;
    document.getElementById('ReciveOrRefoundAmountPreview').innerHTML = document.getElementById('ReciveOrRefoundAmount').innerHTML;
    document.getElementById('ReceivableLabel').innerHTML = document.getElementById('ReceivableLabel').innerHTML;

    //TAble Parties
    var tables = [];
    var tablesOriginal = [];
    var rows = [];
    var rowsOriginal = [];
    var labels = [];
    var inputs = [];
    var table1 = document.getElementById("PartiesPreview");
    var table2 = document.getElementById("SplitPreview");
    var table3 = document.getElementById("TRSDepositsPreview");
    var table4 = document.getElementById("CommisionsIncomePreview");
    var table5 = document.getElementById("tableExpensesPreview");
    var table1Original = document.getElementById("tableOne");
    var table2Original = document.getElementById("AgentTable");
    var table3Original = document.getElementById("depositsTable");
    var table4Original = document.getElementById("CommisionsIncome");
    var table5Original = document.getElementById("tableExpenses");

    chackWarnings();

    PropertyLabel("PropertyPreview");

    tables.push(table1, table2, table3, table4, table5);
    tablesOriginal.push(table1Original, table2Original, table3Original, table4Original, table5Original);
    var hideHST = document.getElementsByClassName('ChangedHST');
    if (hideHST[0].style.display == 'none') {
        for (let i = 0; i < hideHST.length; i++) {
            hideHST[i].style.display = 'none';
        }
    } else {
        for (let i = 0; i < hideHST.length; i++) {
            hideHST[i].style.display = '';
        }
    }

    for (let i = 0; i < tables.length; i++) {
        rows = tables[i].getElementsByTagName('tr');
        rowsOriginal = tablesOriginal[i].getElementsByTagName('tr');
        for (let j = 0; j < rows.length; j++) {
            if (rowsOriginal[j].classList.contains('visible')) {
                rows[j].classList.add('visible');
            } else {
                rows[j].classList.add('hidden');
            }
            labels = rows[j].getElementsByClassName('inlineInput');
            inputs = rowsOriginal[j].getElementsByClassName('inlineInput');
            for (let k = 0; k < labels.length; k++) {
                if (inputs[k].value) {
                    labels[k].innerHTML = inputs[k].value;
                } else {
                    labels[k].innerHTML = '';
                }
            }
        }
    }
}

function showAddParties() {
    var div = document.getElementById('optionalDIV')
    if (div.classList.contains('remove')) {
        document.getElementById('optionalDIV').style.maxHeight = '2400px';
        div.classList.remove('remove');
        document.getElementById('iconEmailPreview').classList.add('rotate');
    } else {
        document.getElementById('optionalDIV').style.maxHeight = '0px';
        div.classList.add('remove');
        document.getElementById('iconEmailPreview').classList.remove('rotate');
    }
}


function forSelectsMulti() {

    try {
        var x, i, j, l, ll, selElmnt, a, b, c, checkElem, counter;
        /* Look for any elements with the class "custom-select": */
        x = document.getElementsByClassName("custom-select2");
        l = x.length;
        var tabs = 1;
        for (i = 0; i < l; i++) {
            var tableact = "'tableTrust" + tabs + "'";
            tabs++;
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
            counter = 0
            for (j = 1; j < ll; j++) {

                /* For each option in the original select element,
                create a new DIV that will act as an option item: */
                c = document.createElement("DIV");

                // checkElem =  '<input type="checkbox" id="checkType'+counter+'" class="sss">';
                // console.log(tableact);
                var smth = counter + ',' + tableact;
                checkElem = '<label class="container multichoice"><input class="inlineInput check' + counter + '" checked = "true" onclick="HideShowRows(' + smth + ')" type="checkbox"> <span class="checkmark"></span></label>';
                counter++;
                // checkElem.setAttribute("type", "checkbox");
                c.innerHTML = '<label class="forcheckLabelList">' + selElmnt.options[j].innerHTML + '</label>' + checkElem;
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

                            break;
                        }

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

                this.nextSibling.classList.toggle("select-hide");
                this.classList.toggle("select-arrow-active");
            });

            b.addEventListener("click", function (e) {
                e.stopPropagation();

                // if(!this.nextSibling.classList.contains("select-hide")){
                //     this.nextSibling.classList.toggle("select-hide");
                // }
                this.classList.toggle("select-arrow-active");

            });
        }
    } catch (err) {
        document.getElementById("demo").innerHTML = err.message;
    }

}

function HideShowRows(number, tableid) {
    var table = document.getElementById(tableid);
    var forid = +number + 1;
    var rowsToChange = table.getElementsByClassName('rowTrust' + forid);


    var cond = table.parentElement.parentElement.getElementsByClassName('check' + number)[0].checked;
    // console.log('condition: '+cond);
    if (!cond) {
        console.log('yes')
        for (let i = 0; i < rowsToChange.length; i++) {
            rowsToChange[i].style.display = 'none';
            console.log('Row to hide: ' + rowsToChange[i]);
        }
    } else {
        console.log('no')
        for (let i = 0; i < rowsToChange.length; i++) {
            rowsToChange[i].style.display = '';
            console.log('Row to display: ' + rowsToChange[i]);
        }
    }

    forid = 0;
}


function handleFiles() {
    var datenow = new Date().toLocaleTimeString([], {
        year: 'numeric',
        month: 'numeric',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });

    var id = 'FileName' + count;
    if (document.getElementById(id).value) {
        if (document.getElementById('EXtraDocumentName1').value.trim()) {
            var id2 = 'FileName' + parseFloat(count + 1);

            // document.getElementById(id).parentElement.style.display = '';
            // document.getElementById(id).parentElement.getElementsByTagName('label')[0].innerHTML = document.getElementById('EXtraDocumentName1').value;
            // document.getElementById(id).parentElement.getElementsByTagName('label')[1].innerHTML = 'Uploaded on: '+datenow;


            const fileList = document.getElementById(id).files; /* now you can work with the file list */

            const numFiles = fileList.length;

            var blob = new Blob(document.getElementById(id).files, {
                type: document.getElementById(id).files[0].type
            });
            var url = window.URL.createObjectURL(blob);

            for (let i = 0; i < numFiles; i++) {

                var oneDocumentDiv = document.createElement("DIV");
                oneDocumentDiv.setAttribute("class", 'oneDocument');

                var oneDocumentInput = document.createElement("INPUT");

                oneDocumentInput.setAttribute("id", id2);
                oneDocumentInput.setAttribute("type", "file");
                oneDocumentInput.setAttribute("accept", ".pdf");
                oneDocumentInput.addEventListener("change", function (e) {
                    docNameFill(id2);
                });

                var nameLabel = document.createElement("LABEL");
                nameLabel.innerHTML = document.getElementById('EXtraDocumentName1').value;
                var createdAtLabel = document.createElement("LABEL");
                createdAtLabel.innerHTML = 'Uploaded on: ' + datenow;
                document.getElementById('storedDocuments').appendChild(oneDocumentDiv);

                var closeImgDoc = document.createElement("button");
                var uploadImgDoc = document.createElement("img");
                var linkdoc = document.createElement("a");
                var breakElem = document.createElement("br");

                closeImgDoc.setAttribute("class", 'deleteDoc bi bi-trash floatDataRightSide');
                closeImgDoc.setAttribute("onclick", "deleteDocument('" + id2 + "')");
                uploadImgDoc.src = '../ImagesUsed/Upload.png';
                uploadImgDoc.setAttribute("class", 'uploadImgDoc');

                linkdoc.target = "_blank";
                linkdoc.href = url;
                linkdoc.appendChild(uploadImgDoc);

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
        } else {
            document.getElementById('noNameDocumentError').style.display = '';
            document.getElementById('EXtraDocumentName1').style.borderColor = 'red';
        }
        document.getElementById('noDocumentError').style.display = 'none';
        document.getElementById('doclab').style.borderColor = '';
    } else {
        document.getElementById('noDocumentError').style.display = '';
        document.getElementById('doclab').style.borderColor = 'red';
    }
    setTimeout(function () {
        document.getElementById('DocumentsSave').click();
    }, 1000);
}

function displayUploaded(id) {
    document.getElementById(id).style.display = '';
}

function changeDateLabel(sectionId, id) {
    document.getElementById(sectionId).style.display = '';
    document.getElementById(sectionId).getElementsByTagName('label')[1].innerHTML = 'Uploaded on: ' + new Date().toLocaleString();
    displayUploaded(id);
}

function deleteDocument(documentId) {
    let file = document.getElementById(documentId);
    file.value = '';
    file.parentElement.style.display = 'none';
}

function movetocompleted() {
    let modal = document.getElementById('myModalCompleted');
    if (!ChecksEmptyFieldsfirstStep()) {
        modal.style.display = 'block';
        ourForm.target = '';
        modal.getElementsByClassName('close')[0].onclick = function () {
            modal.style.display = "";
            ourForm.target = defaultTarget;
        }
    }
}

function reopen() {
    let newOption = new Option('Reopened', 'Reopened');
    document.getElementById('PropertyListingStatus').add(newOption, undefined);
    document.getElementById('PropertyListingStatus').value = 'Reopened';

    let modal = document.getElementById('myModalReopen');
    modal.style.display = 'block';
    ourForm.target = '';

    modal.getElementsByClassName('close')[0].onclick = function () {
        modal.style.display = "";
        ourForm.target = defaultTarget;
    }
}

function saveNotes(fname, lname) {
    if (document.getElementById('ExteraNotes').value.trim()) {

        document.getElementById('allNotesDocuments').value = document.getElementById('ExteraNotes').value;

        document.getElementById('ExteraNotes').parentElement.style.borderColor = 'lightgrey';
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
        NotesNameLabel.innerHTML = fname + ' ' + lname;
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

function deleteNote(id) {
    let element = document.getElementById(id);
    console.log(element);
    element.style.display = "none";
}

//   var myModalExpired = document.getElementById("myModalExpired");
// var spanx = myModalExpired.getElementsByClassName("close")[0];
// spanx.onclick = function () {
//     myModalExpired.style.display = "none";
// }

// var myModalOffMarket = document.getElementById("myModalOffMarket");
// var spanx = myModalOffMarket.getElementsByClassName("close")[0];
// spanx.onclick = function () {
//     myModalOffMarket.style.display = "none";
// }

// var myModalAvailable = document.getElementById("myModalAvailable");
// var spanx = myModalAvailable.getElementsByClassName("close")[0];
// spanx.onclick = function () {
//     myModalAvailable.style.display = "none";
// }


var modal = document.getElementById("myModal");
var spanclose = modal.getElementsByClassName("close")[0];
// var span = modal.getElementsByClassName("closeSign")[0];
// var span2 = modal.getElementsByClassName("closeSign")[1];
var btn = document.getElementById("TRSNExt");
spanclose.onclick = function (event) {
    $(document).unbind('keyup');
    modal.style.display = "none";
    event.stopPropagation();
}
// span.onclick = function (event) {
//     modal.style.display = "none";
//     event.stopPropagation();
// }

// span2.onclick = function (event) {
//     modal.style.display = "none";
//     event.stopPropagation();
// }
if (!(btn == null)) {
    btn.onclick = function (event) {
        $(document).bind('keyup', function (e) {
            if (e.which == 27) { //esc
                modal.style.display = "none";
            }
            if (e.which == 13) { //enter
                document.getElementById("Finalized").click();
                $(document).unbind('keyup');
            }
        });
        document.getElementById('progressMarks').value = document.getElementsByClassName('accepted').length;
        let d2 = new Date(document.getElementById('PropertyClosingDate').value);
        if (d2 < new Date()) {
            if (document.getElementById('ConfirmationRecordSheet')) {
                if (document.getElementById('ConfirmationRecordSheet').checked == true) {
                    modal.style.display = "block";
                    event.stopPropagation();
                    document.getElementById('TermsError').style.display = 'none';
                    document.getElementById('WarningClosingFinalize').style.display = 'none';
                } else {
                    document.getElementById('TermsError').style.display = 'block';
                    window.scrollTo({
                        top: 900,
                        behavior: 'smooth'
                    });
                }
            } else {
                modal.style.display = "block";
                event.stopPropagation();
            }
        } else {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
            document.getElementById('WarningClosingFinalize').style.display = '';
        }

    }
}


var modal2 = document.getElementById("myModalExit");
var span2 = modal2.getElementsByClassName("close")[0];
var setofBtn = document.getElementsByClassName('dropBtn2');
span2.onclick = function (event) {
    modal2.style.display = "none";
    $(document).unbind('keyup');
    // ourForm.target = defaultTarget;
    event.stopPropagation();
}
for (let i = 0; i < setofBtn.length; i++) {
    setofBtn[i].onclick = function (event) {
        $(document).bind('keyup', function (e) {
            if (e.which == 27) { //esc
                modal2.style.display = "none";
            }
            if (e.which == 13) { //enter
                document.getElementById("ExitwithNosaving").click();
            }
        });
        modal2.style.display = "block";
        // ourForm.target = '';
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
        $(document).bind('keyup', function (e) {
            if (e.which == 27) { //esc
                myModalDiscard.style.display = "none";
            }
            if (e.which == 13) { //enter
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
    myModalDelete.style.display = "none";
    $(document).unbind('keyup');
    ourForm.target = defaultTarget;
}
for (let i = 0; i < setofBtnDel.length; i++) {
    setofBtnDel[i].onclick = function (event) {
        $(document).bind('keyup', function (e) {
            if (e.which == 27) {
                ourForm.target = defaultTarget;
                myModalDelete.style.display = "none";
            }
            if (e.which == 13) {
                document.getElementById("Delete").click();
            }
        });
        myModalDelete.style.display = "block";
        ourForm.target = '';
        event.stopPropagation();
    }
}
var setofBtnDel4 = document.getElementsByClassName('dropBtn4');
for (let i = 0; i < setofBtnDel4.length; i++) {
    if (setofBtnDel4[i]) {
        setofBtnDel4[i].onclick = function (event) {
            $(document).bind('keyup', function (e) {
                if (e.which == 27) {
                    ourForm.target = defaultTarget;
                    myModalDelete.style.display = "none";
                }
                if (e.which == 13) {
                    document.getElementById("Delete").click();
                }
            });
            myModalDelete.style.display = "block";
            ourForm.target = '';
            event.stopPropagation();
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
    $(document).bind('keyup', function (e) {
        if (e.which == 27) { //esc
            myModalHST.style.display = "none";
        }
        if (e.which == 13) { //enter
            document.getElementById("ResetHSTbutton").click();
        }
    });
    myModalHST.style.display = "block";
    event.stopPropagation();
}


const setofbuttonSaveSpecial = document.getElementsByClassName('saveSpecial');
for (const element of setofbuttonSaveSpecial) {
    element.onclick = function (event) {

        myModalSave.style.display = "block";
        setTimeout(
            function () {
                document.getElementById('myModalSave').style.marginTop = '20px';
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
            }, 2500 /// milliseconds = 10 seconds
        );
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
        if (!ChecksEmptyFieldsfirstStep()) {
            document.getElementById('EmailForm').classList.toggle("loading");
            setofBtnSave[i].type = 'submit';

            setTimeout(
                function () {
                    document.getElementById('EmailForm').classList.toggle("loading");

                    myModalSave.style.display = "block";

                    setTimeout(
                        function () {
                            document.getElementById('myModalSave').style.marginTop = '20px';
                            // myModalSave.style.display = ""; 
                        }, 200 /// milliseconds = 10 seconds
                    );

                    setTimeout(
                        function () {
                            document.getElementById('myModalSave').style.marginTop = '-45px';
                            // myModalSave.style.display = ""; 
                        }, 2000 /// milliseconds = 10 seconds
                    );

                    setTimeout(
                        function () {
                            myModalSave.style.display = "";
                        }, 2500 /// milliseconds = 10 seconds
                    );

                    fileUdated("agentNameHidden");
                }, 5000
            );

            // }
            // document.getElementById('saveError').style.display = 'none';
            // document.getElementById('saveError2').style.display = 'none';

        } else {
            // document.getElementById('saveError').style.display = '';
            // document.getElementById('saveError2').style.display = '';
            TabsHandleler(event, 'PROPERTY DETAILS', 'tabcontent', 'tablinks1', 'PropertyDetailsTab');
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
        document.getElementById('progressMarks').value = document.getElementsByClassName('accepted').length;

        if (!ChecksEmptyFieldsfirstStep()) {
            $(document).bind('keyup', function (e) {
                if (e.which == 27) { //esc
                    ourForm.target = defaultTarget;
                    myModalSaveClose.style.display = "none";
                }
                if (e.which == 13) { //enter
                    document.getElementById("SaveExit").click();
                }
            });

            if(element.id=="Savebtn7"){
                document.querySelector("#myModalSaveClose > div > div.popUpContainer > button").id="SaveExitTRS";
                document.querySelector("#myModalSaveClose > div > div.popUpContainer > button").name="SaveExitTRS";
            }else{
                document.querySelector("#myModalSaveClose > div > div.popUpContainer > button").id="SaveExit";
                document.querySelector("#myModalSaveClose > div > div.popUpContainer > button").name="SaveExit";
            }

            ourForm.target = '';
            myModalSaveClose.style.display = "block";

            event.stopPropagation();
        } else {
            $(document).unbind('keyup');
            TabsHandleler(event, 'PROPERTY DETAILS', 'tabcontent', 'tablinks1', 'PropertyDetailsTab');
        }
    }
}



var modalEmail = document.getElementById("myModalEmail");
var spanEmail = modalEmail.getElementsByClassName("close")[0];
spanEmail.onclick = function () {
    modalEmail.style.display = "";
    $(document).unbind('keyup');
}
var emailbtn = document.getElementById("emailInvoicebtn");
emailbtn.onclick = function () {
    $(document).bind('keyup', function (e) {
        if (e.which == 27) { //esc
            modalEmail.style.display = "none";
        }
    });
    modalEmail.style.display = "block";
    // createEmails();
    emailonload();
    // document.getElementById('myModalEmail').classList.add('slideDown');
}

document.onclick = function (event) {
    closeAllWindows();
    if (event.target == modal2) {
        modal2.style.display = "none";
        // ourForm.target = defaultTarget;
    } else if (event.target == modal) {
        // modal.style.display = "none";
    } else if (event.target == myModalSaveClose) {
        myModalSaveClose.style.display = "none";
        ourForm.target = defaultTarget;
    } else if (event.target == myModalSave) {
        myModalSave.style.display = "none";
    } else if (event.target == myModalDelete) {
        myModalDelete.style.display = "none";
        ourForm.target = defaultTarget;
    } else if (event.target == myModalDiscard) {
        myModalDiscard.style.display = "none";
    } else if (event.target == myModalHST) {
        myModalHST.style.display = "none";
    } else if (event.target == myModalTRSPreview) {
        myModalTRSPreview.style.display = "none";
    } else if (event.target == modalEmail) {
        modalEmail.style.display = "none";
    } else if (event.target == document.getElementById('myModalCompleted')) {
        document.getElementById('myModalCompleted').style.display = "none";
    } else if (event.target == document.getElementById('myModalReopen')) {
        document.getElementById('myModalReopen').style.display = "none";
        document.getElementById('PropertyListingStatus').value = dealStatus;
    }
    event.stopPropagation();
}

var myModalTRSPreview;
var spanx;
var PrintTRSBtn = document.getElementById('TRSPrint');


let mypromise = function functionOne(testInput) {
    // console.log("Entered function");
    return new Promise((resolve, reject) => {
        if (!document.getElementById('PreviewTRS').innerHTML) {
            var resolvedFlag = loadPreviewFile();
        } else {
            var resolvedFlag = true;
        }
        setTimeout(
            () => {
                //console.log("Inside the promise");
                if (resolvedFlag == true) {
                    resolve("Resolved");
                } else {
                    reject("Rejected")
                }
            }, 400
        );
    });
};

PrintTRSBtn.onclick = function (event) {

    mypromise().then((res) => {
        fillTRS();
        document.getElementById('AgentNamePrepared').innerHTML = document.getElementById('agentNameHidden').value;
        document.getElementById('printedDate1').innerHTML = document.getElementById('timenow').value;
        document.getElementById('printedDate2').innerHTML = document.getElementById('timenow').value;
        // console.log(`The function recieved with value ${res}`)
        return 'Success';
    }).then(() => {
        myModalTRSPreview = document.getElementById("myModalTRS");
        spanx = document.getElementById("closeTRS");
        spanx.onclick = function () {
            myModalTRSPreview.style.display = "none";
        }
        myModalTRSPreview.style.display = "block";
        document.getElementById("onclickfield2").style.display = "none";
        document.getElementById("onclickfield").style.display = "none";
    }).catch((error) => {
        console.log(`Handling error as we received ${error}`);
    });

    // event.stopPropagation();
}

// On load of page

document.querySelectorAll('input').forEach((input) => {
    input.addEventListener('input', function () {
        this.style.borderColor = "lightgrey";
    });
});

customsel();

var input1 = document.getElementsByClassName("date-input");

for (let i = 0; i < input1.length; i++) {
    input1[i].addEventListener("keyup", function (event) {
        if (event.keyCode === 46) {
            eraseDate(input1[i]);
        }
    });
}

forSelectsMulti();

TabsHandleler(event, 'PROPERTY DETAILS', 'tabcontent', 'tablinks1', 'PropertyDetailsTab');