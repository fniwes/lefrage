<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">
		<asset:javascript src="application.js"/>
  		<asset:stylesheet src="application.css"/>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<link rel="icon" type="image/png" href="http://developers.mercadolibre.com/wp-content/uploads/logo_puzzle_slider.png" />
		<title>Busqueda Regalo</title>
	</head>
	
	<body>
		<div class="container">
		    <div class="row">
			    <div class="input-group">
			    	<input type="text" class="form-control" placeholder="Buscar..." id="searchInput">
					<span class="input-group-btn">
			    		<button class="btn btn-default" id="searchBtn">Buscar</button>
			      	</span>
	  		  	</div><!-- /input-group -->
	  		</div><!-- /row -->
  		</div><!-- /container -->

		<div id="search_result"class="container marketing" style="width: 70%">
		</div><!-- /container marketing -->

		<nav>
			<ul class="pager">
				<li class="previous"><a id="btn-previous" href="#"><span aria-hidden="true">&larr;</span>Anterior</a></li>
				<li class="next"><a id="btn-next" href="#">Siguiente<span aria-hidden="true">&rarr;</span></a></li>
			</ul> <!-- /ul -->
		</nav> <!-- /nav -->

	</body>
</html>

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
		        		<a href="#" class="btn btn-primary btn-block" role="button">Post</a>
		        	</div>
		        	<div class="buttons col-md-6">
		        		<a href="#" class="btn btn-primary btn-block" role="button">Compartir</a>
		        	</div>
		       	</div> <!-- /row -->
        	</div> <!-- /caption -->
    	</div> <!-- /thumbnail -->
    </article>
</script>
<script id="error_search" type="text/template">
	<div>
		<div class="alert alert-danger alert-dismissible" role="alert">Error en la búsqueda, por favor vuelva a intenterlo.
		</div>
	</div>
</script>