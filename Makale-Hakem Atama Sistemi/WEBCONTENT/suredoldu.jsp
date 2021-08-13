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
<jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="odev.getset"></jsp:useBean>
<title>Insert title here</title>
</head>
<body>
<%
int dizi[] = new int[100];
DateFormat df = new SimpleDateFormat("dd/MM/yy");
Date dateobj = new Date();
int a=0;
String Tarihmakale1=df.format(dateobj); 
ResultSet rst=sayiCrud.listeleatananmakale();
while(rst.next()) {	
	String Tarihmakale2=rst.getString("tarihmakale"); 
	int makaleid=rst.getInt("makaleid");
	String hocamail=rst.getString("hocamail");
	Date d1 = df.parse(Tarihmakale1);
	Date d2 = df.parse(Tarihmakale2);
	long islem=d1.getTime()-d2.getTime();
	long gun_farki    = (islem  / (1000 * 60 * 60 * 24))  % 365;
	System.out.println(gun_farki);
	if(gun_farki==14)
	{   
		dizi[a]=rst.getInt("hocaid");
		a+=1;
        
		ResultSet rsm=sayiCrud.listelemakale();
		while(rsm.next()) {
			String durumm=rsm.getString("durum");
			int idmakale=rsm.getInt("idmakale");
			if(idmakale==makaleid)	
		{
			if(!durumm.equals("Değerlendirilmiştir"))
			{

				String result;
			    final String to = hocamail;
			    final String subject = "Uyarı";
			    final String messg = "1 HAFTANIZ KALDI.";
			    final String from = "elifsoyleyen2@gmail.com";
			    final String pass = "Cemre00.";  
			    
			    Properties properties = new Properties();
			    properties.put("mail.smtp.host", "smtp.gmail.com");
			    properties.put("mail.smtp.port", "587");
			    properties.put("mail.smtp.starttls.enable", "true");
			    properties.put("mail.smtp.auth", "true");
			    Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator() {
			        @Override
			        protected PasswordAuthentication getPasswordAuthentication() {
			            return new PasswordAuthentication(from, pass);
			        }
			    });

			    try {
			      
			        MimeMessage message = new MimeMessage(mailSession);
			        message.setFrom(new InternetAddress(from));   
			        message.addRecipient(Message.RecipientType.TO,
			                new InternetAddress(to));
			        message.setSubject(subject);
			        message.setText(messg);
			        Transport.send(message);
			        result = "Your mail sent successfully....";
			        System.out.println("baaşrılııı"+result);
			   	 
			    } catch (MessagingException mex) {
			        mex.printStackTrace();
			        result = "Error: unable to send mail....";
			        System.out.println("olmadıı"+result);
			    }


			}
		}
	
	}
	
}
	
	
	if(gun_farki>21)
	{   

		dizi[a]=rst.getInt("hocaid");
		a+=1;
        
		ResultSet rsm=sayiCrud.listelemakale();
		while(rsm.next()) {
			String durumm=rsm.getString("durum");
			int idmakale=rsm.getInt("idmakale");
			if(idmakale==makaleid)	
		{
			if(!durumm.equals("Değerlendirilmiştir"))
			{
				int idatananmakale=rst.getInt("idatananmakale"); 
			System.out.println("aaaa");
			response.sendRedirect("hocalisteleeditor.jsp");
		  boolean sonuc=sayiCrud.deleteatananmakale(idatananmakale);
		  if (sonuc=true)
			   {
	  
				System.out.println("makale silindi"); 
			   }
		  
		 	String makaleDurumu="Atanmamış";
       	 	sayiNesnesi.setDurum(makaleDurumu);
		  boolean islemsonucu=sayiCrud.guncellemakale(sayiNesnesi, idmakale);
		  if (islemsonucu=true)
		   {  
				System.out.println("makale durum guncellendi");	  
		   }

			}
		}
	
	}
}
	if(gun_farki>21){
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
	}
   
}
response.sendRedirect("hocalisteleeditor.jsp");
%>
</body>
</html>