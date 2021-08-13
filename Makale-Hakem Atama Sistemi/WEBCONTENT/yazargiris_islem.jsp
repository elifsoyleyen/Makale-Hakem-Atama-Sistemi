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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="sayiNesnesi" class="odev.getset" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="odev.dataislemler" ></jsp:useBean>
<body>
 <% 
boolean sonuc=false;


    String ad = request.getParameter("yazarka");
    String sifre = request.getParameter("yazarsf");
    
    MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
  	mdAlgorithm.update(sifre.getBytes());

  	byte[] digest = mdAlgorithm.digest();
  	StringBuffer hexString = new StringBuffer();

  	for (int i = 0; i < digest.length; i++) {
  		sifre = Integer.toHexString(0xFF & digest[i]);

  	    if (sifre.length() < 2) {
  	    	sifre = "0" + sifre;
  	    }

  	    hexString.append(sifre);
  	}
   
   
    int i=0;
    int sayi=0;
    System.out.println(ad);
    System.out.println(sifre);
    ResultSet rs=islemler.listeleyazar();
    	while(rs.next())
    	{   
  
    		sayi+=1;
    		String dbad=rs.getString("yazarka");
    		String dbsf=rs.getString("yazarsf");
        		
    	if(ad.equals(dbad)&& hexString.toString().equals(dbsf))
    	{ 
    		String yazarkayitTarih=rs.getString("tarih");
    		DateFormat df = new SimpleDateFormat("dd/MM/yy");
    		Date dateobj = new Date();
    		String buguntarih=df.format(dateobj); //son olucak
    		Date d1 = df.parse(yazarkayitTarih);
    		Date d2 = df.parse(buguntarih);
    		long dif=d2.getTime()-d1.getTime();
    		int aralik=(int)(dif/(1000*60*60*24));
    		System.out.println("ssss"+d1);
    		System.out.println("bugün"+d2);
    		System.out.println(aralik);
    		if(aralik<5){
    		int idyazar=rs.getInt("idyazar");
		    session.setAttribute("idyazar",idyazar);
		    String yazaradsoyad=rs.getString("yazaradsoyad");
		    session.setAttribute("yazaradsoyad",yazaradsoyad);
    		System.out.println("burdayım");
    		response.sendRedirect("yazarmakalelerim.jsp");
    		}
    		else
    		{
    			int idyazar=rs.getInt("idyazar");
    		    session.setAttribute("idyazar",idyazar);
    			response.sendRedirect("sifredegistiryazar.jsp");
    			
    		}
    			
    	}
    	
    		
    	
    	else if(!ad.equals(dbad)|| !hexString.toString().equals(dbsf))
    	{
    		i+=1;	
    	}       
    	}
    	if (i==sayi){
    		  request.setAttribute("alert", "Hatalı Kullanıcı Adı veya Şifre");
    			RequestDispatcher rd1=request.getRequestDispatcher("anasayfa.jsp");  
    			rd1.include(request, response);
    			
    		%>	<%String message1 = (String)request.getAttribute("alert"); %> 	
    			<script type="text/javascript">
    		    var msg = "<%=message1%>";
    		    alert(msg);
    		</script>

    		  <%
    		
    		
    	}
    %>
</body>
</html>