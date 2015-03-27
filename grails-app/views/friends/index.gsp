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
							'<a id="friend-button-'+friendId+'" onclick="return befriend(event,'+friendId+')" href="/lefrage/friends/befriend/'+friendId+'" style="font-size: 80%;background-color: #d4e157;" class="btn btn-default green-btn" role="button">Ser amigos</a>'
						);
						//Convierte el boton de desamigarse a amigarse (de manera asquerosa, 
						//podria usarse de nuevo el template en vez de hacer esto)
					}
				});
				return false;
			}

			function befriend(event,friendId){
				var href = $(event.target).attr("href");
				console.log(href);
				$.ajax({
					method:"POST",
					url: href,
					success: function(){
						$("#"+event.target.id).remove();
						alert("Solicitud enviada!");
						$("#div-friend-"+friendId).append(
							'<a id="friend-button-'+friendId+'" onclick="return unfriend(event,'+friendId+')" href="/lefrage/friends/revert/'+friendId+'" style="font-size: 80%;background-color: #d4e157;" class="btn btn-default green-btn" role="button">Revocar solicitud</a>'
						);
						//Convierte el boton de amigarse a revertir solicitud (de manera asquerosa, 
						//podria usarse de nuevo el template en vez de hacer esto)
					}
				});
				return false;
			}
		</script>
	</body>
</html>

