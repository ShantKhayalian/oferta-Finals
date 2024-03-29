<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/12/2019
  Time: 7:05 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
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


<fmt:setBundle basename="com.ithome.web.Resources.Content"
               var="Bundles"/>--%>
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
                        <c:if test="${requestScope.comparListCarLoan != null}">
                            <c:forEach var="size" items="${requestScope.comparListCarLoan}" varStatus="TheCount">
                                <span class="count"><c:out value="${TheCount.count}"/></span>
                            </c:forEach>
                        </c:if>
                    </span>
                    <div class="tooltip-container bottom right" id="compareTooltipMb">
                        <div class="tooltip">
                            <span class="tooltip-title">Համեմատության</span>
                            <form action="CompareDeposit" method="get" name="DepositComparesmall">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListDeposit != null}">
                            <ul>
                                <li>
                                    <c:forEach var="DepositCompare" items="${requestScope.comparListDeposit}"
                                               varStatus="TheCount">
                                        <c:set var="counterDeposit" value="${TheCount.count}" scope="request"/>

                                    </c:forEach>
                                    <span onclick="document.DepositComparesmall.submit();">Ավանդ</span>
                                    <span class="bold font-14">${counterDeposit}</span>
                                     <i class="icon-delete" onclick="document.Deletesmall.submit();"></i>
                                </li>
                                   <form action="DepositClient" method="get" name="Deletesmall">
                                        <input type="hidden" name="pageNameToDelete" value="Ավանդ">
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                       <%-- <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">--%>
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
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
                                        <i type="submit" class="icon-delete"
                                           onclick="document.DeleteHipoteksmall.submit();"></i>
                                </li>
                                 <form action="DepositClient" method="get" name="DeleteHipoteksmall">
                                       <input type="hidden" name="pageNameToDelete" value="Հիփոթեք">
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                      <%--  <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">--%>
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
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
                                     <span onclick="document.ConsumerComparesmall.submit();">Սպառողական</span>
                                     <span class="bold font-14">${counterCompare}</span>
                                         <i type="submit" class="icon-delete"
                                            onclick="document.DeleteConsumersmall.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteConsumersmall">
                                        <input type="hidden" name="pageNameToDelete" value="Սպարողական">
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                       <%-- <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">--%>
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
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
                                          <i type="submit" class="icon-delete"
                                             onclick="document.DeleteCarsmall.submit();"></i>
                                </li>
                            </ul>
                                <form action="DepositClient" method="get" name="DeleteCarsmall">
                                         <input type="hidden" name="pageNameToDelete" value="Ավտովարկ">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                     <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </c:if>



                           <%-- <form action="CompareMicro" method="get" name="MicroCompare">
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
                                         <i type="submit" class="icon-delete"
                                            onclick="document.DeleteMicro.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteMicro">
                                      <input type="hidden" name="pageNameToDelete" value="ՄԻԿՐՈՎԱՐԿ">
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                      &lt;%&ndash;  <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">&ndash;%&gt;
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
                                        <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
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
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                       <%-- <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">--%>
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
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
                                        <a href="MortgageClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ՀԻՓՈԹԵՔ</a></li>
                                    <li>
                                        <a href="ConsumerClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ՍՊԱՌՈՂԱԿԱՆ ՎԱՐԿԵՐ</a>
                                    </li>
                                    <li>
                                        <a href="AutoClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ԱՎՏՈՎԱՐԿ</a></li>
                                    <li>
                                        <a href="MicroClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ՄԻԿՐՈՎԱՐԿ</a></li>
                                    <li>
                                        <a href="AClient?Currancy=${requestScope.PageCurrancy}&&Amount=${dropDownList.minAmount}&&MaxAmounr=${dropDownList.maxAmount}">ԳՅՈՒՂԱՏՆՏԵՍԱԿԱՆ
                                            ՎԱՐԿ</a>
                                    </li>
                                    <li>
                                        <a href="CardClient?Currancy=${requestScope.PageCurrancy}&&Dram=AMD&&Ruble=OFF&&Dollar=OFF&&Euro=OFF&&Cashback=Cash&&Depit=OFF&&Free=OFF&&Period=OFF&&Credit=OFF">ՔԱՐՏԵՐ</a></li>
                                </ul>
                            </c:forEach>
                        </c:if>
                    </div>
                    <!-- starting compare Section -->

                    <%--  <%
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
                        <c:if test="${requestScope.comparListCarLoan != null}">
                            <c:forEach var="size" items="${requestScope.comparListCarLoan}" varStatus="TheCount">
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
                                <li>
                                    <c:forEach var="DepositCompare" items="${requestScope.comparListDeposit}"
                                               varStatus="TheCount">
                                        <c:set var="counterDeposit" value="${TheCount.count}" scope="request"/>

                                    </c:forEach>
                                    <span onclick="document.DepositCompare.submit();">Ավանդ</span>
                                    <span class="bold font-14">${counterDeposit}</span>
                                     <i class="icon-delete" onclick="document.Delete.submit();"></i>
                                </li>
                                   <form action="DepositClient" method="get" name="Delete">
                                        <input type="hidden" name="pageNameToDelete" value="Ավանդ">
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                       <%-- <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">--%>
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
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
                                        <i type="submit" class="icon-delete"
                                           onclick="document.DeleteHipotek.submit();"></i>
                                </li>
                                 <form action="DepositClient" method="get" name="DeleteHipotek">
                                       <input type="hidden" name="pageNameToDelete" value="Հիփոթեք">
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                      <%--  <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">--%>
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
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
                                     <span onclick="document.ConsumerCompare.submit();">Սպառողական</span>
                                     <span class="bold font-14">${counterCompare}</span>
                                         <i type="submit" class="icon-delete"
                                            onclick="document.DeleteConsumer.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteConsumer">
                                        <input type="hidden" name="pageNameToDelete" value="Սպարողական">
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                       <%-- <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">--%>
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
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
                                          <i type="submit" class="icon-delete"
                                             onclick="document.DeleteCar.submit();"></i>
                                </li>
                            </ul>
                                <form action="DepositClient" method="get" name="DeleteCar">
                                         <input type="hidden" name="pageNameToDelete" value="Ավտովարկ">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                    <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                    </form>
                            </c:if>



                           <%-- <form action="CompareMicro" method="get" name="MicroCompare">
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
                                         <i type="submit" class="icon-delete"
                                            onclick="document.DeleteMicro.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteMicro">
                                      <input type="hidden" name="pageNameToDelete" value="ՄԻԿՐՈՎԱՐԿ">
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                      &lt;%&ndash;  <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">&ndash;%&gt;
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
                                        <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
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
                                        <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="AutoCalculate"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="percentageSecond"
                                               value="<%=request.getAttribute("percentageSecond")%>" type="hidden">
                                       <%-- <input name="range_two" value="<%=request.getParameter("range_two")%>" type="hidden">--%>
                                        <input name="options" value="<%=request.getParameter("options")%>"
                                               type="hidden">
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


    <div class="top-calculator top-search hyperpox-search">
        <div class="bg" style="background-image: url('../images/4.jpg')">
            <div class="inner-container info-container">
                <div class="row-md clearfix margin-bottom-0">
                    <div class="text-box col-5">
                        <p class="font-32">Ավտովարկ</p>
                        <p>Մենք կօգնենք ձեզ գտնել <br/>Շահավետ կանխիկ վարկեր</p>
                    </div>
                </div>
                <div class="row-md clearfix">
                    <div class="col-3 large col">
                        <form name="main" action="AutoCalulate" method="get">
                            <span class="label">Մուտքագրեք վարկի գումարը</span>
                            <div class="range-group">
                                <div class="def-range">
                                    <script language="javascript" type="text/javascript">
                                        var delayTimer;

                                        function doSearch(text) {
                                            clearTimeout(delayTimer);
                                            delayTimer = setTimeout(function () {
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
                                                   onchange="showVal(this.value)" id="amount">

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

                                            <output style="display: none;"></output>

                                            <input type="text" name="value" min="${dropDownList3.minAmount}"
                                                   max="${dropDownList3.maxAmount}" step="${dropDownList3.steps}"
                                                   value="${requestScope.Amountfiltered}"
                                                   oninput="showVal(this.value)"
                                                   onchange="showVal(this.value)" id="amount">

                                            <input type="range" name="range" min="${dropDownList3.minAmount}"
                                                   max="${dropDownList3.maxAmount}" step="${dropDownList3.steps}"
                                                   value="${requestScope.Amountfiltered}" data-rangeslider
                                                   id="amount_range" onchange="doSearch();">


                                            <input type="hidden" name="value_url" id="value_amount_url_two">

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
                    <div class="col-3 large col">
                        <span class="label">Կանխավճար</span>
                        <div class="range-group">
                            <div class="def-range">
                                <c:if test="${requestScope.valueTwo !=null}">
                                    <c:forEach items="${requestScope.dropDownsListWithCurrancy}"
                                               var="dropDownList2"
                                               varStatus="loop">
                                        <%--  <c:set value="${dropDownList2.minAmount}" var="AmountDiscounted" scope="request"/>--%>
                                        <c:set value='<%=request.getAttribute("range")%>' var="AmountDiscounted"
                                               scope="request"/>
                                        <c:set value='<%=request.getAttribute("percentageSecond")%>' var="percentageSecond" scope="request"/>
                                        <c:set value='${dropDownList2.steps}' var="step" scope="request"/>
                                        <%!
                                            static long discountAmount;
                                            static long percentageForDiscount;
                                            static long MainAmounts;
                                            long stepsDivid;
                                        %>
                                        <%!
                                            long discountingAmount(long discountAmount, long percentageForDiscount) {
                                                long result = ((discountAmount * percentageForDiscount) / 100);
                                                return result;
                                            }
                                        %>
                                        <%!
                                            long maximumAmount(long discountAmount, long percentageMax) {
                                                long result = discountAmount * percentageMax / 100;
                                                return result;
                                            }
                                        %>
                                        <%!
                                            long MinAmount(long discountAmount, long percentageMax) {
                                                long result = discountAmount * percentageMax / 100;
                                                return result;
                                            }
                                        %>
                                        <%!
                                            long finalStep(){
                                                long stepResult =stepsDivid/5;
                                                return stepResult;
                                            }
                                        %>

                                        <%
                                            stepsDivid = Long.parseLong(String.valueOf(request.getAttribute("step")));
                                            // MainAmounts = Integer.parseInt(String.valueOf(request.getAttribute("AmountDiscounted")));
                                            discountAmount = Long.parseLong(String.valueOf(request.getAttribute("AmountDiscounted")));
                                            if (request.getAttribute("percentageSecond") != null) {
                                                percentageForDiscount = Long.parseLong(String.valueOf(request.getAttribute("percentageSecond")));

                                            } else {
                                                percentageForDiscount = 10;
                                            }
                                        %>
                                        <output style="display: none;" id="outputer"></output>

                                        <input type="text" name="value_two" min="<%=MinAmount(discountAmount,10)%>"
                                               max="<%=maximumAmount(discountAmount,80)%>" step="<%=finalStep()%>"
                                               value='<%=discountingAmount(discountAmount,percentageForDiscount)%>'
                                               oninput="showVal(this.value)"
                                               onchange="showVal(this.value)" id="amount_two">

                                        <input type="range" name="range_two" min="<%=MinAmount(discountAmount,10)%>"
                                               max="<%=maximumAmount(discountAmount,80)%>" step="<%=finalStep()%>"
                                               value='<%=discountingAmount(discountAmount,percentageForDiscount)%>'
                                               data-rangeslider=""
                                               id="amount_range_two"
                                               style="position: absolute; width: 1px; height: 1px; overflow: hidden; opacity: 0;"
                                               onchange="doSearch();">

                                    </c:forEach>
                                </c:if>


                                <c:if test="${requestScope.valueTwo==null}">
                                    <c:forEach items="${requestScope.dropDownsListWithCurrancy}"
                                               var="dropDownList3"
                                               varStatus="loop">
                                        <c:set value="${dropDownList2.minAmount}" var="AmountDiscounted"
                                               scope="request"/>
                                        <c:set value='<%=request.getParameter("percentageSecond")%>'
                                               var="percentageSecond" scope="request"/>
                                        <c:set value='${dropDownList2.steps}' var="step2" scope="request"/>
                                        <%!
                                            long discountAmount2;
                                            long percentageForDiscount2;
                                            long Amount2;
                                            long stepsDivid2;
                                        %>
                                        <%!
                                            long discountingAmount2(long discountAmount, long percentageForDiscount) {
                                                long result = (discountAmount * percentageForDiscount) / 100;
                                                return result;
                                            }
                                        %>
                                        <%!
                                            long maximumAmount2(long discountAmount) {
                                                long result = discountAmount * 80 / 100;
                                                return result;
                                            }
                                        %>
                                        <%!
                                            long finalStep2(){
                                                long stepResult =stepsDivid2/5;
                                                return stepResult;
                                            }
                                        %>
                                        <%
                                            stepsDivid2 = Long.parseLong(String.valueOf(request.getAttribute("step2")));
                                            discountAmount2 = Long.parseLong(String.valueOf(request.getAttribute("AmountDiscounted")));
                                            if (request.getAttribute("percentageSecond") != null) {
                                                percentageForDiscount2 = (int) request.getAttribute("percentageSecond");
                                            } else {
                                                percentageForDiscount2 = 10;
                                            }
                                        %>
                                        <output style="display: none;" id="outputer"></output>

                                        <input type="text" name="value_two"
                                               min="<%=discountingAmount2(discountAmount2,percentageForDiscount2)%>"
                                               max="<%=maximumAmount2(discountAmount2)%>" step="<%=finalStep2()%>"
                                               value='<%=discountingAmount2(discountAmount2,percentageForDiscount2)%>'
                                               oninput="showVal(this.value)"
                                               onchange="showVal(this.value)" id="amount_two">

                                        <input type="range" name="range_two"
                                               min="<%=discountingAmount2(discountAmount2,percentageForDiscount2)%>"
                                               max="<%=maximumAmount2(discountAmount2)%>" step="<%=finalStep2()%>"
                                               value='<%=discountingAmount2(discountAmount2,percentageForDiscount2)%>'
                                               data-rangeslider
                                               id="amount_range" onchange="doSearch();">

                                        <input type="hidden" name="percentageSecond" value=0/>
                                        <input type="hidden" name="value_url" id="value_amount_url">



                                    </c:forEach>
                                </c:if>
                            </div>
                            <div class="def-input">
                                <c:set value="${requestScope.PageCurrancy}" var="curancy"/>
                                <c:choose>
                                    <c:when test="${curancy == 'AMD'}">
                                        <input type="text" name="percentageSecond" value="<%=percentageForDiscount%> %" onchange="document.main.submit();"/>
                                    </c:when>
                                    <c:when test="${curancy == 'USD'}">
                                        <input type="text" name="percentageSecond" value="<%=percentageForDiscount%> %" onchange="document.main.submit();"/>
                                    </c:when>
                                    <c:when test="${curancy == 'RUB'}">
                                        <input type="text" name="percentageSecond" value="<%=percentageForDiscount%> %" onchange="document.main.submit();"/>
                                    </c:when>
                                    <c:when test="${curancy == 'EUR'}">
                                        <input type="text" name="percentageSecond" value="<%=percentageForDiscount%> %" onchange="document.main.submit();"/>
                                    </c:when>
                                </c:choose>



                            </div>
                        </div>
                    </div>

                    <div class="col-2 small col">
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
                                        <option value="1" >1 ամիս</option>
                                        <option value="3"  selected>3 ամիս</option>
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
                                        <option value="1" >1 ամիս</option>
                                        <option value="3"  >3 ամիս</option>
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
                                        <option value="1" >1 ամիս</option>
                                        <option value="3"  >3 ամիս</option>
                                        <option value="6" >6 ամիս</option>
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
                                        <option value="1" >1 ամիս</option>
                                        <option value="3"  >3 ամիս</option>
                                        <option value="6" >6 ամիս</option>
                                        <option value="9" >9 ամիս</option>
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
                                        <option value="1" >1 ամիս</option>
                                        <option value="3"  >3 ամիս</option>
                                        <option value="6" >6 ամիս</option>
                                        <option value="9" >9 ամիս</option>
                                        <option value="12" >12 ամիս</option>
                                        <option value="18" selected>18 ամիս</option>
                                        <option value="24">24 ամիս</option>
                                        <option value="36">36 ամիս</option>
                                        <option value="48">48 ամիս</option>
                                        <option value="60">60 ամիս</option>
                                    </select>
                                </c:when>
                                <c:when test="${monthsSection == '24'}">
                                    <select name="months" id="select_month" onchange="document.main.submit();">
                                        <option value="1" >1 ամիս</option>
                                        <option value="3"  >3 ամիս</option>
                                        <option value="6" >6 ամիս</option>
                                        <option value="9" >9 ամիս</option>
                                        <option value="12" >12 ամիս</option>
                                        <option value="18" >18 ամիս</option>
                                        <option value="24"selected>24 ամիս</option>
                                        <option value="36">36 ամիս</option>
                                        <option value="48">48 ամիս</option>
                                        <option value="60">60 ամիս</option>
                                    </select>
                                </c:when>
                                <c:when test="${monthsSection == '36'}">
                                    <select name="months" id="select_month" onchange="document.main.submit();">
                                        <option value="1" >1 ամիս</option>
                                        <option value="3"  >3 ամիս</option>
                                        <option value="6" >6 ամիս</option>
                                        <option value="9" >9 ամիս</option>
                                        <option value="12" >12 ամիս</option>
                                        <option value="18" >18 ամիս</option>
                                        <option value="24" >24 ամիս</option>
                                        <option value="36" selected>36 ամիս</option>
                                        <option value="48">48 ամիս</option>
                                        <option value="60">60 ամիս</option>
                                    </select>
                                </c:when>
                                <c:when test="${monthsSection == '48'}">
                                    <select name="months" id="select_month" onchange="document.main.submit();">
                                        <option value="1" >1 ամիս</option>
                                        <option value="3"  >3 ամիս</option>
                                        <option value="6" >6 ամիս</option>
                                        <option value="9" >9 ամիս</option>
                                        <option value="12" >12 ամիս</option>
                                        <option value="18" >18 ամիս</option>
                                        <option value="24" >24 ամիս</option>
                                        <option value="36" >36 ամիս</option>
                                        <option value="48" selected>48 ամիս</option>
                                        <option value="60">60 ամիս</option>
                                    </select>
                                </c:when>
                                <c:when test="${monthsSection == '60'}">
                                    <select name="months" id="select_month" onchange="document.main.submit();">
                                        <option value="1" >1 ամիս</option>
                                        <option value="3"  >3 ամիս</option>
                                        <option value="6" >6 ամիս</option>
                                        <option value="9" >9 ամիս</option>
                                        <option value="12" >12 ամիս</option>
                                        <option value="18" >18 ամիս</option>
                                        <option value="24" >24 ամիս</option>
                                        <option value="36" >36 ամիս</option>
                                        <option value="48">48 ամիս</option>
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
                            <input type="hidden" name="City" value='<%=request.getAttribute("city")%>'>
                            <input type="hidden" name="MaxAmount" value='<%=request.getParameter("MaxAmount")%>'>
                        </div>
                    </div>
                    <div class="col-1-2 small col">
                        <button class="def-button btn-green">
                            <span>Գտնել</span>
                        </button>
                    </div>
                </div>
                </form>

            </div>
        </div>
    </div>
    <div class="padding-bt-60 bg-white-dark">
        <div class="inner-container">
            <div class="bookmarked-items loan-items-container  margin-bottom-40">
                <c:if test="${requestScope.depositeAseList != null}">
                    <c:forEach items="${requestScope.depositeAseList}" var="SpecialDeposit">
                        <div class="table">
                            <div class="table-row">
                                <div class="table-cell item-img">
                                    <c:forEach items="${SpecialDeposit.banksList}" var="image">
                                        <img src="${SpecialDeposit.banksList}"/>
                                    </c:forEach>
                                </div>
                                    <%-- <c:if test="${requestScope.productNameList != null}">
                                         <c:forEach items="${requestScope.productNameList}"
                                                    var="productName" varStatus="page">
                                             <c:if test="${SpecialDeposit.productCode == productName.productCode}">
                                                 <div class="table-cell">
                                                     <c:out value="${SpecialDeposit.productName}"/><br>
                                                     <p class="font-28 bold">${SpecialDeposit.CLFatual}%</p>
                                                 </div>
                                             </c:if>
                                         </c:forEach>
                                     </c:if>--%>
                                <div class="table-cell">

                                        <%-- <p>սկսած</p>--%>
                                    <c:out value="${SpecialDeposit.productName}"/>
                                    <p class="font-24 bold">${SpecialDeposit.CLFatual}%</p>
                                            <small>№ ${SpecialDeposit.productCode}</small>
                                </div>

                                <div class="table-cell">
                                    <c:set var="percentageMainMain" value="${SpecialDeposit.CLFatual}" scope="request"/>

                                    <%!
                                        int calculatePercentageMain(float Amount, double Percentage, int month) {
                                            int newAmount = (int) (Amount - (Amount *percentageForDiscount /100));
                                            double percentage = (Percentage / 100) / 12;// dogosi pajanum
                                            System.out.println("percentage " + percentage);
                                            float addNumber1 = (float) (percentage + 1); // Avelatsnel +1
                                            System.out.println("addNumber1 " + addNumber1);
                                            float powerNumber = (float) Math.pow(addNumber1, -(month));//enthanur avelatsadz himnagan kumari dogose
                                            System.out.println("powerNumber " + powerNumber);
                                            float minuesOne = (1 - powerNumber);
                                            System.out.println("minuesOne " + minuesOne);
                                            float AmountToPay = (float) (newAmount * percentage);
                                            System.out.println("AmountToPay " + AmountToPay);

                                            float result = (int) (AmountToPay / minuesOne);
                                            return (int) AmountToPay;
                                        }
                                    %>

                                    <%
                                        double percentMain = (double) request.getAttribute("percentageMainMain");
                                        int AmountMain = Integer.parseInt((String) request.getAttribute("minAmount"));//100000
                                        int monthMain = Integer.parseInt(request.getParameter("months"));//1
                                    %>
                                    <c:set value='<%=request.getParameter("Currancy")%>' var="currancy"/>
                                    <c:choose>
                                        <c:when test="${currancy == 'AMD'}">
                                            <h2 class="timer count-title count-number font-28 bold"
                                                data-to="<%=calculatePercentage(AmountMain, percentMain, monthMain) %>"
                                                data-speed="1739"></h2>
                                        </c:when>
                                        <c:when test="${currancy == 'USD'}">
                                            <h2 class="timer count-title count-number font-28 bold"
                                                data-to="<%=calculatePercentage(AmountMain, percentMain, monthMain) %>"
                                                data-speed="1739"></h2>
                                        </c:when>
                                        <c:when test="${currancy == 'RUB'}">
                                            <h2 class="timer count-title count-number font-28 bold"
                                                data-to="<%=calculatePercentage(AmountMain, percentMain, monthMain) %>"
                                                data-speed="1739"></h2>
                                        </c:when>
                                        <c:when test="${currancy == 'EUR'}">
                                            <h2 class="timer count-title count-number font-28 bold"
                                                data-to="<%=calculatePercentage(AmountMain, percentMain, monthMain) %>"
                                                data-speed="1739"></h2>
                                        </c:when>
                                    </c:choose>

                                </div>
                                <div class="table-cell">
                                        <%-- <sql:setDataSource var="db"
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
                                        <c:set value="${SpecialDeposit.productCode}"
                                               var="productCode"/>
                                        <c:if test="${productCode == productCodeSql }">
                                            <c:out value="${CommentsDao.Comment1_Am}"/>
                                            <%-- <c:out value="${CommentsDao.Comment2_Am}"/>
                                             <c:out value="${CommentsDao.Comment3_Am}"/>--%>
                                        </c:if>
                                    </c:forEach>

                                </div>
                                <div class="table-cell text-center">
                                    <c:set value="${SpecialDeposit.sendRequest}" var="isThere"/>
                                    <c:choose>
                                    <c:when test="${isThere == 1}">
                                    <c:set var="sendRequest" value="${SpecialDeposit.sendRequest}"/>
                                    <c:set var="gotoPage" value="${SpecialDeposit.gotoPage}"/>
                                    <c:set var="lastLogic" value="${SpecialDeposit.lastlogic}"/>
                                    <c:choose>
                                    <c:when test="${gotoPage == 1 || sendRequest== 1 && lastLogic== 0}">
                                    <a href="CreditSend?ProductCode=${SpecialDeposit.productCode}&&MaxAmount=<%=request.getParameter("MaxAmount")%>&&percentageSecond=<%=request.getParameter("percentageSecond")%>&&months=<%=request.getAttribute("months")%>&&PageToGo=Cars&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&range_two=<%=discountingAmount(discountAmount,percentageForDiscount)%>&&Amount=<%=request.getAttribute("range")%>"
                                       class="def-button btn-green with-shadow  margin-bottom-15">Իմանալ ավելին</a>
                                    <p>
                                        <a href="AutoCalulate?id=${SpecialDeposit.productCode}&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("city")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getAttribute("PageToGo")%>&&range=<%=request.getAttribute("Amount")%>&&PageName=AutoCalulate&&months=<%=request.getParameter("months")%>"
                                           class="blue-link font-12 linkScrollDown">Համեմատել</a>
                                        </c:when>

                                        <c:when test="${gotoPage == 0 && sendRequest== 0 && lastLogic==1}">
                                        <a href="${SpecialDeposit.bankLink}"
                                           class="def-button btn-green with-shadow  margin-bottom-15" target="_blank">Անցնել էջ</a>
                                    <p><a href="AutoCalulate?id=${SpecialDeposit.productCode}&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("city")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getAttribute("PageToGo")%>&&range=<%=request.getAttribute("Amount")%>&&PageName=AutoCalulate&&months=<%=request.getParameter("months")%>"
                                          class="blue-link font-12 linkScrollDown">Համեմատել</a>

                                        </c:when>
                                        </c:choose>

                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="sendRequest" value="${SpecialDeposit.sendRequest}"/>
                                            <c:set var="gotoPage" value="${SpecialDeposit.gotoPage}"/>
                                            <c:set var="lastLogic" value="${SpecialDeposit.lastlogic}"/>
                                        <c:choose>
                                        <c:when test="${gotoPage == 1 || sendRequest== 1}">
                                        <a href="CreditSend?ProductCode=${SpecialDeposit.productCode}&&MaxAmount=<%=request.getParameter("MaxAmount")%>&&percentageSecond=<%=request.getParameter("percentageSecond")%>&&months=<%=request.getAttribute("months")%>&&PageToGo=Cars&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&range_two=<%=discountingAmount(discountAmount,percentageForDiscount)%>&&Amount=<%=request.getAttribute("range")%>"
                                           class="def-button btn-green with-shadow  margin-bottom-15">Իմանալ
                                            ավելին</a>
                                    <p><a href="AutoCalulate?id=${SpecialDeposit.productCode}&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("city")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getAttribute("PageToGo")%>&&range=<%=request.getAttribute("Amount")%>&&PageName=AutoCalulate&&months=<%=request.getParameter("months")%>"
                                          class="blue-link font-12 linkScrollDown">Համեմատել</a>
                                        </c:when>
                                        </c:choose>
                                        <c:choose>
                                        <c:when test="${gotoPage == 0 && sendRequest==0 && lastLogic==1}">
                                        <a href="${SpecialDeposit.bankLink}"
                                           class="def-button btn-green with-shadow  margin-bottom-15" target="_blank">Անցնել էջ</a>
                                    <p><a href="AutoCalulate?id=${SpecialDeposit.productCode}&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("city")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getAttribute("PageToGo")%>&&range=<%=request.getAttribute("Amount")%>&&PageName=AutoCalulate&&months=<%=request.getParameter("months")%>"
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
            <!-- Testing section Start -->

            <div class="loan-items-container">
                <div class="table hide-for-mb">
                    <div class="table-row head sorting">
                        <div class="table-cell"><span>Բանկ</span></div>

                        <div class="table-cell">
                            <span>Տոկոս</span>
                            <c:set value="${requestScope.arrow}" var="arrow"/>
                            <c:choose>
                                <c:when test="${arrow == 0}">
                                    <i class="icon-polygon-down active"></i>
                                    <i class="icon-polygon-up " onclick="document.SortingPercentageAsec.submit();"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="icon-polygon-down "
                                       onclick="document.SortingPercentageDesc.submit();"></i>
                                    <i class="icon-polygon-up active "></i>
                                </c:otherwise>
                            </c:choose>
                            <form action="AutoCalulate" method="get" name="SortingPercentageDesc">

                                <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>" type="hidden">
                                <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                <input name="Currancy" value="<%=request.getParameter("Currancy")%>" type="hidden">
                                <input name="PageToGo" value="<%=request.getAttribute("PageToGo")%>" type="hidden">
                                <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                <input name="percentageSecond" value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                <input name="rangetwo" value="<%=request.getParameter("range_two")%>" type="hidden">
                                <input name="valueTwo" value="<%=request.getParameter("value_two")%>" type="hidden">
                                <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
                                <input name="sorting" value="AsecPercent" type="hidden">

                            </form>
                            <form action="AutoCalulate" method="get" name="SortingPercentageAsec">

                                <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>" type="hidden">
                                <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                <input name="Currancy" value="<%=request.getParameter("Currancy")%>" type="hidden">
                                <input name="PageToGo" value="<%=request.getAttribute("PageToGo")%>" type="hidden">
                                <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                <input name="percentageSecond" value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                <input name="rangetwo" value="<%=request.getParameter("range_two")%>" type="hidden">
                                <input name="valueTwo" value="<%=request.getParameter("value_two")%>" type="hidden">
                                <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
                                <input name="sorting" value="DescPercent" type="hidden">
                            </form>

                        </div>
                        <div class="table-cell">
                            <%--<c:set value="${requestScope.arrow2}" var="arrow2"/>
                            <c:choose>
                                <c:when test="${arrow2 == 0}">

                                    <i class="icon-polygon-down active"></i>
                                    <i class="icon-polygon-up "
                                       onclick="document.SortingTimeAsecAmount.submit();"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="icon-polygon-down "
                                       onclick="document.SortingTimeDescAmount.submit();"></i>
                                    <i class="icon-polygon-up active "></i>
                                </c:otherwise>
                            </c:choose>--%>
                            <span>Գումար</span>
                            <form action="AutoCalulate" method="get" name="SortingTimeDescAmount">

                                <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>" type="hidden">
                                <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                <input name="Currancy" value="<%=request.getParameter("Currancy")%>" type="hidden">
                                <input name="PageToGo" value="<%=request.getAttribute("PageToGo")%>" type="hidden">
                                <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                <input name="percentageSecond" value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                <input name="rangetwo" value="<%=request.getParameter("range_two")%>" type="hidden">
                                <input name="valueTwo" value="<%=request.getParameter("value_two")%>" type="hidden">
                                <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
                                <input name="sorting" value="DescAmount" type="hidden">

                            </form>
                            <form action="AutoCalulate" method="get" name="SortingTimeAsecAmount">

                                <input name="MaxAmount" value="<%=request.getParameter("MaxAmount")%>" type="hidden">
                                <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                <input name="Currancy" value="<%=request.getParameter("Currancy")%>" type="hidden">
                                <input name="PageToGo" value="<%=request.getAttribute("PageToGo")%>" type="hidden">
                                <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                <input name="months" value="<%=request.getParameter("months")%>" type="hidden">
                                <input name="percentageSecond" value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                <input name="rangetwo" value="<%=request.getParameter("range_two")%>" type="hidden">
                                <input name="valueTwo" value="<%=request.getParameter("value_two")%>" type="hidden">
                                <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
                                <input name="sorting" value="AsecAmount" type="hidden">
                            </form>
                        </div>
                        <div class="table-cell"><span>Պահանջներ</span></div>
                        <div class="table-cell"></div>
                    </div>
                </div>
                <div class="table">
                    <div class="table-row ">
                        <div class="table-cell item-img">

                            <c:if test="${requestScope.depositAllInRage != null}">
                                <c:forEach var="firstDepo" items="${requestScope.depositAllInRage}" varStatus="loop">
                                    <c:set var="percentageMain" value="${firstDepo.CLFatual}" scope ="request"/>
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
                                                                <a class="green-link font-12 width-icon right-icon ellipsis" >
                                                                        <%-- <span>+ առաջարկ </span> <i class="icon-arrow-down"></i>--%>
                                                                </a>
                                                            </p>
                                                        </div>
                                                            <%-- <div class="table-cell">
                                                                 <p><a href=""
                                                                       class="blue-dark-link">${firstDepo.productName}</a></p>
                                                             </div>--%>
                                                        <div class="table-cell">
                                                                <%-- <p>Տարեկան ավանդական տոկոսը</p>--%>
                                                            <c:out value="${firstDepo.productName}"/>
                                                            <p class="font-24 bold">${firstDepo.CLFatual}%</p>
                                                            <p class="font-12 bold">№ ${firstDepo.productCode}</p>
                                                        </div>
                                                            <%-- <div class="table-cell">
                                                                 <p>Ավանդի ժամկետը</p>
                                                                 <p class="font-24 bold">${firstDepo.CLMinPeriodMonths} Ամիս</p>
                                                             </div>--%>
                                                            <%-- <div class="table-cell">
                                                                 <p>Առավելագույն գումարը</p>
                                                                 <p class="font-24 bold">${firstDepo.DMaxAmount}</p>
                                                             </div>--%>

                                                        <div class="table-cell">
                                                                <%-- <p>Ձեր եկամուտը</p>--%>
                                                            <p class="font-24 bold">
                                                            <%!
                                                                int calculatePercentage(float Amount, double Percentage, int month) {
                                                                    int newAmount = (int) (Amount - (Amount *percentageForDiscount /100));
                                                                    double percentage = (Percentage / 100) / 12;// dogosi pajanum
                                                                    System.out.println("percentage " + percentage);
                                                                    float addNumber1 = (float) (percentage + 1); // Avelatsnel +1
                                                                    System.out.println("addNumber1 " + addNumber1);
                                                                    float powerNumber = (float) Math.pow(addNumber1, -(month));//enthanur avelatsadz himnagan kumari dogose
                                                                    System.out.println("powerNumber " + powerNumber);
                                                                    float minuesOne = (1 - powerNumber);
                                                                    System.out.println("minuesOne " + minuesOne);
                                                                    float AmountToPay = (float) (newAmount * percentage);
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
                                                            <c:set value='<%=request.getParameter("Currancy")%>' var="currancy"/>
                                                            <c:choose>
                                                                <c:when test="${currancy == 'AMD'}">
                                                                    <h2 class="timer count-title count-number font-28 bold"
                                                                        data-to="<%=calculatePercentage(Amount, percent, month) %>"
                                                                        data-speed="1739"></h2>

                                                                </c:when>
                                                                <c:when test="${currancy == 'USD'}">
                                                                    <h2 class="timer count-title count-number font-28 bold"
                                                                        data-to="<%=calculatePercentage(Amount, percent, month) %>"
                                                                        data-speed="1739"></h2>
                                                                </c:when>
                                                                <c:when test="${currancy == 'RUB'}">
                                                                    <h2 class="timer count-title count-number font-28 bold"
                                                                        data-to="<%=calculatePercentage(Amount, percent, month) %>"
                                                                        data-speed="1739"></h2>
                                                                </c:when>
                                                                <c:when test="${currancy == 'EUR'}">
                                                                    <h2 class="timer count-title count-number font-28 bold"
                                                                        data-to="<%=calculatePercentage(Amount, percent, month) %>"
                                                                        data-speed="1739"></h2>
                                                                </c:when>
                                                            </c:choose>
                                                        </p>
                                                        </div>
                                                        <div class="table-cell">
                                                                <%-- <sql:setDataSource var="db"
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

                                                        </div>
                                                        <div class="table-cell text-center last">
                                                            <p class="margin-bottom-20 show-for-mb text-left">
                                                                <a class="green-link font-12 width-icon right-icon ellipsis"
                                                                   onclick="toggleSubSuggestions()">
                                                                    <span><%--+5 առաջարկ --%></span> <i
                                                                        class="icon-arrow-down"></i>
                                                                </a>
                                                            </p>
                                                            <c:set var="sendRequest" value="${firstDepo.sendRequest}"/>
                                                            <c:set var="gotoPage" value="${firstDepo.gotoPage}"/>
                                                            <c:set var="lastLogic" value="${firstDepo.lastLogic}"/>
                                                            <c:choose>
                                                                <c:when test="${gotoPage == 1 || sendRequest== 1 && lastLogic == 0}">
                                                                    <a href="CreditSend?ProductCode=${firstDepo.productCode}&&MaxAmount=<%=request.getParameter("MaxAmount")%>&&percentageSecond=<%=request.getParameter("percentageSecond")%>&&months=<%=request.getAttribute("months")%>&&FromPageName=Cars&&City=<%=request.getParameter("City")%>&&Currancy=<%=request.getParameter("Currancy")%>&&range_two=<%=discountingAmount(discountAmount,percentageForDiscount)%>&&options=<%=request.getParameter("options")%>&&Amount=<%=request.getAttribute("range")%>"
                                                                       class="def-button btn-green with-shadow  margin-bottom-15">Իմանալ
                                                                        ավելին</a>
                                                                    <a href="AutoCalulate?id=${firstDepo.productCode}&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("city")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getAttribute("PageToGo")%>&&range=<%=request.getAttribute("Amount")%>&&PageName=AutoCalulate&&months=<%=request.getParameter("months")%>"
                                                                       class="blue-link font-12 linkScrollDown">Համեմատել</a>
                                                                    <%--  <p><a href="index.php?page=compare/deposit"
                                                                            class="blue-link font-12">Համեմատել</a></p>--%>

                                                                </c:when>
                                                                <c:when test="${gotoPage == 0 && sendRequest==0  && lastLogic == 1}">
                                                                    <a href=""
                                                                       class="def-button btn-green with-shadow  margin-bottom-15" target="_blank">Անցնել
                                                                        էջ</a>
                                                                    <a href="AutoCalulate?id=${firstDepo.productCode}&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("city")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getAttribute("PageToGo")%>&&range=<%=request.getAttribute("Amount")%>&&PageName=AutoCalulate&&months=<%=request.getParameter("months")%>"
                                                                       class="blue-link font-12 linkScrollDown">Համեմատել</a>
                                                                    <%--<p><a href="index.php?page=compare/deposit"
                                                                          class="blue-link font-12">Համեմատել</a></p>--%>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="AutoCalulate?id=${firstDepo.productCode}&&MaxAmounr=<%=request.getParameter("MaxAmounr")%>&&City=<%=request.getParameter("city")%>&&Currancy=<%=request.getParameter("Currancy")%>&&PageToGo=<%=request.getAttribute("PageToGo")%>&&range=<%=request.getAttribute("Amount")%>&&PageName=AutoCalulate&&months=<%=request.getParameter("months")%>"
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
						<span class="tab-link active" onclick="openTabItem(event, 'deposit')" id="defaultOpen">
                           Ավանդներ</span>
                                    <span class="tab-link" onclick="openTabItem(event, 'mortgage')">
                        Հիպոթեկային վարկ</span>
                                    <span class="tab-link" onclick="openTabItem(event, 'consumer-loan')">
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

                                        <a href="DepositClient?PageToGo=Deposits&&Currancy=${requestScope.PageCurrancy}&&Amount=<%=depositMinAmount%>&&MaxAmounr=<%=depositMaxAmount%>"
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
                                                        <c:set var="minAmountDeposit" scope="request"
                                                               value='${SpecialDeposit.DMinAmount}'/>
                                                        <c:set var="maxAmountDeposit" scope="request"
                                                               value='${SpecialDeposit.DMaxAmount}'/>
                                                        <%!
                                                            static int depositMinAmount;
                                                            static int depositMaxAmount;
                                                            static int convertMonths;
                                                        %>
                                                        <%
                                                            depositMinAmount = Integer.parseInt(String.valueOf(request.getAttribute("minAmountDeposit")));
                                                            depositMaxAmount = Integer.parseInt(String.valueOf(request.getAttribute("maxAmountDeposit")));
                                                        %>


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
                                                                        convertMonths = getMonths / 30;
                                                                    %>
                                                                    <span class="bold font-20"><%=convertMonths%> Ամիս</span>
                                                                    <span>Ավանդի ժամկետը</span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <form action="Credits" method="get">
                                                                    <input type="submit" class="def-button btn-blue"
                                                                           value="Իմանալ ավելին"/>
                                                                    <input type="hidden" name="ProductCode"
                                                                           value="${SpecialDeposit.productCode}"/>
                                                                    <input type="hidden" name="PageToGo" value="Deposit"/>
                                                                    <input type="hidden" name="Currancy"
                                                                           value="${SpecialDeposit.currancy}"/>
                                                                    <input type="hidden" name="SpecialAMount"
                                                                           value="${SpecialDeposit.DMinAmount}"/>
                                                                    <input type="hidden" name="MaxAmounr"
                                                                           value="${SpecialDeposit.DMaxAmount}"/>
                                                                        <%-- <input type="hidden" name="value_two" value="0"/>--%>
                                                                    <input type="hidden" name="months" value='<%=convertMonths%>'/>
                                                                </form>
                                                            </div>
                                                            <div>
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

                                        <a href="MortgageClient?Currancy=${requestScope.PageCurrancy}&&Amount=<%=mortgageMinAmount%>&&MaxAmounr=<%=mortgageMaxAmount%>"
                                           class="green-link width-icon">
                                            <i class="icon-grid"></i> <span>Հիփոթեքի բոլոր առաջարկները</span>
                                        </a>

                                    </div>
                                    <div>
                                        <div class="simple-carousel margin-top-30">
                                            <div class="owl-carousel owl-theme" id="simpleCarousel2">

                                                <c:if test="${requestScope.MortgageListOffer!=null}">
                                                    <c:forEach items="${requestScope.MortgageListOffer}"
                                                               var="SpecialMortgage">
                                                        <c:set var="minAmountMort" scope="request"
                                                               value='${SpecialMortgage.MMinAmount}'/>
                                                        <c:set var="maxAmountMort" scope="request"
                                                               value='${SpecialMortgage.MMaxAmount}'/>
                                                        <c:set var="maxMonthMort" scope="request"
                                                               value='${SpecialMortgage.MMaxPeriodMonth}'/>
                                                        <%!
                                                            static int mortgageMinAmount;
                                                            static int mortgageMaxAmount;
                                                            static int convertMonthsMortgage;
                                                        %>
                                                        <%
                                                            mortgageMinAmount = Integer.parseInt(String.valueOf(request.getAttribute("minAmountMort")));
                                                            mortgageMaxAmount = Integer.parseInt(String.valueOf(request.getAttribute("maxAmountMort")));
                                                            convertMonthsMortgage = Integer.parseInt(String.valueOf(request.getAttribute("maxMonthMort")));
                                                        %>
                                                        <%!
                                                            int calculateRangeTwo(int MaxAmount) {
                                                                int resulat = MaxAmount * 10 / 100;
                                                                return resulat;
                                                            }
                                                        %>
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
                                                                <form action="CreditSend" method="get">
                                                                    <input type="submit" class="def-button btn-blue"
                                                                           value="Իմանալ ավելին"/>
                                                                    <input type="hidden" name="ProductCode"
                                                                           value="${SpecialMortgage.productCode}"/>
                                                                    <input type="hidden" name="PageToGo" value="Mortgage"/>
                                                                    <input type="hidden" name="Currancy"
                                                                           value="${SpecialMortgage.currancy}"/>
                                                                    <input type="hidden" name="SpecialAMount"
                                                                           value="${SpecialMortgage.MMinAmount}"/>
                                                                    <input type="hidden" name="MaxAmounr"
                                                                           value="${SpecialMortgage.MMaxAmount}"/>
                                                                    <input type="hidden" name="value_two" value="0"/>
                                                                        <%--<input type="hidden" name="percentageSecond" value="10"/>--%>
                                                                    <input type="hidden" name="options" value="1"/>
                                                                        <%--   <input type="hidden" name="range_two"
                                                                                  value='<%=calculateRangeTwo(mortgageMinAmount)%>'/>--%>

                                                                    <input type="hidden" name="months"
                                                                           value='<%=convertMonthsMortgage%>'/>

                                                                </form>
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

                                        <a href="ConsumerClient?Currancy=${requestScope.PageCurrancy}&&Amount=<%=conMinAmount%>&&MaxAmounr=<%=contgageMaxAmount%>"
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
                                                        <c:set var="minAmountCon" scope="request"
                                                               value='${SpecialconsumerCreditListoffer.CCMinAmount}'/>
                                                        <c:set var="maxAmountCon" scope="request"
                                                               value='${SpecialconsumerCreditListoffer.CCMaxAmount}'/>
                                                        <c:set var="maxMonthCon" scope="request"
                                                               value='${SpecialconsumerCreditListoffer.CCMaxPeriodMonth}'/>
                                                        <%!
                                                            static int conMinAmount;
                                                            static int contgageMaxAmount;
                                                            static int convertMonthscon;
                                                        %>
                                                        <%
                                                            conMinAmount = Integer.parseInt(String.valueOf(request.getAttribute("minAmountMort")));
                                                            contgageMaxAmount = Integer.parseInt(String.valueOf(request.getAttribute("maxAmountMort")));
                                                            convertMonthscon = Integer.parseInt(String.valueOf(request.getAttribute("maxMonthCon")));
                                                        %>
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
                                                                <form action="CreditSend" method="get">
                                                                    <input type="submit" class="def-button btn-blue"
                                                                           value="Իմանալ ավելին"/>
                                                                    <input type="hidden" name="ProductCode"
                                                                           value="${SpecialconsumerCreditListoffer.productCode}"/>
                                                                    <input type="hidden" name="PageToGo" value="Consumer"/>
                                                                    <input type="hidden" name="Currancy"
                                                                           value="${SpecialconsumerCreditListoffer.currancy}"/>
                                                                    <input type="hidden" name="Amount"
                                                                           value="${SpecialconsumerCreditListoffer.CCMinAmount}"/>
                                                                    <input type="hidden" name="MaxAmounr"
                                                                           value="${SpecialconsumerCreditListoffer.CCMaxAmount}"/>
                                                                    <input type="hidden" name="value_two" value="1000000"/>
                                                                    <input type="hidden" name="options" value="1"/>
                                                                        <%-- <input type="hidden" name="range_two" value='30'/>--%>

                                                                    <input type="hidden" name="months"
                                                                           value='<%=convertMonthsMortgage%>'/>

                                                                </form>
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
                                        <a href="AutoClient?Currancy=${requestScope.PageCurrancy}&&Amount=<%=carMinAmount%>&&MaxAmounr=<%=cartgageMaxAmount%>"
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
                                                        <c:set var="minAmountcar" scope="request"
                                                               value='${SpecialcarLoansListoffer.CLMinAmount}'/>
                                                        <c:set var="maxAmountcar" scope="request"
                                                               value='${SpecialcarLoansListoffer.CLMaxAmount}'/>
                                                        <c:set var="maxMonthcar" scope="request"
                                                               value='${SpecialcarLoansListoffer.CLMaxPeriodMonths}'/>
                                                        <%!
                                                            static int carMinAmount;
                                                            static int cartgageMaxAmount;
                                                            static int carvertMonthscon;
                                                        %>
                                                        <%
                                                            carMinAmount = Integer.parseInt(String.valueOf(request.getAttribute("minAmountcar")));
                                                            cartgageMaxAmount = Integer.parseInt(String.valueOf(request.getAttribute("maxAmountcar")));
                                                            carvertMonthscon = Integer.parseInt(String.valueOf(request.getAttribute("maxMonthcar")));
                                                        %>
                                                        <%!
                                                            int calculateRangeTwoCar(int MaxAmount) {
                                                                int resulat = MaxAmount * 10 / 100;
                                                                return resulat;
                                                            }
                                                        %>
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

                                                                <form action="CreditSend" method="get">
                                                                    <input type="submit" class="def-button btn-blue"
                                                                           value="Իմանալ ավելին"/>
                                                                    <input type="hidden" name="ProductCode"
                                                                           value="${SpecialcarLoansListoffer.productCode}"/>
                                                                    <input type="hidden" name="PageToGo" value="Cars"/>
                                                                    <input type="hidden" name="Currancy"
                                                                           value="${SpecialcarLoansListoffer.currancy}"/>
                                                                    <input type="hidden" name="Amount"
                                                                           value="${SpecialcarLoansListoffer.CLMinAmount}"/>
                                                                    <input type="hidden" name="MaxAmount"
                                                                           value="${SpecialcarLoansListoffer.CLMaxAmount}"/>
                                                                    <input type="hidden" name="value_two" value="1000000"/>
                                                                    <input type="hidden" name="options" value="1"/>
                                                                        <%--  <input type="hidden" name="range_two"
                                                                                 value="<%=calculateRangeTwoCar(carMinAmount)%>"/>
                                                                          <input type="hidden" name="percentageSecond" value="10"/>--%>

                                                                    <input type="hidden" name="months"
                                                                           value='<%=convertMonthsMortgage%>'/>

                                                                </form>
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
                                        <a href="AClient?Currancy=${requestScope.PageCurrancy}&&Amount=<%=AGMinAmount%>&&MaxAmounr=<%=AGtgageMaxAmount%>"
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
                                                        <c:set var="minAmountAG" scope="request"
                                                               value='${SpecialagriculturalCreditListoffer.ACMinAmount}'/>
                                                        <c:set var="maxAmountAG" scope="request"
                                                               value='${SpecialagriculturalCreditListoffer.ACMaxAmount}'/>
                                                        <c:set var="maxMonthsAG" scope="request"
                                                               value='${SpecialagriculturalCreditListoffer.ACMaxPeriodMonth}'/>
                                                        <%!
                                                            static int AGMinAmount;
                                                            static int AGtgageMaxAmount;
                                                            static int carvertMonthsAG;
                                                        %>
                                                        <%
                                                            AGMinAmount = Integer.parseInt(String.valueOf(request.getAttribute("minAmountAG")));
                                                            AGtgageMaxAmount = Integer.parseInt(String.valueOf(request.getAttribute("maxAmountAG")));
                                                            carvertMonthsAG = Integer.parseInt(String.valueOf(request.getAttribute("maxMonthsAG")));
                                                        %>


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
                                                                <form action="CreditSend" method="get">
                                                                    <input type="submit" class="def-button btn-blue"
                                                                           value="Իմանալ ավելին"/>
                                                                    <input type="hidden" name="ProductCode"
                                                                           value="${SpecialagriculturalCreditListoffer.productCode}"/>
                                                                    <input type="hidden" name="PageToGo" value="AG"/>
                                                                    <input type="hidden" name="Currancy"
                                                                           value="${SpecialagriculturalCreditListoffer.currancy}"/>
                                                                    <input type="hidden" name="Amount"
                                                                           value="${SpecialagriculturalCreditListoffer.ACMinAmount}"/>
                                                                    <input type="hidden" name="MaxAmount"
                                                                           value="${SpecialagriculturalCreditListoffer.ACMaxAmount}"/>
                                                                    <input type="hidden" name="value_two" value="1000000"/>
                                                                    <input type="hidden" name="options" value="1"/>
                                                                        <%--   <input type="hidden" name="range_two" value="30"/>
                                                                           <input type="hidden" name="Per" value="10"/>--%>

                                                                    <input type="hidden" name="months"
                                                                           value='<%=convertMonthsMortgage%>'/>

                                                                </form>
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
                                                    <c:forEach items="${requestScope.cardsListOffer}" var="SpecialcardsListOffer">

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
                                                                <form action="CreditSend" method="get">
                                                                    <input type="submit" class="def-button btn-blue"
                                                                           value="Իմանալ ավելին"/>
                                                                    <input type="hidden" name="ProductCode"
                                                                           value="${SpecialcardsListOffer.productCode}"/>
                                                                    <input type="hidden" name="PageToGo" value="Cards"/>
                                                                </form>
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
                    <script src="js/range_two.js"></script>
                    <script src="js/percent.js"></script>
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
                        if (obj.WorningMessage === "Դուք արդեն ունեք նույն ID-ին") {
                            alert("Դուք արդեն ունեք նույն ID-ին");
                            console.log(obj.WorningMessage);

                        } else if (obj.WorningMessage === "Դուք չեք կարող 4 ից ավել համեմատել։") {
                            alert("Դուք չեք կարող 4 ից ավել համեմատել");
                            console.log(obj.WorningMessage);
                        } else {
                            console.log(obj.WorningMessage);
                        }
                    </script>
</body>
</html>
