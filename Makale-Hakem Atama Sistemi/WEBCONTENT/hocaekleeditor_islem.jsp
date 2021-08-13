<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
 <%@page import="java.util.Date"%>
 <%@page import="java.text.DateFormat"%>
 <%@page import="java.text.SimpleDateFormat"%> 
 <%@page import="java.security.MessageDigest"%>
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
String hocaka=request.getParameter("hocaka");
String hocasf=request.getParameter("hocasf");

MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(hocasf.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
	hocasf = Integer.toHexString(0xFF & digest[i]);

    if (hocasf.length() < 2) {
    	hocasf = "0" + hocasf;
    }

    hexString.append(hocasf);
}

String hocamail=request.getParameter("hocamail");
String hocaadsoyad=request.getParameter("hocaadsoyad");
String hocatel=request.getParameter("hocatel");
int idTur=Integer.parseInt(request.getParameter("aa"));
String puan="1";
String pozisyon="hoca";
System.out.println("id"+idTur);


sayiNesnesi.sethocaka(hocaka);
sayiNesnesi.sethocasf(hexString.toString());
sayiNesnesi.settarih(tarih);
sayiNesnesi.setpuan(puan);
sayiNesnesi.sethocatel(hocatel);
sayiNesnesi.sethocaadsoyad(hocaadsoyad);
sayiNesnesi.sethocamail(hocamail);
sayiNesnesi.setpozisyon(pozisyon);

sayiNesnesi.setturid(idTur);



sonuc=sayiCrud.eklehoca(sayiNesnesi);
if(sonuc==true)

    response.sendRedirect("hocalisteleeditor.jsp");
	%>

</body>
</html>