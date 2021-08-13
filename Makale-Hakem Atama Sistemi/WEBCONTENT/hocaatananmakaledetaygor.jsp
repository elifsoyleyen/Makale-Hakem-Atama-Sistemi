<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
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

    <link rel="stylesheet" href="sufee-admin-dashboard-master/assets/css/bb.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
</head>

<body>
    <!-- Left Panel -->

    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="./"><img src="images/logo.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
            </div>

           <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                  
                   
                    <li class="menu-item-has-children ">
                      <a href="hocaatananmakalelistele.jsp"> <i class="menu-icon fa fa-dashboard"></i>Atanan Makalelerim </a>
                       
                    </li>
                 
                  
                    
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
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
        <!-- Header-->

        <div class="content mt-3">
            <div class="animated fadeIn">

   <jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
                <div class="row">
                    <div class="col-lg-6">
                    <%
                    
                 
                    int id=Integer.parseInt(request.getParameter("makaleid"));
                    session.setAttribute("makaleid",id);
					ResultSet rss=sayiCrud.listeleatananmakale();
				  	while(rss.next()) 
				  	{
				  		
				  		int idmakale=rss.getInt("makaleid");
				  		String onay=rss.getString("onay");
				  		if(idmakale==id){

					%>
                                                    <div class="card-header">
                                                        <strong>Makalelerim</strong> 
                                                    </div>
                                                    <div class="card-body card-block"  id="pdfolustu">
                                                      <form action="makaleekle_islem.jsp" method="post">
                                                            <div class="row form-group">
                                                                <div class="col col-md-3"><label class=" form-control-label">Yazar Adı:</label></div>
                                                                <div class="col-12 col-md-9">
                                                                  
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col col-md-3"><label for="text-input" class=" form-control-label"></label>Makale Başlığı</div>
                                                                <div class="col-12 col-md-9">
                                                                <input  type="text" name="makaleBaslik" id="makaleBaslik" placeholder="Text" class="form-control" value="<%=rss.getString("makaleBaslik")%>"><small class="form-text text-muted"></small></div>
                                                            </div>

                                                            <div class="row form-group">
                                                                <div class="col col-md-3"><label for="textarea-input" class=" form-control-label" >Makale İçerik</label></div>
                                                                <div class="col-12 col-md-9">
                                                                <textarea name="makaleicerik"  rows="9" placeholder="Content..." class="form-control" ><%=rss.getString("makaleicerik")%></textarea></div>
                                                            </div>  
                                                              </div>
                                                            <% if(onay.equals("Onaylanmadı"))
                                                            {%>
                                                            	
                                                            	 <td> <a href='makalekabulet.jsp?idatananmakale=<%=rss.getString("idatananmakale")%>'  class="btn btn-success">Kabul Et</a></td>
                                                            	  
                                                              	
                                                                 <td> <a href='makalereddet.jsp?idatananmakale=<%=rss.getString("idatananmakale")%>' class="btn btn-danger">Red</a></td>
                                                            	
                                                           
                                                        <%}
                                                            else 
                                                            {
                                                            	%>
                                                            	 <td> <a href='' class="btn btn-warning"  id=pdfcek onclick="pdfcek()">Rapor Gönder</a></td>
                                                            	<%
                                                            }
                                                        
                                                        %> 
                                                            
                                                            
                                                            
   	
                                                        </form>
                                                  
                                                  
                                                </div>
                                           <% }} %>
                                            </div>
                    </div>
                    <!--/.col-->


                                     
                                            </div>
                                        </div><!-- .animated -->
                               
                                <!-- Right Panel -->


                            <script src="sufee-admin-dashboard-master/vendors/jquery/dist/jquery.min.js"></script>
                            <script src="sufee-admin-dashboard-master/vendors/popper.js/dist/umd/popper.min.js"></script>

                            <script src="sufee-admin-dashboard-master/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
                            <script src="sufee-admin-dashboard-master/vendors/jquery-validation-unobtrusive/dist/jquery.validate.unobtrusive.min.js"></script>

                            <script src="sufee-admin-dashboard-master/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
                            <script src="sufee-admin-dashboard-master/assets/js/main.js"></script>
                                     
              
              
 <script>
    function pdfcek() {
        var sTable = document.getElementById('pdfolustu').innerHTML;
        var style = "<style>";
        style = style + "table {width: 100%;font: 17px arial;}";
        style = style + "table, th, td {border: solid 1px #DDD; ";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=500,width=500');
        win.document.write('<html><head>');
        win.document.write('<title>Profile</title>'); 
        win.document.write(style);       
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(sTable);        
        win.document.close(); 	 
        win.print();    
    }
</script>

  
                            
</body>
</html>
