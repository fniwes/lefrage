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
						<p ><a style="color: #dce775" href="/lefrage/${friend.springUser.username}/muro"> ${friend.name} ${friend.surname} </a></p>
						<p>Nacimiento:
							<g:formatDate date="${friend.dateOfBirth}" format="dd/MM/yyyy"/>
						</p>
						<p><a href="/lefrage/friends/unFriend/${friend.id}" style="font-size: 80%;background-color: #d4e157;border-color:  #d4e157" class="btn btn-primary" role="button">Dejar de ser amigos</a> </p>
				</div>
			</div>
		</g:each>
		</div>
	</body>
</html>

