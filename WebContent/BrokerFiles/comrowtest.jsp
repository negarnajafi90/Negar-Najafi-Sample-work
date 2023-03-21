                          	 
   <% 
           DecimalFormat decimalFormat = new DecimalFormat("0.00");

                  String Price = ""; String List = ""; String Sel = ""; String TypePen = "";
        String RefC = ""; String RebC = ""; String rref=""; String DateFin = "";



            //double TotalPrice=0.00;
        //double TotalAgents=0.00;
        //double TotalBrokers=0.00;
        //double TotalNets=0.00;
        //double TotalCommissions=0.00;
        //double TotalRebate=0.00;
        //double TotalReferral=0.00;
        //double TotalBoth = 0;
   TypePen = MyCommissions.get(i).Type ;
    if(TypePen.equals("Trade in Real Estate") || TypePen.equals("Lender/Mortgage Referral") || TypePen.equals("Other") || TypePen.equals("Appraisal") || TypePen.equals("Letter of Opinion") || TypePen.equals("Valuation") || TypePen.equals("Consulting")){
        Price = "<span>-</span>";
        List = "-";
        Sel = "-";
        RefC = "<span>-</span>";
        RebC = "<span>-</span>";
        if(TypePen.equals("Trade in Real Estate") || TypePen.equals("Lender/Mortgage Referral") || TypePen.equals("Other")){
            TypePen = "Referral";
            rref = "ReferralFee";
        }else{
            TypePen = "Appraisal";
            rref="Appraisal";
        }
    }else{
        Price = CanadaVal.format(Double.parseDouble(MyCommissions.get(i).Price));
        List = MyCommissions.get(i).ListingCommission + "%";
        Sel = MyCommissions.get(i).SellingCommission + "%";
        RefC = CanadaVal.format(Double.parseDouble(MyCommissions.get(i).Referral));
        RebC = CanadaVal.format(Double.parseDouble(MyCommissions.get(i).Rebate)) ;
        TypePen = "TRS";
        rref="TRS";
    }

    if(MyCommissions.get(i).Date.isEmpty() || MyCommissions.get(i).Date==""){
        DateFin = "";
    }else{
        DateFin = MyCommissions.get(i).Date;
    }
    
    
        for (int i = 0; i < MyCommissions.size(); i++) {   
            %>
    
       <tr class="tablerows comrow">
           <%-- <a href='../UpdateForms/<%=MyCommissionsPending.get(i).Description%>.jsp?ID=<%=MyCommissionsPending.get(i).TradeID%>'><%=MyCommissionsPending.get(i).TradeID%></a>
           --%>
           <td class="row1Comission cen"><a
                   href='../UpdateForms/<%= rref %>.jsp?ID=<%= MyCommissions.get(i).TradeID%>'><%= MyCommissions.get(i).TradeID%></a>
           </td>
           <td class="row2Comission cen"><%= TypePen %></td>
           <td class="row3Comission cen"><%= MyCommissions.get(i).Address %></td>
           <td class="row4Comission num"><%= Price %></td>
           <td class="row5Comission cen"><%= List %></td>
           <td class="row6Comission cen"><%= Sel %></td>
           <td class="row7Comission num"><%= MyCommissions.get(i).GrossCommission %></td>
           <td class="row8Comission num"><%=MyCommissions.get(i).SplitWithBroker %></td>
           <td class="row9Comission num"><%= MyCommissions.get(i).AgentPortion %></td>
           <td class="row10Comission num" style='display: none;'><%= RefC %></td>
           <td class="row11Comission num" style='display: none;'><%= RebC %></td>
           <td class="row12Comission num" style='display: none;'><%= MyCommissions.get(i).NetCommission%></td>
           <td class="row13Comission cen" style='display: none;'><%=MyCommissions.get(i).Closingdate%></td>
           <td class="row14Comission cen" style='display: none;'><%=MyCommissions.get(i).Closingdate%></td>
           <td class="row15Comission cen"><%=DateFin %></td>
       
       </tr>




       
function TRSExpensesPreview(

    CooperatingBrokerageExpensesName, CooperatingBrokerageExpensesNet, CooperatingBrokerageExpensesHST,
    CooperatingBrokerageExpensesHSTPercent,

    CooperatingBrokerageExpensesTotalAmount,

    ExpensesReferralAgentName, ExpensesReferralAgentNet, ExpensesReferralAgentHST, ExpensesReferralAgentHSTPercent,
    ExpensesReferralAgentTotalAmount,

    CustomerName1, CustomerNet1, CustomerHST1, CustomerHST1Percent1, CustomerTotalAmount1,

    CustomerName2, CustomerNet2, CustomerHST2, CustomerHST1Percent2, CustomerTotalAmount2,

    CustomerName3, CustomerNet3, CustomerHST3, CustomerHST1Percent3, CustomerTotalAmount3,

    CustomerName4, CustomerNet4, CustomerHST4, CustomerHST1Percent4, CustomerTotalAmount4,

    AgentExpenses1, AgentExpensesNet1, AgentExpensesHST1, AgentExpensesHST1Percent, AgentExpensesTotalAmount1,

    AgentExpenses2, AgentExpensesNet2, AgentExpensesHST2, AgentExpensesHST1Percent2, AgentExpensesTotalAmount2

) {


    document.getElementById(CooperatingBrokerageExpensesName).value = Data1;

    document.getElementById(CooperatingBrokerageExpensesNet).value = Data2;

    document.getElementById(CooperatingBrokerageExpensesHST).value = (parseFloat(Data2) * parseFloat(Data4)) /
        100;

    document.getElementById(CooperatingBrokerageExpensesHSTPercent).value = Data4;

    document.getElementById(CooperatingBrokerageExpensesTotalAmount).value = (parseFloat(document.getElementById(
        CooperatingBrokerageExpensesNet))) + (parseFloat(document.getElementById(Co -
        operatingBrokerageExpensesHST).value));



    document.getElementById(ExpensesReferralAgentName).value = Data6;

    document.getElementById(ExpensesReferralAgentNet).value = Data7;

    document.getElementById(ExpensesReferralAgentHST).value = (parseFloat(Data7) * parseFloat(Data9)) / 100;

    document.getElementById(ExpensesReferralAgentHSTPercent).value = Data9;

    document.getElementById(ExpensesReferralAgentTotalAmount).value = (document.getElementById(
        ExpensesReferralAgentHST).value) + (document.getElementById(ExpensesReferralAgentNet).value);


    document.getElementById(CustomerName1).value = Data11;

    document.getElementById(CustomerNet1).value = Data12;

    document.getElementById(CustomerHST1).value = (parseFloat(Data12) * parseFloat(Data14)) / 100;

    document.getElementById(CustomerHST1Percent1).value = Data14;

    document.getElementById(CustomerTotalAmount1).value = (document.getElementById(CustomerHST1).value) + (document
        .getElementById(CustomerNet1).value);


    document.getElementById(CustomerName2).value = Data16;

    document.getElementById(CustomerNet2).value = Data17;

    document.getElementById(CustomerHST2).value = (parseFloat(Data17) * parseFloat(Data19)) / 100;

    document.getElementById(CustomerHST1Percent2).value = Data19;

    document.getElementById(CustomerTotalAmount2).value = (ocument.getElementById(CustomerNet2).value) + (document
        .getElementById(CustomerHST2).value);


    document.getElementById(CustomerName3).value = Data21;

    document.getElementById(CustomerNet3).value = Data21;

    document.getElementById(CustomerHST3).value = (parseFloat(Data21) * parseFloat(Data24)) / 100;

    document.getElementById(CustomerHST1Percent3).value = Data23;

    document.getElementById(CustomerTotalAmount3).value = (document.getElementById(CustomerHST3).value) + (document
        .getElementById(CustomerNet3).value);



    document.getElementById(CustomerName4).value = Data25;

    document.getElementById(CustomerNet4).value = Data26;

    document.getElementById(CustomerHST4).value = (parseFloat(Data26) * parseFloat(Data28)) / 100;

    document.getElementById(CustomerHST1Percent4).value = Data28;

    document.getElementById(CustomerTotalAmount4).value = (document.getElementById(CustomerHST4).value) + (document
        .getElementById(CustomerNet4).value);


    document.getElementById(AgentExpenses1).value = Data30;

    document.getElementById(AgentExpensesNet1).value = Data31;

    document.getElementById(AgentExpensesHST1).value = (parseFloat(Data31) * parseFloat(Data33)) / 100;

    document.getElementById(AgentExpensesHST1Percent).value = Data33;

    document.getElementById(AgentExpensesTotalAmount1).value = (document.getElementById(AgentExpensesHST1).value) +
        (document.getElementById(AgentExpensesNet1).value);


    document.getElementById(AgentExpenses2).value = Data35;

    document.getElementById(AgentExpensesNet2).value = Data36;

    document.getElementById(AgentExpensesHST2).value = (parseFloat(Data36) * parseFloat(Data38)) / 100;

    document.getElementById(AgentExpensesHST1Percent2).value = Data38;

    document.getElementById(AgentExpensesTotalAmount2).value = (document.getElementById(AgentExpensesHST2).value) +
        (document.getElementById(AgentExpensesHST2).value);

}

function TRSCommissionIncomePreview(

    TRSListCommissionName, TRSListCommission, TRSListHTS, TRSTotalListCommission,

    TRSSellCommissionName, TRSSellCommission, TRSSellCommissionHTS, TRSTotalSellCommission,

    TRSTotalCommissions, TRSTotaHST, TRSTotalFinalCommissions,

    Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11
) {


    document.getElementById(TRSListCommissionName).value = Data1;

    document.getElementById(TRSListCommission).value = Data2;

    document.getElementById(TRSListHTS).value = Data3;

    document.getElementById(TRSTotalListCommission).value = Data4;

    document.getElementById(TRSSellCommissionName).value = Data5;

    document.getElementById(TRSSellCommission).value = Data6;

    document.getElementById(TRSSellCommissionHTS).value = Data7;

    document.getElementById(TRSTotalSellCommission).value = Data8;
Coo
    document.getElementById(TRSTotalCommissions).value = Data9;

    document.getElementById(TRSTotaHST).value = Data10;

    document.getElementById(TRSTotalFinalCommissions).value = Data11;


}

function TRSDepositsPreview(DepositsName1, DepositsDate1, DepositsAmount1, DepositsName2, DepositsDate2,
    DepositsAmount2,

    DepositsName3, DepositsDate3, DepositsAmount3, DepositsName4, DepositsDate4, DepositsAmount4, TRSTotalDeposits,

    Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12) {


    document.getElementById(DepositsName1).value = Data1;

    document.getElementById(DepositsDate1).value = Data2;

    document.getElementById(DepositsAmount1).value = Data3;

    document.getElementById(DepositsName2).value = Data4;

    document.getElementById(DepositsDate2).value = Data5;

    document.getElementById(DepositsAmount2).value = Data6;

    document.getElementById(DepositsName3).value = Data7;

    document.getElementById(DepositsDate3).value = Data8;

    document.getElementById(DepositsAmount3).value = Data9;

    document.getElementById(DepositsName4).value = Data10;

    document.getElementById(DepositsDate4).value = Data11;

    document.getElementById(DepositsAmount4).value = Data12;

    document.getElementById(TRSTotalDeposits).value = document.getElementById(DepositsAmount1).value + document
        .getElementById(DepositsAmount2).value + document.getElementById(DepositsAmount3).value + document
        .getElementById(DepositsAmount4).value;



}

function TRSAgentsPreview(TRSAgentName1, Allocation1, TRSSplit1, TRSAgentCommision1, TRSAgentCommision1,
    TRSAgentNet1, TRSAgentName2, Allocation2, TRSSplit2, TRSAgentCommision2, TRSAgentNet2, TRSAgentCommision3,
    TRSAgentNet3,

    Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12) {

    document.getElementById(TRSAgentName1).value = Data1;

    document.getElementById(Allocation1).value = Data2;

    document.getElementById(TRSSplit1).value = Data3;

    document.getElementById(TRSAgentCommision1).value = Data4;

    document.getElementById(TRSAgentNet1).value = Data5;

    document.getElementById(TRSAgentName2).value = Data6;

    document.getElementById(Allocation2).value = Data7;

    document.getElementById(TRSSplit2).value = Data8;

    document.getElementById(TRSAgentCommision2).value = Data9;

    document.getElementById(TRSAgentNet2).value = Data10;

    document.getElementById(TRSAgentCommision3).value = Data11;

    document.getElementById(TRSAgentNet3).value = Data12;


}

function TRSPartiesPreview(

    TRSVendorName1, TRSVendorCompany1, TRSVendorAddress1, TRSVendorPhone1,

    TRSVendorName2, TRSVendorCompany2, TRSVendorAddress2, TRSVendorPhone2,

    TRSVendorName3, TRSVendorCompany3, TRSVendorAddress3, TRSVendorPhone3,

    TRSVendorName4, TRSVendorCompany4, TRSVendorAddress4, TRSVendorPhone4,

    TRSVendorLawyerName, TRSVendorLawyerCompany, TRSVendorLawyerAddress, TRSVendorLawyerPhone,

    TRSPurchaserName1, TRSPurchaserCompany1, TRSPurchaserAddress1, TRSPurchaserPhone1,

    TRSPurchaserName2, TRSPurchaserCompany2, TRSPurchaserAddress2, TRSPurchaserPhone2,

    TRSPurchaserName3, TRSPurchaserCompany3, TRSPurchaserAddress3, TRSPurchaserPhone3,

    TRSPurchaserName4, TRSPurchaserCompany4, TRSPurchaserAddress4, TRSPurchaserPhone4,

    TRSPurchaserLawyerName, TRSPurchaserLawyerCompany, TRSPurchaserLawyerAddress, TRSPurchaserLawyerPhone,

    TRSOtherBrokerageName, TRSOtherBrokerageCompany, TRSOtherBrokerageAddress, TRSOtherBrokeragePhone,

    Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10,

    Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20,

    Data21, Data22, Data23, Data24, Data25, Data26, Data27, Data28, Data29, Data30,

    Data31, Data32, Data33, Data34, Data35, Data36, Data37, Data38, Data39, Data40,

    Data41, Data42, Data43, Data44) {

    document.getElementById(TRSVendorName1).value = Data1;

    document.getElementById(TRSVendorCompany1).value = Data2;

    document.getElementById(TRSVendorAddress1).value = Data2;

    document.getElementById(TRSVendorPhone1).value = Data4;


    document.getElementById(TRSVendorName2).value = Data5;

    document.getElementById(TRSVendorCompany2).value = Data6;

    document.getElementById(TRSVendorAddress2).value = Data7;

    document.getElementById(TRSVendorPhone2).value = Data8;

    if (!TRSVendorName2 && !TRSVendorCompany2 && !TRSVendorAddress2 && !TRSVendorPhone2) {

        document.getElementById("displayVendor2").style.display = "none";

    } else {
        document.getElementById("displayVendor2").style.display = "";
    }



    document.getElementById(TRSVendorName3).value = Data9;

    document.getElementById(TRSVendorCompany3).value = Data10;

    document.getElementById(TRSVendorAddress3).value = Data11;

    document.getElementById(TRSVendorPhone3).value = Data12;

    if (!TRSVendorName3 && !TRSVendorCompany3 && !TRSVendorAddress3 && !TRSVendorPhone3) {


        document.getElementById("displayVendor3").style.display = "none";

    } else {
        document.getElementById("displayVendor3").style.display = "";
    }


    document.getElementById(TRSVendorName4).value = Data13;

    document.getElementById(TRSVendorCompany4).value = Data14;

    document.getElementById(TRSVendorAddress4).value = Data15;

    document.getElementById(TRSVendorPhone4).value = Data16;

    if (!TRSVendorName4 && !TRSVendorCompany4 && !TRSVendorAddress4 && !TRSVendorPhone4) {

        document.getElementById("displayVendor4").style.display = "none";

    } else {
        document.getElementById("displayVendor4").style.display = "";
    }

    document.getElementById(TRSVendorLawyerName).value = Data17;

    document.getElementById(TRSVendorLawyerCompany).value = Data18;

    document.getElementById(TRSVendorLawyerAddress).value = Data19;

    document.getElementById(TRSVendorLawyerPhone).value = Data20;


    if (!TRSVendorLawyerName && !TRSVendorLawyerCompany && !TRSVendorLawyerAddress && !TRSVendorLawyerPhone) {

        document.getElementById("displayVendorlawyer").style.display = "none";

    } else {
        document.getElementById("displayVendorlawyer").style.display = "";
    }


    document.getElementById(TRSPurchaserName1).value = Data21;

    document.getElementById(TRSPurchaserCompany1).value = Dat22;

    document.getElementById(TRSPurchaserAddress1).value = Data23;

    document.getElementById(TRSPurchaserPhone1).value = Data24;


    document.getElementById(TRSPurchaserName2).value = Data25;

    document.getElementById(TRSPurchaserCompany2).value = Data26;

    document.getElementById(TRSPurchaserAddress2).value = Data27;

    document.getElementById(TRSPurchaserPhone2).value = Data28;


    if (!TRSPurchaserName2 && !TRSPurchaserCompany2 && !TRSPurchaserAddress2 && !TRSPurchaserPhone2) {

        document.getElementById("DisplayPurchaser2").style.display = "none";

    } else {
        document.getElementById("DisplayPurchaser2").style.display = "";
    }


    document.getElementById(TRSPurchaserName3).value = Data29;

    document.getElementById(TRSPurchaserCompany3).value = Data30;

    document.getElementById(TRSPurchaserAddress3).value = Data31;

    document.getElementById(TRSPurchaserPhone3).value = Data32;


    if (!TRSPurchaserName3 && !TRSPurchaserCompany3 && !TRSPurchaserAddress3 && !TRSPurchaserPhone3) {

        document.getElementById("DisplayPurchaser3").style.display = "none";

    } else {
        document.getElementById("DisplayPurchaser3").style.display = "";
    }


    document.getElementById(TRSPurchaserName4).value = Data33;

    document.getElementById(TRSPurchaserCompany4).value = Data34;

    document.getElementById(TRSPurchaserAddress4).value = Data35;

    document.getElementById(TRSPurchaserPhone4).value = Data36;


    if (!TRSPurchaserName4 && !TRSPurchaserCompany4 && !TRSPurchaserAddress4 && !TRSPurchaserPhone4) {

        document.getElementById("DisplayPurchaser4").style.display = "none";

    } else {
        document.getElementById("DisplayPurchaser4").style.display = "";
    }


    document.getElementById(TRSPurchaserLawyerName).value = Data37;

    document.getElementById(TRSPurchaserLawyerCompany).value = Data38;

    document.getElementById(TRSPurchaserLawyerAddress).value = Data39;

    document.getElementById(TRSPurchaserLawyerPhone).value = Data40;


    if (!TRSPurchaserLawyerName && !TRSPurchaserLawyerCompany && !TRSPurchaserLawyerAddress && !
        TRSPurchaserLawyerPhone) {

        document.getElementById("displayPurchaserLawyer").style.display = "none";

    } else {
        document.getElementById("displayPurchaserLawyer").style.display = "";
    }


    document.getElementById(TRSOtherBrokerageName).value = Data41;

    document.getElementById(TRSOtherBrokerageCompany).value = Data42;

    document.getElementById(TRSOtherBrokerageAddress).value = Data43;

    document.getElementById(TRSOtherBrokeragePhone).value = Data44;

    if (!TRSOtherBrokerageName && !TRSOtherBrokerageCompany && !TRSOtherBrokerageAddress && !
        TRSOtherBrokeragePhone) {

        document.getElementById("OtherBrokerageDisplay").style.display = "none";

    } else {
        document.getElementById("OtherBrokerageDisplay").style.display = "";
    }
}

function TRSPreview(Property6, TransactionNumber, TRSPrice, TRSListCommissionPercent, TRSSellCommissionPercent,
    TRSStatus, TRSListingSide, TRSSource, TRSClosingDate, TRSMLS, ReceivableLabel, ReciveOrRefoundAmount,

    Unit, StreetNumber, StreetName, City, Province, PostalCode, TransactionID, Price, ListCommission,
    SellCommission, Status, ListingSide, ListingSource, ClosingDate, MLS, Label, TRSReciveOrRefoundAmount) {

    if (Unit === null || !Unit || Unit === "") {
        document.getElementById(Property6).innerHTML = StreetNumber + " " + StreetName + ", " + ", " + City + ", " +
            Province + ", " + PostalCode
    } else {
        document.getElementById(Property6).innerHTML = Unit + "-" + StreetNumber + " " + StreetName + ", " + ", " +
            City + ", " + Province + ", " + PostalCode
    }

    document.getElementById(TransactionNumber).innerHTML = TransactionID;

    document.getElementById(TRSPrice).innerHTML = Price;

    document.getElementById(TRSListCommissionPercent).innerHTML = ListCommission;

    document.getElementById(TRSSellCommissionPercent).innerHTML = SellCommission;

    document.getElementById(TRSStatus).innerHTML = Status;

    document.getElementById(TRSListingSide).innerHTML = ListingSide;

    document.getElementById(TRSSource).innerHTML = ListingSource;

    document.getElementById(TRSClosingDate).innerHTML = ClosingDate;

    document.getElementById(TRSMLS).innerHTML = MLS;

    document.getElementById(ReceivableLabel).value = Label;

    document.getElementById(ReciveOrRefoundAmount).innerHTML = TRSReciveOrRefoundAmount;

}

function InvoicePreview(Type, RecieverFullName, RecieverAddress1, RecieverAddress2, Property, InvoiceVendors,
    InvoicePuchasers, InvoiceClosingDate, InvoicePrice, InvoiceCommission, InvoiceTaxAmount, InvoiceTotal,
    InvoiceDeposits, InvoiceRemaingBalance, BalanceDueAmountRemain, StatementReturnMessage, InvoiceBank,
    InvoiceTransit, InvoiceAccount, InvoiceBroker, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15,
    d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, d32, d33, d34, d35, d36, d37,
    d38, d39, d40) {


    document.getElementById(Type).innerHTML = d1;


    document.getElementById(RecieverFullName).innerHTML = d2;

    document.getElementById(RecieverAddress1).innerHTML = d3 + " - " + d4 + " " + d5 + " " + d6;

    document.getElementById(RecieverAddress2).innerHTML = d7 + " " + d8 + " " + d9;


    document.getElementById("InvoiceAddress").innerHTML = d10 + "- " + d11 + " " + d12 + " " + d13 + " " + d14 +
        " " + d15 + " " + d16;


    document.getElementById(InvoiceVendors).innerHTML = d17 + " , " + d18 + " , " + d19 + " , " + d20;

    document.getElementById(InvoicePuchasers).innerHTML = d21 + " , " + d22 + " , " + d23 + " , " + d24;

    document.getElementById(InvoiceClosingDate).innerHTML = d25;

    document.getElementById(InvoicePrice).value = d26;

    document.getElementById(InvoiceCommission).value = d27;

    document.getElementById(InvoiceTaxAmount).value = d28;

    document.getElementById(InvoiceTotal).value = d29;

    document.getElementById(InvoiceDeposits).value = d30;

    document.getElementById(InvoiceRemaingBalance).value = d31;

    document.getElementById(BalanceDueAmountRemain).innerHTML = d32;

    document.getElementById(StatementReturnMessage).innerHTML = "is owning to the vendor(s) on closing.";

    document.getElementById(InvoiceBank).value = d33;

    document.getElementById(InvoiceTransit).value = d34;

    document.getElementById(InvoiceAccount).value = d35;

    document.getElementById(InvoiceBroker).innerHTML = d36;

}


function GetNotes(id1, id2) {
    document.getElementById(id2).value = document.getElementById(id1).value;
}


function TRSExpenses(hst, referralfee, rebatefee, SellCommission, AgentCommission1, AgentCommission2, TotalPurIncome, IncomeHST, TotalIncome, refPerc1, refPerc2, reb1, reb2, brokerName, AgentName, name1, name2, name3, name4, refAgentName) {

    var HST = hst;

    var ReferralFee = parseFloat(referralfee);

    var ReferralFeeHST = (ReferralFee * HST) / 100;

    var ReferralFeeTotalExpenses = ReferralFee + ReferralFeeHST;

    //Getting the Rebates Amounts

    var RebateFee1 = rebatefee[0];
    var RebateFee2 = rebatefee[1];
    var RebateFee3 = rebatefee[2];
    var RebateFee4 = rebatefee[3];
    var TotalRebate = rebatefee[0] + rebatefee[1] + rebatefee[2] + rebatefee[3];

    //-------------------------------------------------------------------------------------------------------------------

    var ReferralAgentPercentage1 = parseFloat(refPerc1);
    var ReferralAgentPercentage2 = parseFloat(refPerc2);

    //Calculating each agents amount of referral fee
    var AgentReferralamount1 = (ReferralFee * ReferralAgentPercentage1) / 100;
    var AgentReferralamount2 = (ReferralFee * ReferralAgentPercentage2) / 100;
    //-----------------------------------------------------------------------------------------------------------
    var RebateAgentPercentage1 = parseFloat(reb1);
    var RebateAgentPercentage2 = parseFloat(reb2);
    //Calculating each agents amount of rebate fee
    var AgentRebateamount1 = (TotalRebate * RebateAgentPercentage1) / 100;
    var AgentRebateamount2 = (TotalRebate * RebateAgentPercentage2) / 100;
    //Here are the calculations of the Cooperating Brokerage expenses 
    var Brokeragecomiision = SellCommission;
    var BrokeragecomiisionHST = (SellCommission * HST) / 100;
    var BrokerageTotalExpenses = Brokeragecomiision + BrokeragecomiisionHST;
    //-------------------------------------------------------------------------------------------------------------------
    var AgentExpenses1 = AgentCommission1 - (AgentRebateamount1 + AgentReferralamount1);
    var AgentExpensesHST1 = (AgentExpenses1 * HST) / 100;
    var AgentExpensesTotal1 = AgentExpenses1 + AgentExpensesHST1;
    var AgentExpenses2 = AgentCommission2 - (AgentRebateamount2 + AgentReferralamount2);
    var AgentExpensesHST2 = (AgentExpenses2 * HST) / 100;
    var AgentExpensesTotal2 = AgentExpenses2 + AgentExpensesHST2;
    //-------------------------------------------------------------------------------------------------------------------

    document.getElementById("Co-operatingBrokerageExpensesName").innerHTML = brokerName;
    document.getElementById("Co-operatingBrokerageExpensesNet").innerHTML = parseFloat(Brokeragecomiision).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("Co-operatingBrokerageExpensesHST").innerHTML = parseFloat(BrokeragecomiisionHST).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("Co-operatingBrokerageExpensesTotalAmount").innerHTML = parseFloat(BrokerageTotalExpenses).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    if (ReferralFee === 0 || ReferralFee === null || ReferralFee === " " || !ReferralFee) {
        document.getElementById("ExpensesReferral").style.display = "none";
    } else {
        document.getElementById("ExpensesReferral").style.display = "";
        document.getElementById("ExpensesReferralAgentName").innerHTML = refAgentName;
        document.getElementById("ExpensesReferralAgentNet").innerHTML = parseFloat(ReferralFee).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
        document.getElementById("ExpensesReferralAgentHST").innerHTML = parseFloat(ReferralFeeHST).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
        document.getElementById("ExpensesReferralAgentTotalAmount").innerHTML = parseFloat(ReferralFeeTotalExpenses).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
    }

    document.getElementById("CustomerName1").innerHTML = name1;
    document.getElementById("CustomerNet1").innerHTML = parseFloat(RebateFee1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("CustomerHST1").innerHTML = "0.00";
    document.getElementById("CustomerTotalAmount1").innerHTML = parseFloat(RebateFee1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerName2").innerHTML = name2;
    document.getElementById("CustomerNet2").innerHTML = parseFloat(RebateFee2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("CustomerHST2").innerHTML = "0.00";
    document.getElementById("CustomerTotalAmount2").innerHTML = parseFloat(RebateFee2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerName3").innerHTML = name3;
    document.getElementById("CustomerNet3").innerHTML = parseFloat(RebateFee3).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("CustomerHST3").innerHTML = "0.00";
    document.getElementById("CustomerTotalAmount3").innerHTML = parseFloat(RebateFee3).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("CustomerName4").innerHTML = name4;
    document.getElementById("CustomerNet4").innerHTML = parseFloat(RebateFee4).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("CustomerHST4").innerHTML = "0.00";
    document.getElementById("CustomerTotalAmount4").innerHTML = parseFloat(RebateFee4).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("AgentExpenses1").innerHTML = AgentName;
    document.getElementById("AgentExpensesNet1").innerHTML = parseFloat(AgentExpenses1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    })
    document.getElementById("AgentExpensesHST1").innerHTML = parseFloat(AgentExpensesHST1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("AgentExpensesTotalAmount1").innerHTML = parseFloat(AgentExpensesTotal1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    // if (document.getElementById("AddNewAgent").style.display === "block") {
    if (0) {
        // document.getElementById("ExpensesAgent2").style.display = "";
        // document.getElementById("AgentExpenses2").value = document.getElementById("SecondAgentID").value;
        // document.getElementById("AgentExpensesNet2").value = parseFloat(AgentExpenses2).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2});
        // document.getElementById("AgentExpensesHST2").value = parseFloat(AgentExpensesHST2).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});
        // document.getElementById("AgentExpensesTotalAmount2").value = parseFloat(AgentExpensesTotal2).toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});
    } else {
        document.getElementById("ExpensesAgent2").style.display = "none";
        AgentExpenses2 = 0;
        AgentExpensesHST2 = 0;
        AgentExpensesTotal2 = 0;
    }

    document.getElementById("TotalExpensesPurAmounts").innerHTML = parseFloat(AgentExpenses2 + AgentExpenses1 + RebateFee4 + RebateFee3 + RebateFee2 + RebateFee1 + Brokeragecomiision + ReferralFee).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("HSTExpensesAmounts").innerHTML = parseFloat(AgentExpensesHST2 + AgentExpensesHST1 + BrokeragecomiisionHST + ReferralFeeHST).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TotalExpensesAmount").innerHTML = parseFloat(AgentExpensesTotal2 + AgentExpensesTotal1 + TotalRebate + ReferralFeeTotalExpenses + BrokerageTotalExpenses).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    var TotalPurExpenses = AgentExpenses2 + AgentExpenses1 + RebateFee4 + RebateFee3 + RebateFee2 + RebateFee1 + Brokeragecomiision + ReferralFee;

    var TotalHSTExpenses = AgentExpensesHST2 + AgentExpensesHST1 + BrokeragecomiisionHST + ReferralFeeHST;

    var TotalExpensesAmount = AgentExpensesTotal2 + AgentExpensesTotal1 + TotalRebate + ReferralFeeTotalExpenses + BrokerageTotalExpenses;

    //alert("section13");
    document.getElementById("TotalNetToBrokeragePurAmounts").innerHTML = parseFloat(TotalPurIncome - TotalPurExpenses).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("HSTNetToBrokerageAmounts").innerHTML = parseFloat(IncomeHST - TotalHSTExpenses).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TotalNetToBrokerageAmount").innerHTML = parseFloat(TotalIncome - TotalExpensesAmount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    //alert("finish Expenses Calculations");
}

function ListingTypeTRS(type) {

    if (((type === 'Landlord-Side') || (type === 'Tenant-Side') || (type === 'Lease-DoubleSided') || (type === 'TenantSide-Self-Represented-Landlord'))) {
        document.getElementById('VendorLandlord1').value = 'Landlord';
        document.getElementById('VendorLandlord2').value = 'Landlord';
        document.getElementById('VendorLandlord3').value = 'Landlord';
        document.getElementById('VendorLandlord4').value = 'Landlord';
        document.getElementById('PurchaserTenant1').value = 'Tenant';
        document.getElementById('PurchaserTenant2').value = 'Tenant';
        document.getElementById('PurchaserTenant3').value = 'Tenant';
        document.getElementById('PurchaserTenant4').value = 'Tenant';
    } else {
        document.getElementById('VendorLandlord1').value = 'Vendor';
        document.getElementById('VendorLandlord2').value = 'Vendor';
        document.getElementById('VendorLandlord3').value = 'Vendor';
        document.getElementById('VendorLandlord4').value = 'Vendor';
        document.getElementById('PurchaserTenant1').value = 'Purchaser';
        document.getElementById('PurchaserTenant2').value = 'Purchaser';
        document.getElementById('PurchaserTenant3').value = 'Purchaser';
        document.getElementById('PurchaserTenant4').value = 'Purchaser';
    }

}

function fillOtherSheet(id, propertyAddress, completionDate, appraisalSource, AppraisalFee, clients, owners, HSTPercent, officeAllocationPercent, firstagentPercent, secondagentPercent, agent1name) {
    document.getElementById('PropertyPreview').innerHTML = propertyAddress;
    document.getElementById('dealID').innerHTML = id;
    document.getElementById('dealID').style.background = '#054d6a';
    document.getElementById('dealID').style.color = 'white';

    document.getElementById("RecordsheetReportDatePreview").innerHTML = completionDate;

    document.getElementById("RecordsheetSourcePreview").innerHTML = appraisalSource;

    document.getElementById("RecordsheetAppraisalfeePreview").innerHTML = "$  " + parseFloat(AppraisalFee).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    PartiesForRecordSheet("RecordSheetClientName1", "RecordSheetClientCompany1", "RecordSheetClientAddress1", "RecordSheetClientPhone1", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("RecordSheetOwnerName1", "RecordSheetOwnerCompany1", "RecordSheetOwnerAddress1", "RecordSheetOwnerPhone1", "Corporation", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");

    if (clients.length > 1) {
        document.getElementById("DisplayClient2").style.display = "";
        PartiesForRecordSheet("RecordSheetClientName2", "RecordSheetClientCompany2", "RecordSheetClientAddress2", "RecordSheetClientPhone2", "Corporation", "123", "Michael street", "2211", "Other", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "Vancouver");
    } else {
        document.getElementById("DisplayClient2").style.display = "none";
    }

    if (owners.length > 1) {
        document.getElementById("DisplayOwner2").style.display = "";
        PartiesForRecordSheet("RecordSheetOwnerName2", "RecordSheetOwnerCompany2", "RecordSheetOwnerAddress2", "RecordSheetOwnerPhone2", "Corporation", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    } else {
        document.getElementById("DisplayOwner2").style.display = "none";
    }

    var GrossFee = parseFloat(AppraisalFee);
    var HST = parseFloat(HSTPercent);
    var GrossFeeHST = (GrossFee * HST) / 100;
    var GrossFeeTotal = GrossFeeHST + GrossFee;
    var AgentSplit1;
    var AgentSplit2;
    var Source = appraisalSource;
    var office = parseFloat(officeAllocationPercent);

    if (Source === "Agent-lead") {
        var AgentSplit1 = 80;
        var AgentSplit2 = 80;
    } else {
        AgentSplit1 = 100 - office;
        AgentSplit2 = 100 - office;
    }

    var FisrtAgentPercentage = parseFloat(firstagentPercent);
    var SecondAgentPercentage = parseFloat(secondagentPercent);
    var FirstAgentCommission = (GrossFee * FisrtAgentPercentage) / 100;
    var SecondAgentCommission = (GrossFee * SecondAgentPercentage) / 100;
    var FirstAgentNet = (FirstAgentCommission * AgentSplit1) / 100;
    var SecondAgentNet = (SecondAgentCommission * AgentSplit2) / 100;
    var FirstAgentNetHST = (FirstAgentNet * HST) / 100;
    var SecondAgentNetHST = (SecondAgentNet * HST) / 100;
    var FirstAgentNetTotal = FirstAgentNetHST + FirstAgentNet;
    var SecondAgentNetTotal = SecondAgentNetHST + SecondAgentNet;

    document.getElementById("BreakdownGrossFeeAmount").innerHTML = parseFloat(GrossFee).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("BreakdownGrossFeeAmountHST").innerHTML = parseFloat(GrossFeeHST).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("BreakdownGrossFeeTotal").innerHTML = parseFloat(GrossFeeTotal).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownAgent1Name").innerHTML = agent1name;
    document.getElementById("BreakdownAgent1Split").innerHTML = parseFloat(AgentSplit1).toFixed(2) + "%";
    document.getElementById("BreakdownAgent1Amount").innerHTML = parseFloat(FirstAgentNet).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownAgent1HST").innerHTML = parseFloat(FirstAgentNetHST).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownAgent1Total").innerHTML = parseFloat(FirstAgentNetTotal).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    // if (document.getElementById("AddSecondAgentCheckBox").checked === false) {

    //     document.getElementById("DisplayBreakdownAgent2").style.display = "none";

    // } else {

    //     document.getElementById("DisplayBreakdownAgent2").style.display = "";

    //     document.getElementById("BreakdownAgent2Name").value = document.getElementById("SecondAgentID").value;

    //     document.getElementById("BreakdownAgent2Split").value = parseFloat(AgentSplit2).toFixed(2) + "%";

    //     document.getElementById("BreakdownAgent2Amount").value = parseFloat(SecondAgentNet).toLocaleString(undefined, {
    //     minimumFractionDigits: 2, maximumFractionDigits: 2
    //     });

    //     document.getElementById("BreakdownAgent2HST").value = parseFloat(SecondAgentNetHST).toLocaleString(undefined, {
    //     minimumFractionDigits: 2, maximumFractionDigits: 2
    //     });

    //     document.getElementById("BreakdownAgent2Total").value = parseFloat(SecondAgentNetTotal).toLocaleString(undefined, {
    //     minimumFractionDigits: 2, maximumFractionDigits: 2
    //     });
    // } //Close else

    var TotalPurNet = SecondAgentNet + FirstAgentNet;
    var TotalHST = SecondAgentNetHST + FirstAgentNetHST;
    var Total = FirstAgentNetTotal + SecondAgentNetTotal;

    var PurBrokerNetAmount = GrossFee - TotalPurNet;
    var BrokerHST = GrossFeeHST - TotalHST;
    var TotalBrokerFee = GrossFeeTotal - Total;

    document.getElementById("BreakdownNetFee").innerHTML = parseFloat(PurBrokerNetAmount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownNetHST").innerHTML = parseFloat(BrokerHST).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownNetTotal").innerHTML = parseFloat(TotalBrokerFee).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

}


function fillReferralSheet(id, completionDate, appraisalSource, AppraisalFee, clients, owners, HSTPercent, officeAllocationPercent, firstagentPercent, secondagentPercent, agent1name) {

    document.getElementById('dealID').innerHTML = id;
    document.getElementById('dealID').style.background = '#054d6a';
    document.getElementById('dealID').style.color = 'white';

    document.getElementById("ReferralFeeRecordSheetDatePreview").innerHTML = completionDate;

    document.getElementById("ReferralFeeRecordSheetSourcePreview").innerHTML = appraisalSource;

    document.getElementById("ReferralFeeRecordSheetfeePreview").innerHTML = "$  " + parseFloat(AppraisalFee).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    PartiesForRecordSheet("RecordSheetClientName1", "RecordSheetClientCompany1", "RecordSheetClientAddress1", "RecordSheetClientPhone1", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("RecordSheetReferralSourceName1", "RecordSheetReferralSourceCompany1", "RecordSheetReferralSourceAddress1", "RecordSheetReferralSourcePhone1", "Corporation", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");

    if (clients.length > 1) {
        document.getElementById("DisplayClient2").style.display = "";
        PartiesForRecordSheet("RecordSheetClientName2", "RecordSheetClientCompany2", "RecordSheetClientAddress2", "RecordSheetClientPhone2", "Corporation", "123", "Michael street", "2211", "Other", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "Vancouver");
    } else {
        document.getElementById("DisplayClient2").style.display = "none";
    }

    // if (owners.length > 1) {
    //     document.getElementById("DisplayOwner2").style.display = "";
    //     PartiesForRecordSheet("RecordSheetOwnerName2", "RecordSheetOwnerCompany2", "RecordSheetOwnerAddress2", "RecordSheetOwnerPhone2", "Corporation", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich","");
    // } else {
    //     document.getElementById("DisplayOwner2").style.display = "none";
    // }

    var GrossFee = parseFloat(AppraisalFee);
    var HST = parseFloat(HSTPercent);
    var GrossFeeHST = (GrossFee * HST) / 100;
    var GrossFeeTotal = GrossFeeHST + GrossFee;
    var AgentSplit1;
    var AgentSplit2;
    var Source = appraisalSource;
    var office = parseFloat(officeAllocationPercent);

    if (Source === "Agent-lead") {
        var AgentSplit1 = 80;
        var AgentSplit2 = 80;
    } else {
        AgentSplit1 = 100 - office;
        AgentSplit2 = 100 - office;
    }

    var FisrtAgentPercentage = parseFloat(firstagentPercent);
    var SecondAgentPercentage = parseFloat(secondagentPercent);
    var FirstAgentCommission = (GrossFee * FisrtAgentPercentage) / 100;
    var SecondAgentCommission = (GrossFee * SecondAgentPercentage) / 100;
    var FirstAgentNet = (FirstAgentCommission * AgentSplit1) / 100;
    var SecondAgentNet = (SecondAgentCommission * AgentSplit2) / 100;
    var FirstAgentNetHST = (FirstAgentNet * HST) / 100;
    var SecondAgentNetHST = (SecondAgentNet * HST) / 100;
    var FirstAgentNetTotal = FirstAgentNetHST + FirstAgentNet;
    var SecondAgentNetTotal = SecondAgentNetHST + SecondAgentNet;

    document.getElementById("BreakdownGrossFeeAmount").innerHTML = parseFloat(GrossFee).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("BreakdownGrossFeeAmountHST").innerHTML = parseFloat(GrossFeeHST).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("BreakdownGrossFeeTotal").innerHTML = parseFloat(GrossFeeTotal).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownAgent1Name").innerHTML = agent1name;
    document.getElementById("BreakdownAgent1Split").innerHTML = parseFloat(AgentSplit1).toFixed(2) + "%";
    document.getElementById("BreakdownAgent1Amount").innerHTML = parseFloat(FirstAgentNet).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownAgent1HST").innerHTML = parseFloat(FirstAgentNetHST).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownAgent1Total").innerHTML = parseFloat(FirstAgentNetTotal).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    // if (document.getElementById("AddSecondAgentCheckBox").checked === false) {

    //     document.getElementById("DisplayBreakdownAgent2").style.display = "none";

    // } else {

    //     document.getElementById("DisplayBreakdownAgent2").style.display = "";

    //     document.getElementById("BreakdownAgent2Name").value = document.getElementById("SecondAgentID").value;

    //     document.getElementById("BreakdownAgent2Split").value = parseFloat(AgentSplit2).toFixed(2) + "%";

    //     document.getElementById("BreakdownAgent2Amount").value = parseFloat(SecondAgentNet).toLocaleString(undefined, {
    //     minimumFractionDigits: 2, maximumFractionDigits: 2
    //     });

    //     document.getElementById("BreakdownAgent2HST").value = parseFloat(SecondAgentNetHST).toLocaleString(undefined, {
    //     minimumFractionDigits: 2, maximumFractionDigits: 2
    //     });

    //     document.getElementById("BreakdownAgent2Total").value = parseFloat(SecondAgentNetTotal).toLocaleString(undefined, {
    //     minimumFractionDigits: 2, maximumFractionDigits: 2
    //     });
    // } //Close else

    var TotalPurNet = SecondAgentNet + FirstAgentNet;
    var TotalHST = SecondAgentNetHST + FirstAgentNetHST;
    var Total = FirstAgentNetTotal + SecondAgentNetTotal;

    var PurBrokerNetAmount = GrossFee - TotalPurNet;
    var BrokerHST = GrossFeeHST - TotalHST;
    var TotalBrokerFee = GrossFeeTotal - Total;

    document.getElementById("BreakdownNetFee").innerHTML = parseFloat(PurBrokerNetAmount).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownNetHST").innerHTML = parseFloat(BrokerHST).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("BreakdownNetTotal").innerHTML = parseFloat(TotalBrokerFee).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

}

function PartiesForRecordSheet(Nameid, Companyid, Addressid, PhoneNumberid, Type, Unit, StreetName, StreetNumber, Province, City, PostalCode, Phone, Officer, BusinessName, FirstName, LastName, OtherProvince) {

    if (Type == "Individual") {
        document.getElementById(Nameid).innerHTML = FirstName + " " + LastName;
    } else {
        document.getElementById(Nameid).innerHTML = Officer;
    }

    document.getElementById(Companyid).innerHTML = BusinessName;

    if (Province == "Other") {
        if (Unit) {
            var date2 = Unit + " - " + StreetNumber + " " + StreetName + ", " + City + ", " + OtherProvince + ', ' + PostalCode;
        } else {
            var date2 = StreetNumber + " " + StreetName + ", " + City + ", " + OtherProvince + ', ' + PostalCode;
        }
    } else {
        if (Unit) {
            var date2 = Unit + " - " + StreetNumber + " " + StreetName + ", " + City + ", " + Province + ", " + PostalCode;
        } else {
            var date2 = StreetNumber + " " + StreetName + ", " + City + ", " + Province + ", " + PostalCode;
        }
    }

    document.getElementById(Addressid).innerHTML = date2;

    document.getElementById(PhoneNumberid).innerHTML = Phone;
}



function checkProvinceTax(Province, Price) {

    var taxHST = 0;

    if (Province === "AB" || Province === "BC" || Province === "MB" || Province === "NWT" || Province === "NU" || Province === "QC" || Province === "SK" || Province === "YT") {
        taxHST = parseFloat(5.00 * Price / 100);
    } else if (Province === "ON") {
        taxHST = parseFloat(13.00 * Price / 100);
    } else if (Province === "PE" || Province === "NC" || Province === "NB" || Province === "NL") {
        taxHST = parseFloat(15.00 * Price / 100)
    } else if (Province === "Other") {
        taxHST = parseFloat(0)
    }

    return taxHST;
}

function fillAppraisalInvoice(id, Price, Province, name, address1, address2, propertyAddress, closingdate, dealDate, bank, transit, account, brokername, businessname, companyphone, companyemail, companyaddress1, companyaddress2) {
    // document.getElementById('MainTitle').innerHTML = propertyAddress;

    document.getElementById('invoiceDealID').innerHTML = id;
    document.getElementById('PropertyFeeInvoice').innerHTML = parseFloat(Price).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById('PropertyHSTInvoice').innerHTML = checkProvinceTax(Province, Price).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById('BalanceInvoice').innerHTML = parseFloat(+Price + +checkProvinceTax(Province, Price)).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById('invoiceClientAddress').innerHTML = address1;
    document.getElementById('invoiceClientAddressTwo').innerHTML = address2;
    document.getElementById('invoicePropertyAddress').innerHTML = propertyAddress;
    document.getElementById('InvoiceReciverName').innerHTML = name;
    document.getElementById('InvoicePropertyReportDate').innerHTML = closingdate;
    document.getElementById('InvoiceCuttentDate').innerHTML = dealDate;
    document.getElementById('invoiceBankName').innerHTML = bank;
    document.getElementById('invoiceTransitName').innerHTML = transit;
    document.getElementById('invoiceAccountNumber').innerHTML = account;

    document.getElementById('InvoiceBroker').innerHTML = brokername;
    document.getElementById('invoiceBusinessName').innerHTML = businessname;
    document.getElementById('BusinessNameMail').innerHTML = businessname;
    document.getElementById('invoicePhone').innerHTML = companyphone;
    document.getElementById('invoiceEmail').innerHTML = companyemail;
    document.getElementById('invoiceEmail').href = 'mailto:' + companyemail;

    document.getElementById('invoiceAddress1').innerHTML = companyaddress1;
    document.getElementById('invoiceAddress2').innerHTML = companyaddress2;

}

function fillReferralInvoice(id, Price, Province, name, address1, address2, propertyAddress, closingdate, dealDate, receiver, bank, transit, account, brokername, businessname, companyphone, companyemail, companyaddress1, companyaddress2, HSTNumber, dealType) {
    document.getElementById('invoiceDealID').innerHTML = id;
    document.getElementById('PropertyFeeInvoice').innerHTML = parseFloat(Price).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById('PropertyHSTInvoice').innerHTML = checkProvinceTax(Province, Price).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });;
    document.getElementById('HSTNumberInv').innerHTML = 'HST (' + HSTNumber + ')';
    document.getElementById('BalanceInvoice').innerHTML = parseFloat(+Price + +checkProvinceTax(Province, Price)).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });;

    document.getElementById('addressFirst').innerHTML = address1;
    document.getElementById('addressSecond').innerHTML = address2;
    document.getElementById('InvoiceReciverName').innerHTML = name;
    // document.getElementById('InvoiceReferralType').innerHTML = dealDate;

    document.getElementById('InvoicePropertyReportDate').innerHTML = closingdate;
    document.getElementById('InvoiceReciverNameBusiness').innerHTML = receiver;
    document.getElementById('InvoiceReferralType').innerHTML = dealType;
    // document.getElementById('InvoiceClients').innerHTML = dealType;

    document.getElementById('InvoiceBank').innerHTML = bank;
    document.getElementById('InvoiceTransit').innerHTML = transit;
    document.getElementById('InvoiceAccount').innerHTML = account;

    document.getElementById('InvoiceBroker').innerHTML = brokername;
    document.getElementById('invoiceBusinessName').innerHTML = businessname;
    document.getElementById('BusinessNameMail').innerHTML = businessname;
    document.getElementById('invoicePhone').innerHTML = companyphone;
    document.getElementById('invoiceEmail').innerHTML = companyemail;
    document.getElementById('invoiceEmail').href = 'mailto:' + companyemail;
    document.getElementById('invoiceAddress1').innerHTML = companyaddress1;
    document.getElementById('invoiceAddress2').innerHTML = companyaddress2;

}

function fillTrsInvoice(id, Price, Commission, Deposits, Province, name, address1, address2, propertyAddress, vendors, purcharers, closingdate, dealDate, bank, transit, account, brokername, businessname, companyphone, companyemail, companyaddress1, companyaddress2, HSTNumber) {
    // document.getElementById('MainTitle').innerHTML = propertyAddress;

    document.getElementById('invoiceDealID').innerHTML = id;
    document.getElementById('InvoicePrice').innerHTML = parseFloat(Price).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById('InvoiceCommission').innerHTML = parseFloat(Commission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById('InvoiceTaxAmount').innerHTML = checkProvinceTax(Province, Commission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById('InvoiceTotal').innerHTML = parseFloat(Commission + checkProvinceTax(Province, Price)).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById('InvoiceDeposits').innerHTML = parseFloat(Deposits).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById('InvoiceRemaingBalance').innerHTML = parseFloat(Commission + checkProvinceTax(Province, Price) - +Deposits).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });;
    document.getElementById('HSTNumberInv').innerHTML = 'HST (' + HSTNumber + ')';

    document.getElementById('RecieverAddress').innerHTML = address1;
    document.getElementById('RecieverAddressTwo').innerHTML = address2;
    document.getElementById('Property7').innerHTML = propertyAddress;
    document.getElementById('RecieverFullName').innerHTML = name;
    document.getElementById('InvoiceClosingDate').innerHTML = closingdate;
    document.getElementById('Date').innerHTML = dealDate;

    document.getElementById('InvoiceVendors').innerHTML = vendors;
    document.getElementById('InvoicePuchasers').innerHTML = purcharers;

    document.getElementById('InvoiceBank').innerHTML = bank;
    document.getElementById('InvoiceTransit').innerHTML = transit;
    document.getElementById('InvoiceAccount').innerHTML = account;

    document.getElementById('InvoiceBroker').innerHTML = brokername;
    document.getElementById('invoiceBusinessName').innerHTML = businessname;
    document.getElementById('BusinessNameMail').innerHTML = businessname;
    document.getElementById('invoicePhone').innerHTML = companyphone;
    document.getElementById('invoiceEmail').innerHTML = companyemail;
    document.getElementById('invoiceEmail').href = 'mailto:' + companyemail;
    document.getElementById('invoiceAddress1').innerHTML = companyaddress1;
    document.getElementById('invoiceAddress2').innerHTML = companyaddress2;

}

function fillTRSSheet(id, propertyAddress, HSTPercent, completionDate, price, listingCom, sellingCom, SellingComFixed, ListingComFixed, status, source, mls, listingTypeTRS, officeLeadPerc, SellingOfficeLeadPerc, ListingOfficeLeadPerc, Agentcomm1, Agentcomm2, Agent1Name, Agent2Name, VendorLawyerName, PurchaserLawyerName, clientType, client1Name, client1Bname, brokerName, deposits, referralfeeAmt, rebateFeeAmt) {
    document.getElementById('PropertyPreview').innerHTML = propertyAddress;
    document.getElementById('dealID').innerHTML = id;
    document.getElementById('dealID').style.background = '#054d6a';
    document.getElementById('dealID').style.color = 'white';

    var HST = parseFloat(HSTPercent);

    document.getElementById("TRSPricePreview").innerHTML = '$' + parseFloat(price).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("TRSListCommissionPercentPreview").innerHTML = parseFloat(listingCom).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
    document.getElementById("TRSSellCommissionPercentPreview").innerHTML = parseFloat(sellingCom).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSStatusPreview").innerHTML = status;
    document.getElementById("TRSListingSidePreview").innerHTML = listingTypeTRS;
    document.getElementById("TRSSourcePreview").innerHTML = source.replace('-', ' ');

    document.getElementById("TRSClosingDatePreview").innerHTML = completionDate;
    document.getElementById("TRSMLSPreview").innerHTML = mls;

    PartiesForRecordSheet("TRSVendorName1", "TRSVendorCompany1", "TRSVendorAddress1", "TRSVendorPhone1", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSVendorName2", "TRSVendorCompany2", "TRSVendorAddress2", "TRSVendorPhone2", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSVendorName3", "TRSVendorCompany3", "TRSVendorAddress3", "TRSVendorPhone3", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSVendorName4", "TRSVendorCompany4", "TRSVendorAddress4", "TRSVendorPhone4", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSVendorLawyerName", "TRSVendorLawyerCompany", "TRSVendorLawyerAddress", "TRSVendorLawyerPhone", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSPurchaserName1", "TRSPurchaserCompany1", "TRSPurchaserAddress1", "TRSPurchaserPhone1", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSPurchaserName2", "TRSPurchaserCompany2", "TRSPurchaserAddress2", "TRSPurchaserPhone2", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSPurchaserName3", "TRSPurchaserCompany3", "TRSPurchaserAddress3", "TRSPurchaserPhone4", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSPurchaserName4", "TRSPurchaserCompany4", "TRSPurchaserAddress4", "TRSPurchaserPhone4", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSPurchaserLawyerName", "TRSPurchaserLawyerCompany", "TRSPurchaserLawyerAddress", "TRSPurchaserLawyerPhone", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");
    PartiesForRecordSheet("TRSOtherBrokerageName", "TRSOtherBrokerageCompany", "TRSOtherBrokerageAddress", "TRSOtherBrokeragePhone", "Individual", "123", "Michael street", "2211", "ON", "Toronto", "A1A 1A1", "(647) 444 3322", "Officer Officerovich", "OOO Big Corporation", "Client", "Clientovich", "");

    // GetPartiesForTRS();

    // alignDeposits('DepositsName1','DepositsName2','DepositsName3','DepositsName4');

    //Getting the values that user has entered to calculate the TRS values

    var Price = parseFloat(price);
    var ListingPercentage = parseFloat(listingCom);
    var SellingPercentage = parseFloat(sellingCom);

    var officeLeadPercentage = parseFloat(officeLeadPerc);
    var SellingOfficeLeadPercentage = parseFloat(SellingOfficeLeadPerc);
    var ListingOfficeLeadPercentage = parseFloat(ListingOfficeLeadPerc);
    var AgentcommissionPercentage1 = parseFloat(Agentcomm1);
    var AgentcommissionPercentage2 = parseFloat(Agentcomm2);

    //The following variables contain amounts regarding commission (Selling and Listing  commission and their HST amounts)

    var ListingCommission;
    var HSTListingCommission;
    var TotalListingCommission;
    var SellingCommission;
    var HSTSellingCommission;
    var TotalSellingCommission;
    var TotalCommissions;
    var CooperatingExpenses = 0;

    //Here are the variables to store each agent commission based various condition we have 	
    var AgentCommissionAmount1 = 0;
    var AgentCommissionAmount2 = 0;
    //All of the conditions that Affects the sell and list commissions are the type of property listing and its source which we 
    // are checking here
    var Source = source;
    var listingType = listingTypeTRS;

    //in this if we check if it its agents own or office lead
    //Also the type of property listing will cause various commission amount which has been check one by one	

    if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {
        ListingCommission = 0;
        HSTListingCommission = 0;
    } else {
        if (ListingComFixed) {
            ListingCommission = ListingPercentage;
            HSTListingCommission = (ListingCommission * HST) / 100;
        } else {
            ListingCommission = (Price * ListingPercentage) / 100;
            HSTListingCommission = (ListingCommission * HST) / 100;
        }
    }

    if (SellingComFixed) {
        SellingCommission = SellingPercentage;
        HSTSellingCommission = (SellingCommission * HST) / 100;
    } else {
        SellingCommission = (Price * SellingPercentage) / 100;
        HSTSellingCommission = (SellingCommission * HST) / 100;
    }

    TotalListingCommission = ListingCommission + HSTListingCommission;
    TotalSellingCommission = SellingCommission + HSTSellingCommission;
    console.log(TotalSellingCommission)

    //**********************************************************************************************************************************************************************************

    //Here we are calculating each agent's commissions based on the listing and selling amounts we calculated above
    if (listingType === "Listing-Side" || listingType === "Landlord-Side") {
        AgentCommissionAmount1 = (ListingCommission * AgentcommissionPercentage1) / 100;
        AgentCommissionAmount2 = (ListingCommission * AgentcommissionPercentage2) / 100;
    } //close  if
    else if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {
        AgentCommissionAmount1 = (SellingCommission * AgentcommissionPercentage1) / 100;
        AgentCommissionAmount2 = (SellingCommission * AgentcommissionPercentage2) / 100;
    } //Close else if 
    else {
        AgentCommissionAmount1 = 0;
        // if (document.getElementById('AddAgent').checked === false) {
        //     AgentCommissionAmount1 = SellingCommission + ListingCommission;
        //     AgentCommissionAmount2 = 0;
        // } 
        // else {
        //     if (document.getElementById('SecondAgentIDRole').value === "Selling Agent") {
        //         AgentCommissionAmount1 = ListingCommission;
        //         AgentCommissionAmount2 = SellingCommission;
        //     } 
        //     else {
        //         AgentCommissionAmount1 = SellingCommission;
        //         AgentCommissionAmount2 = ListingCommission;
        //     } 

        // } 

    }

    //Setting up the amounts for the agent table in the TRS	
    document.getElementById("TRSAgentName1").innerHTML = Agent1Name;

    document.getElementById("TRSAgentCommision1").innerHTML = parseFloat(AgentCommissionAmount1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });;

    var AgentSplit1 = 0;
    var AgentSplit2 = 0;

    // if (document.getElementById('AddAgent').checked === false) {
    if (1) {

        document.getElementById("Agent2Details").style.display = "none";
        document.getElementById("AgentsAllocationHeader").style.display = "none";
        document.getElementById("AgentAllocationRow1").style.display = "none";
        document.getElementById("AgentAllocationRow2").style.display = "none";
        document.getElementById("AgentAllocationRowTotal").style.display = "none";

        document.getElementById("Allocation1").innerHTML = parseFloat(AgentcommissionPercentage1).toFixed(2) + '%';
        document.getElementById("Allocation2").innerHTML = parseFloat(AgentcommissionPercentage2).toFixed(2) + '%';
    } else {
        // document.getElementById("Agent2Details").style.display = "";
        // document.getElementById("AgentsAllocationHeader").style.display = "";
        // document.getElementById("AgentAllocationRow1").style.display = "";
        // document.getElementById("AgentAllocationRow2").style.display = "";
        // document.getElementById("AgentAllocationRowTotal").style.display = "";
        // document.getElementById("Allocation1").value = parseFloat(AgentcommissionPercentage1).toFixed(2) + '%';
        // document.getElementById("Allocation2").value = parseFloat(AgentcommissionPercentage2).toFixed(2) + '%';
    }

    if (Source === "Office-lead") {

        if (listingType === "Sale-Double-Sided" || listingType === "Lease-DoubleSided") {
            // if (document.getElementById('AddAgent').checked === false) {
            if (1) {
                var Selling = (100 - SellingOfficeLeadPercentage) / 100;
                var listing = (100 - ListingOfficeLeadPercentage) / 100;
                var Total = ListingPercentage + SellingPercentage;
                var basedAmount = (listing * ListingPercentage) + (Selling * SellingPercentage);
                var d = listing * ListingPercentage;
                AgentSplit1 = (basedAmount / Total) * 100;
                AgentSplit2 = 0;
            } else {
                // if (document.getElementById('SecondAgentIDRole').value === "Selling Agent") {
                //     AgentSplit1 = 100 - (ListingOfficeLeadPercentage);
                //     AgentSplit2 = 100 - (SellingOfficeLeadPercentage);
                // } //Closing  if
                // else {
                //     AgentSplit1 = 100 - (SellingOfficeLeadPercentage);
                //     AgentSplit2 = 100 - (ListingOfficeLeadPercentage);
                // }
            }

        } else {
            AgentSplit1 = (100 - officeLeadPercentage);
            AgentSplit2 = (100 - officeLeadPercentage);
        }
    } else {
        AgentSplit1 = 80;
        AgentSplit2 = 80;
    }

    var TRSAgentNet1 = (AgentCommissionAmount1 * AgentSplit1) / 100; //Calculating agent net amount based on the split amount
    var TRSAgentNet2 = (AgentCommissionAmount2 * AgentSplit2) / 100; //Calculating agent net amount based on the split amount

    document.getElementById("TRSAgentNet1").innerHTML = parseFloat(TRSAgentNet1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    // document.getElementById("TRSAgentName2").innerHTML = document.getElementById("SecondAgentID").value;
    // document.getElementById("TRSSplit2").innerHTML = parseFloat(AgentSplit2).toFixed(2) + '%';

    document.getElementById("TRSSplit1").innerHTML = parseFloat(AgentSplit1).toFixed(2) + '%';
    // document.getElementById("TRSAgentCommision2").innerHTML = parseFloat(AgentCommissionAmount2).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2  });

    document.getElementById("TRSAgentNet2").innerHTML = parseFloat(TRSAgentNet2).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSAgentCommision3").innerHTML = parseFloat(AgentCommissionAmount2 + AgentCommissionAmount1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSAgentNet3").innerHTML = parseFloat(TRSAgentNet2 + TRSAgentNet1).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSListCommission").innerHTML = parseFloat(ListingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSListHTS").innerHTML = parseFloat(HSTListingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalListCommission").innerHTML = parseFloat(TotalListingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSSellCommission").innerHTML = parseFloat(SellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSSellCommissionHTS").innerHTML = parseFloat(HSTSellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalSellCommission").innerHTML = parseFloat(TotalSellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalCommissions").innerHTML = parseFloat(ListingCommission + SellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotaHST").innerHTML = parseFloat(HSTListingCommission + HSTSellingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });

    document.getElementById("TRSTotalFinalCommissions").innerHTML = parseFloat(TotalSellingCommission + TotalListingCommission).toLocaleString(undefined, {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });


    document.getElementById("TRSListCommissionName").innerHTML = "Our brokerage";

    if (listingType === "Lease-DoubleSided" || listingType === "Sale-Double-Sided") {
        document.getElementById("TRSSellCommissionName").innerHTML = "Our Brokerage";
    } else if (listingType === "BuyerSide-Self-Represented-Vendor") {
        document.getElementById("TRSSellCommissionName").innerHTML = VendorLawyerName;
    } else if (listingType === "TenantSide-Self-Represented-Landlord") {
        if (clientType == 'Individual') {
            document.getElementById("TRSSellCommissionName").innerHTML = client1Name;
        } else {
            document.getElementById("TRSSellCommissionName").innerHTML = client1Bname;
        }
    } else {
        document.getElementById("TRSSellCommissionName").innerHTML = brokerName;
    }

    //Calculating the total Commission amounts and HST	

    var totalIncomeHST = HSTListingCommission + HSTSellingCommission;
    var TotalPurAmountIncome = ListingCommission + SellingCommission;
    TotalCommissions = TotalSellingCommission + TotalListingCommission;
    var Deposits = parseFloat(deposits[0][0]);
    // +deposits[1][0]+deposits[2][0]+deposits[3][0]
    // if(deposits[0][2]){
    //     document.getElementById('DepositsName1').innerHTML = deposits[0][2];
    //     document.getElementById('DepositsDate1').innerHTML = deposits[0][1];
    //     document.getElementById('DepositsAmount1').innerHTML = deposits[0][0];
    // }

    // if(deposits[1][2]){
    //     document.getElementById('DepositsName2').innerHTML = deposits[1][2];
    //     document.getElementById('DepositsDate2').innerHTML = deposits[1][1];
    //     document.getElementById('DepositsAmount2').innerHTML = deposits[1][0];
    // }

    // if(deposits[2][2]){
    //     document.getElementById('DepositsName3').innerHTML = deposits[2][2];
    //     document.getElementById('DepositsDate3').innerHTML = deposits[2][1];
    //     document.getElementById('DepositsAmount3').innerHTML = deposits[2][0];
    // }

    // if(deposits[3][2]){
    //     document.getElementById('DepositsName4').innerHTML = deposits[3][2];
    //     document.getElementById('DepositsDate4').innerHTML = deposits[3][1];
    //     document.getElementById('DepositsAmount4').innerHTML = deposits[3][0];
    // }

    if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {
        CooperatingExpenses = 0;
        document.getElementById("ReciveOrRefoundAmountPreview").innerHTML = '$' + parseFloat(TotalSellingCommission).toLocaleString(undefined, {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });
        document.getElementById("ReceivableLabel").innerHTML = "Receivable";
        document.getElementById("List").style.display = "none";
    } else {

        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "";
        document.getElementById("List").style.display = "";

        if (Deposits > TotalCommissions) {
            var amount = parseFloat(TotalCommissions - Deposits);
            document.getElementById("ReciveOrRefoundAmountPreview").innerHTML = '$' + parseFloat(amount).toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            document.getElementById("ReceivableLabel").innerHTML = "Refund";
        } else {

            var amount = TotalCommissions - Deposits;
            document.getElementById("ReciveOrRefoundAmountPreview").innerHTML = '$' + parseFloat(amount).toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            document.getElementById("ReceivableLabel").innerHTML = "Receivable";
        }
    }

    if (listingType === "Lease-DoubleSided" || listingType === "Sale-Double-Sided") {
        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "none";
        CooperatingExpenses = 0;
    } else if (listingType === "Buyer-Side" || listingType === "Tenant-Side" || listingType === "BuyerSide-Self-Represented-Vendor" || listingType === "TenantSide-Self-Represented-Landlord") {
        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "none";
        CooperatingExpenses = 0;
    } else {
        document.getElementById("ExpensesCo-operatingBrokerage").style.display = "";
        CooperatingExpenses = SellingCommission;
    }

    if (document.getElementById('DepositsName1').innerHTML == '') {
        document.getElementById('DepositsName1').innerHTML = 'No Deposit';
    }

    // TRSExpenses(HST, referralfeeAmt, rebateFeeAmt, CooperatingExpenses, TRSAgentNet1, TRSAgentNet2, TotalPurAmountIncome, totalIncomeHST, TotalCommissions, 50, 50, 50, 50, 'Beoker Brokerovish (no)', 'Agent agentovich no', 'Name1 namovich', 'Name2 namovich', 'Name3 namovich', 'Name4 namovich', 'RefAgent Namovich');

    ListingTypeTRS(listingType);

}

// function sortPrice(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan').sort(function(a, b) {
//         return +a.dataset.price - +b.dataset.price;
//     })
//     .appendTo($wrapper);
// }

// function sortNum(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan').sort(function(a, b) {
//         return +a.dataset.trsnum - +b.dataset.trsnum;
//     })
//     .appendTo($wrapper);
// }

// function sortListing(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan').sort(function(a, b) {
//         return +a.dataset.listingtype - +b.dataset.listingtype;
//     })
//     .appendTo($wrapper);
// }

// function sortStatus(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan').sort(function(a, b) {
//         return +a.dataset.status - +b.dataset.status;
//     })
//     .appendTo($wrapper);
// }

// function sortProperty(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan').sort(function(a, b) {
//         return +a.dataset.propertytype - +b.dataset.propertytype;
//     })
//     .appendTo($wrapper);
// }



// function sortPrice2(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan2').sort(function(a, b) {
//         return +a.dataset.price - +b.dataset.price;
//     })
//     .appendTo($wrapper);
// }

// function sortNum2(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan2').sort(function(a, b) {
//         return +a.dataset.trsnum - +b.dataset.trsnum;
//     })
//     .appendTo($wrapper);
// }

// function sortListing2(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan2').sort(function(a, b) {
//         return +a.dataset.listingtype - +b.dataset.listingtype;
//     })
//     .appendTo($wrapper);
// }

// function sortStatus2(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan2').sort(function(a, b) {
//         return +a.dataset.status - +b.dataset.status;
//     })
//     .appendTo($wrapper);
// }

// function sortProperty2(wrapper){
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.MainSpan2').sort(function(a, b) {
//         return +a.dataset.propertytype - +b.dataset.propertytype;
//     })
//     .appendTo($wrapper);
// }

// function sortComTrs(wrapper){
//     console.log('inside');
//     var $wrapper = $('.'+wrapper);
//     $wrapper.find('.comrow').sort(function(a, b) {
//         console.log('trying'+ +a.dataset.trsnum - +b.dataset.trsnum);
//         return +a.dataset.trsnum - +b.dataset.trsnum;
//     })
//     .appendTo($wrapper);

// }


function sortingPending(id){
    var dateFrom = new Date(document.getElementById('datefromPending').value);
    var dateTo = new Date(document.getElementById('datetoPending').value);

    var dateCheck;
    var list = document.getElementById(id).getElementsByClassName('dealDates');

    if(!(dateFrom=='Invalid Date')&&!(dateTo=='Invalid Date')){
        for(let a = 0; a<list.length; a++){
            if(list[a].getElementsByClassName('closingDateLabel').length > 0){
                dateCheck = new Date(list[a].getElementsByClassName('closingDateLabel')[0].innerHTML);
                if(dateCheck >= dateFrom && dateCheck <= dateTo){
                    list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.remove('hidden');
                }else{
                    list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('hidden');
                }     
            }else{ list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('hidden'); }
        }
    }else if(!(dateFrom=='Invalid Date')){
            for(let a = 0; a<list.length; a++){
                if(list[a].getElementsByClassName('closingDateLabel').length > 0){
                    dateCheck = new Date(list[a].getElementsByClassName('closingDateLabel')[0].innerHTML);
                    if(dateCheck >= dateFrom){
                        list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.remove('hidden');
                    }else{
                        list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('hidden');
                    }   
                }else{ list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('hidden'); }
            }
    }else if(!(dateTo=='Invalid Date')){
            for(let a = 0; a<list.length; a++){
                if(list[a].getElementsByClassName('closingDateLabel').length > 0){
                    dateCheck = new Date(list[a].getElementsByClassName('closingDateLabel')[0].innerHTML);
                    if(dateCheck <= dateTo){
                        list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.remove('hidden');
                    }else{
                        list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('hidden');
                    }   
                }else{ list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('hidden'); }  
            }
       
    }else{
        for(let a = 0; a<list.length; a++){   
            list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.remove('hidden');  
        }
    }
    if(document.getElementById(id).getElementsByClassName('MainSpan').length == document.getElementById(id).getElementsByClassName('hidden').length){
        document.getElementById('nofoundPending').style.display = '';
    }else{
        document.getElementById('nofoundPending').style.display = 'none';
    }
}



function sorting(id){
    const dateFrom = new Date(document.getElementById('datefrom').value);
    const dateTo = new Date(document.getElementById('dateto').value);
    const list = document.getElementById(id).getElementsByClassName('tablerows');
    let dateCheck;
    
    if(dateFrom != 'Invalid Date'&& dateTo != 'Invalid Date'){
        for(const element of list){
            dateCheck = new Date(element.dataset.closingdate);
            if(dateCheck >= dateFrom && dateCheck <= dateTo){
                element.classList.remove('hidden');
            }else{
                element.classList.add('hidden');
            }     
        }
    }else if(dateFrom != 'Invalid Date'){
        for(const element of list){
            dateCheck = new Date(element.dataset.closingdate);
            if(dateCheck >= dateFrom){
                element.classList.remove('hidden');
            }else{
                element.classList.add('hidden');
            }   
        }
    }else if(dateTo != 'Invalid Date'){
        for(const element of list){
            dateCheck = new Date(element.dataset.closingdate);
            if(dateCheck <= dateTo){
                element.classList.remove('hidden');
            }else{
                element.classList.add('hidden');
            }     
        }
    }else{
        for(const element of list){   
            element.classList.remove('hidden');  
        }
    }
    
}

function sortingCompleted(id){
    var dateFrom = new Date(document.getElementById('datefromCompleted').value);
    var dateTo = new Date(document.getElementById('datetoCompleted').value);

    var dateCheck;
    var list = document.getElementById(id).getElementsByClassName('closingDateLabel');
     if(!(dateFrom=='Invalid Date')&&!(dateTo=='Invalid Date')){
        for(let a = 0; a<list.length; a++){
            dateCheck = new Date(list[a].innerHTML);
            if(dateCheck >= dateFrom && dateCheck <= dateTo){
                list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.remove('hidden');
            }else{
                list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('hidden');
            }     
        }
    }else if(!(dateFrom=='Invalid Date')){
        for(let a = 0; a<list.length; a++){
            dateCheck = new Date(list[a].innerHTML);
            if(dateCheck >= dateFrom){
                list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.remove('hidden');
            }else{
                list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('hidden');
            }   
        }
    }else if(!(dateTo=='Invalid Date')){
        for(let a = 0; a<list.length; a++){
            dateCheck = new Date(list[a].innerHTML);
            if(dateCheck <= dateTo){
                list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.remove('hidden');
            }else{
                list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.add('hidden');
            }     
        }
    }else{
        for(let a = 0; a<list.length; a++){   
            list[a].parentElement.parentElement.parentElement.parentElement.parentElement.classList.remove('hidden');  
        }
    }

    if(document.getElementById(id).getElementsByClassName('MainSpan2').length == document.getElementById(id).getElementsByClassName('hidden').length){
        document.getElementById('nofound6').style.display = '';
    }else{
        document.getElementById('nofound6').style.display = 'none';
    }
    
}


var myModalTRSPreview;

function previewLoaded(id, dealtype, address1, address2, price, event) {


    mypromise(dealtype).then((res) => {
        // console.log(dealtype);
        if (dealtype == 'TRSPreviewPrintAppraisal.html') {
            fillOtherSheet(id, '0', '0', '0', price, ['', ''], [''], '', '', '', '', '');
            document.getElementById('RecordSheetPartiesInformationPreview').style.display = 'none';
            document.getElementById('tableComissionsPreview').style.display = 'none';
            document.getElementsByClassName('modal-content')[0].style.height = '90vh';

            document.getElementById("onclickfield").onclick = function () {
                SetId(id, 'Letter of Opinion Fee')
            }
        } else if (dealtype == 'TRSPreviewPrintReferral.html') {
            fillReferralSheet(id, '', '', price, ['', ''], [''], '', '', '', '', '')
            document.getElementById('RecordSheetPartiesInformationPreview').style.display = 'none';
            document.getElementById('tableFeePreview').style.display = 'none';
            document.getElementsByClassName('modal-content')[0].style.height = '90vh';
            
            document.getElementById("onclickfield").onclick = function () {
                SetId(id, 'Referral Fee')
            }

        } else if (dealtype == 'TRSPreviewPrint.html') {
            fillTRSSheet(id, '0', 12, '0', price, 0, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 's', '0', [
                [0, '', ''],
                [0, '', '']
            ]);
            
            document.getElementsByClassName('DetailsPartiesAndContactInformation')[0].style.display = 'none';
            document.getElementsByClassName('DetailsPartiesAndContactInformation')[1].style.display = 'none';
            document.getElementsByClassName('DetailsPartiesAndContactInformation')[2].style.display = 'none';
            document.getElementsByClassName('DetailsPartiesAndContactInformation')[3].style.display = 'none';
            document.getElementsByClassName('modal-content')[0].style.height = '90vh';

            document.getElementById('myModalTRS').style.display = 'block';
            document.getElementById("onclickfield").onclick = function () {
                SetId(id, 'TRS')
            }

        } else if (dealtype == 'invoiceOther.html') {
            fillAppraisalInvoice(id, '0', '0', '0', '0', '', address1 + address2, '', '', '', '', '', '', '', '', '', '', '');
            document.getElementById('SenderInformation').style.display = 'none';
            document.getElementById('BankInformation').style.display = 'none';
            document.getElementById('SomeDetailInformation').style.display = 'none';
            document.getElementsByClassName('invoiceBox ')[1].style.display = 'none';
            document.getElementsByClassName('modal-content')[0].style.height = '90vh';

            document.getElementById("onclickfield").onclick = function () {
                SetId(id, 'Letter of Opinion Fee')
            }


        } else if (dealtype == 'invoiceReferralFee.html') {
            fillReferralInvoice(id, '0', 'ON', '0', '0', ', Canada', address1 + address2, '', '', ', ', '', '', '', '', '', '', '', '', '', '', '');
            document.getElementById('SenderInformation').style.display = 'none';
            document.getElementById('BankInformation').style.display = 'none';
            document.getElementById('SomeDetailInformation').style.display = 'none';
            document.getElementsByClassName('invoiceBox ')[1].style.display = 'none';
            document.getElementsByClassName('modal-content')[0].style.height = '90vh';

            document.getElementById("onclickfield").onclick = function () {
                SetId(id, 'Referral Fee')
            }
        } else if (dealtype == 'InvoiceTRS.html') {
            fillTrsInvoice(id, '0', '0', '0', 'ON', '', '', ', Canada', address1 + address2, '', '', '', '', '', '', '', '', '', '', '', '', '', '');
            
            document.getElementById('SomeDetailInformationTRS').style.display = 'none';
            document.getElementById('StatmentContects').style.display = 'none';
            document.getElementById('InvoiceContects').style.display = 'none';
            document.getElementById('SenderInformation').style.display = 'none';
            document.getElementById('LeasingBox').style.display = 'none';
            document.getElementById('SellingBox').style.display = 'none';
            document.getElementsByClassName('modal-content')[0].style.height = '90vh';
            document.querySelector("#SummaryOfTransaction").style.display='none';
            document.querySelector("#RecieverAddressTwo").style.display='none';
            document.querySelector("#printMainInvoice > div.frontImageLogo > img").src='https://probroker.s3.ca-central-1.amazonaws.com/Mastere/Companylogo/53?math=0.9931698721314935';

            document.getElementById("onclickfield").onclick = function () {
                SetId(id, 'TRS')
            }
        }
        return 'Success';
    }).then(() => {
       
    }).catch((error) => {
        // console.log(`Handling error as we received ${error}`);
    });
}