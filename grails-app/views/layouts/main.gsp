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
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


    <title><g:layoutTitle default="Ima Default Title" /></title>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'styles.css', absolute:'true')}">

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
							<input type="text" class="form-control" placeholder="Buscar...">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-default">
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

    <!-- jQuery Version 2.1.3 -->
    <script src="${resource(dir: 'js', file: 'jquery-2.1.3.js', absolute:'true')}"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js', absolute:'true')}"></script>

    <script>
    	function changeDropdown(name){
    		$("#dropdown").html(name+" <span class='caret'></span>");
    	}
    </script>

</body>

</html>
