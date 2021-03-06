<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!doctype html>

<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sufee Admin - HTML5 Admin Template</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="sufee-admin-dashboard-master/apple-icon.png">
    <link rel="shortcut icon" href="sufee-admin-dashboard-master/favicon.ico">

    <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/flag-icon-css/css/flag-icon.min.cssss">
    <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/jqvmap/dist/jqvmap.min.css">
     <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css">


 <link rel="stylesheet" href="sufee-admin-dashboard-master/assets/css/bb.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>


</head>

<body>


    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="./"><img src="images/logo.png" alt=""></a>
                <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt=""></a>
            </div>

            
         <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="hocalisteleeditor.jsp"> <i class="menu-icon fa fa-dashboard"></i>Hoca Listeleme </a>
                    </li>
                   
                  
                     <li class="active">
                        <a href="makalelisteleeditor.jsp"> <i class="menu-icon fa fa-dashboard"></i>Makale Listeleme </a>
                    </li>
                   <li class="active">
                        <a href="turlisteleeditor.jsp"> <i class="menu-icon fa fa-dashboard"></i>T??r Listeleme </a>
                    </li>
                      <li class="active">
                        <a href="hocaekleeditor.jsp"> <i class="menu-icon fa fa-dashboard"></i>Hoca Ekleme </a>
                    </li>
               
                      <li class="active">
                        <a href="sifredegistireditor.jsp"> <i class="menu-icon fa fa-dashboard"></i>??ifremi De??i??tir </a>
                    </li>

                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->
 

    <div id="right-panel" class="right-panel">
      <%
					
					int ideditor=Integer.parseInt(String.valueOf(session.getAttribute("ideditor")));
					%>
    
  <header id="header" class="header">

            <div class="header-menu">


    
                <div class="top-search-area">
   <form action="makalelisteleeditor.jsp" method="post">
       <input type="text" name="arama" class="" id="arama" placeholder="Search...">
      
       
       	
       <button type="submit" value="Search" class="btn btn-success" >Search</button>
     
   </form>
 </div>
           
            </div>

        </header><!-- /header -->

            <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
 
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Data Table</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                 
	  
                                        <tr>
                                      
                                            <th>Makale Ba??l??k</th>
                                            <th>Makale ????erik</th>
                                            <th>Makale Tarih</th>
                                            <th>T??r</th>
                                             <th>Durum</th>
                                             <th>Detay?? G??r</th>
                                            <th>ATAMA</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                     <jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
									  <% 
									  
									  ResultSet rs;
									  String makaleicerik=request.getParameter("arama");
									  if(makaleicerik==null)
									  {
										  rs=sayiCrud.listelemakale();
										  
										  
									  }
									  else
									  {
									  
									  rs=sayiCrud.makalearama(makaleicerik);
									  }
									  while(rs.next()){
									 
										  
										 
									  { 
										   String idmakale = rs.getString("idmakale");
										   String turadi = rs.getString("turadi");
										  String Makaleicerik=rs.getString("makaleicerik");
									
									  
									  %>
                                        <tr>
                                         
                                            <td><%=rs.getString("makaleBaslik") %></td>
                                           <td> <%=Makaleicerik.substring(0,50)+" ..."%></td>
                                           
                                            <td><%=rs.getString("makaletarih") %></td>
                                            <td><%=rs.getString("turadi") %></td>
                                            <td><%=rs.getString("durum") %></td>
                                            
                                           <td> <a href='makaledetayigoreditor.jsp?idmakale=<%=rs.getString("idmakale")%>' class="btn btn-success">Detay G??r</a></td>
                                      
                                            
                                            <%
                                            String durum=rs.getString("durum");
                                            if(durum.equals("Atanmam????")){
                                            
                                            	 %> <td><a href='atananmakaleler.jsp?idmakale=<%=rs.getString("idmakale")%>'class="btn btn-success">ATAMA</a></td><%
                                            }
                                            else 
                                            {
                                            	 %> <td><a href=''class="btn btn-warning">ATANDI</a></td><%
                                            	
                                            	
                                            }
                                            %>
                                            

                                

                                        </tr>
                                  <%}} %>   

                                    </tbody>
                                   
                                </table>
                            </div>
                        </div>
                    </div>
   

                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
 

  </div><!-- /#right-panel -->
    <!-- Right Panel -->
 	<script src="sufee-admin-dashboard-master/vendors/jquery/dist/jquery.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="sufee-admin-dashboard-master/assets/js/main.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/jszip/dist/jszip.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/pdfmake/build/vfs_fonts.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="sufee-admin-dashboard-master/vendors/datatables.net-buttons/js/buttons.colVis.min.js"></script>
    <script src="sufee-admin-dashboard-master/assets/js/init-scripts/data-table/datatables-init.js"></script>
    <script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>
    


</body>

</html>
