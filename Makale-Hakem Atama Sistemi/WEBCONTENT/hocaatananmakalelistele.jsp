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
    
      <jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
            <jsp:useBean id="sayiNesnesi" class="odev.getset"></jsp:useBean>
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
                        <a href="hocaatananmakalelistele.jsp"> <i class="menu-icon fa fa-dashboard"></i>Atanan Makalelerim </a>
                    </li>
                   
                      <li class="active">
                        <a href="sifredegistirhoca.jsp"> <i class="menu-icon fa fa-dashboard"></i>Şifremi Güncelle </a>
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
               
                    <div class="header-left">
                        <button class="search-trigger"><i class="fa fa-search"></i></button>
                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                            </form>
                        </div>

                    </div>
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
                                          
                                              <th>Makale ID</th>
                                              <th>Makale Baslik</th>
                                              <th>Makale İçerik</th>
                                              <th>Onay Durumu</th>
                                              <th>Detayı Gör</th>

                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
									  <% 
									  int idhoca=Integer.parseInt(String.valueOf(session.getAttribute("idhoca")));
									  ResultSet rs=sayiCrud.listeleatananmakale();
									  while(rs.next()) {
										  String Makaleicerik=rs.getString("makaleicerik");
											
											
										  int hocaid=rs.getInt("hocaid");
										  if(idhoca==hocaid){%>
										  
										 
                                        <tr>
                                           
                                            <td><%=rs.getString("makaleid") %></td>
                                          
                                             <td><%=rs.getString("makaleBaslik") %></td>
                                                <td> <%=Makaleicerik.substring(0,50)+" ..."%></td>
                                                <td><%=rs.getString("onay") %></td>
                              
      							 	  <td> <a href='hocaatananmakaledetaygor.jsp?makaleid=<%=rs.getString("makaleid")%>' class="btn btn-success">Detay Gör</a></td>
                               
                                        </tr>

                                    </tbody>
                                              <%} }%> 
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
