<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.MessageDigest"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<jsp:useBean id="sayiNesnesi" class="odev.getset" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="odev.dataislemler" ></jsp:useBean>

<body>

<%
String yenisifre=request.getParameter("editoryenisf");
String yenisifretekrar =request.getParameter("editoryenisft");
System.out.println(yenisifre);
System.out.println(yenisifretekrar);
int id=Integer.parseInt(String.valueOf(session.getAttribute("ideditor")));
System.out.println(id);
		ResultSet rs=islemler.selectDataeditor(id);
		if(rs.next()){			
			if(yenisifre.equals(yenisifretekrar)){
				
				MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
				mdAlgorithm.update(yenisifretekrar.getBytes());

				byte[] digest = mdAlgorithm.digest();
				StringBuffer hexString = new StringBuffer();

				for (int i = 0; i < digest.length; i++) {
					yenisifretekrar = Integer.toHexString(0xFF & digest[i]);

				    if (yenisifretekrar.length() < 2) {
				    	yenisifretekrar = "0" + yenisifretekrar;
				    }

				    hexString.append(yenisifretekrar);
				}
			sayiNesnesi.seteditorsf(hexString.toString());
			boolean islemSonucu=islemler.guncelleeditorsifre(sayiNesnesi,id);
				if (islemSonucu==true){
					out.println("Editor Şifre Güncelleme İşlemi kaydedilmiştir...");			
					 response.sendRedirect("anasayfa.jsp"); 

		           }
			}
		}
	
	



%>
</body>
</html>