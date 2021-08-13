package odev;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


import java.sql.*;
import odev.getset;

public class dataislemler {
	private Connection con;
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=UTF-8"; 
	private Statement stm;
	private ResultSet resultSet = null;


	
	

public dataislemler()
{
	   try {
		Class.forName(driver);
		 System.out.println("JDBC surucu basari ile yüklendi.");
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	  
	try{
		con=DriverManager.getConnection(url,"root","12345");System.out.println("Veritabanýna baðlanýldý.");
		}
	catch (Exception e) { 
		System.out.println("Veri Tabanýna Baðlanýlamadý. Hata:"+e.getMessage()); System.exit(0);
		}
	try {
		stm=con.createStatement();
		}
	catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); System.exit(0); 
	
		}
}

	
	public ResultSet listeleeditor()
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call listeleeditor()}");
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					System.out.println("Baþarýlý");
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
	
	
	public ResultSet listelehoca()
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call listelehoca()}");
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					System.out.println("Baþarýlý");
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
	
	
	public ResultSet listeletur()
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call listeletur()}");
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					System.out.println("Baþarýlý");
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
	
	public ResultSet hocaselectall()
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call hocaselectall()}");
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					System.out.println("Baþarýlý");
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
	
	
	public ResultSet listeleyazar()
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call listeleyazar()}");
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					System.out.println("Baþarýlý");
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}

	
	public ResultSet listelemakale()
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call listelemakale()}");
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					System.out.println("Baþarýlý");
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
	
	public ResultSet listeleatananmakale()
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call listeleatananmakale()}");
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					System.out.println("Atanan makale listelendi..");
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
		
	public ResultSet makalearama(String makaleicerik)
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call makalearama(?)}");
			        stm.setString(1, makaleicerik);
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
	
	public ResultSet selectDataeditor(int id)
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call selectDataeditor(?)}");
			        stm.setInt(1, id);
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
	public ResultSet selectDatayazar(int id)
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call selectDatayazar(?)}");
			        stm.setInt(1, id);
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
	
	
	public ResultSet selectDatahoca(int id)
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{call selectDatahoca(?)}");
			        stm.setInt(1, id);
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}
	
	
	
	public ResultSet makaleeditorfiltrele(String Turadi)
	{		
		try
		{
			        CallableStatement stm=(CallableStatement) con.prepareCall("{makaleeditorfiltrele (?)}");
			        stm.setString(1, Turadi);
					boolean hasResult =stm.execute();
					if(hasResult){
					ResultSet rs=stm.getResultSet();
					
					return rs;
					}

					else 
					   return null;

					}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;

		
	}

		
	public boolean eklemakale(getset nesne)
	{
		String makaleBaslik=nesne.getmakaleBaslik();
		String makaleicerik=nesne.getmakaleicerik();
		String makaletarih=nesne.getmakaletarih();
		int yazarid=nesne.getyazarid();
		int idTur=nesne.getidTur();
		String durum=nesne.getDurum();
		
		try {
		CallableStatement cs;
	    cs=(CallableStatement) con.prepareCall("{call eklemakale(?,?,?,?,?,?)}");
		cs.setString(1,makaleBaslik);
		cs.setString(2,makaleicerik);
		cs.setString(3,makaletarih);
		cs.setInt(4,yazarid);
		cs.setInt(5,idTur);
		cs.setString(6,durum);
		cs.execute();
		System.out.println("Baþarýlý");
		return true;
		

		}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return false;
		
		
	}
	
	public boolean eklehoca(getset nesne)
	{
		
		
		

		String hocaka=nesne.gethocaka();
		String hocasf= nesne.gethocasf();
		String tarih=nesne.gettarih();
		String puan=nesne.getpuan();
		String hocatel=nesne.gethocatel();
		String hocaadsoyad=nesne.gethocaadsoyad();
		String hocamail=nesne.gethocamail();
		String pozisyon=nesne.getpozisyon();
		int turid=nesne.getturid();
		
		try {
		CallableStatement cs;
	    cs=(CallableStatement) con.prepareCall("{call eklehoca(?,?,?,?,?,?,?,?,?)}");
		cs.setString(1,hocaka);
		cs.setString(2,hocasf);
		cs.setString(3,hocaadsoyad);
		cs.setString(4,puan);
		cs.setString(5,hocamail);
		cs.setString(6,pozisyon);
		cs.setString(7,hocatel);
		cs.setString(8,tarih);
		
		
		cs.setInt(9,turid);
		
		
		cs.execute();
		System.out.println("Baþarýlý");
		return true;
		

		}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return false;
		
		
	}
	
	public boolean ekletur(getset nesne)
	{
		String turadi=nesne.getturadi();

		
		try {
		CallableStatement cs;
	    cs=(CallableStatement) con.prepareCall("{call ekletur(?)}");
		cs.setString(1,turadi);
		cs.execute();
		System.out.println("Baþarýlý");
		return true;
		

		}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return false;
		
		
	}
	public boolean ekleatananmakale(getset nesne)
	{
		int hocaid=nesne.getHocaid();
		int makaleid=nesne.getMakaleid();
		String tarihmakale=nesne.getTarihmakale();
		String onay =nesne.getOnay();
	
		try {
		CallableStatement cs;
	    cs=(CallableStatement) con.prepareCall("{call ekleatananmakale(?,?,?,?)}");
		cs.setInt(1,hocaid);
		cs.setInt(2,makaleid);
		cs.setString(3,tarihmakale);
		cs.setString(4,onay);
		
		cs.execute();
		System.out.println("Baþarýlý");
		return true;
		

		}
		
		catch (Exception e) 
		{ 
			System.out.println("Hata:"+e.getMessage());
			
		}
		return false;
		
		
	}
	
	public boolean guncellemakale(getset nesne,int id)
	{

		String durum=nesne.getDurum();	
		
		try
		{
			
			CallableStatement statement=(CallableStatement) con.prepareCall("{call guncellemakale(?,?)}");
	
			 statement.setInt(1,id);
			 statement.setString(2,durum);	
				
			 int result=statement.executeUpdate();
			 if(result>0)
			 {
				 System.out.println("Durum Güncellendi");
				 return true;
			 }
			 else
			 {
				 
				 return false;
			 }
			
		}
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); 
			return false;
		}
		
	}

	public boolean guncelleeditorsifre(getset nesne,int id)
	{

		String editorsifre=nesne.geteditorsf();	
		
		try
		{
			
			CallableStatement statement=(CallableStatement) con.prepareCall("{call guncelleeditorsifre(?,?)}");
	
			 statement.setInt(1,id);
			 statement.setString(2,editorsifre);	
				
			 int result=statement.executeUpdate();
			 if(result>0)
			 {
				 System.out.println("Editör Þifre Güncellendi");
				 return true;
			 }
			 else
			 {
				 
				 return false;
			 }
			
		}
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); 
			return false;
		}
		
	}
	

	public boolean guncellehocasifre(getset nesne,int id)
	{

		String hocasifre=nesne.gethocasf();	
		
		try
		{
			
			CallableStatement statement=(CallableStatement) con.prepareCall("{call guncellehocasifre(?,?)}");
	
			 statement.setInt(1,id);
			 statement.setString(2,hocasifre);	
				
			 int result=statement.executeUpdate();
			 if(result>0)
			 {
				 System.out.println("Hoca Þifre Güncellendi");
				 return true;
			 }
			 else
			 {
				 
				 return false;
			 }
			
		}
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); 
			return false;
		}
		
	}
	public boolean guncelleyazarsifre(getset nesne,int id)
	{

		String yazarsifre=nesne.getyazarsf();	
		String yazartarih=nesne.getTarihh();	
		
		try
		{
			
			CallableStatement statement=(CallableStatement) con.prepareCall("{call guncelleyazarsifre(?,?,?)}");
	
			 statement.setInt(1,id);
			 statement.setString(2,yazarsifre);	
			 statement.setString(3,yazartarih);	
				
			 int result=statement.executeUpdate();
			 if(result>0)
			 {
				 System.out.println("Yazar Þifre Güncellendi");
				 return true;
			 }
			 else
			 {
				 
				 return false;
			 }
			
		}
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); 
			return false;
		}
		
	}
	public boolean guncellehocapozisyon(getset nesne,int id)
	{
		String pozisyon=nesne.getpozisyon();	
		
		try
		{
			
			CallableStatement statement=(CallableStatement) con.prepareCall("{call guncellehocapozisyon(?,?)}");
	
			 statement.setInt(1,id);
			 statement.setString(2,pozisyon);	
				
			 int result=statement.executeUpdate();
			 if(result>0)
			 {
				 System.out.println("Hoca Pozisyon Güncellendi");
				 return true;
			 }
			 else
			 {
				 
				 return false;
			 }
			
		}
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); 
			return false;
		}
		
	}
	
	public boolean guncelleonay(getset nesne,int id)
	{

		String onay=nesne.getOnay();	
		
		try
		{
			
			CallableStatement statement=(CallableStatement) con.prepareCall("{call guncelleonay(?,?)}");
			 statement.setInt(1,id);
			 statement.setString(2,onay);	
				
			 int result=statement.executeUpdate();
			 if(result>0)
				 
			 {
				 System.out.println("Onay Durumu Güncellendi");
				 return true;
			 }
			 else
			 {
				 
				 return false;
			 }
			
		}
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); 
			return false;
		}
		
	}
	public boolean guncelleatananmakale(getset nesne,int id)
	{

		int hocaid=nesne.getHocaid();	
		String tarihmakale=nesne.getTarihmakale();
		
		try
		{
			
			CallableStatement statement=(CallableStatement) con.prepareCall("{call guncelleatananmakale(?,?,?)}");
	
			 statement.setInt(1,id);
			 statement.setInt(2,hocaid);
			 statement.setString(3,tarihmakale);	
				
			 int result=statement.executeUpdate();
			 if(result>0)
			 {
				 System.out.println("Atanan Makale Hocaid Güncellendi");
				 return true;
			 }
			 else
			 {
				 
				 return false;
			 }
			
		}
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); 
			return false;
		}
		
	}
	
	public boolean deleteatananmakale(int id)
	{

		try
		{
			
			CallableStatement statement=(CallableStatement) con.prepareCall("{call deleteatananmakale(?)}");
	
			 statement.setInt(1,id);

			 int result=statement.executeUpdate();
			 if(result>0)
			 {
				 System.out.println("Atananmakalesilindi");
				 return true;
			 }
			 else
			 {
				 
				 return false;
			 }
			
		}
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); 
			return false;
		}
		
	}
	
	public boolean deletehoca(int id)
	{

		try
		{
			
			CallableStatement statement=(CallableStatement) con.prepareCall("{call deletehoca(?)}");
	
			 statement.setInt(1,id);

			 int result=statement.executeUpdate();
			 if(result>0)
			 {
				 System.out.println("Hocasilindi");
				 return true;
			 }
			 else
			 {
				 
				 return false;
			 }
			
		}
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); 
			return false;
		}
		
	}


}




