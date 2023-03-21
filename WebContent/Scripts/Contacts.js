forSelects();

checkNavBar();

BORhideShow(1);

forSelectsMulti();

$body = $("#MainContacts");
$("#deleteContact").on("click", function(){
     $body.addClass("loading");  
     $("#myModalDelete").css("display", "none");
});

$('#AllcontactsTable').DataTable({
    dom: 'Bfrtip',
    select: true,
    "scrollXInner": true,
    "scrollYInner": "400px",
    "pageLength": 50,
    select: 'single',
    buttons: [{
            extend: 'excelHtml5',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        },
        {
            extend: 'pdfHtml5',
            text: 'PDF',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        },
        {
            extend: 'csvHtml5',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        }

    ]
});

$('#ClientsTable').DataTable({
    dom: 'Bfrtip',
    select: true,
    "scrollXInner": true,
    "scrollYInner": "400px",
    "pageLength": 50,
    select: 'single',
    buttons: [{
            extend: 'excelHtml5',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        },
        {
            extend: 'pdfHtml5',
            text: 'PDF',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        },
        {
            extend: 'csvHtml5',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        }

    ]
});

$('#lawFirmsTable').DataTable({
    dom: 'Bfrtip',
    select: true,
    "scrollXInner": true,
    "scrollYInner": "400px",
    "pageLength": 50,
    select: 'single',
    buttons: [{
            extend: 'excelHtml5',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        },
        {
            extend: 'pdfHtml5',
            text: 'PDF',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        },
        {
            extend: 'csvHtml5',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        }

    ]
});

$('#BrokeragesTable').DataTable({
    dom: 'Bfrtip',
    select: true,
    "scrollXInner": true,
    "scrollYInner": "400px",
    "pageLength": 50,
    select: 'single',
    buttons: [{
            extend: 'excelHtml5',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        },
        {
            extend: 'pdfHtml5',
            text: 'PDF',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        },
        {
            extend: 'csvHtml5',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        }

    ]
});

$(document).ready(function () {
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        $($.fn.dataTable.tables(true)).css('width', '80vw');
        $($.fn.dataTable.tables(true)).DataTable().columns.adjust().draw();
    });
});

function remove(num) {
    document.getElementsByClassName('dt-buttons')[num].classList.remove('showit');
}

function enable(id, tableid) {
    if (containsSelected(document.getElementById(tableid))) {
        document.getElementById(id).type = 'submit';
    } else {
        document.getElementById(id).type = 'button';
    }
}

var myModalDelete = document.getElementById("myModalDelete");
var spanx = myModalDelete.getElementsByClassName("close")[0];
var myModalEdit = document.getElementById("myModalEdit");
var spanedit = myModalEdit.getElementsByClassName("close")[0];

var setofBtnDel1 = document.getElementById('DeleteContacts1');
var setofBtnDel2 = document.getElementById('DeleteContacts2');
var setofBtnDel3 = document.getElementById('DeleteContacts3');
var setofBtnDel4 = document.getElementById('DeleteContacts4');

var setofBtnEdit1 = document.getElementById('EditContacts1');
var setofBtnEdit2 = document.getElementById('EditContacts2');
var setofBtnEdit3 = document.getElementById('EditContacts3');
var setofBtnEdit4 = document.getElementById('EditContacts4');

var table1 = document.getElementById('AllcontactsTable');
var table2 = document.getElementById('ClientsTable');
var table3 = document.getElementById('lawFirmsTable');
var table4 = document.getElementById('BrokeragesTable');

spanx.onclick = function () {
    myModalDelete.style.display = "none";
}

spanedit.onclick = function () {
    myModalEdit.style.display = "none";
}

setofBtnEdit1.onclick = function (event) {
    if (containsSelected(table1)) {
        // myModalEdit.style.display = "block";

        document.getElementById('ErrorEdit1').style.display = 'none';
        var SplitString = document.getElementById('ContactID').value;

        window.location.replace("EditContact.jsp?ContactID=" + SplitString)
    } else {
        document.getElementById('ErrorEdit1').style.display = '';
        document.getElementById('ErrorDelete1').style.display = 'none';
    }
    event.stopPropagation();
}

setofBtnEdit2.onclick = function (event) {
    if (containsSelected(table2)) {
        // myModalEdit.style.display = "block";
        document.getElementById('ErrorEdit2').style.display = 'none';
        var SplitString = document.getElementById('ContactID').value;

        window.location.replace("EditContact.jsp?ContactID=" + SplitString)
    } else {
        document.getElementById('ErrorEdit2').style.display = '';
        document.getElementById('ErrorDelete2').style.display = 'none';
    }
    event.stopPropagation();
}

setofBtnEdit3.onclick = function (event) {
    if (containsSelected(table3)) {
        // myModalEdit.style.display = "block";
        document.getElementById('ErrorEdit3').style.display = 'none';

        var SplitString = document.getElementById('ContactID').value;

        window.location.replace("EditContact.jsp?ContactID=" + SplitString);
    } else {
        document.getElementById('ErrorEdit3').style.display = '';
        document.getElementById('ErrorDelete3').style.display = 'none';
    }
    event.stopPropagation();
}

setofBtnEdit4.onclick = function (event) {
    if (containsSelected(table4)) {
        // myModalEdit.style.display = "block";
        document.getElementById('ErrorEdit4').style.display = 'none';

        var SplitString = document.getElementById('ContactID').value;

        window.location.replace("EditContact.jsp?ContactID=" + SplitString)
    } else {
        document.getElementById('ErrorEdit4').style.display = '';
        document.getElementById('ErrorDelete4').style.display = 'none';
    }
    event.stopPropagation();
}

setofBtnDel1.onclick = function (event) {
    if (containsSelected(table1)) {
        myModalDelete.style.display = "block";
        document.getElementById('ErrorDelete1').style.display = 'none';
    } else {
        document.getElementById('ErrorDelete1').style.display = '';
        document.getElementById('ErrorEdit1').style.display = 'none';

    }
    event.stopPropagation();
}

setofBtnDel2.onclick = function (event) {
    if (containsSelected(table2)) {
        myModalDelete.style.display = "block";
        document.getElementById('ErrorDelete2').style.display = 'none';
    } else {
        document.getElementById('ErrorDelete2').style.display = '';
        document.getElementById('ErrorEdit2').style.display = 'none';
    }
    event.stopPropagation();
}

setofBtnDel3.onclick = function (event) {
    if (containsSelected(table3)) {
        myModalDelete.style.display = "block";
        document.getElementById('ErrorDelete3').style.display = 'none';
    } else {
        document.getElementById('ErrorDelete3').style.display = '';
        document.getElementById('ErrorEdit3').style.display = 'none';
    }
    event.stopPropagation();
}

setofBtnDel4.onclick = function (event) {
    if (containsSelected(table4)) {
        myModalDelete.style.display = "block";
        document.getElementById('ErrorDelete4').style.display = 'none';
    } else {
        document.getElementById('ErrorDelete4').style.display = '';
        document.getElementById('ErrorEdit4').style.display = 'none';
    }
    event.stopPropagation();
}


document.onclick = function (event) {

    if (event.target == myModalDelete) {
        myModalDelete.style.display = "none";
    }

    if (!((event.target.className == 'contactButton') || event.target == document.getElementById(
            'optionsImgExportid'))) {
        if (document.getElementsByClassName('dt-buttons')[0].classList.contains('showit')) {
            remove(0);
        }
        if (document.getElementsByClassName('dt-buttons')[1].classList.contains('showit')) {
            remove(1);
        }
        if (document.getElementsByClassName('dt-buttons')[2].classList.contains('showit')) {
            remove(2);
        }
        if (document.getElementsByClassName('dt-buttons')[3].classList.contains('showit')) {
            remove(3);
        }
    }

    event.stopPropagation();
}

// function HideShowRows(number, tableid) {
//     var table = document.getElementById(tableid);
//     var forid = +number + 1;
//     var rowsToChange = table.getElementsByClassName('row' + forid + 'Comission');


//     var cond = table.parentElement.parentElement.parentElement.parentElement.getElementsByClassName('check' + number)[
//         0].checked;
//     if (!cond) {
//         for (let i = 0; i < rowsToChange.length; i++) {
//             rowsToChange[i].style.display = 'none';
//         }
//     } else {
//         for (let i = 0; i < rowsToChange.length; i++) {
//             rowsToChange[i].style.display = '';
//         }
//     }

//     forid = 0;
//     // event.stopPropagation();
// }

function forSelectsMulti() {
    var x, i, j, l, ll, selElmnt, a, b, c, checkElem, counter;
    /* Look for any elements with the class "custom-select": */
    x = document.getElementsByClassName("custom-select2");
    l = x.length;
    var tabs = 1;
    for (i = 0; i < l; i++) {
        // var tableact = "'AllcontactsTable" + "'";
        var tableact = "'" + x[i].parentElement.parentElement.getElementsByTagName('table')[0].id + "'";
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
            checkElem = '<label class="container multichoice"><input class="inlineInput check' + counter +
                '" checked = "true" onclick="HideShowRows(' + smth +
                ')" type="checkbox"> <span class="checkmark"></span></label>';
            counter++;
            // checkElem.setAttribute("type", "checkbox");
            c.innerHTML = '<label class="forcheckLabelList">' + selElmnt.options[j].innerHTML + '</label>' +
                checkElem;
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


            // closeAllSelect(this);
            this.nextSibling.classList.toggle("select-hide");
            this.classList.toggle("select-arrow-active");
            e.stopPropagation();
        });

        b.addEventListener("click", function (e) {
            /* When the select box is clicked, close any other select boxes,
            and open/close the current select box: */

            // closeAllSelect(this);
            this.classList.toggle("select-hide");
            // this.classList.toggle("select-arrow-active");
            e.stopPropagation();
        });
    }
}




function SetID(ID) {

    document.getElementById('ContactID').value = ID;
    document.getElementById('ContactID1').value = ID;

}
document.getElementById('DisplayFields1').getElementsByClassName('check7')[0].checked = false;
document.getElementById('DisplayFields1').getElementsByClassName('check8')[0].checked = false;
HideShowRows(7,'AllcontactsTable');
HideShowRows(8,'AllcontactsTable');

