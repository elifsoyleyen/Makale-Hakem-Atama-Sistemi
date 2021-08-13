<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8 " pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
<%


String editormail=request.getParameter("mail");
System.out.println(editormail);

ResultSet rs=sayiCrud.listeleeditor();
while (rs.next()){
     String mail=rs.getString("mail");
     if(mail.equals(editormail))
     {
    	 String id=String.valueOf(rs.getInt("ideditor"));
    	 session.setAttribute("ideditor",id);
    	 System.out.println(id);
    String result;
    final String to = editormail;
    final String subject = "Şifremi Unuttum";
    final String messg = "http://localhost:8080/odev/sifremiunuttummail.jsp";
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
	  response.sendRedirect("editorsifremiunuttum.jsp"); 
%>

<%

     }
    }
%>
