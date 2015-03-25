<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title> Amigos </title>
	</head>
	<body>
		<div class="container marketing" style="width: 1200px">
		<g:each var="friend" in="${friends}">
			<div  class="col-md-3">
				<div class="thumbnail" >
						<p><a href="${friend.springUser.username}/wall"> ${friend.name} ${friend.surname} </a></p>	
						<p>Nacimiento: ${friend.dateOfBirth}</p>	
						<p><a href="/lefrage/friends/unFriend/${friend.id}" style="font-size: 80%" class="btn btn-primary" role="button">Dejar de ser 	amigos</a> 
				</div>
			</div>
		</g:each>
		</div>
	</body>
</html>
