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
DateFormat df = new SimpleDateFormat("dd/MM/yy");
Date dateobj = new Date();
String tarih=df.format(dateobj);
String makaleBaslik=request.getParameter("makaleBaslik");
System.out.println(makaleBaslik);
String makaleicerik=request.getParameter("makaleicerik");
System.out.println(makaleicerik);
int yazarid=Integer.parseInt(String.valueOf(session.getAttribute("idyazar")));
System.out.println(request.getParameter("aa"));
int idTur=Integer.parseInt(request.getParameter("aa"));
String durum="Atanmamış";
System.out.println("id"+idTur);
System.out.println(yazarid);

sayiNesnesi.setmakaleBaslik(makaleBaslik);
sayiNesnesi.setmakaleicerik(makaleicerik);
sayiNesnesi.setmakaletarih(tarih);
sayiNesnesi.setyazarid(yazarid);
sayiNesnesi.setidTur(idTur);
sayiNesnesi.setDurum(durum);


sonuc=sayiCrud.eklemakale(sayiNesnesi);
if(sonuc==true)

    response.sendRedirect("yazaranasayfa.jsp");
	%>

</body>
</html>