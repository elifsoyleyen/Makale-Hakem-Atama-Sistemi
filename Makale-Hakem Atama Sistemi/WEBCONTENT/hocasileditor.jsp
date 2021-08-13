<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
 <%@page import="java.util.Date"%>
 <%@page import="java.text.DateFormat"%>
 <%@page import="java.text.SimpleDateFormat"%> 
 <%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="odev.getset"></jsp:useBean>
 <% 

  int id=Integer.parseInt(request.getParameter("idhoca"));
  
  boolean sonuc=sayiCrud.deletehoca(id);
  if (sonuc)
	   {  
	  response.sendRedirect("hocalisteleeditor.jsp"); 
	  
	
	   }
	 
  %>
</body>
</html>