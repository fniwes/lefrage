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
						<a style="color: #dce775" href="/lefrage/${friend.springUser.username}/perfil">
							${friend.name} ${friend.surname} 
						</a>
						<p>Nacimiento:
							<g:formatDate date="${friend.dateOfBirth}" format="dd/MM/yyyy"/>
						</p>
						<Search:friendButton friend="${friend}"/>
				</div>
			</div>
		</g:each>
		</div>
	</body>
</html>

