<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.util.*" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Oferta.am</title>
    <link href="<%=request.getContextPath()%>/images/favicon.ico"
          rel="shortcut icon">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/libs/owl/owl.carousel.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="js/Interval.js"></script>
</head>
<body id="body">

<div class="overlay" id="overlay"></div>
<div class="overlay-box" id="overlay-box"></div>
<div class="page-container">
    <div class="fixed-header">
        <header>
            <div class="inner-container large">
                <div class="flex space-between">
                    <div class="left flex align-items-center">
							<span class="logo"> <a href="App"><img src="../images/oferta1.jpg" alt=""/></a>
							</span> <span class="hide-for-tablet">
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
                                class="icon-state"></i> ${requestScope.City}  </span>
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

                </div>
            </div>
        </div>

    </div>


    <div class="padding-bt-60 bg-white-dark">
        <div class="inner-container">
            <div class="compare-table flex-table">
                <div class="flex align-items-center head">

                    <div class="flex-item">
                    <span class="flex align-items-center">
                        <span class="icon"><img src="../../images/icons/4.svg"/></span>
                        <span class="font-16 bold padding-left-15">Ավտովարկեր</span>
                    </span>
                    </div>

                    <c:if test="${requestScope.consumerCreditsCompareList != null}">
                        <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}">
                            <c:set value="${compare.bankId}" var="BankId" scope="request"/>
                            <%-- <sql:setDataSource var="db"
                                                driver="com.mysql.jdbc.Driver"
                                                url="jdbc:mysql://localhost:3306/oferta_oferta_datat_controller?serverTimezone=UTC&useUnicode=yes&characterEncoding=UTF-8"
                                                user="root" password="YLf{}cJ,Kvd%"/>
                            &lt;%&ndash;<sql:setDataSource var="db"
                                               driver="com.mysql.jdbc.Driver"
                                               url="jdbc:mysql://204.93.169.198:3306/oferta_oferta_datat_controller?serverTimezone=UTC&useUnicode=yes&characterEncoding=UTF-8"
                                               user="oferta_root" password="mnbvcxz00A!"/>&ndash;%&gt;
                            <sql:query dataSource="${db}" var="comment">
                                SELECT * FROM bankscontroller &lt;%&ndash;WHERE bankId=BankId&ndash;%&gt; ;
                            </sql:query>--%>
                            <div class="flex-item">
                                <div class="flex space-between">
                         <span>

                             <span class="item-img flex align-items-center">
                            <c:if test="${requestScope.BanksList != null}">
                                <c:forEach items="${requestScope.BanksList}" var="CommentsDao">
                                    <c:if test="${CommentsDao.bankId == BankId}">
                                        <img src="${CommentsDao.bankSmallLogo}"/>
                                    </c:if>
                                </c:forEach>
                            </c:if>

                                   </span>

                            <p class="margin-top-20"><a href="#"
                                                        class="green-link font-12">${compare.productName}</a></p>
                        </span>
                                    <span class="delete">
                                        <a class="icon-trash"
                                           href="CompareCarLoan?IDToRemove=${compare.idCheck}&&Currancy=<%= request.getParameter("Currancy")%>&&clientCode=${compare.SID}"></a>

                                    </span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>

                </div>

                <div class="flex align-items-center">
                    <div class="flex-item">
                        <p class="title">Տոկոսադրույք</p>
                    </div>
                    <c:if test="${requestScope.consumerCreditsCompareList != null}">
                        <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}">
                            <div class="flex-item">
                                <span>${compare.percentage}%</span>
                                <c:set var="percent" value="${compare.percentage}" scope="request"/>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>

                <div class="flex align-items-center">
                    <div class="flex-item">
                        <p class="title">Վարկի գումարը</p>
                    </div>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                    <script>
                        $(document).ready(function () {
                            var timer = null;
                            $("#start1").keydown(function () {
                                console.log("start1");
                                clearTimeout(timer);
                                timer = setTimeout(SendInfoToBack1, 1800)
                            });
                            $("#start2").keydown(function () {
                                console.log("start2");
                                clearTimeout(timer);
                                timer = setTimeout(SendInfoToBack2, 2800)
                            });
                            $("#start3").keydown(function () {
                                console.log("start3");
                                clearTimeout(timer);
                                timer = setTimeout(SendInfoToBack3, 3800)
                            });
                            $("#start4").keydown(function () {
                                console.log("start4");
                                clearTimeout(timer);
                                timer = setTimeout(SendInfoToBack4, 4800)
                            });

                            function SendInfoToBack1() {
                                var x = $("#start1").val();
                                x = x.replace(/,/g, '');
                                console.log("x = " + x);
                                if (!$.isNumeric(x)) {
                                    alert("Խնդրում ենք մուտքագրել թվեր")
                                } else if(x < 0 ){
                                    alert("Խնդրում ենք մուտքագրել Դրական թվեր")
                                } else {
                                    console.log("Սխալների մուտքագրում չկա");
                                    $("#startApp1").submit();
                                    console.log("Ներկայացվեց հաջողությամբ1")
                                }
                            }
                            function SendInfoToBack2() {
                                var x = $("#start2").val();
                                x = x.replace(/,/g, '');
                                console.log("x = " + x);
                                if (!$.isNumeric(x)) {
                                    alert("Խնդրում ենք մուտքագրել թվեր")
                                }else if(x < 0 ){
                                    alert("Խնդրում ենք մուտքագրել Դրական թվեր")
                                } else {
                                    console.log("Սխալների մուտքագրում չկա");
                                    $("#startApp2").submit();
                                    console.log("Ներկայացվեց հաջողությամբ2")
                                }
                            }
                            function SendInfoToBack3() {
                                var x = $("#start3").val();
                                x = x.replace(/,/g, '');
                                console.log("x = " + x);
                                if (!$.isNumeric(x)) {
                                    alert("Խնդրում ենք մուտքագրել թվեր")
                                }else if(x < 0 ){
                                    alert("Խնդրում ենք մուտքագրել Դրական թվեր")
                                } else {
                                    console.log("Սխալների մուտքագրում չկա");
                                    $("#startApp3").submit();
                                    console.log("Ներկայացվեց հաջողությամբ3")
                                }
                            }
                            function SendInfoToBack4() {
                                var x = $("#start4").val();
                                x = x.replace(/,/g, '');
                                console.log("x = " + x);
                                if (!$.isNumeric(x)) {
                                    alert("Խնդրում ենք մուտքագրել թվեր")
                                }else if(x < 0 ){
                                    alert("Խնդրում ենք մուտքագրել Դրական թվեր")
                                } else {
                                    console.log("Սխալների մուտքագրում չկա");
                                    $("#startApp4").submit();
                                    console.log("Ներկայացվեց հաջողությամբ4")
                                }
                            }
                        });

                    </script>
                    <c:if test="${requestScope.consumerCreditsCompareList != null}">
                        <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}"
                                   varStatus="TheCount">
                            <c:set value='<%=request.getParameter("Currancy")%>' var="currancy"/>

                            <div class="flex-item">
                                <div class="def-input int-dashed">

                                    <c:choose>
                                        <c:when test="${currancy == 'AMD'}">
                                            <form action="CompareCarLoan" method="get" name="amountSectionform"
                                                  id="startApp${TheCount.count}">
                                                <input type="text" name="NewAmount" id="start${TheCount.count}"
                                                       value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${compare.amount}"/>"
                                                       onchange="doSearch();" maxlength="9"/>
                                                <input type="hidden" name="idNew"
                                                       value='${compare.idCheck}'>
                                                <input type="hidden" name="Currancy"
                                                       value='<%=request.getParameter("Currancy")%>'>
                                                <input type="hidden" name="clientCode"
                                                       value='${compare.SID}'>
                                            </form>
                                        </c:when>
                                        <c:when test="${currancy == 'USD'}">
                                            <form action="CompareCarLoan" method="get" name="amountSectionform"
                                                  id="startApp${TheCount.count}">
                                                <input type="text" name="NewAmount" id="start${TheCount.count}"
                                                       value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${compare.amount}"/>"
                                                       onchange="doSearch();" maxlength="9"/>
                                                <input type="hidden" name="idNew"
                                                       value='${compare.idCheck}'>
                                                <input type="hidden" name="Currancy"
                                                       value='<%=request.getParameter("Currancy")%>'>
                                                <input type="hidden" name="clientCode"
                                                       value='${compare.SID}'>
                                            </form>
                                        </c:when>
                                        <c:when test="${currancy == 'EUR'}">
                                            <form action="CompareCarLoan" method="get" name="amountSectionform"
                                                  id="startApp${TheCount.count}">
                                                <input type="text" name="NewAmount" id="start${TheCount.count}"
                                                       value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${compare.amount}"/>"
                                                       onchange="doSearch();" maxlength="9"/>
                                                <input type="hidden" name="idNew"
                                                       value='${compare.idCheck}'>
                                                <input type="hidden" name="Currancy"
                                                       value='<%=request.getParameter("Currancy")%>'>
                                                <input type="hidden" name="clientCode"
                                                       value='${compare.SID}'>
                                            </form>

                                        </c:when>
                                        <c:when test="${currancy == 'RUB'}">
                                            <form action="CompareCarLoan" method="get" name="amountSectionform"
                                                  id="startApp${TheCount.count}">
                                                <input type="text" name="NewAmount" id="start${TheCount.count}"
                                                       value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${compare.amount}"/>"
                                                       onchange="doSearch();" maxlength="9"/>
                                                <input type="hidden" name="idNew"
                                                       value='${compare.idCheck}'>
                                                <input type="hidden" name="Currancy"
                                                       value='<%=request.getParameter("Currancy")%>'>
                                                <input type="hidden" name="clientCode"
                                                       value='${compare.SID}'>
                                            </form>
                                        </c:when>
                                    </c:choose>


                                </div>
                            </div>
                        </c:forEach>
                    </c:if>


                </div>

                <form action="CompareCarLoan" name="compareNewAmount" type="get">
                    <div class="flex align-items-center">
                        <div class="flex-item">
                            <p class="title">Ժամկետը </p>
                        </div>

                        <c:if test="${requestScope.consumerCreditsCompareList != null}">
                        <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}"
                                   varStatus="TheCount">
                            <%-- &lt;%&ndash; <sql:setDataSource var="db"
                                                       driver="com.mysql.jdbc.Driver"
                                                       url="jdbc:mysql://localhost:3306/oferta_oferta_datat_controller?serverTimezone=UTC&useUnicode=yes&characterEncoding=UTF-8"
                                                       user="root" password="YLf{}cJ,Kvd%"/>&ndash;%&gt;
                                    <sql:setDataSource var="db"
                                                       driver="com.mysql.jdbc.Driver"
                                                       url="jdbc:mysql://204.93.169.198:3306/oferta_oferta_datat_controller?serverTimezone=UTC&useUnicode=yes&characterEncoding=UTF-8"
                                                       user="oferta_root" password="mnbvcxz00A!"/>
                                    <sql:query dataSource="${db}" var="comment">
                                        SELECT * FROM cccontroller &lt;%&ndash;WHERE bankId=BankId&ndash;%&gt; ;
                                    </sql:query>
                                    <c:forEach var="CommentsDao" items="${comment.rows}">
                                        <c:set value="${compare.bankId}" var="bankId"/>
                                        <c:set value="${CommentsDao.bankId}" var="bankId2"/>
                                    </c:forEach>
                                    <c:if test="${bankId == bankId2}">--%>

                        <div class="flex-item">
                            <div class="def-select-box select-dashed">
                                <c:set var="monthsSection" value="${compare.months}" scope="request"/>

                                <%!
                                    int monthsFromData;
                                    static int convertToMonths;

                                %>

                                <%
                                    monthsFromData = (int) request.getAttribute("monthsSection");
                                    convertToMonths = monthsFromData;

                                %>
                                <c:choose>
                                    <c:when test='<%=convertToMonths == 1 %>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
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
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>
                                    <c:when test='<%=convertToMonths == 3%>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
                                            <option value="1" >1 ամիս</option>
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
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>
                                    <c:when test='<%=convertToMonths == 6%>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
                                            <option value="1" >1 ամիս</option>
                                            <option value="3" >3 ամիս</option>
                                            <option value="6"selected>6 ամիս</option>
                                            <option value="9">9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>
                                    <c:when test='<%=convertToMonths == 9%>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
                                            <option value="1" >1 ամիս</option>
                                            <option value="3" >3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9" selected>9 ամիս</option>
                                            <option value="12">12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>
                                    <c:when test='<%=convertToMonths == 12 %>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
                                            <option value="1" >1 ամիս</option>
                                            <option value="3" >3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9" >9 ամիս</option>
                                            <option value="12" selected>12 ամիս</option>
                                            <option value="18">18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>
                                    <c:when test='<%=convertToMonths == 18%>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
                                            <option value="1" >1 ամիս</option>
                                            <option value="3" >3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9" >9 ամիս</option>
                                            <option value="12" >12 ամիս</option>
                                            <option value="18" selected>18 ամիս</option>
                                            <option value="24">24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>
                                    <c:when test='<%=convertToMonths == 24%>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
                                            <option value="1" >1 ամիս</option>
                                            <option value="3" >3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9" >9 ամիս</option>
                                            <option value="12" >12 ամիս</option>
                                            <option value="18" >18 ամիս</option>
                                            <option value="24" selected>24 ամիս</option>
                                            <option value="36">36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>
                                    <c:when test='<%=convertToMonths == 36%>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
                                            <option value="1" >1 ամիս</option>
                                            <option value="3" >3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9" >9 ամիս</option>
                                            <option value="12" >12 ամիս</option>
                                            <option value="18" >18 ամիս</option>
                                            <option value="24" >24 ամիս</option>
                                            <option value="36" selected>36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>
                                    <c:when test='<%=convertToMonths == 48%>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
                                            <option value="1" >1 ամիս</option>
                                            <option value="3" >3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9" >9 ամիս</option>
                                            <option value="12" >12 ամիս</option>
                                            <option value="18" >18 ամիս</option>
                                            <option value="24" >24 ամիս</option>
                                            <option value="36" >36 ամիս</option>
                                            <option value="48" selected>48 ամիս</option>
                                            <option value="60">60 ամիս</option>
                                        </select>
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>
                                    <c:when test='<%=convertToMonths == 60%>'>
                                        <select name="months${TheCount.count}" id="select_month"
                                                onchange="document.compareNewAmount.submit();">
                                            <option value="1" >1 ամիս</option>
                                            <option value="3" >3 ամիս</option>
                                            <option value="6">6 ամիս</option>
                                            <option value="9" >9 ամիս</option>
                                            <option value="12" >12 ամիս</option>
                                            <option value="18" >18 ամիս</option>
                                            <option value="24" >24 ամիս</option>
                                            <option value="36" >36 ամիս</option>
                                            <option value="48">48 ամիս</option>
                                            <option value="60" selected>60 ամիս</option>
                                        </select>
                                        <input type="hidden" name="Currancy"
                                               value='<%=request.getParameter("Currancy")%>'>
                                        <input type="hidden" name="clientCode" value='${compare.SID}'>
                                        <input type="hidden" name="idCheck${TheCount.count}" value='${compare.idCheck}'>
                                    </c:when>

                                </c:choose>
                            </div>
                        </div>
                            <%-- </c:if>--%>
                        </c:forEach>
                        </c:if>
                </form>
            </div>


            <div class="flex align-items-center">
                <div class="flex-item">
                    <p class="title">Արժույթ</p>
                </div>
                <c:if test="${requestScope.consumerCreditsCompareList != null}">
                    <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}">
                        <div class="flex-item">
                            <p><%= request.getParameter("Currancy")%>
                            </p>
                        </div>
                    </c:forEach>
                </c:if>

            </div>
            <div class="flex align-items-center">
                <div class="flex-item">
                    <p class="title">Սպասարկման վճար</p>
                </div>

                <c:if test="${requestScope.consumerCreditsCompareList != null}">
                    <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}">
                        <div class="flex-item">
                            <h4 class="timer count-title count-number bold blue" data-to="${compare.service}"
                                data-speed="1739"></h4>
                                <%--<p>${compare.service}</p>--%>
                        </div>
                    </c:forEach>
                </c:if>

            </div>
            <div class="flex align-items-center">
                <div class="flex-item">
                    <span class="title blue">Ամսեկան մարում</span>
                    <span class="info-tooltip">
                        <i class="icon-info"></i>
                        <div class="tooltip-container top left">
                             <div class="tooltip tp-blue">
                                <span class="arrow"><i class="icon-polygon-down"></i></span>
                                <span>Հաշվարկված է անյուիտետային հաշվարկով</span>
                            </div>
                        </div>
                    </span>
                </div>

                <%!
                    int calculatePercentage(float Amount, double Percentage, int month) {

                        int monthConverter = month;
                        System.out.println("Months " + monthConverter);
                        System.out.println("Amount " + Amount);
                       /* double firstStep = (Percentage / 100) / 365;
                        System.out.println("firstStep " + firstStep);
                        double secondStep = 1 + firstStep;
                        System.out.println("secondStep " + secondStep);
                        double thirdStep = Math.pow(secondStep, monthConverter);
                        System.out.println("thirdStep " +thirdStep);
                        double forthStep = 1 / thirdStep;
                        System.out.println("forthStep " + forthStep);
                        double fifthStep = 1 - forthStep;
                        System.out.println("fifthStep " + fifthStep);
                        double sixestStep = Amount * Percentage;
                        System.out.println("sixestStep " + sixestStep);
                        double sevetnStep = sixestStep / 365;
                        System.out.println("sevetnStep " + sevetnStep);
                        double finalStep = (sevetnStep / fifthStep);
                        System.out.println("finalStep " + finalStep);
                        int result = (int) (Amount - finalStep);
                        System.out.println("result " + result);*/
                        double percentage = (Percentage / 100) / 12;
                        int result = (int) (((Amount * ((Percentage / 10) / 12)) / 365) * (monthConverter));
                        return result;
                    }
                %>
                <c:if test="${requestScope.consumerCreditsCompareList != null}">
                    <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}">
                        <%-- <c:set value="${compare.percentage}" var="percentages"/>--%>
                        <c:set value='${compare.amount}' var="minAmount1" scope="request"/>
                        <c:set value='${compare.months}' var="months1" scope="request"/>
                        <div class="flex-item">
                            <%!
                                double percent;
                                int Amount;
                                int month;
                            %>

                            <%
                                percent = (double) request.getAttribute("percent");
                                Amount = (int) request.getAttribute("minAmount1");//100000
                                month = (int) request.getAttribute("months1");//1
                            %>
                            <h3 class="timer count-title count-number bold blue"
                                data-to="<%=calculatePercentage(Amount, percent, (month)) %>"
                                data-speed="1739"></h3>

                        </div>
                    </c:forEach>
                </c:if>
            </div>


            <div class="flex align-items-center">
                <div class="flex-item">
                    <p class="title">Ընդհանուր վճարված գումար</p>
                </div>
                <c:if test="${requestScope.consumerCreditsCompareList != null}">
                    <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}">
                        <c:set var="percent1" value="${compare.percentage}" scope="request"/>
                        <c:set var="minAmount1" value="${compare.amount}" scope="request"/>
                        <c:set var="months1" value="${compare.months}" scope="request"/>
                        <%
                            percent = (double) request.getAttribute("percent1");
                            Amount = Integer.parseInt(String.valueOf(request.getAttribute("minAmount1")));//100000
                            month = Integer.parseInt(String.valueOf(request.getAttribute("months1")));//1
                        %>
                        <div class="flex-item">
                            <h3 class="timer count-title count-number bold blue"
                                data-to="<%=calculatePercentage(Amount, percent, month) + Amount %>"
                                data-speed="1739"></h3>

                                <%-- <p><%=calculatePercentage(Amount, percent, month) + Amount %>
                                 </p>--%>
                        </div>
                    </c:forEach>
                </c:if>

            </div>
            <div class="flex align-items-center padding-top-30">
                <div class="flex-item"></div>
                <c:if test="${requestScope.consumerCreditsCompareList != null}">
                    <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}">
                        <div class="flex-item">

                                <%-- <a class="green-link width-icon" id="myBtn">
                                     <i class="icon-graphic"></i>
                                     <span>Վճարման գրաֆիկ</span>
                                 </a>--%>

                        </div>
                    </c:forEach>
                </c:if>
            </div>


            <!-- Credits?ProductCode=1&FromPageName=Deposit&&MaxAmounr=5000000&&range=1000000&&Currancy=AMD&&value_two=1000000&&months=1-->

            <div class="flex align-items-center bottom">
                <div class="flex-item"></div>
                <c:if test="${requestScope.consumerCreditsCompareList != null}">
                    <c:forEach var="compare" items="${requestScope.consumerCreditsCompareList}">
                        <div class="flex-item">
                            <form action="CreditSend" method="get">
                                    <button class="def-button btn-blue">Իմանալ ավելին</button>
                                    <input type="hidden" name="ProductCode" value="${compare.idCheck}">
                                    <input type="hidden" name="PageToGo" value="Cars">
                                    <input type="hidden" name="range" value="${compare.amount}">
                                    <input type="hidden" name="Amount" value="${compare.amount}">
                                    <input type="hidden" name="Currancy" value='<%=request.getParameter("Currancy")%>'>
                                    <input type="hidden" name="months" value='${compare.months}'>
                                    <input type="hidden" name="City" value='<%=request.getAttribute("city")%>'>
                                    <input type="hidden" name="months" value="<%=convertToMonths%>">
                                    <input type="hidden" name="range_two" value="${compare.perpaiment}">
                                    <input type="hidden" name="percentageSecond" value="${compare.percentage}">
                            </form>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

        </div>
    </div>
</div>


<footer>
    <div class="inner-container large">
        <div class="top flex space-between">
            <div class="flex align-items-center">
					<span class="logo"> <img src="../images/oferta1.jpg" alt=""/>
					</span>
            </div>
            <div class="flex align-items-center">
                <span class="margin-right-15 hide-for-mb">Միացեք մեզ սոցիալական ցանցերում</span> <span>
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
				</span> <span class="text-right"> 2009-2019 domain.am : նյութերը
					օգտագործելիս, հղում դեպի domain.am պարտադիր է: </span>
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/rangeslider.js/2.3.0/rangeslider.min.js'></script>

<script src="<%=request.getContextPath()%>/js/main.js"></script>
<script src="<%=request.getContextPath()%>/js/search.js"></script>
<script src="<%=request.getContextPath()%>/js/range.js"></script>
<script src="<%=request.getContextPath()%>/js/modal.js"></script>
<script src="<%=request.getContextPath()%>/libs/owl/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/js/carousel.js"></script>


</body>
</html>

