<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%@ page import="java.text.NumberFormat" %>

<%@ page import="java.util.Locale" %>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="ProMasterClasses.CommissionDetails"  %>

<%@ page import="ProMasterClasses.Invoice"  %>

<%@ page import="java.text.DecimalFormat"  %>

<%@ page import="java.util.Formatter"  %>

<%@ page import="java.util.Date"  %>

<%@ page import="java.text.SimpleDateFormat"  %>

<%@ page import="java.sql.Connection" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<script>

window.onpageshow = function (event) {
  if (event.persisted) {
    window.location.reload(); //reload page if it has been loaded from cache
  }
};

</script>


<% 

SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy");
SimpleDateFormat sdftime = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");

int UserID=0;//(int)session.getAttribute("Userid") ;
int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
int Type=1;//(String)session.getAttribute("Type") ;
String Email="";//(String)session.getAttribute("Email") ;

if( session.getAttribute("Userid")==null  ){
  response.sendRedirect("../index.jsp");
  return;
}

else{
	 UserID=(int)session.getAttribute("Userid"); 
	 BrokerID=(int)session.getAttribute("Brokerid") ;		   	   
     //Type=(int)session.getAttribute("Type") ;
     Email=(String)session.getAttribute("Email") ;
}

%>

<%-- <%
	//int timeout = session.getMaxInactiveInterval();

//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp");
%> --%>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>

    <script type="text/javascript" src="../Scripts/jQuerry/jsPDF.min.js"></script>
   
    <script type="text/javascript" src="../Scripts/jQuerry/bootstrap.min.js"></script>
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script type="text/javascript" src="../DataTables/datatables.min.js"></script>
  
    <script type="text/javascript" src="../Scripts/jQuerry/bootstrap-datepicker.js"></script>

	<%-- <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> --%>

	<link rel="stylesheet" type="text/css" href="../DataTables/datatables.min.css" />

<script src="//cdn.datatables.net/plug-ins/1.10.12/sorting/datetime-moment.js"></script>
<script src="//cdn.datatables.net/datetime/1.2.0/js/dataTables.dateTime.min.js"></script>

    <link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" type="text/css" />

    <link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

    <link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

    <link rel="stylesheet" type="text/css" href="../CSS/Deals.css">

    <link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

    <link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

    <link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css">

    <link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

    <link rel="stylesheet" type="text/css" href="../CSS/TRSAndTable.css">

    <link rel="stylesheet" type="text/css" href="../CSS/forDateField.css">

    <link rel="stylesheet" type="text/css" href="../CSS/forModals.css">
    <link rel="stylesheet" type="text/css" href="../CSS/dataDates.css">

    <script type="text/javascript" src="../Scripts/Dashboard.js"></script>
    <script type="text/javascript" src="../Scripts/Reports.js"></script>

    <title>Reports - Masterre</title>
    
    <link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">
</head>

<header>


</header>

<%


NumberFormat CanadaVal = NumberFormat.getInstance(new Locale("en", "US"));
CanadaVal.setMinimumFractionDigits(2);
CanadaVal.setMaximumFractionDigits(2);
 
String T=(String)request.getParameter("AgentID"); //Getting the Agent ID which the user has been choosene

int TheAgentID=0;

if(T==null ||T=="" ){ T="0";}else{ T=(String)request.getParameter("AgentID"); }

%>


<body>
    <style>
        .hidden{display: none;}
        .btn{padding-left: 0px; padding-right: 5px;}
    </style>

<script>
     $(function () {

            $('#datefromPending').datepicker({
                format: "dd M yyyy",
                startDate: '-10y'
            }).on('changeDate', function (e) {
                $(this).datepicker('hide');
                getDataPendingSorted();
            });

            $('#datetoPending').datepicker({
                format: "dd M yyyy",
                startDate: '-10y'
            }).on('changeDate', function (e) {
                $(this).datepicker('hide');
                getDataPendingSorted();
            });

            $('#datefromCompleted').datepicker({
                format: "dd M yyyy",
                startDate: '-10y'
            }).on('changeDate', function (e) {
                $(this).datepicker('hide');
                getDataCompletedSorted();
            });

            $('#datetoCompleted').datepicker({
                format: "dd M yyyy",
                startDate: '-10y'
            }).on('changeDate', function (e) {
                $(this).datepicker('hide');
                getDataCompletedSorted();
            });
        })
</script>

<div style='display: flex'>

    <div id="left-Nav-bar-Menu" class="leftcolumn navBar">

        <div class="logo">

			<img class='img1logo' src="../ImagesUsed/MasterRe.png" alt="MasterRe">

			<img class='img2logo' src="../ImagesUsed/MasterRe2.png" alt="MasterRe">

		</div>

        <div class="dropdown" id="forhov">
            <a><button id="createDrop" class="dropbtn" onclick="showOptions()">+</button></a>
        </div>

        <a class="menubartext" href="Dashboard.jsp"><button class="tablinks"><img class="dashboardIcons accept"
                    src="../ImagesUsed/Dashboard.png" alt="YesOrNo" style="margin-bottom: 0px;"><span
                    class="navText">Dashboard</span></button></a>

        <a class="menubartext" href="CommissionCalculator.jsp"><button class="tablinks"> <img
                    class="dashboardIcons accept" src="../ImagesUsed/Commission Calculator.png" alt="YesOrNo"><span
                    class="navText">Commissions Calculator</span></button></a>

        <a class="menubartext" href="Reports.jsp"><button class="tablinks active"><img class="dashboardIcons accept"
                    src="../ImagesUsed/Reports.png" alt="YesOrNo" style="margin-bottom: -3px;"><span
                    class="navText">Deals</span></button></a>

        <a class="menubartext" href="PersonalProfile.jsp"><button class="tablinks"><img class="dashboardIcons accept"
                    src="../ImagesUsed/Personal Profile.png" alt="YesOrNo"><span class="navText">Personal
                    Profile</span></button></a>

        <a class="menubartext forBOR" href="CompanyProfile.jsp"><button class="tablinks"><img class="dashboardIcons accept"
                    src="../ImagesUsed/Company Profile.png" style="margin-bottom: -3px;" alt="YesOrNo"><span
                    class="navText">Company Profile</span></button></a>

        <a class="menubartext" href="Contacts.jsp"><button class="tablinks"><img class="dashboardIcons accept"
                    src="../ImagesUsed/Contacts.png" alt="YesOrNo"><span class="navText">Contacts</span></button></a>

        <a class="menubartext" href="Inbox.jsp" style="display: none;"><button class="tablinks"><img class="dashboardIcons accept"
                    src="../ImagesUsed/Inbox.png" alt="YesOrNo"><span class="navText">Inbox</span></button></a>

        <a class="menubartext" href="../Logout.jsp"><button class="tablinks"><img class="dashboardIcons accept extrasize"
                    src="../ImagesUsed/logOut.png" alt="YesOrNo"><span class="navText">Log Out</span></button></a>

        <button onclick="openNav()" id="navOpenBtn" class="floatDataRightSide" style="display: none;"><img
                class="dashboardIcons accept openClose" src="../ImagesUsed/collapse.png" alt="YesOrNo"></button>

        <button onclick="closeNav()" id="navCloseBtn" class="floatDataRightSide"><img
                class="dashboardIcons accept rotate180 openClose" src="../ImagesUsed/collapse.png"
                alt="YesOrNo"></button>



    </div><!-- Closing left-Nav-bar-Menu -->

    <div id="Right" class="Rightcolumn marginBody navBarMovable">

    <div id="myModalSave" class="modal" >
      <div class="modal-content" style='max-width: 300px;border-color: red;height: 25px; padding-top: 15px;'>
        <img src="../ImagesUsed/Redalert.png" style="width: 28px; float: left; " alt="" loading="lazy"><label style='width: 250px; margin-top: -1px;'>Oops! Something went wrong. Please reload the page or try again</label>
      </div>
    </div>



    <div id="myModalEmail" class="modal" style="z-index: 20;"></div>

            <div class="dropdown1 dispNone" id="newDealAgentDropdown">
                <i class="arrow"></i>
                <div class="dropdown-content1">
                    <a class="menubartext" href="NewDeal.jsp"><button class="tablinks"><span class="">+ New
                                Deal</span></button></a>
                    <a class="menubartext" href="AddNewUser.jsp"><button class="tablinks"><span class="">+ New
                                User</span></button></a>
                    <a class="menubartext" href="AddNewUser.jsp"><button class="tablinks"><span class="">+ New
                                User</span></button></a>
                </div>
            </div>

            <div class="navTop flexibleContainer" id="TopTabs" style="padding-left: 5px; width: calc(100% - 6px);  display:none; ">

                <button
                    onclick="TabsHandleler(event,'DealsForApproval','tabcontent','tablinks','DEALSFORAPPROVALTab'); TabsHandleler(event,'AllDeals','tabcontent1','tablinks1','AllDealTab'); tabBlue('DEALSFORAPPROVALTab');"
                    id="DEALSFORAPPROVALTab" style="flex: 1.5; background-color: #29c1e1;"
                    class="tablinks topGrey topbutton flexible">DEALS FOR APPROVAL</button>

                <button
                    onclick=" TabsHandleler(event, 'MyDeals', 'tabcontent', 'tablinks', 'MYDEALSTab'); TabsHandleler(event,'Pending','tabcontent2','tablinks2','PendingTab'); tabBlue('MYDEALSTab');"
                    id="MYDEALSTab" class="tablinks topGrey topbutton flexible">MY DEALS</button>

                <button
                    onclick=" TabsHandleler(event, 'AgentDeals', 'tabcontent', 'tablinks', 'AGENTDEALTab'); TabsHandleler(event,'AgentPending', 'tabcontent3','tablinks3','AgentPendingTab'); tabBlue('AGENTDEALTab');"
                    id="AGENTDEALTab" class="tablinks topGrey topbutton flexible">AGENT DEAL</button>

            </div>

            <script>
                checkNavBar();
            </script>

            <!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

            <div id="MyDeals">

            <div class="HeaderDashboard flexibleContainer" style="margin-top: 14px;">

                <label class="DealsHeader flexible">Deals</label>

            </div>


            <%-- <label class="HeadLines"></label> --%>

                <div id="InnerTabs" class="PartiesNavBar flexibleContainer" style="width: 700px;">

                    <button id="PendingTab" class="tablinks2  flexible"
                        onclick="getDataPendingSorted(checkdataPending); TabsHandleler(event,'Pending','tabcontent2','tablinks2','PendingTab');">Pending
                    </button>

                    <button id="CompletedTab" class="tablinks2  flexible"
                        onclick='getDataCompletedSorted(); TabsHandleler(event, "Completed", "tabcontent2", "tablinks2", "CompletedTab");'>Completed
                    </button>

                    <button id="CommissionsTab" class="tablinks2  flexible"
                        onclick="getDataCommissions(checkdataCommissions); TabsHandleler(event, 'Commissions', 'tabcontent2', 'tablinks2', 'CommissionsTab');">Commissions
                    </button>

                    <button id=">GoalsTab" class="tablinks2  flexible" style="display: none"
                        onclick="TabsHandleler(event, 'Goals', 'tabcontent2', 'tablinks2', 'GoalsTab');">Goals
                    </button>

                </div><!-- Closing InnerTabs -->


                <div id="Pending" class="tabcontent2" style='width: 700px;'>

                    <div class="forSearchDeals flexibleContainer">
                        <div class="flexible" id="" style="width: 70px; flex: unset;">
                            <a class="buttonAdd" href='NewDeal.jsp'><span style="color: #999999; cursor: pointer; width: 100%;" for=""><span class='charAdd'>+</span><span class='textAdd'>New</span></span></a>
                        </div>

                        <div class="flexible" style="max-width: 220px;">
                            <label for=""></label>

                            <div class="custom-select" id="" onclick="getDataPendingSorted()">

                                <select class="inputSelection" id="datetypePending" name="datetypePending">

                                    <option value="No">Date </option>

                                    <option value="No">Date </option>
        
                                    <option value="Closing">Closing Date (TRS)</option>
        
                                    <option value="Report">Report Date </option>
        
                                </select>
        
                            </div>
                        </div>     
                        
                        <div class="flexible" id="">
                            <label id=""></label>
                            <div class="input-group">
                            
                            <input id="datefromPending" name="datefromPending" type="text" class="form-control date-input"
                                placeholder="DD MM YYYY" readonly="readonly" />
                            <label class="input-group-btn" style="padding-top: 1px;" onclick="eraseDatePending(this);">
                                <span class="btn btn-default">
                                    <span class="glyphicon glyphicon-remove"></span>
                                    </span>
                            </label>
                            <span class='dateFromTo'>From:</span>
                            </div>
                
                        </div>
                
                        <div class="flexible" id="">
                            <label id=""></label>
                            <div class="input-group">
                                <input id="datetoPending" name="datetoPending" type="text" class="form-control date-input"
                                placeholder="DD MM YYYY" readonly="readonly" />
                                <!-- <label class="input-group-btn" for="datetoPending" style="padding-top: 1px; border-radius: 0; border-right: 0;">
                                <span class="btn btn-default">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                                </label> -->
                                <label class="input-group-btn" style="padding-top: 1px;" onclick="eraseDatePending(this);">
                                <span class="btn btn-default">
                                    <span class="glyphicon glyphicon-remove"></span>
                                    </span>
                                </label>
                                <span class='dateFromTo'>To:</span>
                            </div>
                    
                        </div>

                        <div class="flexible" style='max-width: 100px;'>
                            <label for=""> </label>

                            <div class="custom-select" id=""  onclick="getDataPendingSorted()">

                                <select class="inputSelection" id="MyDealsSortPending" name="MyDealsSortPending" >
        
                                    <option value="">Sort by</option>
        
                                    <option value="Price">Price</option>
        
                                    <option value="Status">Status</option>
        
                                    <option value="TRS">TRS#</option>
        
                                    <option value="Listing">Listing Type</option>
        
                                    <option value="Property">Property Type</option>

                                    
        
                                </select>
        
                            </div>
                        </div>

                        <div class="flexible">
                            <label for=""></label>
                            <input type="text" placeholder="Search Deals" class="inlineInput" id="PendingSearch"
                                onkeyup="getDataPendingSorted(); ">
                        </div>

                    </div>

                    <script>
                        var Types = [];
                    </script>


    
                    <div class="PendingWrap" id='AllPendingDeals'>

                    <span id="nofoundPending" style="display: none;" class="NewSectionSmall">
                        <div class="mainDiv" style='padding: 6px;'>
                            <div class="flexibleContainer">
                                <div class="flexibleContainer flexible MaininfoColumn">
                                    <p style="width: 100%; text-align: center;">No deals found</p>
                                </div>
                            </div>
                        </div>
                    </span>

                    <span id="AllPendingMyDealsSpan"></span>

                    </div>

                </div>

                <div id="Completed" class="tabcontent2" style='width: 700px;'>


                    <script>
                        var Status = [];
                        var Size = 0;
                    </script>


                    <div class="forSearchDeals flexibleContainer">

                        <div class="flexible" id="" style="width: 70px; flex: unset;">
                            <a class="buttonAdd" href='NewDeal.jsp'><span style="color: #999999; cursor: pointer; width: 100%;" for=""><span class='charAdd'>+</span><span class='textAdd'>New</span></span></a>
                        </div>

                        <div class="flexible" style="max-width: 220px;">
                            <label for=""></label>
                            <div class="custom-select" id=""onclick="getDataCommissions();">

                                <select class="inputSelection" id="datetypeCompleted" name="datetypeCompleted">

                                    <option value="No">Date</option>
                                    <option value="No">Date</option>
        
                                    <option value="Closing">Closing Date (TRS)</option>
        
                                    <option value="Report">Report Date</option>
                                    <option value="Finalized">Finalized Date</option>
        
                                </select>
        
                            </div>
                        </div>   

                        <div class="flexible" id="">
                            <label id=""></label>
                            <div class="input-group">
                            <input id="datefromCompleted" name="datefromCompleted" type="text" class="form-control date-input"
                                placeholder="DD MM YYYY" readonly="readonly" />
                            <label class="input-group-btn" style="padding-top: 1px;" onclick="eraseDateCompleted(this);">
                                <span class="btn btn-default">
                                    <span class="glyphicon glyphicon-remove"></span>
                                    </span>
                            </label>
                            <span class='dateFromTo'>From:</span>
                            </div>
                
                        </div>
                
                        <div class="flexible" id="">
                            <label id=""></label>
                            <div class="input-group">
                                <input id="datetoCompleted" name="datetoCompleted" type="text" class="form-control date-input"
                                placeholder="DD MM YYYY" readonly="readonly" />
                                <label class="input-group-btn" style="padding-top: 1px;" onclick="eraseDateCompleted(this);">
                                <span class="btn btn-default">
                                    <span class="glyphicon glyphicon-remove"></span>
                                    </span>
                            </label>
                            <span class='dateFromTo'>To:</span>
                            </div>
                    
                        </div>

                        <div class="flexible" style='max-width: 100px;'>
                            <label for=""></label>
                            <div class="custom-select" id="" onclick="getDataCompletedSorted()">

                                <select class="inputSelection" id="MyDealsSortCompleted" name="MyDealsSortCompleted">

                                    <option value="">Sort by</option>
        
                                    <option value="Price">Price</option>
        
                                    <option value="Status">Status</option>
        
                                    <option value="TRS">TRS#</option>
        
                                    <option value="Listing">Listing Type</option>
        
                                    <option value="Property">Property Type</option>
        
                                </select>
        
                            </div>
                        </div>

                        <div class="flexible">
                            <label for=""></label>
                            <input type="text" placeholder="Search Deals" class="inlineInput" id="CompletedSearch"
                            onkeyup="getDataCompletedSorted()">
                        </div>

                    </div>

                    <span id='allCompletedDeals' class='AgentWrap'>

                    <span id="nofound6" style="display: none" class="NewSectionSmall">
                        <div class="mainDiv noFoundDiv">
                            <div class="flexibleContainer">
                                <div class="flexibleContainer flexible MaininfoColumn">
                                    <p style="width: 100%; text-align: center;">No deals found</p>
                                </div>
                            </div>
                        </div>
                    </span>


                    <span id='allCompletedDealsSpan'></span>

                </span>


                    <Script>


                    </Script>


                </div>

                <div id="Commissions" class="tabcontent2">

                    <div class="forSearchDeals flexibleContainer" style='margin-bottom: 0px;    padding-left: 7px;'>
                        <div class="flexible" style='max-width: 220px;'>
                            <label style="width: 100%" for=""></label>
                            <div class="custom-select2 multichoiceBox" id="DisplayFields">

                                <select class="inputSelection" id="DisplayFieldsSelect" name="">

                                    <option value="">Select Fields</option>

                                    <option value="0">Number</option>

                                    <option value="1">Type</option>

                                    <option value="2">Address</option>

                                    <option value="3">Price</option>

                                    <option value="4">Listing Commission</option>

                                    <option value="5">Selling Commission</option>

                                    <option value="6">Gross fee</option>

                                    <option value="7">Net to Brokerage</option>

                                    <option value="8">Net to Agent</option>

                                    <option value="9">Referral</option>

                                    <option value="10">Rebate</option>

                                    <option value="11">Net Fee</option>

                                    <option value="12">Closing date</option>

                                    <option value="13">Report date</option>

                                    <option value="14">Finalized date</option>

                                </select>

                            </div>
                        </div>       

                        <div class="flexible" style="max-width: 120px;">
                            <label for=""></label>
                            <div class="custom-select" onclick="getDataCommissions()">

                                <select class="inputSelection" id="dealStatusCommissions" name="dealStatusCommissions">

                                    <option value="">All</option>
                                    
                                    <option value="">All</option>
        
                                    <option value="1">Completed</option>
        
                                    <option value="0">Pending</option>
        
                                </select>
        
                            </div>
    
                        </div>      

                        <div class="flexible" style="max-width: 220px;">
                            <label for=""></label>
                            <div class="custom-select" id="" onclick="getDataCommissions()">

                                <select class="inputSelection" id="dateTypeCommission" name="dateTypeCommission">

                                    <option value="">Date </option>
                                    <option value="">Date </option>
        
                                    <option value="Closing">Closing Date</option>
        
                                    <option value="Report">Report Date</option>

                                    <option value="Finalized">Finalized Date</option>
        
                                </select>
        
                            </div>
    
                        </div>           

                        <div class="flexible" id="DisplayingClosingDate"style="max-width: 150px;">
                            <label id="CloseDateLabel"></label>
                            <div class="input-group">
                            <input id="datefromCommission" name="datefromCommission" type="text" class="form-control date-input"
                                placeholder="DD MM YYYY" readonly="readonly" />
                            <label class="input-group-btn" id='datefromLab' style="padding-top: 1px;" onclick="eraseDateCommissions(this)">
                                <span class="btn btn-default">
                                    <span class="glyphicon glyphicon-remove"></span>
                                    </span>
                            </label>
                            <span class='dateFromTo'>From:</span>
                            </div>
                
                        </div>
                
                        <div class="flexible" id="DisplayingClosingDate" style="max-width: 150px;">
                            <label id="CloseDateLabel"></label>
                            <div class="input-group">
                                <input id="datetoCommission" name="datetoCommission" type="text" class="form-control date-input"
                                placeholder="DD MM YYYY" readonly="readonly" />
                                <label class="input-group-btn" id="datetoLab" style="padding-top: 1px;" onclick="eraseDateCommissions(this)">
                                <span class="btn btn-default">
                                    <span class="glyphicon glyphicon-remove"></span>
                                    </span>
                            </label>
                            <span class='dateFromTo'>To:</span>
                            </div>
                    
                        </div>
                        
                        
                        
                    </div>
                    <div id="table-wrapper">

                    <div class='wrapperdiv1child'>
                                <a href="NewDeal.jsp"><button class="contactButton"
                                        style="margin-left: 0; padding-left: 0;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-plus-circle optionsImg2" viewBox="0 0 16 16">
                                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                            <path
                                                d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                        </svg>
                                        Add</button></a>
                                <button class="contactButton" id="DeleteContacts4">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        style="margin-bottom: -1px;" class="bi bi-trash3 optionsImg2" viewBox="0 0 16 16">
                                        <path
                                            d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
                                    </svg>
                                    Delete</button>
                                <button class="contactButton" onclick="openExport('Commissions')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" style="margin-bottom: -1px;"
                                        fill="currentColor" class="bi bi-box-arrow-up optionsImg2" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                            d="M3.5 6a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5h-2a.5.5 0 0 1 0-1h2A1.5 1.5 0 0 1 14 6.5v8a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-8A1.5 1.5 0 0 1 3.5 5h2a.5.5 0 0 1 0 1h-2z" />
                                        <path fill-rule="evenodd"
                                            d="M7.646.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 1.707V10.5a.5.5 0 0 1-1 0V1.707L5.354 3.854a.5.5 0 1 1-.708-.708l3-3z" />
                                    </svg>
                                    Export</button>
                                <button class="contactButton" id="EditContacts4">
                                    <svg xmlns="http://www.w3.org/2000/svg" style="    margin-bottom: -2px;" width="16"
                                        height="16" fill="currentColor" class="bi bi-pencil-square optionsImg2"
                                        viewBox="0 0 16 16">
                                        <path
                                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                        <path fill-rule="evenodd"
                                            d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                    </svg>
                                    Edit</button>
                    </div>

                    <span id="allComissionsSpan"></span>


                </div>

                <div id="Goals" class="tabcontent2"  style='width: 700px;'>


                    <div class="forSearchDeals">

                        <div class="custom-select" id="">

                            <select class="inputSelection" id="" name="">

                                <option value="">Sort by</option>

                                <option value="">Closed</option>

                                <option value="">Firm</option>

                                <option value="">Submitted</option>

                                <option value="">House Type</option>

                            </select>

                        </div>

                        <input type="text" placeholder="Search Deals" class="inlineInput" id="">

                    </div>

                </div>


            </div><!-- Closing MyDeals -->
        <div class="loadingmodal"></div>
        </div>
    </div>
            

</body>

<div id='invoicePreview'></div>

<div id='PreviewTRS'></div>

<script>

    TabsHandleler(event,'Pending','tabcontent2','tablinks2','PendingTab');

	$(document).ready(function() {
        forSelects();
        forSelectsMultiDeals();
        getDataPendingSorted(checkdataPending);
    });
    

</script>

</html>