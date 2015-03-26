<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title> Amigos </title>
	</head>
	<body>
		<div class="container marketing" style="width: 1200px">
		<g:each var="friend" in="${friends}">
			<div class="col-md-3">
				<div id="div-friend-${friend.id}" class="thumbnail" >
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

		<script>
			function unfriend(event,friendId){
				var href = $(event.target).attr("href");
				console.log(href);
				$.ajax({
					method:"POST",
					url: href,
					success: function(){
						$("#"+event.target.id).remove();
						$("#div-friend-"+friendId).append(
							'<a id="friend-button-'+friendId+'" href="/lefrage/friends/befriend/'+friendId+'" style="font-size: 80%;background-color: #d4e157;" class="btn btn-default green-btn" role="button">Ser amigos</a>'
						);
						//Convierte el boton de desamigarse a amigarse (de manera asquerosa, 
						//podria usarse de nuevo el template en vez de hacer esto)
					}
				});
				return false;
			}
		</script>
	</body>
</html>

