<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.taglibs.standard.lang.jstl.test.PageContextImpl" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Oferta.am</title>
    <link href="../images/favicon.ico" rel="shortcut icon">

    <link rel="stylesheet" href="fonts/icomoon/style.css" type="text/css">
    <link rel="stylesheet" href="css/global.css" type="text/css">
    <link rel="stylesheet" href="libs/owl/owl.carousel.min.css"/>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


</head>
<style>
    .fold-table {
        display: none;
    }
</style>
<body id="body">
<%--<fmt:setLocale value="${requestScope.Pagelanguage}"/>

<fmt:setBundle basename="com.ithome.web.Resources.Content" var="Bundles"/>--%>
<div class="overlay" id="overlay"></div>
<div class="overlay-box" id="overlay-box"></div>
<div class="page-container">
    <div class="fixed-header">
        <header>
            <div class="inner-container large">
                <div class="flex space-between">
                    <div class="left flex align-items-center">
              <span class="logo">
                   <a href="App?PageLanguage=${requestScope.Pagelanguage}"><img src="../images/oferta1.jpg" alt=""/></a>
               </span>
                        <span class="hide-for-tablet">
                  <ul>
									<li><a href="About?Currancy=${requestScope.PageCurrancy}">Մեր մասին</a></li>
									<li><a
                                            href="ContactUs?Currancy=${requestScope.PageCurrancy}">Կապ մեզ հետ</a></li>
									<%--<li><a href="Ofbanks?Currancy=${requestScope.PageCurrancy}">Մեր Գործընկերները</a></li>--%>
									<li><a href="Ofbanks?Currancy=${requestScope.PageCurrancy}&&City=<%=request.getAttribute("city")%>">Մեր Գործընկերները</a></li>
									<li><a href="Blog?Currancy=${requestScope.PageCurrancy}">Օգտակար հոդվածներ</a></li>
								</ul>
               </span>
                    </div>
                    <div class="right flex align-items-center">
                        <span class="state ellipsis hide-for-tablet"><i
                                class="icon-state"></i>${requestScope.City}  </span>
                        <span class="language-box">
                   <%-- <span class="selected-item" onclick="toggleBoxes('langList')">Հայ</span>
                   &lt;%&ndash; <div class="list" id="langList">
                         <ul>
                            <li class="active">Հայ</li>
                            <li>Eng</li>
                            <li>Рус</li>
                        </ul>
                    </div>&ndash;%&gt;
                </span>--%>
                        <span class="compere-box show-for-tablet relative">
                      <span class="compere-icon" onclick="toggleBoxes('compareTooltipMb')">
                        <c:if test="${requestScope.comparListConsumer != null}">
                            <c:forEach var="size" items="${requestScope.comparListConsumer}" varStatus="TheCount">
                                <span class="count"><c:out value="${TheCount.count}"/></span>
                            </c:forEach>
                        </c:if>
                        <i class="icon-libra"></i>
                    </span>
                    <div class="tooltip-container bottom right" id="compareTooltipMb">

                        <div class="tooltip">
                            <span class="tooltip-title">Համեմատության</span>
                            <form action="CompareDeposit" method="get" name="DepositComparesmall">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListDeposit != null}">
                            <ul>
                               <li >
                                    <c:forEach var="DepositCompare" items="${requestScope.comparListDeposit}"
                                               varStatus="TheCount">
                                        <c:set var="counterDeposit" value="${TheCount.count}" scope="request"/>

                                    </c:forEach>
                                    <span onclick="document.DepositComparesmall.submit();">Ավանդ</span>
                                    <span class="bold font-14">${counterDeposit}</span>
                                     <i class="icon-delete" onclick="document.Deletesmall.submit();">

                                     </i>
                                    <form action="DepositClient" method="get" name="Deletesmall">
                                        <input type="hidden" name="pageNameToDelete" value="Ավանդ">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </ul>
                            </c:if>
                             <form action="CompareMortgage" method="get" name="MortgageComparesmall">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListMortgage != null}">
                            <ul>
                                <li>
                                    <c:forEach var="MortgagCompare" items="${requestScope.comparListMortgage}"
                                               varStatus="TheCount">
                                        <c:set var="counterMortgag" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                      <span onclick="document.MortgageComparesmall.submit();">Հիփոթեք</span>
                                     <span class="bold font-14">${counterMortgag}</span>
                                        <i type="submit" class="icon-delete" onclick="document.DeleteHipoteksmall.submit();"></i>
                                </li>
                                 <form action="DepositClient" method="get" name="DeleteHipoteksmall">
                                        <input type="hidden" name="pageNameToDelete" value="Հիփոթեք">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                       <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </ul>
                            </c:if>
                            <form action="CompareConsumer" method="get" name="ConsumerComparesmall">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                             <c:if test="${requestScope.comparListConsumer != null}">
                            <ul>
                                <li>
                                    <c:forEach var="ConsumerCompare" items="${requestScope.comparListConsumer}"
                                               varStatus="TheCount">
                                        <c:set var="counterCompare" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                     <span  onclick="document.ConsumerComparesmall.submit();">Սպառողական</span>
                                     <span class="bold font-14">${counterCompare}</span>
                                         <i type="submit" class="icon-delete" onclick="document.DeleteConsumersmall.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteConsumersmall">
                                        <input type="hidden" name="pageNameToDelete" value="Սպարողական">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </ul>
                             </c:if>
                            <form action="CompareCarLoan" method="get" name="CarLoanComparesmall">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListCarLoan != null}">
                            <ul>
                                <li>
                                    <c:forEach var="CarLoanCompare" items="${requestScope.comparListCarLoan}"
                                               varStatus="TheCount">
                                        <c:set var="counterCarLoan" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                    <span onclick="document.CarLoanComparesmall.submit();">Ավտովարկ</span>
                                      <span class="bold font-14">${counterCarLoan}</span>
                                          <i type="submit" class="icon-delete" onclick="document.DeleteCarsmall.submit();"></i>
                                </li>
                            </ul>
                                <form action="DepositClient" method="get" name="DeleteCarsmall">
                                        <input type="hidden" name="pageNameToDelete" value="Ավտովարկ">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                     <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </c:if>
                            <%--<form action="CompareMicro" method="get" name="MicroCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListMicro != null}">
                            <ul>
                                <li>
                                    <c:forEach var="MicroCompare" items="${requestScope.comparListMicro}"
                                               varStatus="TheCount">
                                        <c:set var="counterMicro" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                    <span onclick="document.MicroCompare.submit();">Միկրովարկ</span>
                                     <span class="bold font-14">${counterMicro}</span>
                                         <i type="submit" class="icon-delete" onclick="document.DeleteMicro.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteMicro">
                                        <input type="hidden" name="pageNameToDelete" value="ՄԻԿՐՈՎԱՐԿ">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="Calculateer"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                     <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
                                    </form>
                            </ul>
                            </c:if>--%>
                            <form action="CompareAg" method="get" name="AgComparesmall">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListAg != null}">
                            <ul>
                                 <li>
                                    <c:forEach var="AgCompare" items="${requestScope.comparListAg}"
                                               varStatus="TheCount">
                                        <c:set var="counterAg" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                      <span onclick="document.AgComparesmall.submit();">Գյուղատնտեսական</span>
                                      <span class="bold font-14">${counterAg}</span>
                                        <i type="submit" class="icon-delete" onclick="document.DeleteAGsmall.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteAGsmall">
                                        <input type="hidden" name="pageNameToDelete" value="Գյուղատնտեսական">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </ul>
                            </c:if>

                             <%--<c:if test="${requestScope.comparListCard != null}">
                            <ul>
                                <li>
                                    <c:forEach var="CardCompare" items="${requestScope.comparListCard}"
                                               varStatus="TheCount">
                                        <c:set var="counterCard" value="${TheCount.count}" scope="request"/>

                                    </c:forEach>
                                     <span>Քարտեր</span>
                                      <span class="bold font-14">${counterCard}</span>
                                        <i class="icon-delete"></i>
                                </li>
                            </ul>
                             </c:if>--%>
                            <!--Todo add when there is no item -->
                            <!--                            <span>Համեմատության էջում տեղ չկա</span>-->

                        </div>

                    </div>
                </span>
                        <span class="i-menu show-for-tablet" id="mbNavBtn"><i class="icon-menu font-20"></i></span>
                    </div>
                </div>
            </div>

        </header>
        <div class="navigation" id="mbNav">
            <div class="inner-container large">
                <div class="flex space-between align-items-center inner-content flex-wrap">
                    <jsp:include page="include/Search.jsp"/>
                    <div class="nav-content">
                        <c:if test="${requestScope.dropDownsListWithCurrancy!=null}">
                            <c:forEach items="${requestScope.dropDownsListWithCurrancy}" var="dropDownList">
                                <ul>
                                    <li>
                                        <a href="App?Currancy=${requestScope.PageCurrancy}">ԳԼԽԱՎՈՐ</a></li>
                                    <li>
                                        <a href="DepositClient?PageToGo=Deposits&&Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ԱՎԱՆԴՆԵՐ</a>
                                    </li>
                                    <li>
                                        <a href="MortgageClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ՀԻՓՈԹԵՔ</a>
                                    </li>
                                    <li>
                                        <a href="ConsumerClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ՍՊԱՌՈՂԱԿԱՆ
                                            ՎԱՐԿԵՐ</a>
                                    </li>
                                    <li>
                                        <a href="AutoClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ԱՎՏՈՎԱՐԿ</a>
                                    </li>
                                    <li>
                                        <a href="MicroClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ՄԻԿՐՈՎԱՐԿ</a>
                                    </li>
                                    <li>
                                        <a href="AClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ԳՅՈՒՂԱՏՆՏԵՍԱԿԱՆ
                                            ՎԱՐԿ</a>
                                    </li>
                                    <li>
                                        <a href="CardClient?Currancy=${requestScope.PageCurrancy}&&Dram=AMD&&Ruble=OFF&&Dollar=OFF&&Euro=OFF&&Cashback=Cash&&Depit=OFF&&Free=OFF&&Period=OFF&&Credit=OFF">ՔԱՐՏԵՐ</a>
                                    </li>
                                </ul>
                            </c:forEach>
                        </c:if>
                    </div>
                    <!-- starting compare Section -->
<%--
                    <%
                        if (request.getAttribute("WorningMessage") != null) {
                    %>
                    <%=request.getAttribute("WorningMessage")%>
                    <%
                        }
                    %>--%>
                    <span class="right hide-for-tablet">

                <span><i class="icon-search" id="searchBtn"></i></span>
                <span class="compere-box">

                    <span class="compere-icon" >
                        <c:if test="${requestScope.comparListConsumer != null}">
                            <c:forEach var="size" items="${requestScope.comparListConsumer}" varStatus="TheCount">
                                <span class="count"><c:out value="${TheCount.count}"/></span>
                            </c:forEach>
                        </c:if>
                        <i class="icon-libra"></i>
                    </span>
                    <div class="tooltip-container bottom right" id="compareTooltipWeb">
                        <div class="tooltip">
                            <span class="tooltip-title">Համեմատության</span>
                            <form action="CompareDeposit" method="get" name="DepositCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListDeposit != null}">
                            <ul>
                               <li >
                                    <c:forEach var="DepositCompare" items="${requestScope.comparListDeposit}"
                                               varStatus="TheCount">
                                        <c:set var="counterDeposit" value="${TheCount.count}" scope="request"/>

                                    </c:forEach>
                                    <span onclick="document.DepositCompare.submit();">Ավանդ</span>
                                    <span class="bold font-14">${counterDeposit}</span>
                                     <i class="icon-delete" onclick="document.Delete.submit();">

                                     </i>
                                    <form action="DepositClient" method="get" name="Delete">
                                        <input type="hidden" name="pageNameToDelete" value="Ավանդ">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                       <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </ul>
                            </c:if>
                             <form action="CompareMortgage" method="get" name="MortgageCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListMortgage != null}">
                            <ul>
                                <li>
                                    <c:forEach var="MortgagCompare" items="${requestScope.comparListMortgage}"
                                               varStatus="TheCount">
                                        <c:set var="counterMortgag" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                      <span onclick="document.MortgageCompare.submit();">Հիփոթեք</span>
                                     <span class="bold font-14">${counterMortgag}</span>
                                        <i type="submit" class="icon-delete" onclick="document.DeleteHipotek.submit();"></i>
                                </li>
                                 <form action="DepositClient" method="get" name="DeleteHipotek">
                                        <input type="hidden" name="pageNameToDelete" value="Հիփոթեք">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </ul>
                            </c:if>
                            <form action="CompareConsumer" method="get" name="ConsumerCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                             <c:if test="${requestScope.comparListConsumer != null}">
                            <ul>
                                <li>
                                    <c:forEach var="ConsumerCompare" items="${requestScope.comparListConsumer}"
                                               varStatus="TheCount">
                                        <c:set var="counterCompare" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                     <span  onclick="document.ConsumerCompare.submit();">Սպառողական</span>
                                     <span class="bold font-14">${counterCompare}</span>
                                         <i type="submit" class="icon-delete" onclick="document.DeleteConsumer.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteConsumer">
                                        <input type="hidden" name="pageNameToDelete" value="Սպարողական">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                     <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </ul>
                             </c:if>
                            <form action="CompareCarLoan" method="get" name="CarLoanCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListCarLoan != null}">
                            <ul>
                                <li>
                                    <c:forEach var="CarLoanCompare" items="${requestScope.comparListCarLoan}"
                                               varStatus="TheCount">
                                        <c:set var="counterCarLoan" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                    <span onclick="document.CarLoanCompare.submit();">Ավտովարկ</span>
                                      <span class="bold font-14">${counterCarLoan}</span>
                                          <i type="submit" class="icon-delete" onclick="document.DeleteCar.submit();"></i>
                                </li>
                            </ul>
                                <form action="DepositClient" method="get" name="DeleteCar">
                                        <input type="hidden" name="pageNameToDelete" value="Ավտովարկ">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                     <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </c:if>
                            <%--<form action="CompareMicro" method="get" name="MicroCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListMicro != null}">
                            <ul>
                                <li>
                                    <c:forEach var="MicroCompare" items="${requestScope.comparListMicro}"
                                               varStatus="TheCount">
                                        <c:set var="counterMicro" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                    <span onclick="document.MicroCompare.submit();">Միկրովարկ</span>
                                     <span class="bold font-14">${counterMicro}</span>
                                         <i type="submit" class="icon-delete" onclick="document.DeleteMicro.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteMicro">
                                        <input type="hidden" name="pageNameToDelete" value="ՄԻԿՐՈՎԱՐԿ">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="Calculateer"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                     <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
                                    </form>
                            </ul>
                            </c:if>--%>
                            <form action="CompareAg" method="get" name="AgCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListAg != null}">
                            <ul>
                                 <li>
                                    <c:forEach var="AgCompare" items="${requestScope.comparListAg}"
                                               varStatus="TheCount">
                                        <c:set var="counterAg" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                      <span onclick="document.AgCompare.submit();">Գյուղատնտեսական</span>
                                      <span class="bold font-14">${counterAg}</span>
                                        <i type="submit" class="icon-delete" onclick="document.DeleteAG.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteAG">
                                        <input type="hidden" name="pageNameToDelete" value="Գյուղատնտեսական">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="ConsumerCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </ul>
                            </c:if>

                             <%--<c:if test="${requestScope.comparListCard != null}">
                            <ul>
                                <li>
                                    <c:forEach var="CardCompare" items="${requestScope.comparListCard}"
                                               varStatus="TheCount">
                                        <c:set var="counterCard" value="${TheCount.count}" scope="request"/>

                                    </c:forEach>
                                     <span>Քարտեր</span>
                                      <span class="bold font-14">${counterCard}</span>
                                        <i class="icon-delete"></i>
                                </li>
                            </ul>
                             </c:if>--%>
                            <!--Todo add when there is no item -->
                            <!--                            <span>Համեմատության էջում տեղ չկա</span>-->

                        </div>
                    </div>
                </span>
            </span>
                    <!-- Ending compare Section -->
                </div>
            </div>
        </div>

    </div>


    <div class="top-calculator top-search">
        <div class="bg" style="background-image: url('../images/1.jpg')">
            <div class="inner-container info-container">
                <div class="row-md clearfix margin-bottom-0">
                    <div class="text-box col-5">
                        <p class="font-32">Սպառողական վարկեր</p>
                        <p>Մենք կօգնենք ձեզ գտնել <br/>Շահավետ կանխիկ վարկեր</p>
                    </div>
                </div>
                <div>

                </div>
                <div class="row-md clearfix">
                    <form name="main" action="ConsumerCalculate" method="get">
                        <div class="col-6 large col">
                            <span class="label">Մուտքագրեք վարկի գումարը</span>
                            <div class="range-group">
                                <div class="def-range">
                                    <script language="javascript" type="text/javascript">
                                        var delayTimer;
                                        function doSearch(text) {
                                            clearTimeout(delayTimer);
                                            delayTimer = setTimeout(function() {
                                                document.main.submit()
                                            }, 2000); // Will do the ajax stuff after 1000 ms, or 1 s
                                        }

                                    </script>

                                    <c:if test="${requestScope.Amount!=null}">
                                        <c:forEach items="${requestScope.dropDownsListWithCurrancy}"
                                                   var="dropDownList2"
                                                   varStatus="loop">
                                            <output style="display: none;" id="outputer"></output>

                                            <input type="text" name="value" min="${dropDownList2.minAmount}"
                                                   max="${dropDownList2.maxAmount}" step="${dropDownList2.steps}"
                                                   value="${requestScope.Amountfiltered}"
                                                   oninput="showVal(this.value)"
                                                   onchange="showVal(this.value)" id="amount"
                                                   onblur="document.main.submit();" inputmode="numeric">

                                            <input type="range" name="range" min="${dropDownList2.minAmount}"
                                                   max="${dropDownList2.maxAmount}" step="${dropDownList2.steps}"
                                                   value="${requestScope.Amountfiltered}" data-rangeslider=""
                                                   id="amount_range"
                                                   style="position: absolute; width: 1px; height: 1px; overflow: hidden; opacity: 0;"
                                                   onchange="doSearch();">

                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.Amount==null}">
                                        <c:forEach items="${requestScope.dropDownsListWithCurrancy}"
                                                   var="dropDownList3"
                                                   varStatus="loop">

                                            <output style="display: none;" id="outputer"></output>

                                            <input type="text" name="value" min="${dropDownList3.minAmount}"
                                                   max="${dropDownList3.maxAmount}" step="${dropDownList3.steps}"
                                                   value="${requestScope.Amountfiltered}"
                                                   oninput="showVal(this.value)"
                                                   onchange="showVal(this.value)" id="amount"
                                                   onblur="document.main.submit();" inputmode="numeric">

                                            <input type="range" name="range" min="${dropDownList3.minAmount}"
                                                   max="${dropDownList3.maxAmount}" step="${dropDownList3.steps}"
                                                   value="${requestScope.Amountfiltered}" data-rangeslider
                                                   id="amount_range" onchange="doSearch();">

                                            <%--    <input type="hidden" name="value_url" id="value_amount_url" >--%>

                                        </c:forEach>
                                    </c:if>

                                </div>
                                <div class="def-select-box">

                                    <c:set var="AMD" value="${requestScope.PageCurrancy }"/>
                                    <c:choose>
                                        <c:when test="${AMD == 'AMD'}">
                                            <select name="Currancy" onchange="document.main.submit();">
                                                <option value="AMD" selected>֏</option>
                                                <option value="USD">$</option>
                                                <option value="EUR">€</option>
                                                <option value="RUB">₽</option>
                                            </select>
                                        </c:when>
                                    </c:choose>


                                    <c:set var="AMD" value="${requestScope.PageCurrancy }"/>
                                    <c:choose>
                                        <c:when test="${AMD == 'USD'}">
                                            <select name="Currancy" onchange="document.main.submit();">
                                                <option value="AMD">֏</option>
                                                <option value="USD" selected>$</option>
                                                <option value="EUR">€</option>
                                                <option value="RUB">₽</option>
                                            </select>
                                        </c:when>
                                    </c:choose>


                                    <c:set var="AMD" value="${requestScope.PageCurrancy }"/>
                                    <c:choose>
                                        <c:when test="${AMD == 'EUR'}">
                                            <select name="Currancy" onchange="document.main.submit();">
                                                <option value="AMD">֏</option>
                                                <option value="USD">$</option>
                                                <option value="EUR" selected>€</option>
                                                <option value="RUB">₽</option>
                                            </select>
                                        </c:when>
                                    </c:choose>


                                    <c:set var="AMD" value="${requestScope.PageCurrancy }"/>
                                    <c:choose>
                                        <c:when test="${AMD == 'RUB'}">
                                            <select name="Currancy" onchange="document.main.submit();">
                                                <option value="AMD">֏</option>
                                                <option value="USD">$</option>
                                                <option value="EUR">€</option>
                                                <option value="RUB" selected>₽</option>
                                            </select>
                                        </c:when>
                                    </c:choose>


                                </div>
                            </div>
                        </div>
                        <div class="col-4 middle col">
                            <span class="label">Ժամկետը</span>
                            <div class="def-select-box">
                                <c:set var="monthsSection" value='<%=request.getParameter("months")%>'/>
                                <c:choose>
                                    <c:when test="${monthsSection == '1'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1" selected>1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${monthsSection == '3'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1">1 ամիս</option>
                                            <option value="3" selected>3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${monthsSection == '6'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1">1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6" selected>6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${monthsSection == '9'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1">1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9" selected>9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${monthsSection == '12'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1">1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12" selected>12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${monthsSection == '18'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1">1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18" selected>18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${monthsSection == '24'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1">1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24" selected>24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${monthsSection == '36'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1">1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36" selected>36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${monthsSection == '48'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1">1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36" >36 ամիս</option>
                                            <option value="48" selected>48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${monthsSection == '60'}">
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1">1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36" >36 ամիս</option>
                                            <option value="48" >48 ամիս</option>
                                            <option value="60" selected>60 ամիս</option>
                                        </select>
                                    </c:when>
                                    <c:otherwise>
                                        <select name="months" id="select_month" onchange="document.main.submit();">
                                            <option value="1" selected>Բոլորը</option>
                                            <option value="1">1 ամիս</option>
                                            <option value="3">3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                        </select>
                                    </c:otherwise>
                                </c:choose>
                                <%-- <input type="hidden" name="select_value" id="select_month_value" value="1">--%>
                                <input type="hidden" name="City" value='<%=request.getAttribute("city")%>'>
                                <input type="hidden" name="MaxAmounr" value='<%=request.getParameter("MaxAmounr")%>'>

                            </div>
                        </div>
                        <div class="col-2 small col">
                            <button class="def-button btn-green">
                                <span>Գտնել</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="padding-bt-60 bg-white-dark">
        <div class="inner-container">
            <div class="bookmarked-items loan-items-container  margin-bottom-40">
                <c:if test="${requestScope.depositeAseList != null}">
                    <c:forEach items="${requestScope.depositeAseList}" var="SpecialConsumer">
                        <div class="table">
                            <div class="table-row">
                                <div class="table-cell item-img">
                                    <img src="${SpecialConsumer.banksList}">
                                </div>
                                <div class="table-cell">
                                    <%--<p>Տոկոս</p>--%>
                                    <p class="font-24 bold">${SpecialConsumer.CCFactual}%</p>
                                    <c:set var="percentage" value="${SpecialConsumer.CCFactual}"
                                           scope="request"/>
                                    <small>№ ${SpecialConsumer.productCode}</small>
                                </div>
                               <%-- <div class="table-cell">

                                 &lt;%&ndash;   <p>սկսած</p>&ndash;%&gt;
                                    <p class="font-28 bold">${SpecialConsumer.CCFactual}%</p>
                                     <small>№${SpecialConsumer.productCode}</small>
                                    <c:set var="percentage" value="${SpecialConsumer.CCFactual}" scope="request"/>
                                </div>--%>
                                <div class="table-cell">
                                <%--    Գումար--%>
                                    <%!
                                        int calculatePercentageMain(float Amount, double Percentage, int month) {
                                            double percentage = (Percentage / 100) / 12;// dogosi pajanum
                                            System.out.println("percentage " + percentage);
                                            float addNumber1 = (float) (percentage + 1); // Avelatsnel +1
                                            System.out.println("addNumber1 " + addNumber1);
                                            float powerNumber = (float) Math.pow(addNumber1,-(month));//enthanur avelatsadz himnagan kumari dogose
                                            System.out.println("powerNumber " + powerNumber);
                                            float minuesOne = (1 - powerNumber );
                                            System.out.println("minuesOne " + minuesOne);
                                            float AmountToPay= (float) (Amount * percentage);
                                            System.out.println("AmountToPay " + AmountToPay);

                                            float result = (int) (AmountToPay / minuesOne);
                                            return (int) AmountToPay;
                                        }
                                    %>

                                    <%
                                        double percentMain = (double) request.getAttribute("percentage");
                                        int AmountMain = Integer.parseInt((String) request.getAttribute("minAmount"));//100000
                                        int monthMain = Integer.parseInt(request.getParameter("months"));//1
                                    %>

                                    <c:set value="${requestScope.PageCurrancy}" var="curancy"/>
                                    <c:choose>
                                        <c:when test="${curancy == 'AMD'}">
                                            <h2 class="timer count-title count-number font-28 bold" data-to="<%=calculatePercentageMain(AmountMain, percentMain, monthMain) %>"
                                                data-speed="1739"></h2>
                                             </c:when>
                                        <c:when test="${curancy == 'USD'}">
                                            <h2 class="timer count-title count-number font-28 bold" data-to="<%=calculatePercentageMain(AmountMain, percentMain, monthMain) %>"
                                                data-speed="1739"></h2></c:when>
                                        <c:when test="${curancy == 'RUB'}">
                                            <h2 class="timer count-title count-number font-28 bold" data-to="<%=calculatePercentageMain(AmountMain, percentMain, monthMain) %>"
                                                data-speed="1739"></h2> </c:when>
                                        <c:when test="${curancy == 'EUR'}">
                                            <h2 class="timer count-title count-number font-28 bold" data-to="<%=calculatePercentageMain(AmountMain, percentMain, monthMain) %>"
                                                data-speed="1739"></h2> </c:when>
                                    </c:choose>

                                </div>
                                <div class="table-cell">
                                    <p>Մեկնաբանություն</p>
                                    <%--<sql:setDataSource var="db"
                                                       driver="com.mysql.jdbc.Driver"
                                                       url="jdbc:mysql://localhost:3306/oferta_oferta_datat_controller?serverTimezone=UTC&useUnicode=yes&characterEncoding=UTF-8"
                                                       user="root" password="YLf{}cJ,Kvd%"/>--%>
                                         <sql:setDataSource var="db"
                                                            driver="com.mysql.jdbc.Driver"
                                                            url="jdbc:mysql://204.93.169.198:3306/oferta_oferta_datat_controller?serverTimezone=UTC&useUnicode=yes&characterEncoding=UTF-8"
                                                            user="oferta_root" password="mnbvcxz00A!"/>
                                    <sql:query dataSource="${db}" var="comment">
                                        SELECT * FROM commentscontroller ;
                                    </sql:query>
                                    <c:forEach var="CommentsDao" items="${comment.rows}"
                                               varStatus="loop">
                                        <c:set value="${CommentsDao.productCode}"
                                               var="productCodeSql"/>
                                        <c:set value="${SpecialConsumer.productCode}"
                                               var="productCode"/>
                                        <c:if test="${productCode == productCodeSql }">
                                            <c:out value="${CommentsDao.Comment1_Am}"/>
                                         <%--   <c:out value="${CommentsDao.Comment2_Am}"/>
                                            <c:out value="${CommentsDao.Comment3_Am}"/>--%>
                                        </c:if>
                                    </c:forEach>

                                </div>
                                <div class="table-cell text-center">
                                    <c:set value="${SpecialConsumer.sendRequest}" var="isThere"/>
                                    <c:choose>
                                    <c:when test="${isThere == 1}">
                                    <c:set var="sendRequest" value="${SpecialConsumer.sendRequest}"/>
                                    <c:set var="gotoPage" value="${SpecialConsumer.gotoPage}"/>
                                    <c:set var="lastLogic" value="${SpecialConsumer.lastlogic}"/>
                                    <c:choose>
                                    <c:when test="${gotoPage == 1 || sendRequest== 1 && lastLogic== 0}">
                                    <a href="CreditSend?id=${SpecialConsumer.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmount=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=Consumer&&Amount=<%=request.getAttribute("range")%>&&PageName=Consumer"
                                       class="def-button btn-green with-shadow  margin-bottom-15">Իմանալ ավելին</a>
                                    <p>
                                        <a href="ConsumerCalculate?id=${SpecialConsumer.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getParameter("PageToGo")%>&&Amount=<%=request.getAttribute("range")%>&&PageName=Deposit"
                                           class="blue-link font-12 linkScrollDown">Համեմատել</a>
                                        </c:when>

                                        <c:when test="${gotoPage == 0 && sendRequest== 0 && lastLogic==1}">
                                        <a href="${SpecialConsumer.bankLink}"
                                           class="def-button btn-green with-shadow  margin-bottom-15" target="_blank">Անցնել էջ</a>
                                    <p><a href="ConsumerCalculate?id=${SpecialConsumer.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getParameter("PageToGo")%>&&Amount=<%=request.getAttribute("range")%>&&PageName=Deposit"
                                          class="blue-link font-12 linkScrollDown">Համեմատել</a>

                                        </c:when>
                                        </c:choose>

                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="sendRequest" value="${SpecialConsumer.sendRequest}"/>
                                            <c:set var="gotoPage" value="${SpecialConsumer.gotoPage}"/>
                                            <c:set var="lastLogic" value="${SpecialConsumer.lastlogic}"/>
                                        <c:choose>
                                        <c:when test="${gotoPage == 1 || sendRequest== 1}">
                                        <a href="CreditSend?id=${SpecialConsumer.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmount=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=Consumer&&Amount=<%=request.getAttribute("range")%>&&PageName=Consumer"
                                           class="def-button btn-green with-shadow  margin-bottom-15">Իմանալ
                                            ավելին</a>
                                    <p><a href="ConsumerCalculate?id=${SpecialConsumer.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getParameter("PageToGo")%>&&Amount=<%=request.getAttribute("range")%>&&PageName=Deposit"
                                          class="blue-link font-12 linkScrollDown">Համեմատել</a>
                                        </c:when>
                                        </c:choose>
                                        <c:choose>
                                        <c:when test="${gotoPage == 0 && sendRequest==0 && lastLogic==1}">
                                        <a href="${SpecialConsumer.bankLink}"
                                           class="def-button btn-green with-shadow  margin-bottom-15" target="_blank">Անցնել էջ</a>
                                    <p>
                                        <a href="ConsumerCalculate?id=${SpecialConsumer.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getParameter("PageToGo")%>&&Amount=<%=request.getAttribute("range")%>&&PageName=Deposit"
                                           class="blue-link font-12 linkScrollDown">Համեմատել</a>

                                        </c:when>
                                        </c:choose>
                                        </c:otherwise>
                                        </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

            <div class="loan-items-container">
                <div class="table hide-for-mb">
                    <div class="table-row head sorting">
                        <div class="table-cell"><span>Բանկ</span></div>

                        <div class="table-cell">
                            <span>Տոկոս</span>
                            <c:set value="${requestScope.arrow}" var="arrow"/>
                            <c:choose>
                                <c:when test="${arrow == 0}">
                                    <i class="icon-polygon-down "
                                       onclick="document.SortingPercentageDesc.submit();"></i>
                                    <i class="icon-polygon-up active "></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="icon-polygon-down active"></i>
                                    <i class="icon-polygon-up " onclick="document.SortingPercentageAsec.submit();"></i>
                                </c:otherwise>
                            </c:choose>
                            <form action="ConsumerCalculate" method="get" name="SortingPercentageDesc">

                                <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>" type="hidden">
                                <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                <input name="Currancy" value="<%=request.getParameter("Currancy")%>" type="hidden">
                                <input name="PageToGo" value="<%=request.getParameter("PageToGo")%>" type="hidden">
                                <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                <input name="sorting" value="AsecPercent" type="hidden">

                            </form>
                            <form action="ConsumerCalculate" method="get" name="SortingPercentageAsec">

                                <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>" type="hidden">
                                <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                <input name="Currancy" value="<%=request.getParameter("Currancy")%>" type="hidden">
                                <input name="PageToGo" value="<%=request.getParameter("PageToGo")%>" type="hidden">
                                <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                <input name="sorting" value="DescPercent" type="hidden">
                            </form>

                        </div>
                        <div class="table-cell">
                           <%-- <c:set value="${requestScope.arrow2}" var="arrow2"/>
                            <c:choose>
                                <c:when test="${arrow2 == 0}">

                                    <i class="icon-polygon-down "
                                       onclick="document.SortingPercentageDesc.submit();"></i>
                                    <i class="icon-polygon-up active "></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="icon-polygon-down active"></i>
                                    <i class="icon-polygon-up " onclick="document.SortingPercentageAsec.submit();"></i>
                                </c:otherwise>
                            </c:choose>--%>
                            <span>Գումար</span>
                           <%-- <form action="ConsumerCalculate" method="get" name="SortingTimeDescAmount">

                                <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>" type="hidden">
                                <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                <input name="Currancy" value="<%=request.getParameter("Currancy")%>" type="hidden">
                                <input name="PageToGo" value="<%=request.getParameter("PageToGo")%>" type="hidden">
                                <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                <input name="sorting" value="DescAmount" type="hidden">

                            </form>
                            <form action="ConsumerCalculate" method="get" name="SortingTimeAsecAmount">

                                <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>" type="hidden">
                                <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                <input name="Currancy" value="<%=request.getParameter("Currancy")%>" type="hidden">
                                <input name="PageToGo" value="<%=request.getParameter("PageToGo")%>" type="hidden">
                                <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                <input name="sorting" value="AsecAmount" type="hidden">
                            </form>--%>
                        </div>
                        <div class="table-cell"><span>Մեկնաբանություն</span></div>
                        <div class="table-cell"></div>
                    </div>
                </div>
                <div class="table">
                    <div class="table-row ">
                        <div class="table-cell item-img">

                            <c:if test="${requestScope.depositAllInRage != null}">
                                <c:forEach var="firstDepo" items="${requestScope.depositAllInRage}" varStatus="loop">
                                    <c:set var="percentageMain" value="${firstDepo.CCFactual}" scope="request"/>
                                    <c:set value="${firstDepo.bankId}" var="bank"/>
                                    <c:set value="${firstDepo.orderOfAppearance}" var="apperance"/>
                                    <table class="fold-table">
                                        <tbody>
                                        <tr class="view">
                                            <td>
                                                <!-- first section -->
                                                <div class="table">
                                                    <div class="table-row">

                                                        <div class="table-cell item-img">
                                                            <img src="${firstDepo.banksList}"/>
                                                            <p class="margin-top-20 hide-for-mb">
                                                                <a class="green-link font-12 width-icon right-icon ellipsis">
                                                                        <%-- <span>+ առաջարկ </span> <i class="icon-arrow-down"></i>--%>
                                                                </a>
                                                            </p>
                                                        </div>
                                                        <div class="table-cell">
                                                            <p >${firstDepo.productName}</p>
                                                            <p class="font-24 bold">${firstDepo.CCFactual}%</p>
                                                            <small>№ ${firstDepo.productCode} </small>

                                                        </div>
                                                       <%-- <div class="table-cell">
                                                           &lt;%&ndash; <p>սկսած</p>&ndash;%&gt;
                                                            <p class="font-24 bold">${firstDepo.CCFactual}%</p>
                                                            <small>№${firstDepo.productCode}</small>
                                                        </div>--%>
                                                     <%--   <div class="table-cell">
                                                            <p>Մինչեւ <%=request.getParameter("months")%> Ամիս</p>
                                                            <p class="font-24 bold">${firstDepo.CCMaxPeriodMonth}
                                                                Ամիս</p>
                                                        </div>--%>
                                                            <%-- <div class="table-cell">
                                                                 <p>Առավելագույն գումարը</p>
                                                                 <p class="font-24 bold">${firstDepo.DMaxAmount}</p>
                                                             </div>--%>

                                                        <div class="table-cell">
                                                          <%--  <p>Գումար</p>--%>
                                                            <p class="font-24 bold">

                                                                <%!
                                                                    int calculatePercentage(float Amount, double Percentage, int month) {
                                                                        double percentage = (Percentage / 100) / 12;// dogosi pajanum
                                                                        System.out.println("percentage " + percentage);
                                                                        float addNumber1 = (float) (percentage + 1); // Avelatsnel +1
                                                                        System.out.println("addNumber1 " + addNumber1);
                                                                        float powerNumber = (float) Math.pow(addNumber1,-(month));//enthanur avelatsadz himnagan kumari dogose
                                                                        System.out.println("powerNumber " + powerNumber);
                                                                        float minuesOne = (1 - powerNumber );
                                                                        System.out.println("minuesOne " + minuesOne);
                                                                        float AmountToPay= (float) (Amount * percentage);
                                                                        System.out.println("AmountToPay " + AmountToPay);

                                                                        float result = (int) (AmountToPay / minuesOne);
                                                                        return (int) AmountToPay;
                                                                    }
                                                                %>

                                                                <%
                                                                    double percent = (double) request.getAttribute("percentageMain");
                                                                    int Amount = Integer.parseInt((String) request.getAttribute("minAmount"));//100000
                                                                    int month = Integer.parseInt(request.getParameter("months"));//1
                                                                %>
                                                                        <c:set value="${requestScope.PageCurrancy}" var="curancy"/>
                                                                    <c:choose>
                                                                    <c:when test="${curancy == 'AMD'}">
                                                              <h2 class="timer count-title count-number font-28 bold" data-to="<%=calculatePercentage(Amount, percent, month)%>"
                                                                  data-speed="1739"></h2>
                                                                             </c:when>
                                                              <c:when test="${curancy == 'USD'}">
                                                                  <h2 class="timer count-title count-number font-28 bold" data-to="<%=calculatePercentage(Amount, percent, month)%>"
                                                                      data-speed="1739"></h2></c:when>
                                                              <c:when test="${curancy == 'RUB'}">
                                                                  <h2 class="timer count-title count-number font-28 bold" data-to="<%=calculatePercentage(Amount, percent, month)%>"
                                                                      data-speed="1739"></h2></c:when>
                                                              <c:when test="${curancy == 'EUR'}">
                                                                  <h2 class="timer count-title count-number font-28 bold" data-to="<%=calculatePercentage(Amount, percent, month)%>"
                                                                      data-speed="1739"></h2></c:when>
                                                              </c:choose>


                                                            </p>
                                                        </div>
                                                        <div class="table-cell">
                                                            <p class="font-18">
                                                                <%--<sql:setDataSource var="db"
                                                                                   driver="com.mysql.jdbc.Driver"
                                                                                   url="jdbc:mysql://localhost:3306/oferta_oferta_datat_controller?serverTimezone=UTC&useUnicode=yes&characterEncoding=UTF-8"
                                                                                   user="root" password="YLf{}cJ,Kvd%"/>--%>
                                                                     <sql:setDataSource var="db"
                                                                                        driver="com.mysql.jdbc.Driver"
                                                                                        url="jdbc:mysql://204.93.169.198:3306/oferta_oferta_datat_controller?serverTimezone=UTC&useUnicode=yes&characterEncoding=UTF-8"
                                                                                        user="oferta_root" password="mnbvcxz00A!"/>
                                                                <sql:query dataSource="${db}" var="comment">
                                                                    SELECT * FROM commentscontroller ;
                                                                </sql:query>
                                                                <c:forEach var="CommentsDao" items="${comment.rows}"
                                                                           varStatus="loop">
                                                                    <c:set value="${CommentsDao.productCode}"
                                                                           var="productCodeSql"/>
                                                                    <c:set value="${firstDepo.productCode}"
                                                                           var="productCode"/>
                                                                    <c:if test="${productCode == productCodeSql }">
                                                                        <c:out value="${CommentsDao.Comment1_Am}"/>
                                                                      <%--  <c:out value="${CommentsDao.Comment2_Am}"/>
                                                                        <c:out value="${CommentsDao.Comment3_Am}"/>--%>
                                                                    </c:if>
                                                                </c:forEach>


                                                            </p>
                                                        </div>
                                                        <div class="table-cell text-center last">
                                                            <p class="margin-bottom-20 show-for-mb text-left">
                                                                <a class="green-link font-12 width-icon right-icon ellipsis"
                                                                   onclick="toggleSubSuggestions()">
                                                                    <span>Ավելի Առաջարկներ</span> <%--<i
                                                                        class="icon-arrow-down"></i>--%>
                                                                </a>
                                                            </p>
                                                            <c:set var="sendRequest" value="${firstDepo.sendRequest}"/>
                                                            <c:set var="gotoPage" value="${firstDepo.gotoPage}"/>
                                                            <c:set var="lastLogic" value="${firstDepo.lastLogic}"/>
                                                            <c:choose>
                                                                <c:when test="${gotoPage == 1 || sendRequest== 1 && lastLogic == 0}">

                                                                    <a href="CreditSend?id=${firstDepo.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmount=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=Consumer&&Amount=<%=request.getAttribute("range")%>&&PageName=Consumer"
                                                                       class="def-button btn-green with-shadow  margin-bottom-15">Իմանալ
                                                                        ավելին</a>
                                                                    <a href="ConsumerCalculate?id=${firstDepo.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getParameter("PageToGo")%>&&Amount=<%=request.getAttribute("range")%>&&PageName=Deposit"
                                                                       class="blue-link font-12 linkScrollDown">Համեմատել</a>
                                                                    <%--  <p><a href="index.php?page=compare/deposit"
                                                                            class="blue-link font-12">Համեմատել</a></p>--%>

                                                                </c:when>
                                                                <c:when test="${gotoPage == 0 && sendRequest==0  && lastLogic == 1}">
                                                                    <a href=""
                                                                       class="def-button btn-green with-shadow  margin-bottom-15" target="_blank">Անցնել
                                                                        էջ</a>
                                                                    <a href="ConsumerCalculate?id=${firstDepo.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getParameter("PageToGo")%>&&Amount=<%=request.getAttribute("range")%>&&PageName=Deposit"
                                                                       class="blue-link font-12 linkScrollDown">Համեմատել</a>
                                                                    <%--<p><a href="index.php?page=compare/deposit"
                                                                          class="blue-link font-12">Համեմատել</a></p>--%>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="ConsumerCalculate?id=${firstDepo.productCode}&&months=<%=request.getParameter("months")%>&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getParameter("PageToGo")%>&&Amount=<%=request.getAttribute("range")%>&&PageName=Deposit"
                                                                       class="blue-link font-12 linkScrollDown">Համեմատել</a>
                                                                    <%-- <p><a href="index.php?page=compare/deposit"
                                                                           class="blue-link font-12">Համեմատել</a></p>--%>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </c:forEach>
                            </c:if>
                            <!-- Testing section Ending -->

                            <div class="see-all flex align-items-center justify-center">
    <span class="green-link width-icon right-icon" id="loadMore">
    <span>Տեսնել ավելին</span>
    <i class="icon-arrow-down font-9"></i>
    </span>
                            </div>
                        </div>
                    </div>
                    <div class="padding-bt-60">
                        <div class="inner-container">
                            <p class="font-24 title margin-bottom-35">
                                Հատուկ առաջարկներ
                            </p>
                            <div class="tab-container">
                                <div class="tab-nav flex align-items-center flex-wrap">
						<span class="tab-link" onclick="openTabItem(event, 'deposit')" >
                           Ավանդներ</span>
                                    <span class="tab-link" onclick="openTabItem(event, 'mortgage')">
                        Հիպոթեկային վարկ</span>
                                    <span class="tab-link active" onclick="openTabItem(event, 'consumer-loan')" id="defaultOpen">
                   Սպառողական վարկ</span>
                                    <span class="tab-link" onclick="openTabItem(event, 'car-loan')">
                    Ավտովարկ</span>
                                    <span class="tab-link" onclick="openTabItem(event, 'agricultural')">
                    Միկրոկրեդիտ</span>
                                    <span class="tab-link" onclick="openTabItem(event, 'card')">
                   Քարտեր</span>
                                </div>
                                <!-- ############################################################ Deposit START -->
                                <div class="tab-content" id="deposit">
                                    <div class="top">
                                        <a href="DepositClient?PageToGo=Deposits&&Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}"
                                           class="green-link width-icon ellipsis width-percent-70 block">
                                            <i class="icon-grid"></i>
                                            <span>Ավանդների բոլոր առաջարկները</span>
                                        </a>
                                    </div>
                                    <div>
                                        <div class="simple-carousel margin-top-30">
                                            <div class="owl-carousel owl-theme" id="simpleCarousel">
                                                <c:if test="${requestScope.depositListOffer!=null}">
                                                    <c:forEach items="${requestScope.depositListOffer}" var="SpecialDeposit">
                                                        <div class="special-offer-item">
                                                            <div class="item-top flex align-items-center margin-bottom-20">
                                                                <div>
                                                                    <span class="bold font-20">${SpecialDeposit.DPercentage}</span>
                                                                    <span>Տարեկան</span>
                                                                </div>
                                                                <div>
                                                                    <c:set var="ToMonth" scope="request"
                                                                           value="${SpecialDeposit.timeLine}"/>
                                                                    <%
                                                                        int getMonths = Integer.parseInt(String.valueOf(request.getAttribute("ToMonth")));
                                                                        int convertMonths = getMonths / 30;
                                                                    %>
                                                                    <span class="bold font-20"><%=convertMonths%> Ամիս </span>
                                                                    <span>Ավանդի ժամկետը</span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <form action="Credits" method="get">
                                                                    <input type="submit" class="def-button btn-blue" value="Իմանալ ավելին"/>
                                                                    <input type="hidden" name="ProductCode" value="${SpecialDeposit.productCode}"/>
                                                                    <input type="hidden" name="PageToGo" value="Deposit"/>
                                                                    <input type="hidden" name="Currancy" value="${SpecialDeposit.currancy}"/>
                                                                    <input type="hidden" name="SpecialAMount" value="${SpecialDeposit.DMinAmount}"/>
                                                                    <input type="hidden" name="MaxAmounr" value="${SpecialDeposit.DMaxAmount}"/>
                                                                    <input type="hidden" name="value_two" value="0"/>
                                                                    <input type="hidden" name="months" value='<%=convertMonths%>'/>
                                                                </form>
                                                            </div>
                                                            <div class="item-bottom flex align-items-center margin-top-30 margin-bottom-15">
                                                                <div class="item-img">
                                                                    <img src="${SpecialDeposit.banksList}"/>
                                                                </div>
                                                                <div>
                                                                    <span>${SpecialDeposit.productName}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- ############################################################ Deposit ENDS -->
                                <!-- ############################################################ Mortgage STARTS -->
                                <div class="tab-content" id="mortgage">
                                    <div class="top">
                                        <a href="MortgageClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}"
                                           class="green-link width-icon"> <i
                                                class="icon-grid"></i> <span>Հիփոթեքի բոլոր առաջարկները</span>
                                        </a>
                                    </div>
                                    <div>
                                        <div class="simple-carousel margin-top-30">
                                            <div class="owl-carousel owl-theme" id="simpleCarousel2">

                                                <c:if test="${requestScope.MortgageListOffer!=null}">
                                                    <c:forEach items="${requestScope.MortgageListOffer}"
                                                               var="SpecialMortgage">
                                                        <div class="special-offer-item">
                                                            <div class="item-top flex align-items-center margin-bottom-20">
                                                                <div>
                                                                    <span class="bold font-20">${SpecialMortgage.MFatual}</span>
                                                                    <span>Տարեկան</span>
                                                                </div>
                                                                <div>
                                                                    <span class="bold font-20">${SpecialMortgage.MMaxPeriodMonth} Ամիս</span>
                                                                    <span>վարկի ժամկետը</span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <a class="def-button btn-blue" href="">Իմանալ ավելին</a>
                                                            </div>
                                                            <div class="item-bottom flex align-items-center margin-top-30 margin-bottom-15">
                                                                <div class="item-img">
                                                                    <img src="${SpecialMortgage.banksList}"/>
                                                                </div>
                                                                <div>
                                                                    <span>${SpecialMortgage.productName}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ############################################################ Mortgage ENDS -->
                                <!-- ############################################################ Consumer STARTS -->
                                <div class="tab-content" id="consumer-loan">
                                    <div class="top">
                                        <a href="ConsumerClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}"
                                           class="green-link width-icon"> <i
                                                class="icon-grid"></i> <span>Սպառողական բոլոր առաջարկները</span>
                                        </a>
                                    </div>
                                    <div>
                                        <div class="simple-carousel margin-top-30">
                                            <div class="owl-carousel owl-theme" id="simpleCarousel3">
                                                <c:if test="${requestScope.consumerCreditListoffer!=null}">
                                                    <c:forEach
                                                            items="${requestScope.consumerCreditListoffer}"
                                                            var="SpecialconsumerCreditListoffer">
                                                        <div class="special-offer-item">
                                                            <div class="item-top flex align-items-center margin-bottom-20">
                                                                <div>
                                                                    <span class="bold font-20">${SpecialconsumerCreditListoffer.CCFactual}</span>
                                                                    <span>Տարեկան</span>
                                                                </div>
                                                                <div>
                                                                    <span class="bold font-20">${SpecialconsumerCreditListoffer.CCMaxPeriodMonth} Ամիս</span>
                                                                    <span>վարկի ժամկետը</span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <a class="def-button btn-blue" href="">Իմանալ ավելին</a>
                                                            </div>
                                                            <div class="item-bottom flex align-items-center margin-top-30 margin-bottom-15">
                                                                <div class="item-img">
                                                                    <img src="${SpecialconsumerCreditListoffer.banksList}"/>
                                                                </div>
                                                                <div>
                                                                    <span>${SpecialconsumerCreditListoffer.productName}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ############################################################ Consumer ENDS -->
                                <!-- ############################################################ Car loan STARTS -->
                                <div class="tab-content" id="car-loan">
                                    <div class="top">
                                        <a href="AutoClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}"
                                           class="green-link width-icon"> <i
                                                class="icon-grid"></i> <span>Ավտոմեքենայի վարկի բոլոր առաջարկները</span>
                                        </a>
                                    </div>
                                    <div>
                                        <div class="simple-carousel margin-top-30">
                                            <div class="owl-carousel owl-theme" id="simpleCarousel4">
                                                <c:if test="${requestScope.carLoansListoffer!=null}">
                                                    <c:forEach items="${requestScope.carLoansListoffer}"
                                                               var="SpecialcarLoansListoffer">
                                                        <div class="special-offer-item">
                                                            <div class="item-top flex align-items-center margin-bottom-20">
                                                                <div>
                                                                    <span class="bold font-20">${SpecialcarLoansListoffer.CLFatual}</span>
                                                                    <span>Տարեկան</span>
                                                                </div>
                                                                <div>
                                                                    <span class="bold font-20">${SpecialcarLoansListoffer.CLMaxPeriodMonths} Ամիս</span>
                                                                    <span>վարկի ժամկետը</span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <a class="def-button btn-blue" href="">Իմանալ ավելին</a>
                                                            </div>
                                                            <div class="item-bottom flex align-items-center margin-top-30 margin-bottom-15">
                                                                <div class="item-img">
                                                                    <img src="${SpecialcarLoansListoffer.banksList}"/>
                                                                </div>
                                                                <div>
                                                                    <span>${SpecialcarLoansListoffer.productName}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ############################################################ Car loan ENDS -->
                                <!-- ############################################################ agricultural STARTS -->
                                <div class="tab-content" id="agricultural">
                                    <div class="top">
                                        <a href="AClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}"
                                           class="green-link width-icon"> <i
                                                class="icon-grid"></i> <span>Գյուղատնտեսության բոլոր առաջարկները</span>
                                        </a>
                                    </div>
                                    <div>
                                        <div class="simple-carousel margin-top-30">
                                            <div class="owl-carousel owl-theme" id="simpleCarousel5">
                                                <c:if test="${requestScope.agriculturalCreditListoffer!=null}">
                                                    <c:forEach
                                                            items="${requestScope.agriculturalCreditListoffer}"
                                                            var="SpecialagriculturalCreditListoffer">
                                                        <div class="special-offer-item">
                                                            <div class="item-top flex align-items-center margin-bottom-20">
                                                                <div>
                                                                    <span class="bold font-20">${SpecialagriculturalCreditListoffer.ACFactual}</span>
                                                                    <span>Տարեկան</span>
                                                                </div>
                                                                <div>
                                                                    <span class="bold font-20">${SpecialagriculturalCreditListoffer.ACMaxPeriodMonth} Ամիս</span>
                                                                    <span>վարկի ժամկետը</span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <a class="def-button btn-blue" href="">Իմանալ ավելին</a>
                                                            </div>
                                                            <div class="item-bottom flex align-items-center margin-top-30 margin-bottom-15">
                                                                <div class="item-img">
                                                                    <img src="${SpecialagriculturalCreditListoffer.banksList}"/>
                                                                </div>
                                                                <div>
                                                                    <span>${SpecialagriculturalCreditListoffer.productName}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ############################################################ agricultural ENDS -->
                                <!-- ############################################################ card STARTS -->
                                <div class="tab-content" id="card">
                                    <div class="top">
                                        <a href="CardClient?Currancy=${requestScope.PageCurrancy}&&Dram=AMD&&Ruble=OFF&&Dollar=OFF&&Euro=OFF&&Cashback=Cash&&Depit=OFF&&Free=OFF&&Period=OFF&&Credit=OFF"
                                           class="green-link width-icon"> <i
                                                class="icon-grid"></i> <span>Բոլոր Քարտեր առաջարկները</span>
                                        </a>
                                    </div>
                                    <div>
                                        <div class="simple-carousel margin-top-30">
                                            <div class="owl-carousel owl-theme" id="simpleCarousel6">
                                                <c:if test="${requestScope.cardsListOffer!=null}">
                                                    <c:forEach items="${requestScope.cardsListOffer}"
                                                               var="SpecialcardsListOffer">
                                                        <div class="special-offer-item">
                                                            <div class="item-top flex align-items-center margin-bottom-20">
                                                                <div>
                                                                    <span class="bold font-20">${SpecialcardsListOffer.cardPerFactual}</span>
                                                                    <span>Տարեկան</span>
                                                                </div>
                                                                <div>
                                                                    <span class="bold font-20">${SpecialcardsListOffer.cardGracePeriod}</span>
                                                                    <span>Քարտի ժամկետը</span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <a class="def-button btn-blue" href="">Իմանալ ավելին</a>
                                                            </div>
                                                            <div class="item-bottom flex align-items-center margin-top-30 margin-bottom-15">
                                                                <div class="item-img">
                                                                    <img src="${SpecialcardsListOffer.banksList}"/>
                                                                </div>
                                                                <div>
                                                                    <span>${SpecialcardsListOffer.productName}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ############################################################ card ENDS -->

                <footer>
                    <div class="inner-container large">
                        <div class="top flex space-between">
                            <div class="flex align-items-center">
    <span class="logo">
    <img src="../images/oferta1.jpg" alt=""/>
    </span>
                            </div>
                            <div class="flex align-items-center">
                                <span class="margin-right-15 hide-for-mb">Միացեք մեզ սոցիալական ցանցերում</span> <span>
                        <span>
    <ul class="social-box">
   <jsp:include page="include/Social.jsp"/>
    </ul>
    </span>
                            </div>
                        </div>
                        <div class="bottom flex space-between align-items-center">
    <span>
    <ul>
						<li><a href="About?Currancy=${requestScope.PageCurrancy}">Մեր մասին</a></li>
						<li><a href="ContactUs?Currancy=${requestScope.PageCurrancy}">Կապ մեզ հետ</a></li>
						<li><a href="Policy?Currancy=${requestScope.PageCurrancy}">Գաղտնիության քաղաքականություն</a></li>
						<%--<li class="show-for-tablet"><a
                                href="Ofbanks?Currancy=${requestScope.PageCurrancy}">Գաղտնիության քաղաքականություն</a></li>--%>
						<%--<li class="show-for-tablet"><a
                                href="Blog?Currancy=${requestScope.PageCurrancy}"><fmt:message
                                key="Useful Articles" bundle="${Bundles}"/></a></li>--%>
					</ul>
    </span>
                            <span class="text-right">
    2009-2019 domain.am : նյութերը օգտագործելիս, հղում դեպի domain.am պարտադիր է:
    </span>
                        </div>
                    </div>
                </footer>

                <script>
                    $(function () {
                        $("#datepicker").datepicker({
                            changeMonth: true,
                            changeYear: true
                        });
                    });
                </script>
                <script type="text/javascript"
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
                <script type="text/javascript"
                        src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
                <script type="text/javascript"
                        src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>
                <script src='https://cdnjs.cloudflare.com/ajax/libs/rangeslider.js/2.3.0/rangeslider.min.js'></script>
                <script src="js/main.js"></script>
                <script src="js/search.js"></script>
                <script src="js/range.js"></script>
                <script src="js/modal.js"></script>
                <script src="libs/owl/owl.carousel.min.js"></script>
                <script src="js/carousel.js"></script>
                    <script src="js/Interval.js"></script>
                <script>
                    $(document).ready(function () {
                        sessionStorage.clear();
                        $(".linkScrollDown").click(function () {
                            let sizeScrollDown = $(window).scrollTop();
                            sessionStorage.setItem("sizeScrollDown", sizeScrollDown);
                        });
                    });
                    if (sessionStorage['sizeScrollDown']) {
                        $("html, body").animate({scrollTop: sessionStorage.getItem("sizeScrollDown")}, "slow");
                    } else {
                        console.log("empty session storage");
                    }
                </script>
                <script>
                    var acc = document.getElementsByClassName("accordion");
                    var i;

                    for (i = 0; i < acc.length; i++) {
                        acc[i].addEventListener("click", function () {
                            this.classList.toggle("active");
                            var panel = this.nextElementSibling;
                            if (panel.style.display === "block") {
                                panel.style.display = "none";
                            } else {
                                panel.style.display = "block";
                            }
                        });
                    }
                </script>
                    <script>
                        var obj;
                        obj = jQuery.parseJSON('${jsonArray}');
                        if(obj.WorningMessage==="Դուք արդեն ունեք նույն ID-ին"){
                            alert("Դուք արդեն ունեք նույն ID-ին");
                            console.log(obj.WorningMessage);

                        }else if(obj.WorningMessage==="Դուք չեք կարող 4 ից ավել համեմատել։"){
                            alert("Դուք չեք կարող 4 ից ավել համեմատել");
                            console.log(obj.WorningMessage);
                        }else {
                            console.log(obj.WorningMessage);
                        }
                    </script>


</body>
</html>
