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
                <a class="navbar-brand" href="./"><img src="images/logo.png" alt=""></a>
                <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt=""></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    
                   
                    <li class="menu-item-has-children ">
                        <a href="yazarmakalelerim.jsp"   aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>Makalelerim</a>
                       
                    </li>
                 
                    <li class="menu-item-has-children ">
                        <a href="makaleekle.jsp" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Makale Ekle</a>
                      
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

         

            </div>

        </header><!-- /header -->
        <!-- Header-->

        <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">
                    <div class="col-lg-6">
                    <%String yazaradsoyad=String.valueOf(session.getAttribute("yazaradsoyad"));
					System.out.println(yazaradsoyad);
					int idd=Integer.parseInt(String.valueOf(session.getAttribute("idyazar")));
					%>
                                                    <div class="card-header">
                                                        <strong>Makale Ekleme Sayfası</strong> 
                                                    </div>
                                                    <div class="card-body card-block">
                                                      <form action="makaleekle_islem.jsp" method="post">
                                                            <div class="row form-group">
                                                                <div class="col col-md-3"><label class=" form-control-label">Yazar Adı:</label></div>
                                                                <div class="col-12 col-md-9">
                                                                    <p class="form-control-static"><%=yazaradsoyad%></p>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col col-md-3"><label for="text-input" class=" form-control-label"></label>Makale Başlığı</div>
                                                                <div class="col-12 col-md-9">
                                                                <input type="text" name="makaleBaslik" id="makaleBaslik" placeholder="Text" class="form-control"><small class="form-text text-muted"></small></div>
                                                            </div>

                                                            <div class="row form-group">
                                                                <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">Makale İçerik</label></div>
                                                                <div class="col-12 col-md-9">
                                                                <textarea name="makaleicerik"  rows="9" placeholder="Content..." class="form-control"></textarea></div>
                                                            </div>  
                                                                <div class="row form-group">
                                                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Tür</label></div>
                                                                    <div class="col-12 col-md-9">
                                                                  
                                                                        <select id="selectBox" onchange="populateCustomerId();" class="form-control-lg form-control">
                                                                           <jsp:useBean id="sayiCrud" class="odev.dataislemler"></jsp:useBean>
                                                                           <% 		
																		ResultSet rs=sayiCrud.listeletur();
																	  	while(rs.next()) 
																	  	{ %> 
																	  <option  value="<%=rs.getInt("idtur")%>" ><%=rs.getString("turadi")%></option>
																	  	<% } %>
                                                                        </select>
                                                               <input id="customerId" name="aa" type="hidden" value="" />
                                                                    </div>
                                                                </div>          
                                                                <div class="card-footer">
                                                         <input class="btn btn-success" type="submit" value="Ekle">
                                                        
                                                    </div>

   	
                                                        </form>
                                                    </div>
                                                  
                                                </div>
                                           
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
function populateCustomerId(){
    var selectBox = document.getElementById('selectBox');

    /* selected value of dropdown */
    var selectedCustomerId = selectBox.options[selectBox.selectedIndex].value;

    /* selected value set to input field */
    document.getElementById('customerId').value = selectedCustomerId; 
}

</script>

    <script>
        $('#btn1').click(function () {
            alert('Makale Ekleme İşlemi Başarı İle Gerçekleşti')
        });
    </script>
  
                            
</body>
</html>
