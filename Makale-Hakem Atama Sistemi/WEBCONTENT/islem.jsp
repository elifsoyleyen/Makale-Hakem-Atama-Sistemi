<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
 <%@page import="java.util.Date"%>
 <%@page import="java.text.DateFormat"%>
 <%@page import="java.text.SimpleDateFormat"%> 
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="odev.getset"></jsp:useBean>
<title>Insert title here</title>
</head>
<body>
<%
int dizi[] = new int[100];
DateFormat df = new SimpleDateFormat("dd/MM/yy");
Date dateobj = new Date();
String Tarihmakale1=df.format(dateobj); 
int a=0;
ResultSet rst=sayiCrud.listeleatananmakale();
while(rst.next()) {
	String Tarihmakale2=rst.getString("tarihmakale"); 
	Date d1 = df.parse(Tarihmakale1);
	Date d2 = df.parse(Tarihmakale2);
	long islem=d1.getTime()-d2.getTime();
	long gun_farki    = (islem  / (1000 * 60 * 60 * 24))  % 365;
	System.out.println(gun_farki);
	String onay=rst.getString("onay");
	
	
	if(gun_farki>5)
	{
		if(onay.equals("Onaylanmadı"))
		{   
			dizi[a]=rst.getInt("hocaid");
			a+=1;
			
			int idatananmakale=rst.getInt("idatananmakale");
			System.out.println("girdim");
			int idmakale=0;
			int idtur=0;
			String turadi="";
		
			ResultSet rs=sayiCrud.listeleatananmakale();
			while(rs.next()) {
				
				int atananmakaleid=rs.getInt("idatananmakale");
				if(idatananmakale==atananmakaleid){
				idmakale=rs.getInt("makaleid");
				  idtur=rs.getInt("idTur");	
				}
			}

			int i=0;
			int enkucuk=0;
			int hocaid=0;
			String adsoyad="";

			ResultSet rss=sayiCrud.hocaselectall();
			while(rss.next()) { 
				int hocaturid=rss.getInt("idtur");
				String pozisyonn=rss.getString("pozisyon");
				if(!pozisyonn.equals("Hakem"))
				{
			    if(hocaturid==idtur)
			    		{
			    	

			    	if(i==0)
			    	{
			    		enkucuk=Integer.parseInt(rss.getString("puan"));   		    		
			    	}    	
			    	
			    	int puan=Integer.parseInt(rss.getString("puan"));
			        if(puan<enkucuk)
			        {
			        	enkucuk=puan;
			          	      	
			        }
			    	
			        i+=1;
			    	}
			    	
			    		}
			}

			ResultSet rsss=sayiCrud.hocaselectall();
			while(rsss.next()) {
				int puan=Integer.parseInt(rsss.getString("puan"));
				int hocaturid=rsss.getInt("idtur");
				String pozisyonn=rsss.getString("pozisyon");
				System.out.println("Pozisyon "+pozisyonn);
				if(!pozisyonn.equals("Hakem"))
				{
					
			    if(hocaturid==idtur)
			    		{
			    	
			    	if(puan==enkucuk)
			    	{   		
			    		
			    		hocaid=rsss.getInt("idhoca");
			    		System.out.println("HOCAID "+hocaid);
			    		
			    		adsoyad=rsss.getString("hocaadsoyad");
			    	}
			    		}

			}
			}

			boolean sonuc=false;
			DateFormat df1 = new SimpleDateFormat("dd/MM/yy");
			Date dateobj1 = new Date();
			String Tarihmakale=df.format(dateobj);
			String onay1="Onaylanmadı";
		
			System.out.println(adsoyad);

			sayiNesnesi.setHocaid(hocaid);
			sayiNesnesi.setTarihmakale(Tarihmakale);

			sonuc=sayiCrud.guncelleatananmakale(sayiNesnesi,idatananmakale);
			if(sonuc==true){

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


			
			}
				}	
	}
int b;
    for(b=0; b<dizi.length; b++)
    {
    	
    int idhoca=dizi[b];
	String pozisyon="hoca";
	sayiNesnesi.setpozisyon(pozisyon);
	boolean islemSonucuu=sayiCrud.guncellehocapozisyon(sayiNesnesi,idhoca);
	if (islemSonucuu==true){
		System.out.println("POZİSYON GÜNCELLENDİİ");
		
	
	}
    }
    response.sendRedirect("suredoldu.jsp");
%>
</body>
</html>