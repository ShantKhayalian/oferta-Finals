<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 6/28/2019
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="java.util.*" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Oferta.am</title>
    <link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/DriopDownMain/dropdownstyle.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/libs/owl/owl.carousel.min.css"/>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>

</head>
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
                                class="icon-state"></i>${requestScope.City}    </span>
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

                 <%--   <%
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
                                <li onclick="document.DepositCompare.submit();">
                                    <c:forEach var="DepositCompare" items="${requestScope.comparListDeposit}"
                                               varStatus="TheCount">
                                        <c:set var="counterDeposit" value="${TheCount.count}" scope="request"/>

                                    </c:forEach>
                                     <span>Ավանդ</span>
                                    <span class="bold font-14">${counterDeposit}</span>
                                     <i class="icon-delete" onclick="document.Delete.submit();"></i>
                                    <form action="DepositClient" method="get" name="Delete">
                                        <input type="hidden" name="pageNameToDelete" value="Ավանդ">
                                        <input name="MaxAmounr" value="<%=request.getParameter("MaxAmounr")%>"
                                               type="hidden">
                                        <input name="City" value="<%=request.getParameter("City")%>" type="hidden">
                                        <input name="Currancy" value="<%=request.getParameter("Currancy")%>"
                                               type="hidden">
                                        <input name="PageToGo" value="<%=request.getParameter("PageToGo")%>"
                                               type="hidden">
                                        <input name="Amount" value="<%=request.getAttribute("range")%>" type="hidden">
                                    </form>
                                </li>
                            </ul>
                            </c:if>
                             <form action="CompareMortgage" method="get" name="MortgageCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListMortgage != null}">
                            <ul>
                                <li onclick="document.MortgageCompare.submit();">
                                    <c:forEach var="MortgagCompare" items="${requestScope.comparListMortgage}"
                                               varStatus="TheCount">
                                        <c:set var="counterMortgag" value="${TheCount.count}" scope="request"/>


                                    </c:forEach>
                                     <span>Հիփոթեք</span>
                                     <span class="bold font-14">${counterMortgag}</span>
                                        <i class="icon-delete"></i>
                                </li>
                            </ul>
                            </c:if>
                            <form action="CompareConsumer" method="get" name="ConsumerCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                             <c:if test="${requestScope.comparListConsumer != null}">
                            <ul>
                                <li onclick="document.ConsumerCompare.submit();">
                                    <c:forEach var="ConsumerCompare" items="${requestScope.comparListConsumer}"
                                               varStatus="TheCount">
                                        <c:set var="counterCompare" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                     <span>Սպառողական</span>
                                     <span class="bold font-14">${counterCompare}</span>
                                        <i class="icon-delete"></i>
                                </li>
                            </ul>
                             </c:if>
                            <form action="CompareCarLoan" method="get" name="CarLoanCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListCarLoan != null}">
                            <ul>
                                <li onclick="document.CarLoanCompare.submit();">
                                    <c:forEach var="CarLoanCompare" items="${requestScope.comparListCarLoan}"
                                               varStatus="TheCount">
                                        <c:set var="counterCarLoan" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                    <span>Ավտովարկ</span>
                                      <span class="bold font-14">${counterCarLoan}</span>
                                        <i class="icon-delete"></i>
                                </li>
                            </ul>
                            </c:if>
                            <form action="CompareMicro" method="get" name="MicroCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListMicro != null}">
                            <ul>
                                <li onclick="document.MicroCompare.submit();">
                                    <c:forEach var="MicroCompare" items="${requestScope.comparListMicro}"
                                               varStatus="TheCount">
                                        <c:set var="counterMicro" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                    <span>Միկրովարկ</span>
                                     <span class="bold font-14">${counterMicro}</span>
                                        <i class="icon-delete"></i>
                                </li>
                            </ul>
                            </c:if>
                            <form action="CompareAg" method="get" name="AgCompare">
                                <input type="hidden" name="Currancy" value="<%=request.getParameter("Currancy")%>">
                            </form>
                            <c:if test="${requestScope.comparListAg != null}">
                            <ul>
                                <li onclick="document.AgCompare.submit();">
                                    <c:forEach var="AgCompare" items="${requestScope.comparListAg}"
                                               varStatus="TheCount">
                                        <c:set var="counterAg" value="${TheCount.count}" scope="request"/>
                                    </c:forEach>
                                     <span>Գյուղատնտեսական</span>
                                      <span class="bold font-14">${counterAg}</span>
                                        <i class="icon-delete"></i>
                                </li>
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


    <div class="bg-white-dark padding-bt-60">
        <div class="inner-container">
            <div class="row-lg row-flex flex align-items-stretch flex-wrap">
                <div class="col-6">
                    <form class="contact-form" action="SendEmailFromContact" method="get"
                          onsubmit="return checkForm(this);">
                        <div class="row-md clearfix form-row">
                            <div class="col-12">
                                <span class="label">Անուն ազգանուն</span>
                                <div class="def-input int-outline">
                                    <input type="text" name="to"
                                           placeholder="Անուն ազգանուն "
                                           required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="row-md clearfix form-row">
                            <div class="col-6">
                                <span class="label">Հեռախոս</span>
                                <div class="def-input int-outline">
                                    <input type="tel" name="senderPhoneNumber"
                                           placeholder="Հեռախոս"
                                           required="required"/>
                                </div>
                            </div>
                            <div class="col-6 form-row">
                                <span class="label">Էլեկտրոնային հասցե</span>
                                <div class="def-input int-outline">
                                    <input type="email" name="senderEmailAddress"
                                           pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                           placeholder="Էլեկտրոնային հասցե"
                                           required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="row-md clearfix">
                            <div class="col-12">
                                <div class="def-textarea txt-outline">
                                    <span class="label">Հաղորդագրություն</span>
                                    <textarea name="senderMessage"
                                              placeholder="Հաղորդագրություն"
                                              required="required"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row-md clearfix form-row">
                            <div class="col-10">
                                <label class="def-checkbox">
                                    <input type="checkbox" name="termsChkbx" id="termsChkbx"/>
                                    <span><i class="icon-check"></i></span>
                                    <span class="item-text">Ես համաձայն եմ անձնական տվյալների պահպանման և մշակման պայմանների հետ</span>
                                </label>
                            </div>
                        </div>
                        <div class="row-md clearfix form-row">
                            <div class="col-12 text-center">
                                <input type="submit" value="Ուղարկել հայտ"
                                       class="def-button btn-green with-shadow max-width-160 margin-top-5"
                                       id="sub1">
                                <c:if test="${requestScope.messageSuccess != null }">
                                    <c:set var="lang" value="${requestScope.Pagelanguage}"/>
                                    <c:choose>
                                        <c:when test="${lang == 'en_US'}">
                                            <p>Your message is in our mailbox,Thank you</p>
                                        </c:when>
                                        <c:when test="${lang == 'hy_AM'}">
                                            <p>Ձեր հաղորդագրությունը մեր փոստարկղում է, շնորհակալություն</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p> Ваше сообщение в нашем почтовом ящике, спасибо</p>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${requestScope.messageError  != null}">
                                    <c:set var="lang" value="${requestScope.Pagelanguage}"/>
                                    <c:choose>
                                        <c:when test="${lang == 'en_US'}">
                                            <p>Something went wrong, please try again</p>
                                        </c:when>
                                        <c:when test="${lang == 'hy_AM'}">
                                            <p>Ինչ-որ բան չհաջողվեց, կրկին փորձեք</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p>Что-то пошло не так. Пожалуйста, попытайтесь еще раз</p>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>

                                <script type="application/javascript">
                                    document.getElementById('termsChkbx').addEventListener('click', function (e) {
                                        document.getElementById('sub1').disabled = !e.target.checked;
                                    });
                                </script>
                                <c:set var="lang" value="${requestScope.Pagelanguage}"/>
                                <c:choose>
                                    <c:when test="${lang == 'en_US'}">
                                        <script>

                                            function checkForm(form) {
                                                if (!form.termsChkbx.checked) {
                                                    alert("Please indicate that you accept the Terms and Conditions");
                                                    form.termsChkbx.focus();
                                                    return false;
                                                }
                                                return true;
                                            }

                                        </script>
                                    </c:when>
                                    <c:when test="${lang == 'hy_AM'}">
                                        <script>

                                            function checkForm(form) {
                                                if (!form.termsChkbx.checked) {
                                                    alert("Խնդրում ենք նշել, որ դուք ընդունում եք Պայմաններն ու պայմանները");
                                                    form.termsChkbx.focus();
                                                    return false;
                                                }
                                                return true;
                                            }

                                        </script>
                                    </c:when>
                                    <c:otherwise>
                                        <script>

                                            function checkForm(form) {
                                                if (!form.termsChkbx.checked) {
                                                    alert("Пожалуйста, укажите, что вы принимаете Условия использования");
                                                    form.termsChkbx.focus();
                                                    return false;
                                                }
                                                return true;
                                            }

                                        </script>
                                    </c:otherwise>
                                </c:choose>

                                <input type="hidden" name="PageLanguage" value="${requestScope.Pagelanguage}">
                                <input type="hidden" name="Currancy" value="${requestScope.PageCurrancy}">
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-6">
                    <div class="bank-info row-md row-flex flex flex-wrap">
                        <div class="col-12">
                            <p class="blue-dark">Իրավաբանական հասցե։</p>
                            <p class="font-16 bold">16, 51/1 Գարեգին Նժդեհի փողոց, Երևան 0006, Հայաստան</p>
                        </div>
                        <div class="col-12">
                            <p class="blue-dark">Աշխ. ժամերը</p>
                            <p class="font-16 bold">Երկ - Շաբ: 09:00-20:00 Կիր: Փակ է</p>
                        </div>
                        <div class="col-12">
                            <p class="blue-dark">Էլ. հասցե</p>
                            <p class="font-16 bold">info@varking.am</p>
                        </div>
                        <div class="col-12">
                            <p class="blue-dark">Հեռախոսահամար</p>
                            <p class="font-16 bold">+ 374 99 098 055</p>
                        </div>
                        <div class="col-12">
                            <p class="blue-dark">Կայք</p>
                            <p class="font-16 bold">www.oferta.am</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="img-box" style="background-image: url('/images/contact.jpg')"></div>
</div>


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
<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script src="<%=request.getContextPath()%>/js/search.js"></script>
<script src="<%=request.getContextPath()%>/js/range.js"></script>
<script src="<%=request.getContextPath()%>/js/modal.js"></script>
<script src="<%=request.getContextPath()%>/libs/owl/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/carousel.js"></script>


</body>
</html>

