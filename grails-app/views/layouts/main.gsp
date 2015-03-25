<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
  
    <asset:javascript src="application.js"/>
  	<asset:stylesheet src="application.css"/>
	<link rel="icon" type="image/png" href="http://developers.mercadolibre.com/wp-content/uploads/logo_puzzle_slider.png" />


    <!--<title>Bare - Start Bootstrap Template</title>-->

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet"  href="${resource(dir: 'css', file: 'bootstrap.min.css', absolute:'true')}">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


    <title><g:layoutTitle default="Ima Default Title" /></title>

    <!-- Custom CSS -->
    <style>
    body {
        padding-top: 70px;
        /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
    	/*	font-family: Myriad;*/
    	font-family: 'PT Sans', sans-serif; 

    }

    .navbar {
    	background-color: #d4e157;
		border: 0;
		min-height: 50px;
		/*-webkit-box-shadow: 0px 5px 7px 0px rgba(0, 0, 0, 0.2);
		-moz-box-shadow:    0px 5px 7px 0px rgba(0, 0, 0, 0.2);
		box-shadow:         0px 5px 7px 0px rgba(0, 0, 0, 0.2);*/
	}	
	.navbar-inverse .navbar-nav>li>a , .navbar-inverse .navbar-brand , .input-group .form-control{
		color: white;
		font-size: 17px;
		border-radius: 10px;
		height:40px;
		padding:10px;
	}
	.navbar-inverse .navbar-nav>li>a , .navbar-inverse .navbar-brand {
		margin-top: 5px;
		margin-left:5px;
		float: left;
	}
	.navbar-inverse .navbar-brand {
		font-size:20px;
		border-radius: 10px;
	}

	.navbar-inverse .navbar-nav > li > a:hover, .navbar-inverse .navbar-brand:hover{
		background-color: #dce775;
	}

	.input-group{
		background-color: #dce775;
		border: 0px;
		border-radius: 10px;
		margin-top: 5px;
		margin-left:5px;
		float: left;
	}
	.input-group .form-control{
		background-color:transparent;
		border:0;
		box-shadow:0 0 0; 
	}
	.input-group button{
	    border:0;
	    background:transparent;
	    color:white;
	    font-size:17px;
	    height:100%;
	}

	.input-group button:hover{
		background:transparent;
		color:#afb42b;
	}

	.input-group button:focus{
		background:transparent;
		color:#afb42b;
	}

	.input-group .form-control::-webkit-input-placeholder { /* WebKit browsers */
	    color:    white;
	}
	.input-group .form-control:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
	   color:    white;
	   opacity:  1;
	}
	.input-group .form-control::-moz-placeholder { /* Mozilla Firefox 19+ */
	   color:    white;
	   opacity:  1;
	}
	.input-group .form-control:-ms-input-placeholder { /* Internet Explorer 10+ */
	   color:    white;
	}

	.navbar-inverse .navbar-nav > .open > a:hover{
		background-color:#DCE775;	
	}

	.navbar-inverse .navbar-nav > .open > a{
		background-color:#DCE775;	
	}
    </style>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
 <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/lefrage">Lefrage</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <Navbar:showLinks/>
                    <li>
                    	<div class="input-group">
							<input type="text" class="form-control" placeholder="Buscar..." id="searchInput">
							<span class="input-group-btn">
								<button id="searchBtn" type="submit" class="btn btn-default">
									<span class="fa fa-search">
										<span class="sr-only">Buscar...</span>
									</span>
								</button>
							</span>
						</div>
                    </li>
                    <li class="dropdown">
                      	<a id="dropdown" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Amigos <span class='caret'></span></a>
                  		<ul class="dropdown-menu" role="menu">
                    		<li><a onclick="changeDropdown('Meli')">Meli</a></li>
	                        <li><a onclick="changeDropdown('Amigos')">Amigos</a></li>
	                    </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	<g:layoutBody />
	
    <script>
    	function changeDropdown(name){
    		$("#dropdown").html(name+" <span class='caret'></span>");
    	}
    </script>

    <script id="search_item_template" type="text/template">
		<article class="col-md-4 search-item">
	   		<div class="thumbnail">
	    		<img src="#urlImg" width="100%" height="200">
	        	<div class="caption">
	            	<h3>#itemTitle</h3>
	            	<p>$ #itemPrice</p>
	            <hr class="featurette-divider">
			        <div class="row">
			        	<div class="buttons col-md-6">
			        		<button type="button" id="btn-post" class="btn btn-primary btn-block" data-toggle="modal" data-target="#postModal" >Post</button>
			        	</div>
			        	<div class="buttons col-md-6">
			        		<button class="btn btn-primary btn-block">Compartir</button>
			        	</div>
			       	</div> <!-- /row -->
	        	</div> <!-- /caption -->
	    	</div> <!-- /thumbnail -->
	    </article>
	</script>


	<script id="post_item_template" type="text/template">
		<article class="col-md-4 search-item">
			<img src="#urlImg" width="100%" height="200">
	    	<div class="caption">
	        	<h3>#itemTitle</h3>
	        	<p>$ #itemPrice</p>
	    	</div> <!-- /caption -->
	    </article>
	</script>

	<script id="error_search" type="text/template">
		<div>
			<div class="alert alert-danger alert-dismissible" role="alert">Error en la búsqueda, por favor vuelva a intenterlo.
			</div>
		</div>
	</script>

</body>

</html>
