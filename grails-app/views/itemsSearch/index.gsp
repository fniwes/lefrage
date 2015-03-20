<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">
		<asset:javascript src="application.js"/>
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

		<div id="search_result"class="container marketing" style="width: 60%">
		</div><!-- /container marketing -->

	</body>
</html>

<script id="search_item_template" type="text/template">
	<div>
		<div class="row featurette">	          		 
			<h2 class="featurette-heading"></h2>
			<div class="col-md-7">
				<h2 class="featurette-heading"> #itemTitle <span class="text-muted"> $ #itemPrice</span></h2>
			</div>
			<div class="col-md-5">
				<img class="featurette-image img-responsive" src="#urlImg" width="300"/>
			</div>
		</div>
	</div>
</script>
<script id="error_search" type="text/template">
	<div>
		<div class="alert alert-danger alert-dismissible" role="alert">Error en la búsqueda, por favor vuelva a intenterlo.
		</div>
	</div>
</script>