<!DOCTYPE html>
<html>
	<head>
		<title>Le Muro de ${currentUserName}</title>
		<meta name="layout" content="main">
		<style>
			
		</style>
	</head>
	<body>
		<div class="profile-data">
			<h2 style="margin-bottom:0px">
				${name} ${surname}
			</h2>
			<h3 style="margin-top:5px">
				${username}
			</h3>
			<a href="/lefrage/${username}/busquedas" class="btn btn-default" style="margin-top:0px; width:100%; margin-top:10px">
				Búsquedas
			</a>
		</div>
		<div style="width:500px;margin-left:auto;margin-right:auto" >
			<g:each var="post" in="${userPosts}">
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
