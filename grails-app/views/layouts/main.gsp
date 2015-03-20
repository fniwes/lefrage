<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>

    <!--<title>Bare - Start Bootstrap Template</title>-->

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet"  href="${resource(dir: 'css', file: 'bootstrap.min.css', absolute:'true')}">

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
	}	
	.navbar-toggle{
	}
	.navbar-inverse .navbar-nav>li>a , .navbar-inverse .navbar-brand {
		color: white;
		font-size: 17px;
		border-radius: 10px;
	}
	.navbar-inverse .navbar-brand {
		font-size:20px;
		border-radius: 10px;
	}
	.navbar-inverse .navbar-nav > li > a:hover, .navbar-inverse .navbar-brand:hover{
		background-color: #dce775;
	}
	@font-face { 

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
                <a class="navbar-brand" href="#">Lefrage</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">Wall</a>
                    </li>
                    <li>
                        <a href="#">Friends</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	<g:layoutBody />

    <!-- jQuery Version 2.1.3 -->
    <script src="js/jquery-2.1.3.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
