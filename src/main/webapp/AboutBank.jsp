<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="java.util.*" %>
<%@page isELIgnored="false" %>
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

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/Compare.js"></script>

</head>
<body id="body">
<%--<fmt:setLocale value="${requestScope.Pagelanguage}"/>

<fmt:setBundle basename="com.ithome.web.Resources.Content" var="Bundles"/>--%>
<div class="overlay" id="overlay"></div>
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
								<li><li><a href="Ofbanks?Currancy=${requestScope.PageCurrancy}&&City=<%=request.getAttribute("city")%>">Մեր Գործընկերները</a></li>
									<%--<li><a href="#">Մեր Գործընկերները</a></li>--%>
									<li><a href="Blog?Currancy=${requestScope.PageCurrancy}">Օգտակար հոդվածներ</a></li>
								</ul>
							</span>
                    </div>
                    <div class="right flex align-items-center">
                        <span class="state ellipsis hide-for-tablet"><i
                                class="icon-state"></i> ${requestScope.City}   </span>
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

    <c:if test="${requestScope.banksList != null}">
            <c:forEach items="${requestScope.banksList}" var="bankDetail">
                <div class="bg-white-dark padding-bottom-60 bank-item-page">
                    <div class="inner-container">
                        <div class="bank-header">
                            <div class="bg" style="background-image: url('../../../images/10.svg')">
                                <div class="top">
                                    <div class="item-logo">

                                        <a href="">
                                            <img src="${bankDetail.bankBigLogo}"
                                                 style="width: 100px;" alt="">
                                        </a>

                                    </div>

                                    <p class="font-36"> ${bankDetail.bankName}</p>
                                </div>
                            </div>
                        </div>
                        <div class="loan-types">
                            <div class="flex flex-wrap align-items-stretch">
                                <div class="block-container item">
                                    <a href="DepositBanks?Currancy=${requestScope.PageCurrancy}&&bankId=${bankDetail.bankId}">
                                        <span class="icon"><img src="../images/icons/1.svg"/></span>
                                        <span>Ավանդներ</span>
                                    </a>
                                </div>
                                <div class="block-container item">
                                    <a href="MortgageBanks?Currancy=${requestScope.PageCurrancy}&&bankId=${bankDetail.bankId}">
                                        <span class="icon"><img src="../images/icons/2.svg"/></span>
                                        <span>Հիփոթեք</span>
                                    </a>
                                </div>
                                <div class="block-container item">
                                    <a href="ConsumerBanks?Currancy=${requestScope.PageCurrancy}&&bankId=${bankDetail.bankId}">
                                        <span class="icon"><img src="../images/icons/3.svg"/></span>
                                        <span>Սպառողական վարկեր</span>
                                    </a>
                                </div>
                                <div class="block-container item">
                                    <a href="AutoBanks?Currancy=${requestScope.PageCurrancy}&&bankId=${bankDetail.bankId}">
                                        <span class="icon"><img src="../images/icons/4.svg"/></span>
                                        <span>Ավտովարկ</span>
                                    </a>
                                </div>
                                <div class="block-container item">
                                    <a href="MicroBanks?Currancy=${requestScope.PageCurrancy}&&bankId=${bankDetail.bankId}">
                                        <span class="icon"><img src="../images/icons/5.svg"/></span>
                                        <span>Միկրովարկ</span>
                                    </a>
                                </div>
                                <div class="block-container item">
                                    <a href="AgBanks?Currancy=${requestScope.PageCurrancy}&&bankId=${bankDetail.bankId}">
                                        <span class="icon"><img src="../images/icons/6.svg"/></span>
                                        <span>Գյուղատնտեսական վարկ</span>
                                    </a>
                                </div>
                                <div class="block-container item">
                                    <a href="CardBanks?Currancy=${requestScope.PageCurrancy}&&bankId=${bankDetail.bankId}">
                                        <span class="icon"><img src="../images/icons/7.svg"/></span>
                                        <span>Քարտեր</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="about-bank padding-top-60">
                            <p class="title font-24">Բանկի մասին</p>
                            <p class="item-desc"> ${bankDetail.bankName}</p>
                            <div class="bank-info row-md row-flex flex flex-wrap">
                                <div class="col-6">
                                    <p class="blue-dark">Իրավաբանական հասցե։</p>
                                    <p class="font-16 bold">${bankDetail.bankAddress}</p>
                                </div>
                                <div class="col-3">
                                    <p class="blue-dark">Էլ. հասցե</p>
                                    <p class="font-16 bold">${bankDetail.bankWebSite}</p>
                                </div>
                                <div class="col-3">
                                    <p class="blue-dark">Աշխ. ժամերը</p>
                                    <p class="font-16 bold">Երկ - Շաբ: 09:00-20:00 Կիր: Փակ է</p>
                                </div>
                                <div class="col-6">
                                    <p class="blue-dark">Հեռախոսահամար</p>
                                    <p class="font-16 bold">${bankDetail.bankPhoneNumber}</p>
                                </div>
                                <div class="col-3">
                                    <p class="blue-dark">Կայք</p>
                                    <p class="font-16 bold">${bankDetail.bankEmailAddress}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="padding-bt-60">
                    <div class="inner-container bank-branches">
                        <div class="flex space-between align-items-center flex-wrap">
                            <p class="font-24 title">Մասնաճյուղեր և բանկոմատներ <a href=""
                                                                                   class="green-link">Երևանում</a></p>
                            <div class="right-part">
                                <a href="" class="def-button btn-outline">${bankDetail.bankHQ}</a>
                                <a href="" class="def-button btn-outline">${bankDetail.bankBranches}</a>
                            </div>
                        </div>
                        <div class="map">

                            <%--<iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d24380.81480803617!2d44.48420823987601!3d40.195673287729065!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sInecobank%2C!5e0!3m2!1sru!2s!4v1557868287819!5m2!1sru!2s"
                                    frameborder="0" style="border:0" allowfullscreen></iframe>--%>

                            <c:set value="${bankDetail.bankName}" var="bankName"/>
                                <c:choose>
                                    <c:when test="${bankName == 'AMERIABANK'}">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3048.499186105274!2d44.50756241564362!3d40.17570297818636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x406abc57a46ad91b%3A0x15dd5a253c1b4e3f!2z1LHVtNWl1oDVq9Wh1aLVodW21a8gfCBBbWVyaWFiYW5r!5e0!3m2!1sen!2s!4v1569648791284!5m2!1sen!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                                         </c:when>
                                    <c:when test="${bankName == 'HSBC Bank Armenia cjsc'}">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3047.9447869054447!2d44.518739215643876!3d40.18804217743944!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x406abce0612cc619%3A0x20a359da7b3dde40!2sHSBC%20Bank%20Head%20Office!5e0!3m2!1sen!2s!4v1569648739000!5m2!1sen!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                                    </c:when>
                                    <c:when test="${bankName == 'ՎՏԲ Բանկ Հայաստան'}">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1523.9746746068126!2d44.5165572577249!3d40.18794064750932!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x406abd1e2afde517%3A0x47700db9569b7305!2sAmeriabank%20CJSC%20-%20Moskovyan%20Branch!5e0!3m2!1sen!2s!4v1569620826568!5m2!1sen!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                                    </c:when>
                                    <c:when test="${bankName == 'ACBA-CREDIT AGRICOLE BANK'}">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3048.1268450289726!2d44.50533571564377!3d40.18399047768475!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x406abde7a80b5e67%3A0x479d7ba42dc522fb!2sACBA-CREDIT%20AGRICOLE%20BANK!5e0!3m2!1sen!2s!4v1569648874121!5m2!1sen!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                                    </c:when>

                                </c:choose>
                                 </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>

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
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
    <script src="<%=request.getContextPath()%>/js/search.js"></script>
    <script src="<%=request.getContextPath()%>/js/range.js"></script>
    <script src="<%=request.getContextPath()%>/js/modal.js"></script>
    <script src="<%=request.getContextPath()%>/libs/owl/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/carousel.js"></script>


</body>
</html>

