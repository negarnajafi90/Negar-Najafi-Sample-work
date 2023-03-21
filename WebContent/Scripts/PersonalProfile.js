$(function () {
    $('#DateOfBirth').datepicker({
        format: "dd M yyyy"
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        document.getElementById(this.id).style.borderColor =
            "lightgrey";
        document.getElementById(this.id).nextElementSibling.style
            .borderColor = "lightgrey";
    });

});
$(function () {
    $('#StartDate').datepicker({
        format: "dd M yyyy",
        startDate: '1d'

    }).on('changeDate', function (e) {
        var anndate= new Date($("#StartDate").val());
        var minDate = anndate.setDate(anndate.getDate());
        var someDate = new Date($("#StartDate").val());
        var maxDate = someDate.setDate(someDate.getDate() + 365);
        if(new Date($("#AnniversaryDate").val()) < new Date($("#StartDate").val())){
        $('#AnniversaryDate').datepicker('setDate', new Date($("#StartDate").val()));
        }
        
        if(minDate != ''){
            $('#AnniversaryDate').datepicker('setStartDate', new Date(minDate));
        }

        if(maxDate != ''){
            $('#AnniversaryDate').datepicker('setEndDate', new Date(maxDate));
        }
        
        $(this).datepicker('hide');
    });

});
$(function () {
    $('#AnniversaryDate').datepicker({
        format: "dd M yyyy",
        startDate: '1d',
        endDate:  new Date(new Date().setYear(new Date().getFullYear()+1))
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
    });

});
$(function () {
    $('#HireDate').datepicker({
        format: "dd M yyyy"
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
    });

});

$("#showMoreEmail").on("click", function () {
    $("#emailShow").slideToggle();
    $(this).toggleClass('rotated');
});

$("#showMorePassword").on("click", function () {
    $("#AccessMainSection").slideToggle();
    $(this).toggleClass('rotated');
});

var CurrectCurrentPassword;

function checkEmail(Email) {

    var NewEmail = document.getElementById("NewLoginEmail").value;

    if (!NewEmail) {

        document.getElementById('EmailChange').type = 'button';

        document.getElementById('ErrorEmail').style.display = "block";


    } else if (NewEmail === Email) {

        document.getElementById('EmailChange').type = 'button';

        document.getElementById('ErrorEmail').style.display = "block";

        document.getElementById('ErrorEmptyEmail').style.display = "none";

    } else {
        document.getElementById('EmailChange').type = 'submit';


        document.getElementById('ErrorEmptyEmail').style.display = "none";

        document.getElementById('ErrorEmail').style.display = "none";
    }
}

function changeFormTarget(el) {

    el.form.setAttribute('target', '_self')
}