<!DOCTYPE html>
<html>
	<head>
		<title>Le Muro de ${currentUserName}</title>
		<meta name="layout" content="main">
	</head>
	<body>
		<div style="width:500px;margin-left:auto;margin-right:auto" >
			<g:each var="post" in="${currentUserPosts}">
				<div class="panel panel-default">
			  		<div class="panel-heading">Panel heading without title</div>
	  				<div class="panel-body">
	    				Panel content
	  				</div>
				</div>
			</g:each>
		</div>
	</body>
</html>
