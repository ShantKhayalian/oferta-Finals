<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <title>Oferta.am</title>
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
                                class="icon-state"></i> ${requestScope.City}    </span>
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

                <%--    <%
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
                                        <input name="PageToGo" value="Calculateer"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                        <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
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
                                        <input name="PageToGo" value="Calculateer"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                      <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
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
                                        <input name="PageToGo" value="Calculateer"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                     <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
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
                                        <input name="PageToGo" value="Calculateer"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                     <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
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
                                        <input name="PageToGo" value="Calculateer"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                     <input name="months" value="<%=request.getAttribute("months")%>" type="hidden">
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
    <c:if test="${requestScope.TheListCC != null}">
    <c:forEach items="${requestScope.TheListCC}" var="details">
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
                            <c:when test="${gotoPage == 1 || sendRequest== 1 && lastLogic== 0}">
                                <a href="${details.bankLink}"
                                   class="def-button btn-green with-shadow margin-top-15 max-width-160"
                                   target="_blank">Անցնել բանկի
                                    էջ</a>
                            </c:when>
                            <c:when test="${gotoPage == 0 || sendRequest== 0 && lastLogic== 1}">

                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>

            <div class="row row-flex flex flex-wrap credit-info">
                <div class="col-4 flex align-items-center item">
                    <span>Տոկոսադրույքը</span><span>${details.CCFactual}%</span>
                    <c:set value="${details.CCFactual}" var="percent" scope="request"/>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Սպասարկման վճար</span><span>${details.CCMinServiceFee}</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Փաստաթղթեր</span><span>Անձնագիր</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Վարկի գումարը</span><span>${details.CCMinAmount} - ${details.CCMaxAmount}</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Արժույթ</span><span>${requestScope.PageCurrancy}</span>
                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Վարկառուի տարիքը</span><span>${details.minAge}-${details.maxAge}</span>
                </div>

                <div class="col-4 flex align-items-center item">
                    <span>Տեւողությունը</span><span>${details.CCMinPeriodMonth} ամիս - ${details.CCMaxPeriodMonth} ամիս</span>
                </div>
                <div class="col-4 flex align-items-center item">

                </div>
                <div class="col-4 flex align-items-center item">
                    <span>Նախնական որոշում</span><span>1 ժամ</span>
                </div>

            </div>

        </div>
    </div>

    <div class="padding-bt-60">
        <div class="inner-container">
            <form class="credit-form" name="mains" action="CreditSend">
                <div class="row-lg row-flex flex align-items-stretch main-items__left_and_right">
                    <div class="col-4 left-side mobile-left__sides">

                        <div class="row-md clearfix  form-row">
                            <div class="col-12">
                                <span class="label">Մուտքագրեք վարկի գումարը</span>
                                <div class="range-group">
                                    <div class="def-range int-outline">
                                        <script language="javascript" type="text/javascript">
                                            var delayTimer;
                                            function doSearch(text) {
                                                clearTimeout(delayTimer);
                                                delayTimer = setTimeout(function () {
                                                    document.mains.submit()
                                                }, 2000); // Will do the ajax stuff after 1000 ms, or 1 s
                                            }

                                        </script>
                                        <c:if test="${requestScope.range!=null}">
                                            <c:forEach items="${requestScope.dropDownsListWithCurrancy}"
                                                       var="dropDownList2"
                                                       varStatus="loop">
                                                <%!
                                                    int amount;
                                                %>
                                                <%
                                                    if (request.getParameter("range") != null) {
                                                        amount = Integer.parseInt(String.valueOf(request.getParameter("range")));
                                                    } else if (request.getAttribute("range") != null) {
                                                        amount = Integer.parseInt(String.valueOf(request.getAttribute("range")));
                                                    } else if (request.getParameter("Amount") != null) {
                                                        amount = Integer.parseInt(String.valueOf(request.getParameter("Amount")));
                                                    } else {
                                                        amount = Integer.parseInt(String.valueOf(request.getAttribute("Amount")));
                                                    }
                                                %>
                                                <output style="display: none;" id="outputer"></output>

                                                <input type="text" name="value" min="${dropDownList2.minAmount}"
                                                       max="${dropDownList2.maxAmount}"
                                                       step="${dropDownList2.steps}"
                                                       value='<%=request.getAttribute("range")%>'
                                                       oninput="showVal(this.value)"
                                                       onchange="showVal(this.value)" id="amount" inputmode="numeric">

                                                <input type="range" name="range" min="${dropDownList2.minAmount}"
                                                       max="${dropDownList2.maxAmount}"
                                                       step="${dropDownList2.steps}"
                                                       value='<%=request.getAttribute("range")%>' data-rangeslider=""
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

                                                <input type="text" name="Amount" min="${dropDownList3.minAmount}"
                                                       max="${dropDownList3.maxAmount}"
                                                       step="${dropDownList3.steps}"
                                                       value="${dropDownList3.minAmount}"
                                                       oninput="showVal(this.value)"
                                                       onchange="showVal(this.value)" id="amount" inputmode="numeric">

                                                <input type="range" name="range" min="${dropDownList3.minAmount}"
                                                       max="${dropDownList3.maxAmount}"
                                                       step="${dropDownList3.steps}"
                                                       value="${dropDownList3.minAmount}" data-rangeslider
                                                       id="amount_range" onchange="doSearch();">



                                                <input type="hidden" name="value_url" id="value_amount_url">
                                                <c:set value="${dropDownList3.steps}" var="step"
                                                       scope="request"/>

                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="def-select-box st-outline">
                                        <c:set var="AMD" value="${requestScope.PageCurrancy }"/>
                                        <c:choose>
                                            <c:when test="${AMD == 'AMD'}">
                                                <select name="Currancy" onchange="document.mains.submit()">
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
                                                <select name="Currancy" onchange="document.mains.submit();">
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
                                                <select name="Currancy" onchange="document.mains.submit();">
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
                                                <select name="Currancy" onchange="document.mains.submit();">
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
                                <span class="label">Ժամկետը</span>
                                <div class="def-select-box">
                                    <c:set var="monthsSection" value='<%=request.getAttribute("months")%>'/>
                                    <c:choose>
                                        <c:when test="${monthsSection == '1'}">
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                            <select name="months" id="select_month"
                                                    onchange="document.mains.submit();">
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
                                    <input type="hidden" name="MaxAmounr"
                                           value='<%=request.getParameter("MaxAmounr")%>'>
                                    <input type="hidden" name="PageToGo" value='Consumer'>

                                </div>
                            </div>
                        </div>
                        <div class="row-md clearfix  form-row">
                            <div class="col-12">
                                <div class="total-info">
                                    <div class="flex  margin-bottom-15">
                                        <div>
                                            <p>Տոկոսը սկսած</p>
                                            <p class="font-28 bold">${details.CCFactual}%</p>
                                            <c:set value="${details.CCFactual}" var="CCFactual"
                                                   scope="request"/>
                                            <%!
                                                long CaluclalateMonthlypayment(long Amount, double Percentage, long month) {
                                                    double percentageYears = Percentage / 100;
                                                    long result = 0;
                                                    double P = Amount;
                                                    double n = month;
                                                    double r = percentageYears / 12;
                                                    result = (long) (Amount * r);
                                                    return result;
                                                }
                                            %>

                                            <%!
                                                static long AmountSecond;
                                                static long MonthsSet;
                                                static double percent;
                                                static long percentageSecond;
                                            %>
                                            <%
                                                percent = Double.parseDouble(String.valueOf(request.getAttribute("percent")));
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
                                        </div>
                                        <div>
                                            <p>Ամսական վճար</p>
                                            <h2 class="timer count-title count-number font-28 bold"
                                                data-to="<%=CaluclalateMonthlypayment(AmountSecond,percent,MonthsSet)%>"
                                                data-speed="1739"></h2>
                                            <%--<p class="font-28 bold"><fmt:formatNumber type="number"
                                                                                      maxFractionDigits="3"
                                                                                      value='<%=CaluclalateMonthlypayment(AmountSecond,percent,MonthsSet)%>'/></p>--%>
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
                                        <input type="checkbox" id="termsChkbx " onchange="isChecked(this, 'sub1')"/>
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
                                           class="def-button btn-green with-shadow max-width-160 margin-top-5" id="sub1"
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

        <div class="modal-body scroll" id="menu1">
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

                        static long AmountOfLoan;
                        static long MonthsToPay;
                        static double percentageOfLoan;
                        static long NewAmountCalculated;
                        static long MainAmount;
                        static long vjarumDogosakumar;
                        static long marumVargits;
                        static long AmountStartrange_two;

                    %>

                    <%
                        percentageOfLoan=0;
                        MonthsToPay=0;
                        NewAmountCalculated=0;
                        AmountOfLoan=0;
                        percentageOfLoan = percent;
                        MonthsToPay = MonthsSet;
                        AmountOfLoan=0;
                        if (request.getParameter("Amount") != null) {
                            AmountOfLoan = Long.parseLong(request.getParameter("Amount"));
                        } else if (request.getParameter("range") != null) {
                            AmountOfLoan = Long.parseLong(request.getParameter("range"));
                        } else if (request.getAttribute("range") != null) {
                            AmountOfLoan = Long.parseLong(String.valueOf(request.getAttribute("range")));
                        } else {
                            AmountOfLoan = Long.parseLong(String.valueOf(request.getAttribute("Amount")));
                        }
                        // AmountOfLoan = Long.parseLong(String.valueOf(request.getAttribute("AmountStart")));
                        NewAmountCalculated = AmountOfLoan;
                        AmountStartrange_two = Integer.parseInt(String.valueOf(request.getAttribute("AmountStartrange_two")));

                    %>

                    <%!
                        long vjarumDogosakumar(long Amount, long Months, double percentage){
                            long result = 0;
                            double P = Amount;
                            double n = Months *12;
                            double r = (percentage / 12 );
                            result = (long) (Amount * r);
                            vjarumDogosakumar = result;
                            return  result;
                        }
                    %>

                    <%!
                        long VargiMnatsort(long Amount){
                            long newAmount = Amount - entameneVjarumforAmount();
                            NewAmountCalculated= newAmount;
                            return NewAmountCalculated;
                        }
                    %>
                    <%!
                        long MarumVargits(long Amount, long Months, double percentage) {

                            long result = 0;
                            double P = Amount;
                            double n = Months *12;
                            double r = (percentage / 12 ) ;
                            double Result = P * r;
                            double ddd = Math.pow(1 + r, n);
                            double result2 = 1 / ddd;
                            double result3 = (1 - result2);
                            result  = (long) (Result / result3);
                            marumVargits = result;
                            return result;
                        }

                    %>

                    <%!
                        long entameneVjarumforAmount() {
                            return marumVargits - vjarumDogosakumar ;
                        }

                    %>

                    <%!
                        long entameneVjarum(long Amount, long Months, double percentage,long NewAmount ) {
                            return MarumVargits(Amount, Months, percentage) - vjarumDogosakumar(NewAmount,  Months,  percentage) ;
                        }

                    %>


                    <%-- <fmt:formatNumber type="number" maxFractionDigits="3" value='<%=finalAmountCalculate(AmountOfLoan, MonthsToPay)%>'/>--%>

                    <% for (int i = 0; i <= MonthsToPay * 12 - 1; i++) {%>
                    <div class="table-row">
                        <div class="table-cell small"><span><%=i + 1 %></span></div>
                        <div class="table-cell">
                                <span> <fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value='<%=VargiMnatsortHavasar(AmountOfLoan,MonthsToPay,i)%>'/></span>
                        </div>
                        <div class="table-cell large">
                                <span> <fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value='<%=vjarumDogosakumar(NewAmountCalculated,MonthsToPay,(percentageOfLoan/100)) %>'/></span>
                        </div>
                        <div class="table-cell">
                                <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                        value='<%=entameneVjarum(AmountOfLoan,MonthsToPay,(percentageOfLoan/100),NewAmountCalculated)%>'/></span>
                        </div>
                        <div class="table-cell">
                                <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                        value='<%=MarumVargits(AmountOfLoan,MonthsToPay,(percentageOfLoan/100))%>'/></span>
                        </div>

                    </div>
                    <% }%>
                    <div class="table-row bottom">
                        <div class="table-cell small"><span></span></div>
                        <div class="table-cell"><span> <%--<fmt:formatNumber type="number" maxFractionDigits="3"
                                                                             value='<%=finalAmountCalculate2(AmountOfLoan)%>'/></span>--%>
                        </div>
                        <div class="table-cell large"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                              value=''/></span>
                        </div>
                        <div class="table-cell"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                        value=''/></span>
                        </div>
                        <div class="table-cell"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                        value=''/></span>
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
                        static int first2;
                        static int second2;
                        static int third2;
                        static long NewAmountCalculatedHavasar;
                        static long marumVargitsHavasar;
                        static long vjarumDogosakumarHavasar;
                    %>

                    <%!
                        long VargyKumariMarumHavasar(long Amount, long Months){
                            long result  = Amount/Months;
                            vjarumDogosakumarHavasar= result;
                            return result;
                        }
                    %>

                    <%! long dogosakumarHavasar(long Amount, long Months,double percentage){
                        long result=0;
                        double P = Amount;
                        double n = Months;
                        double r = percentage / 12;
                        result = (long) (Amount * r);
                        return result;
                        //System.out.println(varkiGumar * r);
                    }
                    %>

                    <%!
                        long entamenVjarumHavasar(long Amount, long Months,double percentage, long newAmount){
                            long result = dogosakumarHavasar(newAmount,Months,percentage)+ VargyKumariMarumHavasar(Amount,Months);
                            return result;
                        }

                    %>

                    <%! long VargiMnatsortHavasar(long Amount, long Months, int i){
                        long newAmount = Amount - VargyKumariMarumHavasar(Amount,Months)*i;
                        NewAmountCalculatedHavasar= newAmount;
                        return NewAmountCalculatedHavasar;
                    }
                    %>

                    <% for (int i = 0; i < MonthsToPay * 12; i++) {%>
                    <div class="table-row">
                        <div class="table-cell small"><span><%=i + 1%></span></div>
                        <div class="table-cell">
                                <span> <fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value='<%=VargiMnatsortHavasar(AmountOfLoan,MonthsToPay*12,i)%>'/></span>
                        </div>
                        <div class="table-cell large">
                                <span> <fmt:formatNumber type="number" maxFractionDigits="3"
                                                         value='<%=dogosakumarHavasar(NewAmountCalculatedHavasar,MonthsToPay*12,(percentageOfLoan/100))%>'/></span>
                        </div>
                        <div class="table-cell">
                                <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                        value='<%=VargyKumariMarumHavasar(AmountOfLoan,MonthsToPay*12) %>'/></span>
                        </div>
                        <div class="table-cell">
                                <span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                        value='<%=entamenVjarumHavasar(AmountOfLoan,MonthsToPay*12,(percentageOfLoan/100),NewAmountCalculatedHavasar) %>'/></span>
                        </div>

                    </div>
                    <% }%>
                    <div class="table-row bottom">
                        <div class="table-cell small"><span></span></div>
                        <div class="table-cell"><span> <%--<fmt:formatNumber type="number" maxFractionDigits="3"
                                                                             value='<%=finalAmountCalculate2(AmountOfLoan)%>'/>--%></span>
                        </div>
                        <div class="table-cell large"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                              value=''/></span>
                        </div>
                        <div class="table-cell"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                        value=''/></span>
                        </div>
                        <div class="table-cell"><span><fmt:formatNumber type="number" maxFractionDigits="3"
                                                                        value=''/></span>
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
                   <%-- <li class="show-for-tablet"><a href="index.php?page=banks">Մեր Գործընկերները</a></li>
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
    $(function () {
        $("#datepicker").datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
</script>
<%--<script>

    $(document).ready(function() {
        $("#checkbox").change(function() {
            if($(this).is(":checked")) {
                $(".menu2-payment__graphic").css("display", "none");
                $(".menu1-payment__graphic").css("display", "table");
                $("#menu1").show();
                $("#menu2").hide();
            }
           /* else {
                $(".menu2-payment__graphic").css("display", "table");
                $(".menu1-payment__graphic").css("display", "none");
                $("#menu1").hide();
                $("#menu2").show();
            }*/
        })
    });
</script>--%>

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
