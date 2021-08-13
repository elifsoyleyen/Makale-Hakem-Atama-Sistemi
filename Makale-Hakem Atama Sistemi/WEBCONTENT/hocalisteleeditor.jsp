
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
 <%@page import="java.util.Date"%>
 <%@page import="java.text.DateFormat"%>
 <%@page import="java.text.SimpleDateFormat"%> 
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
    <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/jqvmap/dist/jqvmap.min.css">
     <link rel="stylesheet" href="sufee-admin-dashboard-master/vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css">


    <link rel="stylesheet" href="sufee-admin-dashboard-master/assets/css/bb.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <style>
    .renk
    {
    background:#0A9D15;
    }
    </style>
    
    
  <jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
            <jsp:useBean id="sayiNesnesi" class="odev.getset"></jsp:useBean>
            
          
</head>



     <%
					int ideditor=Integer.parseInt(String.valueOf(session.getAttribute("ideditor")));
                 
					%>

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
                        <a href="turlisteleeditor.jsp"> <i class="menu-icon fa fa-dashboard"></i>Tür Listeleme </a>
                    </li>
                      <li class="active">
                        <a href="hocaekleeditor.jsp"> <i class="menu-icon fa fa-dashboard"></i>Hoca Ekleme </a>
                    </li>
               
                      <li class="active">
                        <a href="sifredegistireditor.jsp"> <i class="menu-icon fa fa-dashboard"></i>Şifremi Değiştir </a>
                    </li>

                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">
     
  <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
               
               
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
                                            <th>Hoca Adı Soyadı</th>
                                            <th>Puan</th>
                                            <th>Hoca Mail</th>
                                            <th>Pozisyon</th>
                                            <th>Hoca Telefon</th>
                                            <th>Tür Adı</th>
                                        
                                            <th>Sil</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                 
									  <% 
									  ResultSet rs=sayiCrud.hocaselectall();
									  while(rs.next()) { %>
                                        <tr>
                                            <td><%=rs.getString("hocaadsoyad") %></td>
                                            <td><%=rs.getString("puan") %></td>
                                            <td><%=rs.getString("hocamail") %></td>
                                            <td><%=rs.getString("pozisyon") %></td>
                                            <td><%=rs.getString("hocatel") %></td>
                                            <td><%=rs.getString("turadi") %></td>
                                            
                                          
                                 	 <td><a href='hocasileditor.jsp?idhoca=<%=rs.getString("idhoca")%>' class="btn btn-danger">Sil</a></td>
      							 		
                               
                                        </tr>

                                    </tbody>
                                              <%} %> 
                                </table>
                        <td><a href='hocaekleeditor.jsp'class="btn btn-success">Ekle</a></td>
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
