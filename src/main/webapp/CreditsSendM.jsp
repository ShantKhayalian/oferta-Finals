<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Oferta.am</title>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/materialize.css">

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/Compare.js"></script>
    <script>
        (function ($) {
            $.fn.countTo = function (options) {
                options = options || {};

                return $(this).each(function () {
                    // set options for current element
                    var settings = $.extend({}, $.fn.countTo.defaults, {
                        from: $(this).data('from'),
                        to: $(this).data('to'),
                        speed: $(this).data('speed'),
                        refreshInterval: $(this).data('refresh-interval'),
                        decimals: $(this).data('decimals')
                    }, options);

                    // how many times to update the value, and how much to increment the value on each update
                    var loops = Math.ceil(settings.speed / settings.refreshInterval),
                        increment = (settings.to - settings.from) / loops;

                    // references & variables that will change with each update
                    var self = this,
                        $self = $(this),
                        loopCount = 0,
                        value = settings.from,
                        data = $self.data('countTo') || {};

                    $self.data('countTo', data);

                    // if an existing interval can be found, clear it first
                    if (data.interval) {
                        clearInterval(data.interval);
                    }
                    data.interval = setInterval(updateTimer, settings.refreshInterval);

                    // initialize the element with the starting value
                    render(value);

                    function updateTimer() {
                        value += increment;
                        loopCount++;

                        render(value);

                        if (typeof (settings.onUpdate) == 'function') {
                            settings.onUpdate.call(self, value);
                        }

                        if (loopCount >= loops) {
                            // remove the interval
                            $self.removeData('countTo');
                            clearInterval(data.interval);
                            value = settings.to;

                            if (typeof (settings.onComplete) == 'function') {
                                settings.onComplete.call(self, value);
                            }
                        }
                    }

                    function render(value) {
                        var formattedValue = settings.formatter.call(self, value, settings);
                        $self.html(formattedValue);
                    }
                });
            };

            $.fn.countTo.defaults = {
                from: 0,               // the number the element should start at
                to: 0,                 // the number the element should end at
                speed: 700,           // how long it should take to count between the target numbers
                refreshInterval: 70,  // how often the element should be updated
                decimals: 0,           // the number of decimal places to show
                formatter: formatter,  // handler for formatting the value before rendering
                onUpdate: null,        // callback method for every time the element is updated
                onComplete: null       // callback method for when the element finishes updating
            };

            function formatter(value, settings) {
                return value.toFixed(settings.decimals);
            }
        }(jQuery));

        jQuery(function ($) {
            // custom formatting example
            $('.count-number').data('countToOptions', {
                formatter: function (value, options) {
                    return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
                }
            });

            // start all the timers
            $('.timer').each(count);

            function count(options) {
                var $this = $(this);
                options = $.extend({}, options || {}, $this.data('countToOptions') || {});
                $this.countTo(options);
            }
        });

    </script>

</head>
<style>
    .html-content {
        position: absolute;
        top: 999999px;
    }
</style>
<body id="body">
<div class="overlay" id="overlay"></div>
<div class="overlay-box" id="overlay-box"></div>
<div class="page-container">
    <div class="fixed-header">
        <header>
            <div class="inner-container large">
                <div class="flex space-between">
                    <div class="left flex align-items-center">
               <span class="logo">
                   <a href="App?PageLanguage=${requestScope.Pagelanguage}"> <img src="../images/oferta1.jpg"
                                                                                 alt=""/></a>
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
                                class="icon-state"></i>${requestScope.City}   </span>
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
                       <%-- <span class="compere-box show-for-tablet relative">
                     <span class="compere-icon" onclick="toggleBoxes('compareTooltipMb')">
                        <span class="count">4</span>
                        <i class="icon-libra"></i>
                    </span>
                    <div class="tooltip-container bottom right" id="compareTooltipMb">
                        <div class="tooltip"> <!--Todo add 'tp-blue' class when there is no item -->
                            <span class="tooltip-title">Համեմատության</span>
                            <ul>
                                <li>
                                    <span>Սպառողական վարկ</span>
                                    <span class="bold font-14">4</span>
                                    <i class="icon-delete"></i>
                                </li>
                            </ul>
                            <!--Todo add when there is no item -->
                            <!--                            <span>Համեմատության էջում տեղ չկա</span>-->
                        </div>
                    </div>--%>
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

                    <span class="compere-icon">
                        <c:if test="${requestScope.comparListDeposit != null}">
                            <c:forEach var="size" items="${requestScope.comparListDeposit}" varStatus="TheCount">
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
                                        <input type="hidden" name="pageNameToDelete" value="Հիփոթեք">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="CreditSendMortgage"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
                                      <input name="ProductCode" value="<%=request.getAttribute("ProductCode")%>"
                                             type="hidden">
                                  <%--   <input name="value_two" value="<%=request.getParameter("value_two")%>"
                                            type="hidden">--%>
                                     <input name="percentageSecond"
                                            value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                     <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
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
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="CreditSendMortgage"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
                                      <input name="ProductCode" value="<%=request.getAttribute("ProductCode")%>"
                                             type="hidden">
                                  <%--   <input name="value_two" value="<%=request.getParameter("value_two")%>"
                                            type="hidden">--%>
                                     <input name="percentageSecond"
                                            value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                     <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
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
                                      <input type="hidden" name="pageNameToDelete" value="Հիփոթեք">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="CreditSendMortgage"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
                                      <input name="ProductCode" value="<%=request.getAttribute("ProductCode")%>"
                                             type="hidden">
                                     <%--<input name="value_two" value="<%=request.getParameter("value_two")%>"
                                            type="hidden">--%>
                                     <input name="percentageSecond"
                                            value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                     <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
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
                                       <input type="hidden" name="pageNameToDelete" value="Հիփոթեք">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="CreditSendMortgage"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
                                      <input name="ProductCode" value="<%=request.getAttribute("ProductCode")%>"
                                             type="hidden">
                                  <%--   <input name="value_two" value="<%=request.getParameter("value_two")%>"
                                            type="hidden">--%>
                                     <input name="percentageSecond"
                                            value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                     <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
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
                                         <i type="submit" class="icon-delete"
                                            onclick="document.DeleteMicro.submit();"></i>
                                </li>
                                <form action="DepositClient" method="get" name="DeleteMicro">
                                        <input type="hidden" name="pageNameToDelete" value="Հիփոթեք">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="CreditSendMortgage"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
                                      <input name="ProductCode" value="<%=request.getAttribute("ProductCode")%>"
                                             type="hidden">
                                   &lt;%&ndash;  <input name="value_two" value="<%=request.getParameter("value_two")%>"
                                            type="hidden">&ndash;%&gt;
                                     <input name="percentageSecond"
                                            value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                     <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
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
                                       <input type="hidden" name="pageNameToDelete" value="Հիփոթեք">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="CreditSendMortgage"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
                                      <input name="ProductCode" value="<%=request.getAttribute("ProductCode")%>"
                                             type="hidden">
                                   <%--  <input name="value_two" value="<%=request.getParameter("value_two")%>"
                                            type="hidden">--%>
                                     <input name="percentageSecond"
                                            value="<%=request.getParameter("percentageSecond")%>" type="hidden">
                                     <input name="options" value="<%=request.getParameter("options")%>" type="hidden">
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
    <c:if test="${requestScope.TheListM != null}">
    <c:forEach items="${requestScope.TheListM}" var="details">
    <div class="bg-white-dark padding-bottom-60 bank-item-page">
        <div class="inner-container">
            <div class="bank-header">
                <div class="bg" style="background-image: url('../../../images/10.svg')">
                    <div class="top">
                        <div class="item-logo">
                            <a href="">
                                <c:if test="${requestScope.bankList != null}">
                                    <c:forEach items="${requestScope.bankList}" var="bankImage"
                                               varStatus="page">
                                        <c:if test="${details.bankId == bankImage.bankId}">
                                            <img src="${bankImage.bankBigLogo}"/>

                                        </c:if>
                                    </c:forEach>
                                </c:if>

                            </a>
                        </div>
                        <p class="font-36">${details.productName}</p>
                        <p class="font-16">Վարկը առանց գրավի եւ բանկային հաճախորդների երաշխիքի ցանկացած նպատակի
                            համար</p>
                        <c:set var="sendRequest" value="${details.sendRequest}"/>
                        <c:set var="gotoPage" value="${details.gotoPage}"/>
                        <c:set var="lastLogic" value="${details.lastlogic}"/>
                        <c:choose>
                            <c:when test="${gotoPage == 1 || sendRequest== 1 }">
                                <a href="${details.bankLink}"
                                   class="def-button btn-green with-shadow margin-top-15 max-width-160" target="_blank">Անցնել
                                    բանկի
                                    էջ</a>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <div class="row row-flex flex flex-wrap credit-info">
                <div class="col-4 flex align-items-center item">
                    <span>Անվանական տոկոսադրույք</span><span>${details.MFatual}%</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Կանխավճար</span><span>30%</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Աշխատանքային փորձը</span><span><%=request.getParameter("months")%></span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Վարկի գումարը</span><span>${details.MMinAmount} - ${details.MMaxAmount}</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Սպասարկման վճար</span><span>${details.MMinServiceFee}</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Վարկառուի տարիքը</span><span>${details.minAge}-${details.maxAge}</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Վարկի ժամկետ</span><span>${details.MMinPeriodMonth} ամիս - ${details.MMaxPeriodMonth} Ամիս</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Արժույթ</span><span>${details.currancy}</span>
                </div>
            </div>

        </div>
    </div>

    <div class="padding-bt-60">
        <div class="inner-container">

            <div class="row-lg row-flex flex align-items-stretch main-items__left_and_right">
                <form class="credit-form" action="CreditSend" name="main">
                    <div class="col-4 left-side mobile-left__sides">
                        <div class="row-md clearfix form-row">
                            <div class="col-12">
                                <span class="label">Նպատակը</span>
                                <div class="def-select-box st-outline">
                                    <c:set var="options" value='<%=request.getParameter("options")%>'/>
                                    <c:choose>
                                        <c:when test="${options == 0}">
                                            <select name="options" onchange="document.main.submit();">
                                                <option value="0" selected>Բոլորը</option>
                                                <option value="1">Վերանորոգման վարկ</option>
                                                <option value="2">Վերաֆինանսավորում</option>
                                                <option value="3">Անշարժ գույքի ձեռք բերման վարկ</option>
                                                <option value="4">Կառուցապատման համար</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${options == 1}">
                                            <select name="options" onchange="document.main.submit();">
                                                <option value="0">Բոլորը</option>
                                                <option value="1" selected>Վերանորոգման վարկ</option>
                                                <option value="2">Վերաֆինանսավորում</option>
                                                <option value="3">Անշարժ գույքի ձեռք բերման վարկ</option>
                                                <option value="4">Կառուցապատման համար</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${options == 2}">
                                            <select name="options" onchange="document.main.submit();">
                                                <option value="0">Բոլորը</option>
                                                <option value="1">Վերանորոգման վարկ</option>
                                                <option value="2" selected>Վերաֆինանսավորում</option>
                                                <option value="3">Անշարժ գույքի ձեռք բերման վարկ</option>
                                                <option value="4">Կառուցապատման համար</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${options == 3}">
                                            <select name="options" onchange="document.main.submit();">
                                                <option value="0">Բոլորը</option>
                                                <option value="1">Վերանորոգման վարկ</option>
                                                <option value="2">Վերաֆինանսավորում</option>
                                                <option value="3" selected>Անշարժ գույքի ձեռք բերման վարկ</option>
                                                <option value="4">Կառուցապատման համար</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${options == 4}">
                                            <select name="options" onchange="document.main.submit();">
                                                <option value="0">Բոլորը</option>
                                                <option value="1">Վերանորոգման վարկ</option>
                                                <option value="2">Վերաֆինանսավորում</option>
                                                <option value="3">Անշարժ գույքի ձեռք բերման վարկ</option>
                                                <option value="4" selected>Կառուցապատման համար</option>
                                            </select>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>

                        <div class="row-md clearfix  form-row">
                            <div class="col-12">
                                <span class="label">Գույքի արժեք</span>
                                <div class="range-group">
                                    <div class="def-range int-outline">
                                        <script language="javascript" type="text/javascript">
                                            var delayTimer;
                                            function doSearch(text) {
                                                clearTimeout(delayTimer);
                                                delayTimer = setTimeout(function () {
                                                    document.main.submit()
                                                }, 2000); // Will do the ajax stuff after 1000 ms, or 1 s
                                            }

                                        </script>
                                        <c:if test="${requestScope.range!=null}">
                                            <c:forEach items="${requestScope.dropDownsListWithCurrancy}"
                                                       var="dropDownList2"
                                                       varStatus="loop">

                                                <output style="display: none;" id="outputer"></output>

                                                <input type="text" name="value" min="${dropDownList2.minAmount}"
                                                       max="${dropDownList2.maxAmount}"
                                                       step="${dropDownList2.steps}"
                                                       value="${requestScope.Amountfiltered}"
                                                       oninput="showVal(this.value)"
                                                       onchange="showVal(this.value)" id="amount" inputmode="numeric">

                                                <input type="range" name="range"
                                                       min="${dropDownList2.minAmount}"
                                                       max="${dropDownList2.maxAmount}"
                                                       step="${dropDownList2.steps}"
                                                       value="${requestScope.Amountfiltered}"
                                                       data-rangeslider=""
                                                       id="amount_range"
                                                       style="position: absolute; width: 1px; height: 1px; overflow: hidden; opacity: 0;"
                                                       onchange="doSearch();">

                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${requestScope.range==null}">
                                            <c:forEach items="${requestScope.dropDownsListWithCurrancy}"
                                                       var="dropDownList3"
                                                       varStatus="loop">

                                                <output style="display: none;" id="outputer"></output>

                                                <input type="text" name="value" min="${dropDownList3.minAmount}"
                                                       max="${dropDownList3.maxAmount}"
                                                       step="${dropDownList3.steps}"
                                                       value="${requestScope.Amountfiltered}"
                                                       oninput="showVal(this.value)"
                                                       onchange="showVal(this.value)" id="amount" inputmode="numeric">

                                                <input type="range" name="range"
                                                       min="${dropDownList3.minAmount}"
                                                       max="${dropDownList3.maxAmount}"
                                                       step="${dropDownList3.steps}"
                                                       value="${requestScope.Amountfiltered}" data-rangeslider
                                                       id="amount_range" onchange="doSearch();">


                                                <input type="hidden" name="value_url" id="value_amount_url">

                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="def-select-box st-outline">
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
                        </div>

                        <div class="row-md clearfix  form-row">
                            <div class="col-12">
                                <span class="label">Կանխավճար</span>
                                <div class="range-group">
                                    <div class="def-range int-outline">
                                        <c:if test="${requestScope.valueTwo!=null}">
                                            <c:forEach items="${requestScope.dropDownsListWithCurrancy}"
                                                       var="dropDownList2"
                                                       varStatus="loop">
                                                <c:set value="${dropDownList2.minAmount}" var="AmountDiscounted"
                                                       scope="request"/>
                                                <c:set value='<%=request.getAttribute("range")%>' var="AmountDiscounted"
                                                       scope="request"/>
                                                <c:set value='<%=request.getAttribute("PercentageSecond")%>'
                                                       var="percentageSecond" scope="request"/>
                                                <%!
                                                    static long discountAmount;
                                                    static long percentageForDiscount;
                                                %>
                                                <%!
                                                    long discountingAmount(long discountAmount, long percentageForDiscount) {
                                                        if (percentageForDiscount < 10) {
                                                            return (discountAmount * 10) / 100;
                                                        }
                                                        if (percentageForDiscount > 80) {
                                                            return (discountAmount * 80) / 100;
                                                        }
                                                        return (discountAmount * percentageForDiscount) / 100;
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
                                                <%
                                                    discountAmount = Long.parseLong(String.valueOf(request.getAttribute("AmountDiscounted")));
                                                    if (request.getAttribute("percentageSecond") != null) {
                                                        percentageForDiscount = Long.parseLong(String.valueOf(request.getAttribute("percentageSecond")));
                                                    } else {
                                                        percentageForDiscount = 10;
                                                    }
                                                %>
                                                <output style="display: none;" id="outputer"></output>

                                                <input type="text" name="value_two"
                                                       min="<%=MinAmount(discountAmount,10)%>"
                                                       max="<%=maximumAmount(discountAmount,80)%>"
                                                       step="${dropDownList2.steps}"
                                                       value='<%=discountingAmount(discountAmount,percentageForDiscount)%>'
                                                       oninput="showVal(this.value)"
                                                       onchange="showVal(this.value)" id="amount_two" inputmode="numeric">

                                                <input type="range" name="range_two"
                                                       min="<%=MinAmount(discountAmount,10)%>"
                                                       max="<%=maximumAmount(discountAmount,80)%>"
                                                       step="${dropDownList2.steps}"
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
                                                <c:set value="${dropDownList3.minAmount}" var="AmountDiscounted2"
                                                       scope="request"/>
                                                <c:set value='<%=request.getAttribute("PercentageSecond")%>'
                                                       var="percentageSecond2" scope="request"/>
                                                <%!
                                                    static long discountAmount2;
                                                    static long percentageForDiscount2;
                                                %>
                                                <%!
                                                    long discountingAmount2(long discountAmount, long percentageForDiscount) {
                                                        long result = (discountAmount * percentageForDiscount) / 100;
                                                        return result;
                                                    }
                                                %>
                                                <%!
                                                    long maximumAmount2(Long discountAmount) {
                                                        long result = discountAmount * 80 / 100;
                                                        return result;
                                                    }
                                                %>
                                                <%
                                                    discountAmount2 = Long.parseLong(String.valueOf(request.getAttribute("AmountDiscounted2")));
                                                    if (request.getAttribute("PercentageSecond") != null) {
                                                        percentageForDiscount2 = Long.parseLong(String.valueOf(request.getAttribute("PercentageSecond")));
                                                    } else {
                                                        percentageForDiscount2 = 10;
                                                    }
                                                %>
                                                <output style="display: none;" id="outputer"></output>

                                                <input type="text" name="value_two"
                                                       min="<%=discountingAmount2(discountAmount2,percentageForDiscount2)%>"
                                                       max="<%=maximumAmount2(discountAmount2)%>"
                                                       step="${dropDownList3.steps}"
                                                       value='<%=discountingAmount2(discountAmount2,percentageForDiscount2)%>'
                                                       oninput="showVal(this.value)"
                                                       onchange="showVal(this.value)" id="amount_two" inputmode="numeric">

                                                <input type="range" name="range_two"
                                                       min="<%=discountingAmount2(discountAmount2,percentageForDiscount2)%>"
                                                       max="<%=maximumAmount2(discountAmount2)%>"
                                                       step="${dropDownList3.steps}"
                                                       value='<%=discountingAmount2(discountAmount2,percentageForDiscount2)%>'
                                                       data-rangeslider
                                                       id="amount_range_two" onchange="doSearch();">


                                                <input type="hidden" name="value_url" id="value_amount_url">
                                                <c:set value='<%=discountingAmount2(discountAmount2,percentageForDiscount2)%>'
                                                       var="range2" scope="request"/>

                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="def-input">

                                        <input type="text" value='<%=request.getAttribute("PercentageSecond")%> %'
                                               name="percentageSecond" onchange="doSearch();"/>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row-md clearfix  form-row">
                            <div class="col-12">
                                <span class="label">Ժամկետը</span>
                                <div class="def-select-box st-outline">
                                    <c:set var="monthsSection" value='<%=request.getAttribute("months")%>'/>
                                    <c:choose>
                                        <c:when test="${monthsSection == '1'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1" selected>1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '2'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2" selected>2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '3'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3" selected>3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '4'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4" selected>4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '5'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5" selected>5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '6'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6" selected>6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '7'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7" selected>7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '8'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8" selected>8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '9'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9" selected>9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '10'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10" selected>10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '12'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12" selected>12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '15'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15" selected>15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '20'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20" selected>20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '25'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25" selected>25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${monthsSection == '30'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30" selected>30 Տարի</option>
                                            </select>
                                        </c:when>
                                        <c:otherwise>
                                            <select name="months" id="select_month"
                                                    onchange="document.main.submit();">
                                                <option value="1" selected>Բոլորը</option>
                                                <option value="1">1 Տարի</option>
                                                <option value="2">2 Տարի</option>
                                                <option value="3">3 Տարի</option>
                                                <option value="4">4 Տարի</option>
                                                <option value="5">5 Տարի</option>
                                                <option value="6">6 Տարի</option>
                                                <option value="7">7 Տարի</option>
                                                <option value="8">8 Տարի</option>
                                                <option value="9">9 Տարի</option>
                                                <option value="10">10 Տարի</option>
                                                <option value="12">12 Տարի</option>
                                                <option value="15">15 Տարի</option>
                                                <option value="20">20 Տարի</option>
                                                <option value="25">25 Տարի</option>
                                                <option value="30">30 Տարի</option>
                                            </select>
                                        </c:otherwise>
                                    </c:choose>
                                        <%-- <input type="hidden" name="select_value" id="select_month_value" value="1">--%>
                                    <input type="hidden" name="City"
                                           value='<%=request.getAttribute("city")%>'>
                                    <input type="hidden" name="MaxAmounr"
                                           value='<%=request.getParameter("MaxAmounr")%>'>
                                    <input type="hidden" name="PageToGo" value='Mortgage'>

                                </div>
                            </div>
                        </div>
                        <div class="row-md clearfix  form-row">
                            <div class="col-12">
                                <div class="total-info">
                                    <div class="flex  margin-bottom-15">
                                        <div>
                                            <p>Տոկոսը սկսած</p>
                                            <p class="font-28 bold">${details.MFatual}%</p>
                                            <c:set value="${details.MFatual}" var="MFatual"
                                                   scope="request"/>

                                            <%!
                                                static int AmountSecond;
                                                static int MonthsSet;
                                                static double percent;
                                                static int percentageSecond;
                                            %>
                                        </div>
                                        <div>
                                            <p>Ամսական վճար</p>
                                            <%!
                                                int calculatePercentage(float Amount, double Percentage, int month) {
                                                    month *= 12;
                                                    int newAmount = (int) (Amount - (Amount * percentageSecond / 100));
                                                    double percentage = (Percentage / 100) / 12;// dogosi pajanum
                                                    System.out.println("percentage " + percentage);
                                                    float addNumber1 = (float) (percentage + 1); // Avelatsnel +1
                                                    System.out.println("addNumber1 " + addNumber1);
                                                    float powerNumber = (float) Math.pow(addNumber1, -month);//enthanur avelatsadz himnagan kumari dogose
                                                    System.out.println("powerNumber " + powerNumber);
                                                    float minuesOne = (1 - powerNumber);
                                                    System.out.println("minuesOne " + minuesOne);
                                                    float AmountToPay = (float) (newAmount * percentage);
                                                    System.out.println("AmountToPay " + AmountToPay);

                                                    float result = (int) (AmountToPay / minuesOne);
                                                    return (int) result;
                                                }
                                            %>

                                                <%-- <%

                                                     double percent = (double) request.getAttribute("MFatual");
                                                     int Amount = Integer.parseInt((String) request.getAttribute("minAmount"));//100000
                                                     int month = Integer.parseInt(request.getParameter("months"));//1
                                                 %>--%>
                                            <%
                                                percentageSecond = Integer.parseInt(String.valueOf(request.getAttribute("PercentageSecond")));
                                                percent = Double.parseDouble(String.valueOf(request.getAttribute("MFatual")));
                                                if (request.getParameter("months") != null) {
                                                    MonthsSet = Integer.parseInt(request.getParameter("months"));
                                                } else {
                                                    MonthsSet = Integer.parseInt(String.valueOf(request.getAttribute("months")));
                                                }
                                                if (request.getParameter("Amount") != null) {
                                                    AmountSecond = Integer.parseInt(request.getParameter("Amount"));
                                                } else if (request.getParameter("range") != null) {
                                                    AmountSecond = Integer.parseInt(request.getParameter("range"));
                                                } else if (request.getAttribute("range") != null) {
                                                    AmountSecond = Integer.parseInt(String.valueOf(request.getAttribute("range")));
                                                } else {
                                                    AmountSecond = Integer.parseInt(String.valueOf(request.getAttribute("Amount")));
                                                }
                                            %>
                                            <h2 class="timer count-title count-number font-28 bold"
                                                data-to="<%=calculatePercentage(AmountSecond, percent, MonthsSet)%>"
                                                data-speed="1739"></h2>

                                            </p>
                                        </div>
                                    </div>
                                    <a class="green-link width-icon" id="myBtn">
                                        <i class="icon-graphic"></i>
                                        <span>Վճարման գրաֆիկ</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <c:set value='${details.gotoPage}' var="isAvilable"/>
                <c:choose>
                    <c:when test="${isAvilable == 1}">
                        <form action="CreditSend">
                            <input type="hidden" value="sendingEmail" name="Email">
                            <div class="col-8 right-side mobile-right__sides">
                                <div class="row-md clearfix  form-row">
                                    <div class="col-6">
                                        <span class="label">Անուն</span>
                                        <div class="def-input int-outline">
                                            <input type="text" name="userName" placeholder="" required/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <span class="label">Ազգանուն</span>
                                        <div class="def-input int-outline">
                                            <input type="text" name="serName" placeholder="" required/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-md clearfix  form-row">
                                    <div class="col-6">
                                        <span class="label">Հեռախոս</span>
                                        <div class="def-input int-outline">
                                            <input type="text" name="phone" placeholder="098 889 898" required
                                                   pattern="[0-9]{3}[0-9]{3}[0-9]{3}"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <span class="label">Էլ. հասցե</span>
                                        <div class="def-input int-outline">
                                            <input type="text" name="email" placeholder="" required
                                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-md clearfix  form-row">
                                    <div class="col-12">
                                        <div class="def-textarea txt-outline">
                                            <span class="label">Հաղորդագրություն</span>
                                            <textarea name="body" required></textarea>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    function isChecked(checkbox, sub1) {
                                        document.getElementById(sub1).disabled = !checkbox.checked;
                                    }
                                </script>

                                <div class="row-md clearfix  form-row">
                                    <div class="col-12">
                                        <label class="def-checkbox">
                                            <input type="checkbox" id="termsChkbx "
                                                   onchange="isChecked(this, 'sub1')"/>
                                            <span><i class="icon-check"></i></span>
                                            <span class="item-text">Ես համաձայն եմ անձնական տվյալների պահպանման և մշակման պայմանների հետ</span>
                                            <%
                                                if (request.getAttribute("message") != null) {
                                            %>
                                            <%=request.getAttribute("message")%>
                                            <%
                                                }
                                            %>
                                        </label>
                                    </div>
                                </div>
                                <div class="row-md clearfix  form-row button-row">
                                    <div class="col-12">
                                        <input type="submit" name="submit"
                                               class="def-button btn-green with-shadow max-width-160 margin-top-5"
                                               id="sub1"
                                               value="Ուղարկել հայտ" disabled="disabled"/>
                                        <input type="hidden" name="Bankid" value="${details.bankId}">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>

            </div>

            </form>
        </div>
    </div>
    </c:forEach>
    </c:if>

    <div id="myModal" class="modal modal-payment-graphic">

        <!-- Modal content -->
        <div class="modal-content">

            <div class="modal-header flex align-items-center space-between flex-wrap margin-bottom-20">
                <span class="close-btn" id="closeModal"><i class="icon-close font-16"></i></span>
                <div>
                    <p class="title font-16">Վճարման գրաֆիկ
                        <a href="javascript:CreatePDFfromHTML()" class="green align-middle margin-left-15"><i
                                class="icon-download"></i></a>
                    </p>
                </div>
                <div class="switch">
                    <label>
                        <span>Հավասար մարում</span>
                        <input type="checkbox" id="checkbox">
                        <span class="lever"></span>
                        <span class="green_texts">Հավասար վարկ</span>
                    </label>
                </div>
            </div>

            <div class="modal-body scroll" id="menu2">
                <div class="clone-pdf">
                    <div class="payment-graphic-table table table-style-two menu2-payment__graphic">
                        <div class="table-row head">
                            <div class="table-cell small"><span>Ամիս</span></div>
                            <div class="table-cell"><span>Վարկի մնացորդ</span></div>
                            <div class="table-cell large"><span>Վճարվող տոկոսագումար</span></div>
                            <div class="table-cell"><span>Մարում վարկից</span></div>
                            <div class="table-cell"><span>Ընդամենը վճարում</span></div>
                        </div>

                        <c:set value='<%=request.getParameter("Amount")%>' var="AmountStart" scope="request"/>
                        <c:set value='<%=request.getParameter("range_two")%>' var="AmountStartrange_two" scope="request"/>

                        <%!

                            static int AmountOfLoan;
                            static int MonthsToPay;
                            static double percentageOfLoan;
                            static int AmountToPaycalc;
                            static int MainAmount;
                            static int loanWithMainAMount;
                            static int collect1;
                            static int AmountStartrange_two;

                        %>

                        <%
                            percentageOfLoan = percent;
                            MonthsToPay = MonthsSet;
                            AmountOfLoan = AmountSecond;
                            AmountStartrange_two = Integer.parseInt(String.valueOf(request.getAttribute("AmountStartrange_two")));

                        %>

                        <%!
                            int calculatePercentage2(int Amount, double Percentage, int month) {
                                month *= 12 - 1;
                                int newAmount = (Amount - (Amount * percentageSecond / 100));
                                double percentage = (Percentage / 100) / 12;// dogosi pajanum
                                System.out.println("percentage " + percentage);
                                float addNumber1 = (float) (percentage + 1); // Avelatsnel +1
                                System.out.println("addNumber1 " + addNumber1);
                                float powerNumber = (float) Math.pow(addNumber1, -month);//enthanur avelatsadz himnagan kumari dogose
                                System.out.println("powerNumber " + powerNumber);
                                float minuesOne = (1 - powerNumber);
                                System.out.println("minuesOne " + minuesOne);
                                AmountToPaycalc = (int) (newAmount * percentage);
                                System.out.println("AmountToPay " + AmountToPaycalc);

                                float result = (int) (AmountToPaycalc / minuesOne);
                                loanWithMainAMount = (int) (AmountToPaycalc / minuesOne);
                                //return (int) result;
                                return collect1;
                            }
                        %>


                        <%!
                            int calculatVargiMnatsort(int Amount, int i) {
                                int resul3 = 0;
                                resul3 = Amount - (calculatePercentage2(AmountOfLoan, percentageOfLoan, MonthsToPay) - vjarumDogosakumar2(AmountOfLoan, percentageOfLoan, MonthsToPay)) * i;
                                finalCaculat1 = resul3;
                                return resul3;
                            }
                        %>
                        <%!
                            int vjarumDogosakumar(float Amount, double Percentage, int month) {
                                month *= 12 - 1;
                                int newAmount = (int) (Amount - (Amount * percentageSecond / 100));
                                double percentage = (Percentage / 100) / 12;// dogosi pajanum
                                System.out.println("percentage " + percentage);
                                float addNumber1 = (float) (percentage + 1); // Avelatsnel +1
                                System.out.println("addNumber1 " + addNumber1);
                                float powerNumber = (float) Math.pow(addNumber1, -month);//enthanur avelatsadz himnagan kumari dogose
                                System.out.println("powerNumber " + powerNumber);
                                float minuesOne = (1 - powerNumber);
                                System.out.println("minuesOne " + minuesOne);
                                collect1 = (int) ((newAmount * percentage) / month);
                                finalCaculat1 += (int) (newAmount * percentage) / 8;
                                //return (int) (newAmount * percentage);
                                return collect1;
                            }
                        %>
                        <%!
                            int finalCaculat1;
                            int finalCaculat2;
                            int finalCaculat3;
                        %>
                        <%
                            finalCaculat1 = 0;
                            finalCaculat2 = 0;
                            finalCaculat3 = 0;
                        %>

                        <%!
                            int finalAmountCalculate(int Amount) {
                                int newAmount = (Amount - (Amount * percentageSecond / 100));
                                int FinalAmountresult = 0;
                                FinalAmountresult += calculatVargiMnatsort(newAmount, 0);
                                return FinalAmountresult;
                            }
                        %>
                        <%!
                            int calculatSecond(int i) {
                                int result;
                                result = (calculatThird() - vjarumDogosakumar(calculatVargiMnatsort2(AmountOfLoan, i), percentageOfLoan, MonthsToPay));
                                finalCaculat2 += result;
                                return result;
                            }
                        %>
                        <%!
                            int calculatFirst() {
                                return calculatePercentage2(AmountOfLoan, percentageOfLoan, MonthsToPay);
                            }
                        %>
                        <%!
                            int calculatThird() {
                                int result;
                                result = calculatePercentage2(AmountOfLoan, percentageOfLoan, MonthsToPay);
                                finalCaculat3 += result / 2;
                                return result;
                            }
                        %>


                        <%-- <fmt:formatNumber type="number" maxFractionDigits="3" value='<%=finalAmountCalculate(AmountOfLoan, MonthsToPay)%>'/>--%>

                        <% for (int i = 0; i <= MonthsToPay * 12 - 1; i++) {%>
                        <div class="table-row">
                            <div class="table-cell small"><span><%=i + 1 %></span></div>
                            <div class="table-cell">
                                <span> <fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value='<%=calculatVargiMnatsort2(AmountOfLoan,i)%>'/></span>
                            </div>
                            <div class="table-cell large">
                                <span> <fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value='<%=vjarumDogosakumar(calculatVargiMnatsort2(AmountOfLoan,i), percentageOfLoan, MonthsToPay) %>'/></span>
                            </div>
                            <div class="table-cell">
                                <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                        value='<%=calculatSecond(i)%>'/></span>
                            </div>
                            <div class="table-cell">
                                <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                        value='<%=calculatThird()%>'/></span>
                            </div>

                        </div>
                        <% }%>
                        <div class="table-row bottom">
                            <div class="table-cell small"><span></span></div>
                            <div class="table-cell"><span> <%--<fmt:formatNumber type="number" maxFractionDigits="3"
                                                                             value='<%=finalAmountCalculate2(AmountOfLoan)%>'/></span>--%>
                            </div>
                            <div class="table-cell large"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                  value='<%=finalCaculat1%>'/></span>
                            </div>
                            <div class="table-cell"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                            value='<%=finalCaculat2-calculatFirst()%>'/></span>
                            </div>
                            <div class="table-cell"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                            value='<%=finalCaculat3-calculatFirst()%>'/></span>
                            </div>
                        </div>
                        <div class="table-row head">
                            <div class="table-cell small"><span>Ամիս</span></div>
                            <div class="table-cell"><span>Վարկի մնացորդ</span></div>
                            <div class="table-cell large"><span>Վճարվող տոկոսագումար2</span></div>
                            <div class="table-cell"><span>Մարում վարկից</span></div>
                            <div class="table-cell"><span>Ընդամենը վճարում</span></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-body scroll" id="menu1">
                <div class="clone-pdf">
                    <div class="payment-graphic-table table table-style-two menu1-payment__graphic">
                        <div class="table-row head">
                            <div class="table-cell small"><span>Ամիս</span></div>
                            <div class="table-cell"><span>Վարկի մնացորդ</span></div>
                            <div class="table-cell large"><span>Վճարվող տոկոսագումար</span></div>
                            <div class="table-cell"><span>Մարում վարկից</span></div>
                            <div class="table-cell"><span>Ընդամենը վճարում</span></div>
                        </div>


                        <%!
                            int calculatePercentage3(float Amount, double Percentage, int month) {
                                month *= 12;
                                int newAmount = (int) (Amount - (Amount * percentageSecond / 100));

                                double percentage = (Percentage / 100) / 12;// dogosi pajanum
                                System.out.println("percentage " + percentage);
                                float addNumber1 = (float) (percentage + 1); // Avelatsnel +1
                                System.out.println("addNumber1 " + addNumber1);
                                float powerNumber = (float) Math.pow(addNumber1, -month);//enthanur avelatsadz himnagan kumari dogose
                                System.out.println("powerNumber " + powerNumber);
                                float minuesOne = (1 - powerNumber);
                                System.out.println("minuesOne " + minuesOne);
                                AmountToPaycalc = (int) (newAmount * percentage);
                                System.out.println("AmountToPay " + AmountToPaycalc);

                                float result = (int) (AmountToPaycalc / minuesOne);
                                loanWithMainAMount = (int) (AmountToPaycalc / minuesOne);
                                third2 += result;
                                return (int) result;

                            }
                        %>
                        <%!
                            static int first2;
                            static int second2;
                            static int third2;
                        %>


                        <%!
                            int calculatVargiMnatsort2(int Amount, int i) {
                                int newAmount = (Amount - (Amount * percentageSecond / 100));
                                System.out.println("newAmount " + newAmount);
                                int resul3 = 0;
                                resul3 = newAmount - (calculatePercentage(AmountOfLoan, percentageOfLoan, MonthsToPay)) * i;
                                System.out.println("resul3 " + resul3);
                                return resul3;
                            }
                        %>
                        <%!
                            int vjarumDogosakumar2(float Amount, double Percentage, int month) {
                                month *= 12;
                                int newAmount = (int) (Amount - (Amount * percentageSecond / 100));
                                double percentage = (Percentage / 100) / 12;// dogosi pajanum
                                System.out.println("percentage " + percentage);
                                float addNumber1 = (float) (percentage + 1); // Avelatsnel +1
                                System.out.println("addNumber1 " + addNumber1);
                                float powerNumber = (float) Math.pow(addNumber1, -month);//enthanur avelatsadz himnagan kumari dogose
                                System.out.println("powerNumber " + powerNumber);
                                float minuesOne = (1 - powerNumber);
                                System.out.println("minuesOne " + minuesOne);
                                first2 += (int) (newAmount * percentage);
                                return (int) (newAmount * percentage);
                            }
                        %>
                        <%!
                            int claculateThirdPart(float Amount, int month) {
                                Amount-=AmountStartrange_two;
                                int months =  month * 12;
                                int result = (int) (Amount / (months));
                                System.out.println("claculateThirdPart " + result);
                               /* int result = calculatePercentage3(AmountOfLoan, percentageOfLoan, MonthsToPay) - vjarumDogosakumar(AmountOfLoan, percentageOfLoan, MonthsToPay);
                                second2 += calculatePercentage3(AmountOfLoan, percentageOfLoan, MonthsToPay) - vjarumDogosakumar(AmountOfLoan, percentageOfLoan, MonthsToPay);*/
                                return result;
                            }
                        %>

                        <%!
                            int calculatMainMpneyDescByLoanPercentage(float Amount, double Percentage, int month, int i) {
                                int result = 0;
                                Amount -=  AmountStartrange_two;

                                result = (int) (Amount - claculateThirdPart(AmountOfLoan,MonthsToPay) * i);
                                return result;
                            }
                        %>

                        <%!
                            int finalAmountCalculate2(int Amount) {
                                int newAmount = (Amount - (Amount * percentageSecond / 100));
                                int FinalAmountresult = 0;
                                FinalAmountresult += calculatVargiMnatsort(newAmount, 0);
                                return FinalAmountresult;
                            }
                        %>
                        <%!
                            int finalInterest2(int months) {
                                int FinalInterestresult = 0;
                                FinalInterestresult += vjarumDogosakumar(AmountOfLoan, percentageOfLoan, MonthsToPay) * months;
                                return FinalInterestresult;
                            }
                        %>
                        <%!
                            int finalAMountMain2(int months) {
                                int FinalInterestresult = 0;
                                FinalInterestresult += calculatePercentage(AmountOfLoan, percentageOfLoan, MonthsToPay) * months;
                                return FinalInterestresult;
                            }
                        %>
                        <%!
                            int finalAMountPayment2(int months) {
                                int FinalInterestresult = 0;
                                int fullPaymentwithintrest = calculatePercentage(AmountOfLoan, percentageOfLoan, MonthsToPay) + vjarumDogosakumar(AmountOfLoan, percentageOfLoan, MonthsToPay);
                                FinalInterestresult += fullPaymentwithintrest * months;
                                return FinalInterestresult;
                            }
                        %>

                        <%!
                            int SumOfPercentageAndLoan(float Amount, double Percentage, int month, int i){

                                return calculatMainMpneyDescByLoanPercentage(Amount, Percentage, month, i) + vjarumDogosakumar2(AmountOfLoan, percentageOfLoan, MonthsToPay);
                            }
                        %>


                        <%-- <fmt:formatNumber type="number" maxFractionDigits="3" value='<%=finalAmountCalculate(AmountOfLoan, MonthsToPay)%>'/>--%>

                        <% for (int i = 0; i < MonthsToPay * 12; i++) {%>
                        <div class="table-row">
                            <div class="table-cell small"><span><%=i + 1%></span></div>
                            <div class="table-cell">
                                <span> <fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value='<%=calculatMainMpneyDescByLoanPercentage(AmountOfLoan,percentageOfLoan,MonthsToPay,i)%>'/></span>
                            </div>
                            <div class="table-cell large">
                                <span> <fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value='<%=vjarumDogosakumar2(calculatMainMpneyDescByLoanPercentage(AmountOfLoan,percentageOfLoan,MonthsToPay,i), percentageOfLoan, MonthsToPay) %>'/></span>
                            </div>
                            <div class="table-cell">
                                <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                        value='<%=claculateThirdPart(AmountOfLoan,MonthsToPay) %>'/></span>
                            </div>
                            <div class="table-cell">
                                <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                        value='<%=claculateThirdPart(AmountOfLoan,MonthsToPay)+vjarumDogosakumar2(AmountOfLoan, percentageOfLoan, MonthsToPay)%>'/></span>
                            </div>

                        </div>
                        <% }%>
                        <div class="table-row bottom">
                            <div class="table-cell small"><span></span></div>
                            <div class="table-cell"><span> <%--<fmt:formatNumber type="number" maxFractionDigits="3"
                                                                             value='<%=finalAmountCalculate2(AmountOfLoan)%>'/>--%></span>
                            </div>
                            <div class="table-cell large"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                                  value='<%=first2-vjarumDogosakumar2(AmountOfLoan, percentageOfLoan, MonthsToPay)%>'/></span>
                            </div>
                            <div class="table-cell"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                            value='<%=second2%>'/></span>
                            </div>
                            <div class="table-cell"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                            value='<%=third2/3%>'/></span>
                            </div>
                        </div>
                        <div class="table-row head">
                            <div class="table-cell small"><span>Ամիս</span></div>
                            <div class="table-cell"><span>Վարկի մնացորդ</span></div>
                            <div class="table-cell large"><span>Վճարվող տոկոսագումար2</span></div>
                            <div class="table-cell"><span>Մարում վարկից2</span></div>
                            <div class="table-cell"><span>Ընդամենը վճարում</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="html-content"></div>
    </div>

    <footer>
        <div class="inner-container large">
            <div class="top flex space-between">
                <div class="flex align-items-center">
                <span class="logo">
                    <img src="../images/oferta1.jpg" alt=""/>
                </span>
                </div>
                <div class="flex align-items-center">
                    <span class="margin-right-15 hide-for-mb">Միացեք մեզ սոցիալական ցանցերում</span>
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
                 <%--   <li class="show-for-tablet"><a href="index.php?page=banks">Մեր Գործընկերները</a></li>
                    <li class="show-for-tablet"><a href="index.php?page=usefull-links">Օգտակար հոդվածներ</a></li>--%>
                </ul>
            </span>
                <span class="text-right">
                2009-2019 domain.am : նյութերը օգտագործելիս, հղում դեպի domain.am պարտադիր է:
            </span>
            </div>
        </div>
    </footer>
    <script>

        $(document).ready(function () {
            $("#checkbox").change(function () {
                if ($(this).is(":checked")) {
                    $(".menu2-payment__graphic").css("display", "none");
                    $(".menu1-payment__graphic").css("display", "table");
                    $("#menu1").show();
                    $("#menu2").hide();
                }
                else {
                    $(".menu2-payment__graphic").css("display", "table");
                    $(".menu1-payment__graphic").css("display", "none");
                    $("#menu1").hide();
                    $("#menu2").show();
                }
            })
        });
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

    <script>
        $(".clone-pdf").clone().appendTo(".html-content");

        function CreatePDFfromHTML() {
            var HTML_Width = $(".html-content").width();
            var HTML_Height = $(".html-content").height();
            var top_left_margin = 15;
            var PDF_Width = HTML_Width + (top_left_margin * 2);
            var PDF_Height = (PDF_Width * 1.5) + (top_left_margin * 2);
            var canvas_image_width = HTML_Width;
            var canvas_image_height = HTML_Height;

            var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;

            html2canvas($(".html-content")[0]).then(function (canvas) {
                var imgData = canvas.toDataURL("image/jpeg", 1.0);
                var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
                pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);
                for (var i = 1; i <= totalPDFPages; i++) {
                    pdf.addPage(PDF_Width, PDF_Height);
                    pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height * i) + (top_left_margin * 4), canvas_image_width, canvas_image_height);
                }
                pdf.save("Your_PDF_Name.pdf");
            });
        }

    </script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>--%>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/rangeslider.js/2.3.0/rangeslider.min.js'></script>
    <script src="js/main.js"></script>
    <script src="js/search.js"></script>
    <script src="js/range.js"></script>
    <script src="js/range_two.js"></script>
    <script src="js/modal.js"></script>
    <script src="libs/owl/owl.carousel.min.js"></script>
    <script src="js/carousel.js"></script>

</body>
</html>
