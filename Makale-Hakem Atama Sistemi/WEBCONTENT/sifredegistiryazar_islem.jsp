<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="javax.swing.*"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.time.LocalDate"%>
 <%@page import="java.util.Date"%>
 <%@page import="java.text.DateFormat"%>
 <%@page import="java.text.SimpleDateFormat"%> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<jsp:useBean id="sayiNesnesi" class="odev.getset" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="odev.dataislemler" ></jsp:useBean>

<body>

<%
String yenisifre=request.getParameter("aa");
String yenisifretekrar =request.getParameter("bb");
System.out.println(yenisifre);
System.out.println(yenisifretekrar);

int id=Integer.parseInt(String.valueOf(session.getAttribute("idyazar")));
System.out.println(id);
		ResultSet rs=islemler.selectDatayazar(id);
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
				
				String yazarkayitTarih=rs.getString("tarih");
	    		DateFormat df = new SimpleDateFormat("dd/MM/yy");
	    		Date dateobj = new Date();
	    		String buguntarih=df.format(dateobj); //son olucak
				sayiNesnesi.setyazarsf(hexString.toString());
			
    			sayiNesnesi.setTarihh(buguntarih);
				boolean islemSonucu=islemler.guncelleyazarsifre(sayiNesnesi,id);
				if (islemSonucu==true){
					out.println("Editor Şifre Güncelleme İşlemi kaydedilmiştir...");			
					 response.sendRedirect("anasayfa.jsp"); 
					 

		           }
			}
		}
	
	



%>
</body>
</html>