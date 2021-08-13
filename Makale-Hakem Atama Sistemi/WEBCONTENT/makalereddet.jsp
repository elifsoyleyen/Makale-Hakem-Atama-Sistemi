<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
 <%@page import="java.text.DateFormat"%>
 <%@page import="java.text.SimpleDateFormat"%> 

<!DOCTYPE html>
<html>
<head>

</head>
<body>
<jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="odev.getset"></jsp:useBean>
<% 
int idmakale=0;
int idtur=0;
String turadi="";
int idatananmakale=Integer.parseInt(request.getParameter("idatananmakale"));
ResultSet rst=sayiCrud.listeleatananmakale();
while(rst.next()) {
	
	int atananmakaleid=rst.getInt("idatananmakale");
	if(idatananmakale==atananmakaleid){
	idmakale=rst.getInt("makaleid");
	  idtur=rst.getInt("idTur");	
	}
}

int i=0;
int enkucuk=0;
int hocaid=0;
String adsoyad="";

ResultSet rs=sayiCrud.hocaselectall();
while(rs.next()) { 
	int hocaturid=rs.getInt("idtur");
	String pozisyonn=rs.getString("pozisyon");
	if(!pozisyonn.equals("Hakem"))
	{
    if(hocaturid==idtur)
    		{
    	System.out.println("içerdeyiz..");

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
	int hocaturid=rss.getInt("idtur");
	String pozisyonn=rss.getString("pozisyon");
	System.out.println("Pozisyon "+pozisyonn);
	if(!pozisyonn.equals("Hakem"))
	{
		System.out.println("HAKEM DEĞİL");
    if(hocaturid==idtur)
    		{
    	System.out.println("HOCA TÜRE EŞİT");
    	if(puan==enkucuk)
    	{   		
    		System.out.println("İÇERDEYİM");
    		hocaid=rss.getInt("idhoca");
    		System.out.println("HOCAID "+hocaid);
    		
    		adsoyad=rss.getString("hocaadsoyad");
    	}
    		}

}
}

boolean sonuc=false;
DateFormat df = new SimpleDateFormat("dd/MM/yy");
Date dateobj = new Date();
String Tarihmakale=df.format(dateobj);
String onay="Onaylanmadı";
System.out.println("buraya geldim");
System.out.println(adsoyad);

sayiNesnesi.setHocaid(hocaid);
sayiNesnesi.setTarihmakale(Tarihmakale);



sonuc=sayiCrud.guncelleatananmakale(sayiNesnesi,idatananmakale);
if(sonuc==true){

System.out.println("GUNCELLENDİİİİİİİİİİİİİİİİ");

	
	String durum="Hoca Bekleniyor";
	sayiNesnesi.setDurum(durum);

	boolean islemSonucu=sayiCrud.guncellemakale(sayiNesnesi,idmakale);
	if (islemSonucu==true){
		
		 String pozisyon="Hakem";
			sayiNesnesi.setpozisyon(pozisyon);

			boolean islemSonucuu=sayiCrud.guncellehocapozisyon(sayiNesnesi,hocaid);
			if (islemSonucuu==true){
			
				
			}
	}
	
}


	
int idhoca=Integer.parseInt(String.valueOf(session.getAttribute("idhoca")));
String pozisyon="hoca";
sayiNesnesi.setpozisyon(pozisyon);

boolean islemSonucuu=sayiCrud.guncellehocapozisyon(sayiNesnesi,idhoca);
if (islemSonucuu==true){
	
	
}




  %>

</body>
</html>