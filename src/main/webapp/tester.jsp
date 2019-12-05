<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.util.*" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p> Pagelanguage:${requestScope.Pagelanguage}</p>
<p> sessionId:${requestScope.sessionId}</p>
<p> pageCurrancy:${requestScope.pageCurrancy}</p>
<p> pageName:${requestScope.pageName}</p>
<p> city:${requestScope.city}</p>
<p> pageLanguageName:${requestScope.pageLanguageName}</p>
<p> amoutFiltered:${requestScope.amoutFiltered}</p>
<p> Month:${requestScope.Month}</p>
<p> percentage:${requestScope.percentage}</p>

<%!
    float calculatePercentage(float Amount,float Percentage,int month)
    {
        float percentage = (Percentage/100)/12;
        System.out.println("Percentage " +Percentage);
        System.out.println("percentage " +percentage);
        System.out.println((Percentage/100)/12);
        float result=((Amount * percentage))*month;
        System.out.println(result);
        return result;
    }
%>

<p>
    <%!
        float Amount;
        int Percentage;
        int month;
    %>
    <%
        Amount= Float.parseFloat((String) request.getAttribute("amoutFiltered"));//100000
        Percentage = Integer.parseInt((String) request.getAttribute("percentage"));//12
        month = Integer.parseInt((String) request.getAttribute("Month"));//1
    %>

<%--    <%=calculatePercentage(Amount,Percentage,month) %>--%>
    <%=calculatePercentage(100000, (float) 11.4,120) %>


</p>
</body>
</html>
