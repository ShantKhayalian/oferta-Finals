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
    <link href="images/favicon.ico" rel="shortcut icon">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/DriopDownMain/dropdownstyle.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/global.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/libs/owl/owl.carousel.min.css"/>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript"
            src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>

    <script>
        function myFaceBookFunction() {
            var x = document.URL;
            document.getElementById('faceShar').src = x;
            console.log(x );
        }
    </script>


    <script>
        function myLinkedinFunction() {
            var x = document.URL;
            document.getElementById('linkedShare').src = x;
            console.log(x );
        }
    </script>

</head >
<body id="body" onload="myFaceBookFunction()">
<div id="fb-root"></div>
<script>
    (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
    fjs.parentNode.insertBefore(js, fjs);
}
(document, 'script', 'facebook-jssdk'));
</script>


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

    <div class="padding-bt-60">
        <div class="inner-container usefull-link-item-page">
            <div class="top">

                <%-- <p class="date">15.02.2019 <span class="padding-left-10">15:00</span></p>--%>
                <div class="flex align-items-center space-between margin-bottom-15">
                    <p class="font-36">Հատուկ առաջարկ Visa քարտապաններին</p>
                    <ul class="social-box hide-for-tablet">

                        <li>
                            <div class="fb-share-button" id="faceShar"
                                 data-href=""
                                 data-layout="button_count">
                            </div>

                           <%-- <div class="fb-share-button" id="faceShar" data-href="http://oferta.am/App"
                                 data-layout="button_count" data-size="small">
                                <a target="_blank" href="" class=" fb-xfbml-parse-ignore">Կիսվել</a></div>--%>
                        </li>

                        <li>
                            <a href="https://telegram.me/share/url?url=onclick='window.open(&apos;https://telegram.me/share/url?url==&apos;+encodeURIComponent(location.href)+&apos;&amp;bodytext=&amp;tags=&amp;text=&apos;+encodeURIComponent(document.title));return false;' rel='nofollow' style='text-decoration:none;'"
                               class="telegram" target="_blank"><i class="icon-telegram"></i></a></li>
                        <script src="http://platform.linkedin.com/in.js" type="text/javascript"> lang: en_US</script>
                        <script type="IN/Share" data-url="myLinkedinFunction()" id="linkedShare" ></script>
                       <%-- <li><a href="https://www.linkedin.com/company/ofertaam" class="linkedin" target="_blank"><i
                                class="icon-linkedin"></i></a></li>--%>
                    </ul>
                </div>
            </div>
            <c:if test="${requestScope.usefulArticlesList != null}">
            <c:forEach var="usefulArticlesList" items="${requestScope.usefulArticlesList}">
            <c:set var="languages" value="${requestScope.Pagelanguage}"/>
            <c:choose>
            <c:when test="${languages == 'en_US'}">
            <div class="img-box simple">
                <img src="${usefulArticlesList.UAImageLink}"/>
            </div>
            <div class="row clearfix margin-top-30">
                <div class="col-9 left-side">
                    <div class="text-box font-16">
                        <p class="font-24 line-height-36">${usefulArticlesList.UATitleEn}</p>
                        <p>${usefulArticlesList.UAMainTextEn}</p>
                    </div>
                    <ul class="social-box">
                        <li>
                            <div class="fb-share-button" id="faceShar"
                                 data-href=""
                                 data-layout="button_count">
                            </div>

                                <%-- <div class="fb-share-button" id="faceShar" data-href="http://oferta.am/App"
                                      data-layout="button_count" data-size="small">
                                     <a target="_blank" href="" class=" fb-xfbml-parse-ignore">Կիսվել</a></div>--%>
                        </li>

                        <li>
                            <a href="https://telegram.me/share/url?url=onclick='window.open(&apos;https://telegram.me/share/url?url==&apos;+encodeURIComponent(location.href)+&apos;&amp;bodytext=&amp;tags=&amp;text=&apos;+encodeURIComponent(document.title));return false;' rel='nofollow' style='text-decoration:none;'"
                               class="telegram" target="_blank"><i class="icon-telegram"></i></a></li>
                        <script src="http://platform.linkedin.com/in.js" type="text/javascript"> lang: en_US</script>
                        <script type="IN/Share" data-url="myLinkedinFunction()" id="linkedShare" ></script>
                    </ul>
                </div>
                </c:when>
                <c:when test="${languages == 'hy_AM'}">
                <div class="img-box simple">
                    <img src="${usefulArticlesList.UAImageLink}"/>
                </div>
                <div class="row clearfix margin-top-30">
                    <div class="col-9 left-side">
                        <div class="text-box font-16">
                            <p class="font-24 line-height-36">${usefulArticlesList.UATitleAm}</p>
                            <p>${usefulArticlesList.UAMainTextAm}</p>
                        </div>
                        <ul class="social-box">
                            <li>
                                <div class="fb-share-button" id="faceShar"
                                     data-href=""
                                     data-layout="button_count">
                                </div>

                                    <%-- <div class="fb-share-button" id="faceShar" data-href="http://oferta.am/App"
                                          data-layout="button_count" data-size="small">
                                         <a target="_blank" href="" class=" fb-xfbml-parse-ignore">Կիսվել</a></div>--%>
                            </li>

                            <li>
                                <a href="https://telegram.me/share/url?url=onclick='window.open(&apos;https://telegram.me/share/url?url==&apos;+encodeURIComponent(location.href)+&apos;&amp;bodytext=&amp;tags=&amp;text=&apos;+encodeURIComponent(document.title));return false;' rel='nofollow' style='text-decoration:none;'"
                                   class="telegram" target="_blank"><i class="icon-telegram"></i></a></li>
                            <script src="http://platform.linkedin.com/in.js" type="text/javascript"> lang: en_US</script>
                            <script type="IN/Share" data-url="myLinkedinFunction()" id="linkedShare" ></script>
                        </ul>
                    </div>
                    </c:when>
                    <c:otherwise>
                    <div class="img-box simple">
                        <img src="${usefulArticlesList.UAImageLink}"/>
                    </div>
                    <div class="row clearfix margin-top-30">
                        <div class="col-9 left-side">
                            <div class="text-box font-16">
                                <p class="font-24 line-height-36">${usefulArticlesList.UATitleRu}</p>
                                <p>${usefulArticlesList.UAMainTextRu}</p>
                            </div>
                            <ul class="social-box">
                                <li>
                                    <div class="fb-share-button" id="faceShar"
                                         data-href=""
                                         data-layout="button_count">
                                    </div>

                                        <%-- <div class="fb-share-button" id="faceShar" data-href="http://oferta.am/App"
                                              data-layout="button_count" data-size="small">
                                             <a target="_blank" href="" class=" fb-xfbml-parse-ignore">Կիսվել</a></div>--%>
                                </li>

                                <li>
                                    <a href="https://telegram.me/share/url?url=onclick='window.open(&apos;https://telegram.me/share/url?url==&apos;+encodeURIComponent(location.href)+&apos;&amp;bodytext=&amp;tags=&amp;text=&apos;+encodeURIComponent(document.title));return false;' rel='nofollow' style='text-decoration:none;'"
                                       class="telegram" target="_blank"><i class="icon-telegram"></i></a></li>
                                <script src="http://platform.linkedin.com/in.js" type="text/javascript"> lang: en_US</script>
                                <script type="IN/Share" data-url="myLinkedinFunction()" id="linkedShare" ></script>
                                    <%-- <li><a href="https://www.linkedin.com/company/ofertaam" class="linkedin" target="_blank"><i
                                             class="icon-linkedin"></i></a></li>--%>
                            </ul>
                            </ul>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        </c:forEach>
                        </c:if>


                        <div class="col-3 right-side hide-for-tablet">
                            <div class="banner-box no-bg">
                                <div class="banner-img">
                                    <img src="../images/us-loan-debt.png" alt=""/>
                                </div>
                                <div class="inner">
                                    <div class="text-box">
                                        <p class="font-32 margin-bottom-10 line-height-44">Հաշվիչ վարկերի համար</p>
                                        <p>Հայտնի է, որ ընթերցողը, կարդալով հասկանալի տեքստ, չի կարողանա կենտրոնանալ
                                            տեքստի
                                            ձևավորման վրա</p>
                                        <button class="def-button btn-green max-width-110 margin-top-20">
                                            <span>Հաշվել</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^other blogs section  -->
                    <%--   <div class="flex align-items-center space-between margin-bottom-35 margin-top-80">
                           <p class="font-24 title">Կարդացեք նաեւ</p>
                       </div>
                       <div class="row-md clearfix faq-row">
                           <div class="col-3">
                               <div class="faq-item">
                                   <a href="index.php?page=usefull-link-item">
                                       <div class="item-img"
                                            style="background-image: url('../images/articles/1.png')"></div>
                                       <div class="item-desc">
                                           <span class="item-title font-16">Հատուկ առաջարկ Visa քարտապաններին</span>
                                           <span class="date">15.02.2019</span>
                                           <span>Հատուկ զեղչեր Visa քարտապանների համար Dubai Shopping Festival-ի շրջանակներում</span>
                                       </div>
                                   </a>
                               </div>
                           </div>--%>

                    <!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^other blogs section  -->
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
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
    <script src="<%=request.getContextPath()%>/js/search.js"></script>
    <script src="<%=request.getContextPath()%>/js/range.js"></script>
    <script src="<%=request.getContextPath()%>/js/modal.js"></script>
    <script src="<%=request.getContextPath()%>/libs/owl/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/carousel.js"></script>


</body>
</html>
