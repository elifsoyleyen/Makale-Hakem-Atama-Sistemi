<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
 <%@page import="java.util.Date"%>
 <%@page import="java.text.DateFormat"%>
 <%@page import="java.text.SimpleDateFormat"%> 
<!DOCTYPE html>
<html>
<head>

</head>
<body>

<jsp:useBean id="sayiCrud" class="odev.dataislemler" scope="page"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="odev.getset" scope="page" ></jsp:useBean>
<%
boolean sonuc=false;
String turadi=request.getParameter("turadi");
System.out.println(turadi);
sayiNesnesi.setturadi(turadi);



sonuc=sayiCrud.ekletur(sayiNesnesi);
if(sonuc==true)

    response.sendRedirect("turekleeditor.jsp");
	%>

</body>
</html>