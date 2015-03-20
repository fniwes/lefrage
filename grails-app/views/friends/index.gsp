<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>
		<div class="container marketing">
		<g:each var="friend" in="${friends}">
			<div class="row">
			  <div style:"background-color:red" class="col-sm-6 col-md-4">
					<p><a href="${friend.name}${friend.id}/wall"> ${friend.name} ${friend.surname} </a></p>
					<p>Nacimiento: ${friend.dateOfBirth}</p>
					<p><a href="#" class="btn btn-primary" role="button">Dejar de ser amigos</a> 
			    </div>
			</div>
		</g:each>
		<div>
	</body>
</html>