<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
</head>
<jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="odev.getset"></jsp:useBean>
<body>
	<%
	int id=Integer.parseInt(request.getParameter("idatananmakale"));
String onay="Onaylandı";
sayiNesnesi.setOnay(onay);

boolean islemSonucuu=sayiCrud.guncelleonay(sayiNesnesi,id);
if (islemSonucuu==true){
	response.sendRedirect("hocaatananamakalelistele.jsp");
	System.out.println("Onay Durumu Güncelllendiiiiii..");
	

}
%>
</body>
</html>