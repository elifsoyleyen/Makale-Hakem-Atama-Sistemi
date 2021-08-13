<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="javax.swing.*"%>
<%@page import="java.security.MessageDigest"%>
<!DOCTYPE html>
<html>
<head>
</head>
<jsp:useBean id="sayiNesnesi" class="odev.getset" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="odev.dataislemler" ></jsp:useBean>
<body>
 <% 
boolean sonuc=false;


    String ad = request.getParameter("editorka");
    String sifre = request.getParameter("sifre");
    
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
    ResultSet rs=islemler.listeleeditor();
    	while(rs.next())
    	{
    		sayi+=1;
    		String dbad=rs.getString("editorka");
    		String dbsf=rs.getString("editorsf");
    		
        		
    	if(ad.equals(dbad)&& hexString.toString().equals(dbsf))
    	{ 
    		
    		System.out.println("burdayım");
    		String id=String.valueOf(rs.getInt("ideditor"));
       	 	session.setAttribute("ideditor",id);
    		response.sendRedirect("islem.jsp");
    			
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