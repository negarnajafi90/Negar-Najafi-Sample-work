<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%@ page import="java.util.ArrayList"  %>

<%@ page import="ProMasterClasses.Users"  %>

<%@ page import="ProMasterClasses.Transaction"  %>

<%@ page import="RDS.RDSFunctions"  %>

<%@ page import="ProMasterClasses.CommissionDetails"  %>

<%@ page import="ProMasterClasses.Invoice"  %>

<%@ page import="ProMasterClasses.Companies"  %>

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


int UserID=0;//(int)session.getAttribute("Userid") ;

int BrokerID=0;//(int)session.getAttribute("Brokerid") ;
   
String Type="0";//(String)session.getAttribute("Type") ;

String Email="";//(String)session.getAttribute("Email") ;

Connection con=null;

if( session.getAttribute("Userid")==null  ){
	
  response.sendRedirect("../NoPermission.jsp");



}

else{
	
	 UserID=(int)session.getAttribute("Userid"); 
	
	 BrokerID=(int)session.getAttribute("Brokerid") ;
			   	   
     Type=(String)session.getAttribute("Type") ;
     
     Email=(String)session.getAttribute("Email") ;
     
     con=(Connection) session.getAttribute("Connection");

}

%>

<%

//This part is to keep track of the maximum time a user can be in active on the system and after that direct the user to the login page

//int timeout = session.getMaxInactiveInterval(); // Get the time has been set 

//response.setHeader("Refresh", timeout + "; URL = ../SystemLogout.jsp"); // If a user's session is expire refresh it and ask to log in again

%>


<%
	//Here we are getting the information for the user


	//Geting the user's information 

	Companies MyCompanies=new Companies();

	RDSFunctions myRDS=new RDSFunctions();

	MyCompanies=myRDS.GetaCompanyBuyBrokerID(BrokerID ,con);

	String MyID=String.valueOf( MyCompanies.ID );	

	String URL="https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/"+MyID;	

	Users MyInformation=new Users();

	MyInformation=myRDS.GetAnyUserById(UserID ,con);

	%>


<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Scripts to add jQuerry and bootrstrap -->

	<script type="text/javascript" src="../Scripts/jQuerry/jquerry.min.js"></script>
	<script type="text/javascript" src="../Scripts/jQuerry/jsPDF.min.js"></script>
	<!-- <script type="text/javascript" src="../Scripts/jQuerry/jquery-3.6.0.min.js"></script> -->
	<script type="text/javascript" src="../Scripts/jQuerry/bootstrap.min.js"></script>

	<script type="text/javascript" src="../Scripts/jQuerry/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" href="../CSS/bootstrap-datepicker.css" type="text/css" />

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">


	<!-- Our scripts/css -->

	<link rel="stylesheet" type="text/css" href="../CSS/TradeInRealestate.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Dashboard.css">

	<link rel="stylesheet" type="text/css" href="../CSS/SelectWindow.css">

	<link rel="stylesheet" type="text/css" href="../CSS/CheckButton.css">

	<link rel="stylesheet" type="text/css" href="../CSS/Fonts.css">

	<link rel="stylesheet" type="text/css" href="../CSS/ButtonsAndFields.css	">

	<link rel="stylesheet" type="text/css" href="../CSS/forDateField.css">

	<link rel="stylesheet" type="text/css" href="../CSS/forRegistration.css">

	<script type="text/javascript" src="../Scripts/Dashboard.js"></script>

	<script type="text/javascript" src="../Scripts/Registration.js"></script>

	<script type="text/javascript" src="../Scripts/CropImage.js"></script>

	<title>Company Details - Masterre</title>

	<link rel="icon" type="image/png" sizes="16x16" href="../favicon-16.png">

	<style>
	
		
	</style>
</head>

<header>

</header>

<body>

	<script type="text/javascript">
		$(function () {
			$('#CompanyFiscalyearend').datepicker({
				format: "dd M yyyy"
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				CorporateDetailsCheckSubmit();
				document.getElementById(this.id).style.borderColor =
					"lightgrey";
				document.getElementById(this.id).nextElementSibling.style
					.borderColor = "lightgrey";
				document.getElementById(this.id).nextElementSibling.nextElementSibling.style
					.borderColor = "lightgrey";
			});
			// $('#CompanyFiscalyearend').datepicker({
			// 	format: "dd M yyyy"
			// }).on('changeDate', function (e) {
			// 	$(this).datepicker('hide');
			// 	document.getElementById(this.id).style.borderColor =
			// 		"lightgrey";
			// 	document.getElementById(this.id).nextElementSibling.style
			// 		.borderColor = "lightgrey";
			// });

			// $('#AlternateBrokerEndDate').datepicker({
			// 	format: "dd M yyyy"
			// }).on('changeDate', function (e) {
			// 	$(this).datepicker('hide');
			// 	document.getElementById(this.id).style.borderColor =
			// 		"lightgrey";
			// 	document.getElementById(this.id).nextElementSibling.style
			// 		.borderColor = "lightgrey";
			// });

			// $('#AlternateBrokerStartDate').datepicker({
			// 	format: "dd M yyyy"
			// }).on('changeDate', function (e) {
			// 	$(this).datepicker('hide');
			// 	document.getElementById(this.id).style.borderColor =
			// 		"lightgrey";
			// 	document.getElementById(this.id).nextElementSibling.style
			// 		.borderColor = "lightgrey";
			// });

			$('#CardClosingDate').datepicker({
				format: "dd M yyyy",
				startDate: '-10y'
				//endDate: '-1d'
			}).on('changeDate', function (e) {
				$(this).datepicker('hide');
				document.getElementById(this.id).style.borderColor = "lightgrey";
				document.getElementById(this.id).nextElementSibling.style.borderColor = "lightgrey";
			});

		});
	</script>

	<div id="myModalAgreement" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modalHeader"></div>
			<div class="boxModal" style="height: 87vh; overflow: scroll;">
				<p><b>To continue, you must read and agree to the following licence agreement.</b></p>
				<h1>Masterre Software Licence Agreement</h1>
				<p>Thank you for choosing Masterre as your trusted partner for real
					estate transaction management. We take our clients' needs to heart.</p>

				<p>This Masterre Software Licence Agreement (the “Agreement”) is between you and Masterre
					Corporation, entity that owns the Software that you are accessing or using (“Masterre” or “we”). If you
					are agreeing to this Agreement not as an individual but on behalf of your company, or other entity for
					which you are acting, then “you” means your entity and you are binding your entity to this Agreement.
					Masterre may modify this Agreement from time to time, subject to the terms in Section 11 (Changes to
					this Agreement) below.</p>

				<p>By clicking on the “Accept” button at the end of this Agreement, I am agreeing to be bound by the
					terms and conditions of this Agreement, as of the date accepted. If you do not agree to this Agreement,
					do not use or access the Software.</p>

				<h2>PLEASE READ THIS ENTIRE AGREEMENT CAREFULLY BEFORE AGREEING TO ITS TERMS.</h2>

				<!-- <h3>1. Scope of Agreement</h3> -->
				<ol>
					<li class="lihead">Scope of Agreement
						<ol>
							<li><b>Software.</b> This Agreement governs your initial licence purchase of Masterre’s Software, support
								and maintenance services for the Software (“Support and Maintenance”), as well as any future licence
								purchases made by you that reference this Agreement.</li>
							<li><b>Additional Services.</b> Additional services meaning legal, accounting, bookkeeping, insurance
								products or other services that may be offered to you by either Geoff Pollock Professional Corporation,
								Evgeniya Pollock Professional Corporation or Evgeniya Pollock (“Additional Services”), are specifically
								excluded from this Agreement.</li>
						</ol>
					</li>
					<li class="lihead">Accounts; Authorized Users
						<ol>
							<li><b>Account Registration.</b> You must set up a Brokerage account with us to access the Software. Your
								registration information must be accurate, current and complete. You must keep your registration
								current so that we may send notices, statements and other information to you by email or through your
								account.</li>
							<li><b>Authorized Users.</b> Masterre Software may allow you to designate different types of users, including
								Broker of record, Alternate Broker of Record, real estate agents, administrative assistants, other third
								parties who are acting for your (together “ Authorized users”). Only Authorized Users may access and
								use the Software. Software pricing and functionality may vary according to the type of Authorized User.
								You are responsible for compliance with this Agreement by all Authorized Users, including what
								Authorized Users do with your data, and for all fees incurred by Authorized Users (or from adding
								Authorized Users). All use of Software must be solely for the benefit of you and must be within the
								Scope of Use.</li>
						</ol>
					</li>
					<li class="lihead">Use of the Software
						<ol>
							<li><b>Your Licence Rights.</b> Subject to the terms and conditions of this Agreement, Masterre grants you a
								non-exclusive, non-sublicensable and non-transferable licence to use the Software during the applicable
								licence term for your own business purposes (“Licence Term”), in accordance with this Agreement, and
								your authorized scope of use for the Software (“Scope of Use”) as specified in the applicable Order,
								which may include: (a) number and type of Authorized Users, (b) numbers of licences, copies or
								instances, or (c) entity, division, business unit, website, field of use or other restrictions or billable units.</li>
							<li><b>Restrictions.</b> Except as otherwise expressly permitted in this Agreement, you will not: (a) reproduce,
								modify, adapt or create derivative works of any part of the Software; (b) rent, lease, distribute, sell,
								sublicence, transfer, or provide access to the Software to a third party; (c) use the Software for the
								benefit of any third party; (d) incorporate the Software into a product or service you provide to a third
								party; (e) interfere with any licensing mechanism in the Software or otherwise circumvent mechanisms
								in the Software intended to limit your use; (f) reverse engineer, disassemble, decompile, translate, or
								otherwise seek to obtain or derive the source code, underlying ideas, algorithms, file formats or non-
								public APIs to the Software, except to the extent expressly permitted by applicable law (and then only
								upon advance notice to us); (g) remove or obscure any proprietary or other notices contained in the
								Software; (h) use the Software for competitive analysis or to build competitive products; (i) publicly
								disseminate information regarding the performance of the Software; or (j) encourage or assist any third
								party to do any of the foregoing.</li>
							<li><b>Masterre Proprietary Information.</b> Masterre Proprietary Information shall mean information and
								related materials (written or oral) 1) belonging to Masterre and identified as confidential or proprietary
								and disclosed to me during the term of this Agreement relating to Masterre’s Software program and
								documentation; potential products and other technology-related information; and other significant
								business information otherwise defined as “Trade Secrets” under any applicable legal jurisdiction; or 2)
								all information obtained by me from, or disclosed to me by Masterre which (i) relates to Masterre’s past,
								present or future research, development or business activities or the results from such activities or (ii)
								which Masterre received from others and which Masterre is obligated to treat as confidential or
								proprietary. I agree to hold Masterre Proprietary Information in confidence and shall not use of disclose
								Masterre Proprietary Information except as may be authorized by Masterre in this Agreement or
								otherwise in writing.</li>
							<li><b>System Requirements.</b> You are solely responsible for ensuring that your systems meet the
								hardware, software and any other applicable system requirements for the Software as specified in the
								Documentation. Masterre will have no obligations or responsibility under this Agreement for issues
								caused by your use of any third-party hardware or software not provided by Masterre.</li>
							<li><b>Broker of Record Responsibility.</b> Masterre spreadheads and calculators are not intended in any way
								to be used as tax, financial or legal advice. Any calculations performed by Masterre Software are based
								on data and assumptions provided by you, and any risks associated with such data and assumptions
								shall be borne by you. We have done our best to ensure that the information and any calculations
								provided by Masterre Software are accurate and provide assistance when determining agent and
								brokerage commissions. The Broker of Record is solely responsible for all calculations, including review
								of the record sheets prepared by the agents and administrative assistants. The Broker of Record has
								been provided with necessary tools to make changes to any information displayed on the record sheet,
								including sales tax. Masterre expressly recommends that you seek advice from an accountant especially
								if you are not sure how much sales tax should be collected from a client or paid to any party to a trade.
								Masterre shall not be held liable or responsible for any errors or omissions as a result of your use of the
								Software or for any damage you may suffer as a result of failing to seek competent tax advice from a
								lawyer or accountant.</li>
						</ol>
					</li>
					<li class="lihead">Licence Term, Renewals, and Payment
						<ol>
							<li><b>Licence Term and Renewals.</b> The Licence Term, Support and Maintenance period will be indicated
								in your applicable Masterre ordering documentation or other purchase flow referencing this Agreement
								(“Order”). Orders may include purchases of Software licences, Support and Maintenance, increased or
								upgraded Scope of Use or renewals. The Licence Term and any applicable service periods will commence
								on your initial access to or use of the Software (“Effective Date”), unless a different start date is
								designated in the Order, and expire on the expiration date indicated in the Order. Unless earlier
								terminated in accordance with this Agreement, each right to use Software will expire at the end of the
								applicable Licence Term. Unless you have selected the “autorenewal” option in the Order any renewals
								must be mutually agreed upon by the parties in writing. All renewals are subject to the applicable
								Software or Support and Maintenance continuing to be offered and will be charged at the then-current
								rates.</li>
							<li><b>Termination.</b> As part of our commitment to customer satisfaction, you may terminate your Order of
								the Software under this Agreement, for no reason or any reason, by providing notice of termination no
								later than ten (10) days after the Order. In the event you terminate your Order under this Section 4.2,
								Masterre may disable access code that allowed the Software to operate and, at your request, Masterre
								will refund you any amount paid under such Order. This termination and refund right apply only to your
								Order and only if you exercise your termination right within the period specified above. You understand
								that Masterre may change this practice in the future in accordance with Section 11 (Changes to this
								Agreement).</li>
							<li><b>Increased Scope of Use.</b> During your Licence Term, you may increase your Scope of Use (e.g.,
								adding Authorized Users) directly through the Masterre Software. Any increases to your Scope of Use
								will be subject to additional fees.</li>
							<li><b>Payment.</b> You will pay all fees, by the due dates and in the currency specified in the Order. You
								agree that we may bill your credit card or other payment method for renewals, additional users,
								expenses and unpaid fees, as applicable.</li>
							<li><b>Taxes.</b> Your fees under this Agreement exclude any taxes or duties payable in respect of the
								Software in the jurisdiction where the payment is either made or received. To the extent that any such
								taxes or duties are payable by Masterre (e.g., HST), you must pay to Masterre the amount of such taxes
								or duties in addition to any fees owed under this Agreement. Notwithstanding the foregoing, you may
								have obtained an exemption from relevant taxes or duties as of the time such taxes or duties are levied
								or assessed. In that case, you will have the right to provide to Masterre any such exemption information,
								and Masterre will use reasonable efforts to provide such invoicing documents as may enable you to
								obtain a refund or credit for the amount so paid from any relevant revenue authority if such a refund or
								credit is available.</li>
							<li><b>Future Functionality.</b> You acknowledge that the Software referenced in an Order is being purchased
								separately from any of our other products or services. You agree that your purchase is not contingent
								on the delivery of any future functionality or features such as bug fixes, patches, major or minor
								releases, or any other changes, enhancements, or modifications to the Software that Masterre makes
								available to you as part of Support and Maintenance, or dependent on any oral or written public
								comments made by Masterre regarding future functionality or features.</li>
							<li><b>No-Charge Software.</b> We may offer certain Software to you at no charge, including free accounts,
								trial use, Beta Versions as defined below (collectively, “No-Charge Software”). Your use of No-Charge
								Software is subject to any additional terms that we specify and is only permitted during the Licence
								Term we designate (or, if not designated, until terminated in accordance with this Agreement). Except
								as otherwise set forth in this Section 4.7, the terms and conditions of this Agreement governing
								Software, including Section 3.2 (Restrictions), fully apply to No-Charge Software. We may terminate
								your right to use No-Charge Software at any time and for any reason in our sole discretion, without
								liability to you. You understand that any pre-release, and beta versions of Software, and any pre-release
								and beta features within generally available Software, that we make available (collectively, “Beta
								Versions”) are still under development, may be inoperable or incomplete and are likely to contain more
								errors and bugs than generally available Software. We make no promises that any Beta Versions will
								ever be made generally available. In some circumstances, we may charge a fee in order to allow you to
								use Beta Versions, but the Beta Versions will still remain subject to this Section 4.7. All information
								regarding the characteristics, features or performance of any No-Charge Software (including Beta
								Versions) constitutes Masterre’s Confidential Information. To the maximum extent permitted by
								applicable law, we disclaim all obligations or liabilities with respect to No-Charge Software, including any
								Support and Maintenance, and indemnity obligations. NOTWITHSTANDING ANYTHING ELSE IN THIS
								AGREEMENT, MASTERRE’S MAXIMUM AGGREGATE LIABILITY TO YOU IN RESPECT OF NO-CHARGE
								SOFTWARE WILL BE CAD $100.</li>
						</ol>
					</li>
					<li class="lihead">Ownership and Feedback.
						<span>The Software is made available on a limited licence or access basis, and no
							ownership right is conveyed to you, irrespective of the use of terms such as “purchase” or “sale”.
							Masterre and its licensors have and retain all right, title and interest, including all intellectual property
							rights, in and to Masterre Software (including all No-Charge Software). From time to time, you may
							choose to submit comments, questions, ideas, suggestions or other feedback (together “Feedback”)
							relating to the Software, Support and Maintenance or Additional Services. Masterre may in connection
							with any of its products or services freely use, copy, disclose, licence, distribute and exploit any
							
							Feedback in any manner without any obligation, royalty or restriction based on intellectual property
							rights or otherwise. No Feedback will be considered your Confidential Information, and nothing in this
							Agreement limits Masterre&#39;s right to independently use, develop, evaluate, or market products or
							services, whether incorporating Feedback or otherwise.</span>
					</li>
					<li class="lihead">Term and Termination
						<ol>
							<li><b>Term.</b> This Agreement is effective as of the Effective Date and continues until expiration of all
								Licence Terms, unless earlier terminated as set forth herein.</li>
							<li><b>Termination for Cause.</b> Either party may terminate this Agreement (including all related Orders) if
								the other party (a) fails to cure any material breach of this Agreement within thirty (30) days after
								written notice; (b) ceases operation without a successor; or (c) seeks protection under any bankruptcy,
								receivership, trust deed, creditors’ arrangement, composition or comparable proceeding, or if any such
								proceeding is instituted against that party (and not dismissed within sixty (60) days thereafter).</li>
							<li><b>Termination for Convenience.</b> You may choose to stop using the Software and terminate this
								Agreement (including all Orders) at any time for any reason upon written notice to Masterre, upon any
								such termination (i) you will not be entitled to a refund of any pre-paid fees and (ii) if you have not
								already paid all applicable fees for the then-current Licence Term or related services period (as
								applicable), any such fees that are outstanding will become immediately due and payable.</li>
							<li><b>Effects of Termination.</b> Upon any expiration or termination of this Agreement, your licence to the
								Software terminates (even if the Licence Term is identified as “perpetual” or if no expiration date is
								specified in your Order). If this Agreement is terminated by you in accordance with Section 6.2
								(Termination for Cause), Masterre will refund you any prepaid Software fees covering the remainder of
								the then-current Licence Term after the effective date of termination. If this Agreement is terminated by
								Masterre in accordance with Section 6.2 (Termination for Cause), you will pay any unpaid fees covering
								the remainder of the then-current Licence Term after the effective date of termination. In no event will
								termination relieve you of its obligation to pay any fees payable to Masterre for the period prior to the
								effective date of termination. Except where an exclusive remedy may be specified in this Agreement,
								the exercise by either party of any remedy, including termination, will be without prejudice to any other
								remedies it may have under this Agreement, by law, or otherwise.</li>
							<li><b>Survival.</b> The following Sections will survive any termination or expiration of this Agreement: 3.2
								(Restrictions), 3.3 (Masterre Proprietary Information), 4.4 (Payment), 4.5 (Taxes), 4.7 (No-Charge
								Software) (disclaimers and use restrictions only), 5 (Ownership and Feedback), 6 (Term and
								Termination), 7 (Warranties and Disclaimer), 8 (Limitations of Liability), 9 (Dispute Resolution), and 12
								(General Provisions).</li>
						</ol>
					</li>
					<li class="lihead">Warranties and Disclaimer
						<ol>
							<li><b>General Warranties.</b> Each party represents and warrants that it has the legal power and authority
								to enter into this Agreement. If you are an entity, you represent and warrant that this Agreement and 
								each Order is entered into by an employee or agent of such entity with all necessary authority to bind
								such entity to the terms and conditions of this Agreement.</li>
							<li><b>Virus Warranty.</b> Masterre further represents and warrants that it will take reasonable commercial
								efforts to ensure that the Software, in the form and when provided to you, will be free of any viruses,
								malware, or other harmful code. For any breach of the foregoing warranty, your sole and exclusive
								remedy, and Masterre’s sole obligation, is to provide a new Software access promptly upon notice.</li>
							<li><b>Warranty Disclaimer.</b> EXCEPT AS EXPRESSLY SET FORTH IN SECTION 7.1 (GENERAL WARRANTIES)
								AND 7.2 (VIRUS WARRANTY), ALL SOFTWARE, SUPPORT AND MAINTENANCE ARE PROVIDED “AS IS,”
								AND MASTERRE AND ITS SUPPLIERS EXPRESSLY DISCLAIM ANY AND ALL WARRANTIES AND
								REPRESENTATIONS OF ANY KIND, INCLUDING ANY WARRANTY OF NON-INFRINGEMENT, TITLE, FITNESS
								FOR A PARTICULAR PURPOSE, FUNCTIONALITY, OR MERCHANTABILITY, WHETHER EXPRESS, IMPLIED, OR
								STATUTORY. MASTERRE WILL NOT BE LIABLE FOR DELAYS, INTERRUPTIONS, SERVICE FAILURES OR
								OTHER PROBLEMS INHERENT IN USE OF THE INTERNET AND ELECTRONIC COMMUNICATIONS OR OTHER
								SYSTEMS OUTSIDE THE REASONABLE CONTROL OF MASTERRE. TO THE MAXIMUM EXTENT PERMITTED
								BY LAW, NEITHER MASTERRE NOR ANY OF ITS THIRD PARTY SUPPLIERS MAKES ANY REPRESENTATION,
								WARRANTY OR GUARANTEE AS TO THE RELIABILITY, TIMELINESS, QUALITY, SUITABILITY, TRUTH,
								AVAILABILITY, ACCURACY OR COMPLETENESS OF ANY SOFTWARE OR ANY CONTENT THEREIN OR
								GENERATED THEREWITH, OR THAT: (A) THE USE OF ANY SOFTWARE WILL BE SECURE, TIMELY,
								UNINTERRUPTED OR ERROR-FREE; (B) THE SOFTWARE WILL OPERATE IN COMBINATION WITH ANY
								OTHER HARDWARE, SOFTWARE, SYSTEM, OR DATA; (C) THE SOFTWARE (OR ANY PRODUCTS, SERVICES,
								INFORMATION, OR OTHER MATERIAL PURCHASED OR OBTAINED BY YOU THROUGH THE SOFTWARE)
								WILL MEET YOUR REQUIREMENTS OR EXPECTATIONS); (D) ERRORS OR DEFECTS WILL BE CORRECTED;
								OR (E) EXCEPT AS EXPRESSLY SET FORTH IN SECTION 7.2 (VIRUS WARRANTY), THE SOFTWARE IS FREE OF
								VIRUSES OR OTHER HARMFUL COMPONENTS. YOU MAY HAVE OTHER STATUTORY RIGHTS, BUT THE
								DURATION OF STATUTORILY REQUIRED WARRANTIES, IF ANY, WILL BE LIMITED TO THE SHORTEST
								PERIOD PERMITTED BY LAW.</li>
						</ol>
					</li>
					<li class="lihead">Limitations of Liability
						<ol>
							<li><b>Consequential Damages Waiver.</b> EXCEPT FOR EXCLUDED CLAIMS (DEFINED BELOW), NEITHER
								PARTY (NOR ITS SUPPLIERS) WILL HAVE ANY LIABILITY ARISING OUT OF OR RELATED TO THIS
								AGREEMENT FOR ANY LOSS OF USE, LOST OR INACCURATE DATA, LOST PROFITS, FAILURE OF SECURITY
								MECHANISMS, INTERRUPTION OF BUSINESS, COSTS OF DELAY OR ANY INDIRECT, SPECIAL, INCIDENTAL,
								RELIANCE OR CONSEQUENTIAL DAMAGES OF ANY KIND, EVEN IF INFORMED OF THE POSSIBILITY OF
								SUCH DAMAGES IN ADVANCE.</li>
							<li><b>Liability Cap.</b> EXCEPT FOR EXCLUDED CLAIMS, EACH PARTY’S AND ITS SUPPLIERS’ AGGREGATE
								LIABILITY TO THE OTHER ARISING OUT OF OR RELATED TO THIS AGREEMENT WILL NOT EXCEED THE
								AMOUNT ACTUALLY PAID OR PAYABLE BY YOU TO US UNDER THIS AGREEMENT IN THE TWELVE (12)
								MONTHS IMMEDIATELY PRECEDING THE CLAIM.</li>
							<li><b>Excluded Claims.</b> “Excluded Claims” means (1) amounts owed by you under any Orders, (2) either
								party’s express indemnification obligations in this Agreement, and (3) your breach of Section 3.2
								(Restrictions).</li>
							<li><b>Nature of Claims and Failure of Essential Purpose.</b> The parties agree that the waivers and
								limitations specified in this Section 8 (Limitations of Liability) apply regardless of the form of action,
								whether in contract, tort (including negligence), strict liability or otherwise and will survive and apply
								even if any limited remedy specified in this Agreement is found to have failed of its essential purpose.</li>
						</ol>
					</li>
					<li class="lihead">Dispute Resolution
						<ol>
							<li><b>Informal Resolution.</b> In the event of any controversy or claim arising out of or relating to this
								Agreement, the parties will consult and negotiate with each other and, recognizing their mutual
								interests, attempt to reach a solution satisfactory to both parties. If the parties do not reach settlement
								within a period of sixty (60) days, either party may pursue relief as may be available under this
								Agreement pursuant to Section 9.2 (Governing Law; Legislation References). All negotiations pursuant to
								this Section 9.1 will be confidential and treated as compromise and settlement negotiations for
								purposes of all rules and codes of evidence of applicable legislation and jurisdictions.</li>
							<li><b>Governing Law; Legislation References.</b> This Agreement shall be governed by and construed in
								accordance with the laws of the Province of Ontario and the federal laws of Canada applicable therein
								and each of the parties hereto agrees irrevocably to attorn to the non-exclusive jurisdiction of the
								Courts of such Province. Any references in this Agreement to any law, by-law, rule, regulation, or act of
								any government, governmental body or other regulatory body shall be construed as a reference thereto
								as amended or re-enacted from time to time or as a reference to any successor thereto.</li>
							<li><b>Injunctive Relief; Enforcement.</b> Notwithstanding the provisions of Section 9.2 (Governing Law;
								Legislation References), nothing in this Agreement will prevent Masterre from seeking injunctive relief
								with respect to a violation of intellectual property rights, confidentiality obligations or enforcement or
								recognition of any award or order in any appropriate jurisdiction.</li>
						</ol>
					</li>
					<li class="lihead">Third Party Code.
						<span>The Software includes code and libraries licenced to us by third parties, including
							open source software.</span>
					</li>
					<li class="lihead">Changes to this Agreement.
						<ol>
							<li><b>Modifications Generally.</b> We may modify the terms and conditions of this Agreement from time to
								time, with notice given to you by email, through the Software or through our website. Together with
								notice, we will specify the effective date of the modifications.</li>
							<li><b>No-Charge Software:</b> You must accept the modifications to continue using the No-Charge Software. If
								you object to the modifications, your exclusive remedy is to cease using the No-Charge Software.</li>
							<li><b>Paid Licences: </b>Typically, when we make modifications to the main body of this Agreement, the
								modifications may become effective during your then-current Licence Term. If the effective date of such
								modifications is during your then-current Licence Term and you object to the modifications, then (as
								your exclusive remedy) you may terminate your affected Order(s) upon notice to us, and we will refund
								to you any fees you have pre-paid for use of the affected Software for the terminated portion of the
								applicable Licence Term. To exercise this right, you must provide us with notice of your objection and
								termination within ten (10) days of us providing notice of the modifications. For the avoidance of doubt,
								any Order is subject to the version of this Agreement in effect at the time of the Order.</li>
						</ol>
					</li>
					<li class="lihead">General Provisions
						<ol>
							<li><b>Notices.</b> Any notice under this Agreement must be given in writing. We may provide notice to you
								via email or through your account. You agree that any such electronic communication will satisfy any
								applicable legal communication requirements, including that such communications be in writing. Our
								notices to you will be deemed given upon the first business day after we send it. You will provide notice
								to us by post to Masterre Corporation, 1B-26 Lesmill Rd., Toronto, ON,</li>
							<li><b>Force Majeure.</b> Neither party will be liable to the other for any delay or failure to perform any
								obligation under this Agreement (except for a failure to pay fees) if the delay or failure is due to events
								which are beyond the reasonable control of such party, such as a strike, blockade, war, act of terrorism,
								riot, natural disaster, failure or diminishment of power or telecommunications or data networks or
								services, or refusal of a licence by a government agency.</li>
							<li><b>Assignment.</b> You may not assign or transfer this Agreement without our prior written consent. As
								an exception to the foregoing, you may assign this Agreement in its entirety (including all Orders) to
								your successor resulting from your merger, acquisition, or sale of all or substantially all of your assets or
								voting securities, provided that you provide us with prompt written notice of the assignment and the
								assignee agrees in writing to assume all of your obligations under this Agreement. Any attempt by you
								to transfer or assign this Agreement except as expressly authorized above will be null and void. We may
								assign our rights and obligations under this Agreement (in whole or in part) without your consent. We
								may also permit our agents and contractors to exercise our rights or perform our obligations under this
								Agreement, in which case we will remain responsible for their compliance with this Agreement. Subject
								to the foregoing, this Agreement will inure to the parties’ permitted successors and assigns.</li>
							<li><b>Entire Agreement.</b> This Agreement is the entire agreement between you and Masterre relating to
								the Software and supersedes all prior or contemporaneous oral or written communications, proposals
								and representations between you and Masterre with respect to the Software or any other subject
								matter covered by this Agreement. No provision of any purchase order or other business form
								employed by you will supersede or supplement the terms and conditions of this Agreement, and any
								such document relating to this Agreement will be for administrative purposes only and will have no legal
								effect.</li>
							<li><b>Modifications.</b> Except as set forth in Section 11 (Changes to this Agreement), any amendments or
								modifications to this Agreement must be executed in writing by the authorized representatives of
								Masterre and you.</li>
							<li><b>Interpretation.</b> As used herein, “including” (and its variants) means “including without limitation”
								(and its variants). Headings are for convenience only. If any provision of this Agreement is held to be
								void, invalid, unenforceable or illegal, the other provisions will continue in full force and effect.</li>
						</ol>
					</li>
					<li class="lihead">Publicity Rights.
						<span>We may identify you as an Masterre customer in our promotional materials. We
							will promptly stop doing so upon your request sent to info@Masterre.com.</span>							
					</li>
					<li class="lihead">Consent to Receiving Electronic Communication from Masterre.
						<span>Canada’s anti-spam legislation
							(CASL) requires that we obtain your consent in order for you to continue receiving electronic
							communications from Masterre. You can withdraw your consent at any time by sending an email to
							info@masterre.ca. Legislation does not require your consent when sending non-commercial electronic
							messages or any type of documents by mail.</span>
					</li>
					<li class="lihead">Consent to the Collection, Use and Disclosure of Personal Information.
						<span>Access to your brokerage,
							personal information, and client information (together “Personal Information”) is restricted to our
							employees and any third parties who need to know such information in order to provide products or
							services to you. We, or service providers acting on our behalf may process and/or store some or all of
							your Personal Information in jurisdictions outside of Canada, including the United States. Personal
							Information processed and/or stored outside of Canada will be subject to the laws of the country in
							which it is stored. Where we do so, we will contractually require such third party to employ the
							appropriate security safeguards to protect your personal information, subject to the law in the third
							party jurisdiction. You have the right to access the information gathered in accordance with the present
							consent form and have it rectified. You also have the right to withdraw your consent by writing to us by
							email or letter. The consent given under this title is deemed to last for as long as is required by the
							purpose for which the information was collected, even if you cease to be a client of Masterre
							Corporation.</span>
							<ul>
								<li>I acknowledge that I am free to give or refuse to give my consent to collecting, using and
									keeping personal information regarding myself, and the people I represent.</li>
								<li>I acknowledge having been informed of my right to access information obtained by virtue of
									the present consent and to have it corrected, if need be by submitting a written request to
									Masterre Corporation Privacy Officer.</li>
								<li>I acknowledge that the withdrawal or refusal to give consent to disclosing personal
									information may restrain access to Masterre Corporation software, or may lead to denial of
									software access due to lack of information.</li>
								<li>I acknowledge having been informed that I may address all questions regarding the present
									consent to the Privacy Officer.</li>
								<li>If I am representing a company or an organization: I hereby confirm having informed the
									persons concerned and having obtained their consent.</li>
							</ul>
						<div style='margin-top: 20px'><b>Please read statements below:</b></div>
						<div>
							<label class="container"><input type="checkbox" 
								id="sec13agree" name="sec13agree"><span
								class="checkmark"></span></label>
							<label for='sec13agree' class='consentLabel2'>I consent to Masterre identifying my Brokerage in its promotional materials. <span class="grey">(Optional)</span></label>
						</div>
						<div>
							<label class="container"><input type="checkbox" 
									id="sec14agree1" name="sec14agree1"><span
									class="checkmark"></span></label>
							<label for='sec14agree1' class='consentLabel'>I authorize Masterre to send to me by email, text message, or other electronic means: information
								regarding Masterre software, advice and recommendations or other related services. I understand
								that I can unsubscribe at any time to stop receiving this information or documentation.
								<span class="grey">(Optional)</span>
							</label>
						</div>
						<div>
							<label class="container"><input type="checkbox" 
									id="sec14agree2" name="sec14agree2"><span
									class="checkmark"></span></label>
							<label for='sec14agree2' class='consentLabel'>I authorize Masterre to send to me by email, text message, or other electronic means: bulletins,
								announcements, invitations, publications and other news or pertinent information. I understand
								that I can unsubscribe at any time to stop receiving this information or documentation.
								<span class="grey">(Optional)</span>
							</label>
						</div>

						<div>	
							<label class="container"><input onclick="checkifSigned()" type="checkbox" 
								id="finalagree1" name="finalagree1"><span class="checkmark"></span></label>
							<label for='finalagree1' class='consentLabel2'>I acknowledge having read the above declarations and agree with their content. <span class="red">(Mandatory)</span></label>
						</div>

						<div>
							<label class="container"><input onclick="checkifSigned()" type="checkbox" 
								id="finalagree2" name="finalagree2"><span class="checkmark"></span></label>
							<label for='finalagree2' class='consentLabel'>I certify that I have all the necessary authorizations, permissions, and approvals to enter into this
								Agreement on behalf of my company. <span class="red">(Mandatory)</span></label>
						</div>
					</li>
				</ol>

				<div style="padding-top: 13px;position: sticky; bottom: 0; background: white;    padding-bottom: 4px;">
					<button id="acceptAgreement" type="button" class="finalButtons" disabled>Accept</button>
					<a href="../Logout.jsp"><span id='cancelAgreement'>Cancel</span></a>
				</div>
				
			</div>

		</div>
	</div>

	<div id="myModalonLoad" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modalHeader">Welcome to MasterRe!
				<%-- <img src="../ImagesUsed/MasterRe.png" class="logoModal" alt=""> --%>
			</div>
			<div class="boxModal">
				<p style="margin-top: 30px; margin-bottom:0;">Thank you for choosing MASTERRE as your trusted partner for real
					estate transaction management. We take our clients' needs to heart.</p>
				<p style="margin-bottom: 30px;">Let's go over initial steps to help you get started. You can save your progress and logout if you wish to leave the interview.</p>

				<div class="finalButtons" style='width: 170px; margin: auto;'>Begin Company Interview</div>
			</div>

		</div>
	</div>

	<div id="myModal2" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<p>Save progress and complete corporate setup later?</p>
			<div class="popUpContainer" style="margin-top: 26px;">
				<!-- <span class="close">No</span> -->
				<button class="submitButton" type="submit">Confirm</button>
			</div>

			<div class="flexible" id="ExteraAgent"
				style="margin-top: 2px; margin-bottom: 7px; margin-left: 25px; text-align: left;">

				<label class="container" style="margin-left: 7px;"><input class="inlineInput" type="checkbox" id=""
						name="">
					<span class="checkmark" style="top: 16px; left: -7px; border-color: #29c1e1;"></span></label>

				<label style="margin-left: 8px; margin-right: 2px;">Do not show again</label>

			</div>
		</div>

	</div>
	<div style='display: flex'>
		<div id="left-Nav-bar-Menu" class="leftcolumn navBar">

			<!-- <div class="logo" style="padding-bottom: 35px;">

				<img src="../ImagesUsed/MasterRe.png" alt="MasterBroker"
					style="width:19px;  margin-left:16px; margin-bottom:5px;">

				<span class="navText"><img src="../ImagesUsed/MasterRe2.png" alt="MasterBroker"
						style="width:150px; height: 12px;  margin-left:6px; margin-bottom:7px;"></span>

			</div> -->

			<div class="logo">

				<img class='img1logo' src="../ImagesUsed/MasterRe.png" alt="MasterRe">

				<img class='img2logo' src="../ImagesUsed/MasterRe2.png" alt="MasterRe">

			</div>

			<div class="dropdown" id="forhov">

				<button id="createDrop" class="dropbtn">+</button>

			</div>

			<button class="tablinks"><img class="dashboardIcons accept" src="../ImagesUsed/Dashboard.png" alt="YesOrNo"
					style="margin-bottom: 0px;"><span class="navText">Dashboard</span></button>

			<button class="tablinks"> <img class="dashboardIcons accept" src="../ImagesUsed/Commission Calculator.png"
					alt="YesOrNo"><span class="navText">Commissions Calculator</span></button>

			<button class="tablinks"><img class="dashboardIcons accept" src="../ImagesUsed/Reports.png" alt="YesOrNo"
					style="margin-bottom: -3px;"><span class="navText">Deals</span></button>

			<button class="tablinks"><img class="dashboardIcons accept" src="../ImagesUsed/Personal Profile.png"
					alt="YesOrNo"><span class="navText">Personal
					Profile</span></button>

			<button class="tablinks active active"><img class="dashboardIcons accept"
					src="../ImagesUsed/Company Profile.png" style="margin-bottom: -3px;" alt="YesOrNo"><span
					class="navText">Company Profile</span></button>

			<button class="tablinks"><img class="dashboardIcons accept" src="../ImagesUsed/Contacts.png" alt="YesOrNo"><span
					class="navText">Contacts</span></button>

			<!-- <a class="menubartext" href="" style="display: none;"><button class="tablinks"><img class="dashboardIcons accept"
						src="../ImagesUsed/Inbox.png" alt="YesOrNo"><span class="navText">Inbox</span></button></a>
			-->

			<a class="menubartext" href="../Logout.jsp"><button class="tablinks tablinkLogout"><img
						class="dashboardIcons accept extrasize" src="../ImagesUsed/logOut.png" alt="YesOrNo"><span
						class="navText">Log Out</span></button></a>

			<button onclick="openNav()" id="navOpenBtn" class="floatDataRightSide" style="display: none;"><img
					class="dashboardIcons accept openClose" src="../ImagesUsed/collapse.png"
					alt="YesOrNo"></button>

			<button onclick="closeNav()" id="navCloseBtn" class="floatDataRightSide"><img
					class="dashboardIcons accept rotate180 openClose"
					src="../ImagesUsed/collapse.png" alt="YesOrNo"></button>


		</div><!-- Closing left-Nav-bar-Menu -->

		<!-- **************************************************************************************************************  -->

		<div id="CompanyMainSection" class="Rightcolumn marginBody navBarMovable"
			style="float:left; border: 0px solid gray; width: 100%;">

			<div style="width: 100%; height: 50px;" id="divNumber1">



				<div class="navTop flexibleContainer" id="TopNavButtons" style="    margin-top: 14px;">

					<div class="HeaderDashboard flexibleContainer">

						<label class="DealsHeader flexible">Company Profile</label>

					</div>

				</div>

			</div><!-- Closing HeadButtons -->



			<iframe name="hiddenFrame" width="0" height="0" style="display: none;"></iframe>
			
			<form id="CompanyDetailInformationRegistration" name="CompanyDetailInformationRegistration"
			
				action="../CompanyRegistration" target="hiddenFrame" method="post"  enctype="multipart/form-data" >

				<div id="CompanyTabs" class="PartiesNavBar flexibleContainer" style="width: calc(100% - 4px); max-width: 730px;">

					<button type="button" id="CorporateDetailsTab" class="tablinks2 flexible">Company
						Details</button>

					<button type="button" id="BrokerofRecordTab" class="tablinks2 flexible">Broker
						of Record</button>

					<button type="button" id="Tax&BankingTab" class="tablinks2 flexible"> Tax &
						Banking
					</button>

					<button type="button" id="PaymentDetailsTab" class="tablinks2 flexible" style="display: none;">Payment
						Details</button>

					<!-- <button id="UserAccessTab" class="tablinks2 flexible"
					onclick="TabsHandleler(event,'UserAccess','tabcontent2', 'tablinks2', 'UserAccessTab'); ">User<br>
					Access</button> -->

				</div><!-- Closing CompanyTabs -->

				<div id="CorporateDetails" class="tabcontent2" style='overflow: scroll; max-height: 84vh;'>

					<div id="CorporateDetailsTabMainSection" class="NewSectionSmall">

						<p id="ErrorEmpty" class="ErrorEmpty" style="display: none;     max-width: 695px; box-sizing: border-box;">
							Complete all required fields before proceeding.</p>

						<div id="ContactDetails" style="Width:100%; display:inline-block; margin-bottom: 80px;max-width: 730px;">

							<div class="flexibleContainer">

								<div class="flexible">

									<label class="MandentorySign"></label><label>Business Name:</label>

									<input class="inlineInput" type="text" id="CompanyBusinessName" maxlength="60"
										name="CompanyBusinessName" onkeyup="CorporateDetailsCheckSubmit()" onblur="CorporateDetailsCheckSubmit()"
										value="<%=MyCompanies.BusinessName%>">

								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Fiscal Year-End</label>

									<div class="input-group withdelete">
										<input id="CompanyFiscalyearend" name="CompanyFiscalyearend" type="text"
											class="form-control date-input" placeholder="DD MM" readonly="readonly"
											value="<%=MyCompanies.FiscalYearEnd%>"
											onchange="CorporateDetailsCheckSubmit()" />
										<label class="input-group-btn" for="CompanyFiscalyearend"
											id="CompanyFiscalyearendLabel">
											<span class="btn btn-default">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</label>
										<label class="input-group-btn" onclick="eraseDate(this)">
											<span class="btn btn-default">
												<i class="bi bi-x"></i>
											</span>
										</label>
									</div>

								</div>

							</div>

							<div class="flexibleContainer NewSection">

								<div class="flexible">

									<label class="NoMandatoryTwo">Unit</label>

									<input class="inlineInput" type="text" id="CompanyUnitNumber" name="CompanyUnitNumber" maxlength="10"
										value="<%=MyCompanies.Unit%>" onkeyup="CorporateDetailsCheckSubmit()"  onblur="CorporateDetailsCheckSubmit()"/>

								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Street Number</label>

									<input class="inlineInput" type="text" id="CompanyStreetNumber" maxlength="10"
										name="CompanyStreetNumber" value="<%=MyCompanies.StreetNumber%>"
										onkeyup="CorporateDetailsCheckSubmit()"  onblur="CorporateDetailsCheckSubmit()"/>
								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Street Name</label>

									<input class="inlineInput" type="text" id="CompanyStreetName" name="CompanyStreetName" maxlength="40"
										value="<%=MyCompanies.StreetName%>" onkeyup="CorporateDetailsCheckSubmit()"  onblur="CorporateDetailsCheckSubmit()"/>
								</div>

							</div>

							<div class="flexibleContainer">

								<div class="flexible">

									<label class="MandentorySign"></label><label>City</label>

									<input class="inlineInput" type="text" id="CompanyCity" name="CompanyCity" maxlength="30"
										value="<%=MyCompanies.City%>" onkeyup="CorporateDetailsCheckSubmit()"  onblur="CorporateDetailsCheckSubmit()"/>

								</div>

								<div class="flexible ">

									<label class="MandentorySign"></label><label>Province</label>

									<div class="custom-select" onclick="CorporateDetailsCheckSubmit()">

										<select class="inputSelection" id="CompanyProvince" name="CompanyProvince">

											<option value="ON">ON</option>

											<option value="AB">AB</option>

											<option value="BC">BC</option>

											<option value="MB">MB</option>

											<option value="NB">NB</option>

											<option value="NL">NL</option>

											<option value="NS">NS</option>

											<option value="NU">NU</option>

											<option value="ON">ON</option>

											<option value="PE">PE</option>

											<option value="QC">QC</option>

											<option value="SK">SK</option>

											<option value="YT">YT</option>

										</select>

									</div>

								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Postal Code</label>

									<input class="inlineInput" id="CompanyPostalcode" name="CompanyPostalcode" maxlength="11"
										value="<%=MyCompanies.PostalCode%>"
										onchange="postalCorrect(this.id); CorporateDetailsCheckSubmit()" onblur="CorporateDetailsCheckSubmit()">
								</div>

							</div>

							<div class="flexibleContainer NewSection">

								<div class="flexible">

									<label class="MandentorySign"></label><label>E-Mail</label>
									
									<span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
										height="16"><span class="tooltiptext">Enter an email which will be included in a brokerage invoice.</span></span>

									<input class="inlineInput" type="text" id="CompanyEmail" name="CompanyEmail" maxlength="50"
										value="<%=MyCompanies.Email%>" onkeyup="emailCorrect(this.id); CorporateDetailsCheckSubmit()" onblur="CorporateDetailsCheckSubmit()">

								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Phone</label>
																	
									<span class="tooltipHelp"><img src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16"
										height="16"><span class="tooltiptext">Enter a phone number which will be included in a brokerage invoice.</span></span>

									<input class="inlineInput" type="text" id="CompanyPhone" name="CompanyPhone" maxlength="14"
										value="<%=MyCompanies.Phone%>" onblur="CorporateDetailsCheckSubmit()"
										onkeydown="phoneNumberFormatter(this.id);CorporateDetailsCheckSubmit()"
										onchange="phoneNumberFormatterAfter(this.id);" autocomplete="tel">
								</div>
							</div>

							<label class="HeadLinesSecondary NewSection" style="margin-left: 8px;">Invoice Setup</label>
							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<p id="ErrorEmptyLogo" class="ErrorEmpty" style="display: none;">Upload the invoice logo.</p>

							<div class="flexibleContainer">

									<div class="flexible frontImageFlex frontImageWideLogo" id="wideId" >
								<%-- <label class="NoMandatoryTwo">Logo</label> --%>
								<div class="flexibleContainer" style="width: 150px;   ">
									<div class="flexible" style='margin-top: 0; '>
										<label style="cursor: pointer; margin-top: 0;    width: 100%; text-align: center; " for="CompanyLogo" onclick="TESTpath( 'CompanyLogo' , 'CompanyLogoInfo' );"   >Upload Logo</label>
									</div>
									<%-- <div class="flexible">
										<label style="cursor: pointer; margin: auto;     width: 100%; text-align: center;" onclick="deleteFile(event, 'CompanyLogoImg', 'CompanyLogo', 'cover')" for="">Delete</label>
									</div> --%>
								</div>
								<span id="cover" style="display: none;     justify-content: left;"></span>

								<img src="<%=URL%>?num=<%=Math.random()%>" onerror='this.src="../ImagesUsed/UploadLogo.png"' width="150px" alt="House" class="insideWideImg"
									id="CompanyLogoImg">


								<input type="file" accept="image/*" name="CompanyLogo" id="CompanyLogo" multiple="true"

									onchange="displayCroppedMainCompany('CompanyLogo', 'cover'); " style="display: none;">


								<input type="hidden" name="CompanyLogoInfo" id="CompanyLogoInfo" value="Test" >


							</div>



							<div class="NewSectionMedium flexible" style="float: left; flex: 1; ">
								<label class="NoMandatoryTwo">Invoice Footnote</label>
								<input class="input inlineInput" maxlength="60"
								list="FootnoteList" id="Footnote" name="Footnote" />
								<datalist id="FootnoteList" name="FootnoteList">
									<option value="E.&O.E.">
                				</datalist>


							</div>

							</div>
							<div class="flexibleContainer  NewSectionSmall">
								<div class="flexible">
									<p id="ImgSmallError" class="ErrorEmpty"
										style="padding: 20px;  margin-top: 13px ; display: none; margin-right: 0;">

										<label class="heavyfont">Looks like your image is very small</label><br>
										Please make sure your logo looks correct. The recommended upload file is at least 5
										KB.</p>


									<p id="ImgBigError" class="ErrorEmpty"
										style="padding: 20px; margin-top: 13px; display: none; margin-right: 0;"  >

										<label class="heavyfont">We are sorry, but your image is too big</label><br>
										The maximum upload file is 200 KB.</p>
								</div>
								<div class="flexible">

								</div>
							</div>

							<script>
								var loadFile = function (event) {

									var image = document.getElementById('output');
									var file = document.getElementById('CompanyLogo');

									if (file.files[0].size < 5240) {
										document.getElementById('ImgSmallError').style.display = '';
										document.getElementById('ImgBigError').style.display = 'none';
										image.src = URL.createObjectURL(event.target.files[0]);
									} else
									if (file.files[0].size > 204800) {
										document.getElementById('ImgSmallError').style.display = 'none';
										document.getElementById('ImgBigError').style.display = '';
										// alert(file.files[0].size);
									} else {
										image.src = URL.createObjectURL(event.target.files[0]);
										// alert(file.files[0].size);
										document.getElementById('ImgSmallError').style.display = 'none';
										document.getElementById('ImgBigError').style.display = 'none';
									}
								};

								var deleteFile = function (event, id1, id2, idcanv) {

									var image = document.getElementById(id1);
									var file = document.getElementById(id2);

									var canvas = document.getElementById(idcanv);
									document.getElementById('cover').style.display = 'none';

									// alert(file.value);

									if (file.value) {
										try {
											file.value = ''; //for IE11, latest Chrome/Firefox/Opera...
										} catch (err) {}
										if (file.value) { //for IE5 ~ IE10
											var form = document.createElement('form'),
												parentNode = file.parentNode,
												ref = file.nextSibling;
											form.appendChild(file);
											form.reset();
											parentNode.insertBefore(file, ref);
										}
									}

									// alert(file.value);
									image.src = '../ImagesUsed/Picture2.png';
									image.style.visibility = '';
									document.getElementById('ImgSmallError').style.display = 'none';
									document.getElementById('ImgBigError').style.display = 'none';

								};
							</script>

						</div><!-- Closing Contact Details-->

					</div><!-- Closing CorporateDetailsTabMainSection -->

					<div id="CorporateDetailsbuttonsSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="secondSpan extraspacing">
								<button class="buttonBlue" id="Nextbutton1" name="Nextbutton1" type="button"
									onclick="CorporateDetailsStep()">Save & Next</button>
							</span>

						</div>



					</div><!-- CorporateDetailsbuttonsSection -->

				</div><!-- Closing CorporateDetails -->

				<div id="BrokerofRecord" class="tabcontent2">

					<div id="MainBrokerSection">

						<p id="ErrorEmpty2" class="ErrorEmpty" style="display: none;">
							Complete all required fields before proceeding.</p>

						<div id="NoAlternativeBroker" style="margin-top: 46px; margin-bottom: 80px; max-width: 730px;">

							<label class="HeadLinesSecondary" style="margin-left: 8px;">Primary Broker of Record</label>
							<!-- <span
							class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
								alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext">MLS
								listing number will be used to auto populate transaction details</span></span> -->
							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont">Primary Broker of Record</label><span class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
							alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext">MLS
							listing number will be used to auto populate transaction details</span></span></div> -->

							<!-- <hr style="height:3px; border-width:0; color:gray; background-color:gray; width:100%;"> -->

							<!-- <div class="flexibleContainer ">

							
							<div class="flexible"></div>
						</div> -->

							<div class="flexibleContainer NewSectionSmall">

								<div class="flexible">

									<label class="NoMandatoryTwo">Title</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerTitle" name="PrimaryBrokerTitle" maxlength="10"
										value="<%=   MyInformation.Title  %> " onblur="BrokerOfRecordStepSubmit()">

								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>First Name</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerFirstName" maxlength="45"
										name="PrimaryBrokerFirstName" value="<%=MyInformation.Firstname%>"
										onblur="BrokerOfRecordStepSubmit()" autocomplete="given-name">
								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Last Name</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerLastName" maxlength="45"
										name="PrimaryBrokerLastName" value="<%=MyInformation.Lastname%>"
										onblur="BrokerOfRecordStepSubmit()" autocomplete="family-name" />

								</div>

							</div>

							<div id="CopyPropertyAddress1" class="NewSectionCopy">
								<label class="container"><input class="inlineInput"
										onclick="CopyAddress('PrimaryBrokerUnitNumber','PrimaryBrokerStreetNumber','PrimaryBrokerStreetName','PrimaryBrokerProvince','PrimaryBrokerPostalcode','PrimaryBrokerCity');"
										type="checkbox" id="CopyAddressBox" name="CopyAddressBox">
									<span class="checkmark" style="top: 16px;left: 8px;"></span></label>

								<label style="margin-left: 22px;">Same as Brokerage</label>
							</div>
							<div class="flexibleContainer">

								<div class="flexible">

									<label class="NoMandatoryTwo">Unit</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerUnitNumber" maxlength="10"
										name="PrimaryBrokerUnitNumber" value="<%=MyInformation.User_Unit%>" onblur="BrokerOfRecordStepSubmit()" onkeyup="BrokerOfRecordStepSubmit()"  />

								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Street Number</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerStreetNumber" maxlength="10"
										name="PrimaryBrokerStreetNumber" value="<%=MyInformation.User_StreetNumber%>"
										onblur="BrokerOfRecordStepSubmit()" onkeyup="BrokerOfRecordStepSubmit()"  />
								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Street Name</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerStreetName" maxlength="40"
										name="PrimaryBrokerStreetName" value="<%=MyInformation.User_StreetName%>"
										onblur="BrokerOfRecordStepSubmit()" onkeyup="BrokerOfRecordStepSubmit()"  />
								</div>

							</div>

							<div class="flexibleContainer">

								<div class="flexible">

									<label class="MandentorySign"></label><label>City</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerCity" name="PrimaryBrokerCity" maxlength="30"
										value="<%=MyInformation.User_City%>" onblur="BrokerOfRecordStepSubmit()" onkeyup="BrokerOfRecordStepSubmit()"  />

								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Province</label>

									<div class="custom-select" onclick="BrokerOfRecordStepSubmit()" >

										<select class="inputSelection" id="PrimaryBrokerProvince"
											name="PrimaryBrokerProvince">

											<option value="ON">ON</option>

											<option value="AB">AB</option>

											<option value="BC">BC</option>

											<option value="MB">MB</option>

											<option value="NB">NB</option>

											<option value="NL">NL</option>

											<option value="NT">NT</option>

											<option value="NS">NS</option>

											<option value="NU">NU</option>

											<option value="ON">ON</option>

											<option value="PE">PE</option>

											<option value="QC">QC</option>

											<option value="SK">SK</option>

											<option value="YT">YT</option>

										</select>

									</div>

								</div>

								<div class="flexible">

									<label class="MandentorySign"></label><label>Postal Code</label>

									<input class="inlineInput" id="PrimaryBrokerPostalcode" name="PrimaryBrokerPostalcode" maxlength="11"
										value="<%=MyInformation.User_PostalCode%>" onkeyup="BrokerOfRecordStepSubmit()" onblur="BrokerOfRecordStepSubmit()">
								</div>

							</div>




							<div class="flexibleContainer NewSection">

								<div class="flexible">

									<label class="MandentorySign"></label><label>E-Mail</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerEmail" name="PrimaryBrokerEmail" maxlength="50"
										value="<%=MyInformation.User_Email%>" onkeyup="emailCorrect(this.id); BrokerOfRecordStepSubmit()" onblur="BrokerOfRecordStepSubmit()"
										autocomplete="email" />
								</div>


							</div>

							<div class="flexibleContainer">

								<div class="flexible">

									<label class="MandentorySign"></label><label>Phone</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerPhone" name="PrimaryBrokerPhone" maxlength="14"
										value="<%=MyInformation.User_Phone%>" onblur="BrokerOfRecordStepSubmit()"
										onkeydown="phoneNumberFormatter(this.id);BrokerOfRecordStepSubmit()"
										onchange="phoneNumberFormatterAfter(this.id);" autocomplete="tel">

								</div>

								<div class="flexible">

									<label class="NoMandatoryTwo">Mobile</label>

									<input class="inlineInput" type="text" id="PrimaryBrokerMobile" maxlength="20"
										name="PrimaryBrokerMobile" value="<%=MyInformation.User_faxOrMobileNumber%>"
										onkeydown="phoneNumberFormatter(this.id)"
										onchange="phoneNumberFormatterAfter(this.id);" />

								</div>

							</div>

							<div id="AlternativeBrokerinfo" class="NewSectionMedium" style="display: none;">

								<label class="HeadLinesSecondary" style="margin-left: 8px;">Alternate Broker of
									Records</label>
								<!-- <span class="tooltipHelp"><img class="helpImg"
									src="../ImagesUsed/HelpIcone.png" alt="MasterProBrokerHelp" width="16" height="16"><span
									class="tooltiptext">MLS
									listing number will be used to auto populate transaction details</span></span> -->
								<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

								<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont">Alternate Broker of Records</label>
								<span class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
								alt="MasterProBrokerHelp" width="16" height="16"><span class="tooltiptext">Alternative</span></span></div> -->

								<!-- <label></label> -->

								<!-- <hr style="height:3px; border-width:0; color:gray; background-color:gray; width:100%;"> -->


								<p id="" class="Notification" style="line-height: 1.4;">

									You can designate an alternative broker of record here once you complete setting up
									corporate profile and adding an alternate broker of record as a new user..</p>

								<span>

									<img src="">

									<label> </label>

								</span>

							</div><!-- Closing AlternativeBrokerinfo -->


						</div><!-- Closing NoAlternativeBroker -->


					</div><!-- Closing MainBrokerSection -->

					<div id="BrokerofRecordButtonSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="buttonDiscard floatDataLefttSide">
								<button type="button" class="buttonBlue" id="Discard"
									onclick="TabsHandleler(event,'CorporateDetails','tabcontent2','tablinks2','CorporateDetailsTab'); ">Back</button></span>

							<span class="secondSpan extraspacing">

								<button class="buttonBlue" id="Nextbutton2" name="Nextbutton2" type="button"
									onclick="BrokerOfRecordStep()">Save & Next</button>
							</span>

						</div>



					</div><!-- Closing BrokerofRecordButtonSection -->

				</div><!-- Closing BrokerofRecord -->

				<div id="Tax&Banking" class="tabcontent2" style="margin-bottom: 80px; max-width: 730px;">

					<div id="MainTax&Banking" class="NewSectionMedium">

						<p id="ErrorEmpty3" class="ErrorEmpty" style="display: none;">
							Complete all required fields before proceeding.</p>

						<div class="flexibleContainer" id="HSTSection">

							<div class="flexible ">
								<label class="MandentorySign"></label><label>HST Number</label>
								<div class="flexibleContainer" id="HSTSectionDiv">
									<input class="inlineInput flexible" type="text" id="CompanyHSTNumber" maxlength="9"
										name="CompanyHSTNumbere" value="<%=MyCompanies.HSTNumberPart1%>"
										placeholder="123456789" onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">
									<label class="flexible" for="" style="flex: 0.1; margin-top: 6px;">RT</label>
									<input class="inlineInput flexible" style="flex: 0.5;" placeholder="0001" type="text"
										id="CompanyHSTNumberRT" name="CompanyHSTNumbereRT" value="0001" maxlength="4"
										onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()"></div>
							</div>

							<div class="flexible" style="flex: 2.2;"></div>

						</div>

						<div id="FirstRealEstateTrust" class="NewSectionMedium">

							<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont">Real Estate Trust</label></div> -->

							<label class="HeadLinesSecondary" style="margin-left: 8px;">Real Estate Trust</label>

							<span id="PurcharerProcess" class="floatDataRightSide" style=" display: none;">

								<span class="tooltip">
									<img src="../ImagesUsed/AddSVG.svg" style="margin-top: 5px;"
										class="lineButton manageListButton" alt="+" type="button" onclick="AddTrust();"
										id="AddMorePuchaser" name="AddMorePuchaser"><span class="tooltiptext">Add Real
										Estate Trust</span>
								</span>

							</span>

							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<div class="flexibleContainer">
								<div class="flexible">
									<label class="NoMandatory"></label><label>Bank Number</label>

									<input class="inlineInput" type="text" id="RealEstateTrustCompanyBankNumber" maxlength="18"
										name="RealEstateTrustCompanyBankNumber"
										value="<%=MyCompanies.RealEstateTrustBankNumber%>" onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">
								</div>

								<div class="flexible">
									<label class="NoMandatory"></label><label>Transit Number</label>

									<input class="inlineInput" type="text" id="RealEstateTrustCompanyTransitNumber" maxlength="5"
										name="RealEstateTrustCompanyTransitNumber"
										value="<%=MyCompanies.RealEstateTrustTransitNumber%>"
										onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">
								</div>

								<div class="flexible">
									<label class="NoMandatory"></label><label>Account Number</label>

									<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountNumber" maxlength="18"
										name="RealEstateTrustCompanyAccountNumber"
										value="<%= MyCompanies.RealEstateTrustAccountNumber%>"
										onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">
								</div>

								<div class="flexible" style="flex: 0.2; display: none;">
									<label class="chequeLabel">Cheque</label>

									<input class="inlineInput" type="file" id="RealEstateTrustCompanyCheque"
										name="RealEstateTrustCompanyCheque">
									<br>

									<img class="chequeImg" src="../ImagesUsed/Cheque.png">

								</div>
							</div>


						</div><!-- Closing FirstRealEstateTrust -->

						<div id="SecondRealEstateTrust" class="NewSectionMedium" style="display: none;">

							<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont"></label></div> -->

							<label class="HeadLinesSecondary" style="margin-left: 8px;">Second Real Estate Trust</label>

							<span id="PurcharerProcess" class="floatDataRightSide">

								<span class="tooltip">
									<img src="../ImagesUsed/DeleteB.png" style="margin-top: 5px;"
										class="lineButton manageListButton" alt="+" type="button" onclick="RemoveTrust();"
										id="AddMorePuchaser" name="AddMorePuchaser"><span class="tooltiptext">Remove Real
										Estate Trust</span>
								</span>

							</span>

							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<div class="flexibleContainer">

								<div class="flexible">
									<label class="MandentorySign"></label><label>Account Name</label>

									<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountName2" maxlength="60"
										name="RealEstateTrustCompanyBankNumberAccountName2"
										value="<%=MyCompanies.RealEstateTrustAccountName2%>">

								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label>Account Nick Name</label>

									<input class="inlineInput" type="text" maxlength="60"
										id="RealEstateTrustCompanyBankNumberAccountNickNeame2"
										name="RealEstateTrustCompanyBankNumberAccountNickNeame2"
										value="<%=MyCompanies.RealEstateTrustAccountNikname2%>">

								</div>
							</div>

							<div class="flexibleContainer">

								<div class="flexible">
									<label class="MandentorySign"></label><label>Bank Number</label>

									<input class="inlineInput" type="text" id="RealEstateTrustCompanyBankNumber2" maxlength="18"
										name="RealEstateTrustCompanyBankNumber2"
										value="<%=MyCompanies.RealEstateTrustBankNumber2%>">

								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label>Transit Number</label>

									<input class="inlineInput" type="text" id="RealEstateTrustCompanyTransitNumber2" maxlength="5"
										name="RealEstateTrustCompanyTransitNumber2"
										value="<%=MyCompanies.RealEstateTrustTransitNumber2%>">

								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label>Account Number</label>

									<input class="inlineInput" type="text" id="RealEstateTrustCompanyAccountNumber2" maxlength="18"
										name="RealEstateTrustCompanyAccountNumber2"
										value="<%=MyCompanies.RealEstateTrustAccountNumber2%>">

								</div>

								<div class="flexible" style="flex: 0.2; display: none;">
									<label class="chequeLabel">Cheque</label>

									<input type="file" id="RealEstateTrustCompanyCheque2"
										name="RealEstateTrustCompanyCheque2">

									<img class="chequeImg" src="../ImagesUsed/Cheque.png">

								</div>

							</div>



						</div><!-- Closing SecondRealEstateTrust -->


						<div id="CommissionTrust" class="NewSectionMedium">

							<label class="HeadLinesSecondary" style="margin-left: 8px;">Commission Trust</label>
							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont"></label></div> -->

							<div class="flexibleContainer">

								<div class="flexible">
									<label class="MandentorySign"></label><label>Bank Number</label>

									<input class="inlineInput" type="text" id="CommissionTrustCompanyBankNumber" maxlength="18"
										name="CommissionTrustCompanyBankNumber"
										value="<%= MyCompanies.CommissionBankNumber%>" onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">

								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label>Transit Number</label>

									<input class="inlineInput" type="text" id="CommissionTrustCompanyTransitNumber" maxlength="5"
										name="CommissionTrustCompanyTransitNumber"
										value="<%=MyCompanies.CommissionTransitNumber%>" onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">

								</div>


								<div class="flexible">
									<label class="MandentorySign"></label><label>Account Number</label>

									<input class="inlineInput" type="text" id="CommissionTrustCompanyAccountNumber" maxlength="18"
										name="CommissionTrustCompanyAccountNumber"
										value="<%=MyCompanies.CommissionAccountNumber%>" onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">

								</div>

								<div class="flexible" style="flex: 0.2; display: none;">
									<label class="chequeLabel">Cheque</label>

									<input class="inlineInput" type="file" id="CommissionTrustCompanyCheque"
										name="CommissionTrustCompanyCheque">

									<img class="chequeImg" src="../ImagesUsed/Cheque.png">

								</div>

							</div>

						</div><!-- Closing CommissionTrust -->

						<div id="GeneralAccount" class="NewSectionMedium">

							<label class="HeadLinesSecondary" style="margin-left: 8px;">General Account</label>
							<hr style="border: 0; background: #29c1e1; height: 2px; margin-right: 4px;">

							<!-- <div style="border-bottom: 1px solid grey; width: 100%;"><label class="heavyfont"></label></div> -->

							<div class="flexibleContainer">

								<div class="flexible">
									<label class="NoMandatory"></label><label>Bank Number</label>

									<input class="inlineInput" type="text" id="GeneralAccountCompanyBankNumber" maxlength="18"
										name="GeneralAccountCompanyBankNumber"
										value="<%=MyCompanies.GeneralAccountBankNumber%>" onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">

								</div>

								<div class="flexible">
									<label class="NoMandatory"></label><label>Transit Number</label>

									<input class="inlineInput" type="text" id="GeneralAccountCompanyTransitNumber" maxlength="5"
										name="GeneralAccountCompanyTransitNumber"
										value="<%=MyCompanies.GeneralAccountTransitNumber%>"
										onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">

								</div>


								<div class="flexible">
									<label class="NoMandatory"></label><label>Account Number</label>

									<input class="inlineInput" type="text" id="GeneralAccountCompanyAccountNumber" maxlength="18"
										name="GeneralAccountCompanyAccountNumber"
										value="<%=MyCompanies.GeneralAccountAccountNumber%>"
										onblur="CompanyTaxStepSubmit()" onkeyup="CompanyTaxStepSubmit()">

								</div>

								<div class="flexible" style="flex: 0.2; display: none;">
									<label class="chequeLabel">Cheque</label>

									<input type="file" id="GeneralAccountCompanyCheque" name="GeneralAccountCompanyCheque">

									<img class="chequeImg" src="../ImagesUsed/Cheque.png">

								</div>
							</div>
						</div><!-- Closing GeneralAccount -->


					</div><!-- Closing MainTax&Banking -->

					<div id="Tax&BankingButtonSection" class="FooterButton">

						<div class="FooterButtonSpan">

							<span class="buttonDiscard floatDataLefttSide">
								<button type="button" class="buttonBlue" id="Discard"
									onclick="TabsHandleler(event,'BrokerofRecord', 'tabcontent2', 'tablinks2', 'BrokerofRecordTab'); ">Back</button></span>

							<span class="secondSpan extraspacing" style='    margin-right: 40px !important;'>

								<button class="buttonBlue" id="Finalized" name="Finalized" type="Submit"
									onclick="CompanyTaxStep(); changeFormTarget(this);">Complete</button>

							</span>

						</div>

					</div><!-- Closing Tax&BankingButtonSection -->

				</div><!-- Closing Tax&Banking  -->

			</form>

			<div id="PaymentDetails" class="tabcontent2" style="margin-bottom: 80px;">

				<div id="MainPaymnetdetailSection" class="NewSectionMedium">

					<div id="FirstPaymnetVisist">

						<div class="flexibleContainer">
							<div class="flexible">
								<label class="MandentorySign"></label><label>My Plan</label>
								<div class="custom-select">
									<select id="Myplan" name="Myplan">

										<option value="">-- Option --</option>

										<option value="1">1</option>

										<option value="2">2</option>

									</select>
								</div>
							</div>

							<div class="flexible">

								<label class="MandentorySign"></label><label>Active Users</label><span
									class="tooltipHelp"><img class="helpImg" src="../ImagesUsed/HelpIcone.png"
										alt="MasterProBrokerHelp" width="16" height="16"><span
										class="tooltiptext">Description</span></span>

								<input style="margin-top: -1px; text-align: right;" class="inlineInput" type="text"
									id="ActiveUser" name="ActiveUser" value="" placeholder="0">

							</div>

							<div class="flexible">
								<label class="NoMandatoryTwo">Monthly Price</label>

								<span class="inlineInput shortValue" style="display: block; padding: 1px 5px;">
									<label style="margin-left: 5px;">$</label>
									<input class="input5" type="text" id="PlanPrice" name="PlanPrice" min="0"
										placeholder="0.00" onblur="limiting(this); clearing()">
								</span>

								<!-- <input class="inlineInput" style="text-align: right;" type="number" step="0.01" id="" name="" placeholder="0.00" value=""> -->

							</div>

						</div>

						<div class="flexibleContainer" style="margin-left: 9px; margin-top: -7px; ">
							<div class="flexible"><label style="cursor: pointer;">View all plans HERE</label></div>
							<div class="flexible"></div>
							<div class="flexible"></div>
						</div>




						<div id="Plans"> </div><!-- Closing Plans   -->

						<div id="PaymentMethodDetails Information "
							style="width: 435px;margin-left: 14%;border: 1px solid grey;border-radius: 30px;padding: 30px;padding-bottom: 35px;margin-top: 30px;/* padding-left: 40px; */">

							<label style="width: 100%;text-align: center;font-weight: bold;font-size: 19px;">Please select
								your payment method </label>

							<span style="display:table;margin:0 auto;margin-top: 15px;">

								<img class="cardimg" style="margin-left: -4px;" src="">

								<img class="cardimg" src="">

								<img class="cardimg" src="">

								<img class="cardimg" style="margin-right: 0;" src="">

							</span>

							<div class="flexible" style=" padding-left: 20px; padding-right: 20px;">
								<label class="MandentorySign"></label><label> Card Number </label>

								<input class="inlineInput" type="text" id="CardNumber" name="CardNumber" value="">
							</div>

							<div class="flexible" style="padding-left: 20px; padding-right: 20px; margin-top: 14px;">
								<label class="MandentorySign"></label><label> Card Holder Name </label>

								<input class="inlineInput" type="text" id="CardHolderName" name="CardHolderName" value="">
							</div>
							<div class="flexibleContainer" style="width: auto;padding-left: 20px;padding-right: 20px;">
								<div class="flexible">

									<div style="width: 100%; box-sizing: border-box;">
										<label class="MandentorySign"></label><label>Expiration Date</label>
									</div>

									<div class="flexibleContainer">
										<input style="flex: 1; margin-right: 4px;  text-align: center;" class="inlineInput"
											type="text" id="ExpirationMounth" name="ExpirationMounth" value=""
											placeholder="MM">

										<input style=" flex: 1; text-align: center;" class="inlineInput" type="text"
											id="ExpirationYear" name="ExpirationYear" value="" placeholder="YY">
									</div>



								</div>

								<div class="flexible" style="display: none;">

									<label class="NoMandatoryTwo">&nbsp;</label>

									<div class="input-group">
										<input id="CardClosingDate" name="CardClosingDate" type="text"
											class="form-control date-input" placeholder="DD MM YYYY" readonly="readonly">
										<label class="input-group-btn" for="CardClosingDate" id="CardClosingDatelabel">
											<span class="btn btn-default">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</label>

									</div>

								</div>

								<div class="flexible">
									<label class="MandentorySign"></label><label> Security Code </label>

									<input class="inlineInput" type="number" step="0.01" id="CardSecurityCode" name="CardSecurityCode"
										value="">
								</div>
							</div>
						</div>


						<div style="margin-left: 25%; margin-top: 20px;">

							<label class="container"><input type="checkbox" checked="checked"
									id="PaymnetTerms&Comdition" name="PaymnetTerms&Comdition" value="Percentage"><span
									class="checkmark" style="top: 10px;"></span></label>

							<!-- <input type="checkbox" id="PaymnetTerms&Comdition" name="PaymnetTerms&Comdition"> -->

							<label style="margin-left: 22px; width: 280px;">I accept terms and conditions and confirm that
								corporate information is accurate and up
								to date.</label>


						</div>


					</div><!-- Closing FirstPaymnetVisist -->

					<div id="SecondPaymnetVisit" style="display: none;">

						<label> Billing and Payment</label>

						<hr>

						<span>
							<img src=" ">

							<label id="CardTypeLabel"> Credit card ending </label><label
								id="UserCardNumber">*****2423</label>
						</span>


						<span>
							<img src=" ">

							<label id="Plan"> Premium Plan </label>
						</span>

						<span>
							<label id="Number Of Active Users"></label>

							<label> Active users </label>
						</span>

						<span>
							<label id="PlanMonthlyPrice"></label>

							<label>/ month </label>
						</span>

						<span>
							<label>Next Payment on</label>

							<label id="NextPaymnetDate">Jan 1, 2022</label>
						</span>

					</div><!-- closing  SecondPaymnetVisit -->

				</div><!-- Closing MainPaymnetdetailSection  -->

				<div id="PaymentDetailsButtonSection" class="FooterButton">

					<div class="FooterButtonSpan">

						<span class="buttonDiscard floatDataLefttSide">
							<button style="display: none;" type="button" id="Discard">Discard</button></span>

						<span class="secondSpan extraspacing">

							<button style="width: auto;" type="button" id="Savebtn4">Save and complete later</button>

							<button class="buttonBlue" id="Nextbutton" type="button" onclick=";">Confirm and Pay</button>
						</span>

					</div>


				</div><!-- Closing PaymentDetailsButtonSection -->

			</div><!-- Closing PaymentDetails -->


		</div><!-- Closing CompanyMainSection -->

	</div>

	<script type="text/javascript" src="../Scripts/CompanyRegLoad.js"></script>

	<!-- ************************************************************************************************************ -->

</body>

</html>