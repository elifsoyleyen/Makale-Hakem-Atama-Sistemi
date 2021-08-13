<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
 <%@page import="java.util.Date"%>
 <%@page import="java.text.DateFormat"%>
 <%@page import="java.text.SimpleDateFormat"%> 
<%@page import="javax.swing.*"%>
<%@page import="java.security.MessageDigest"%>



<!DOCTYPE html>
<html>
<head>

</head>
<body>
<jsp:useBean id="sayiNesnesi" class="odev.getset" scope="page" ></jsp:useBean>
<jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
<%

String turadi="";
int idmakale=Integer.parseInt(request.getParameter("idmakale"));
ResultSet rst=sayiCrud.listelemakale();
while(rst.next()) {
	int makaleid=rst.getInt("idmakale");
	if(idmakale==makaleid){
	  turadi=rst.getString("turadi");	
	}
}

int i=0;
int enkucuk=0;
int hocaid=0;
String adsoyad="";

ResultSet rs=sayiCrud.hocaselectall();
while(rs.next()) { 
	String hocatur=rs.getString("turadi");
	String pozisyonn=rs.getString("pozisyon");
	if(!pozisyonn.equals("Hakem"))
	{
    if(hocatur.equals(turadi))
    		{

    	if(i==0){
    		 enkucuk=Integer.parseInt(rs.getString("puan"));  		    		
    	}    	
    	
    	int puan=Integer.parseInt(rs.getString("puan"));
        if(puan<enkucuk)
        {
        	enkucuk=puan;
          	      	
        }
    	
        i+=1;
    	}
    	
    		}
}

ResultSet rss=sayiCrud.hocaselectall();
while(rss.next()) {
	int puan=Integer.parseInt(rss.getString("puan"));
	String hocatur=rss.getString("turadi");
	String pozisyonn=rss.getString("pozisyon");
	System.out.println("Pozisyon "+pozisyonn);
	if(!pozisyonn.equals("Hakem"))
	{
		System.out.println("HAKEM DEĞİL");
    if(hocatur.equals(turadi))
    		{
    	System.out.println("HOCA TÜRE EŞİT");
    	if(puan==enkucuk)
    	{   		
    		System.out.println("İÇERDEYİM");
    		hocaid=rss.getInt("idhoca");
    		adsoyad=rss.getString("hocaadsoyad");
    	}
    		}

}
}


boolean sonuc=false;
DateFormat df = new SimpleDateFormat("dd/MM/yy ");
Date dateobj = new Date();
String Tarihmakale=df.format(dateobj);
String onay="Onaylanmadı";
System.out.println(idmakale);
System.out.println(adsoyad);
sayiNesnesi.setHocaid(hocaid);
sayiNesnesi.setMakaleid(idmakale);
sayiNesnesi.setTarihmakale(Tarihmakale);
sayiNesnesi.setOnay(onay);


sonuc=sayiCrud.ekleatananmakale(sayiNesnesi);
if(sonuc==true){
	
	String durum="Hoca Bekleniyor";
	sayiNesnesi.setDurum(durum);

	boolean islemSonucu=sayiCrud.guncellemakale(sayiNesnesi,idmakale);
	if (islemSonucu==true){
		 
		 String pozisyon="Hakem";
			sayiNesnesi.setpozisyon(pozisyon);

			boolean islemSonucuu=sayiCrud.guncellehocapozisyon(sayiNesnesi,hocaid);
			if (islemSonucuu==true){
		
		request.setAttribute("alertMsg", "Makale Hocaya İletilmiştir");
		String message = (String)request.getAttribute("alertMsg");
		
		RequestDispatcher rd=request.getRequestDispatcher("makalelisteleeditor.jsp");  
		rd.include(request, response);
	%>	<script type="text/javascript">
	    var msg = "<%=message%>";
	    alert(msg);
	    
	</script>
	<%
			   }
			}
	
	%> 
	 

	
	<%request.removeAttribute("alertMsg");}%>	

	<%

   

	 %>
</body>
</html>