<!DOCTYPE html>
<html>
	<head>
		<title>Le Muro de ${wallUserName}</title>
		<meta name="layout" content="main">
		<style>
			
		</style>
	</head>
	<body>
		<div class="well well-lg profile" style="width:400px;margin-left:40px;position:fixed;float:left">
			<div class="profile-data" style="margin-left:auto; margin-right:auto">
				<h2 style="margin-bottom:0px">
					${name} ${surname}
				</h2>
				<h3 style="margin-top:5px;color:#C2C2A3" >
					${username}
				</h3>
				<h3 style="margin-top:5px">
					<g:formatDate date="${profileDOB}" format="yyyy-MM-dd"/>
				</h3>
				<h3 style="margin-top:5px">
					Amigos: ${profileFriendsCount}
				</h3>
				<a href="/lefrage/${username}/busquedas" class="btn btn-default mlblue-btn" style="margin-top:0px; width:100%; margin-top:10px">
					Mis búsquedas
				</a>
			</div>
		</div>
		<div style="margin-right:90px">
		<div class="well well-lg" style="width:800px;margin-left:auto;">
			<form style="margin-left:auto;margin-right:auto;width:700px" method="post" action="${createLink(controller: "wall", action: "writePost", params: [username: username])}">
	       		<div>
	            	<g:textArea style="font-size:13pt" placeholder="Le post text..." class="form-control" name="HTMLpostContent"/>
	            </div>
	            <br/>
	            <button type="submit" class="btn btn-primary pull-right">Postear</button>
	            <p/>
	            <button type="reset" class="btn btn-default pull-right">Borrar</button>	
	            <br />
	        </form>
	    </div>
    	<br/><br/>
		<div class="well well-lg" style="width:800px;margin-left:auto;">
			<div style="width:700px;margin-left:auto;margin-right:auto" >
				<g:each status="i" var="post" in="${userPosts}">
					<div style="font-size:15pt"	class="panel panel-default">
				  		<div class="panel-heading ${isAutoPost ? "autopost" : (post.itemID ? "ml" : "")}">
				  			${post.author.name}
				  			<div style="float:right" id="parsedDate${i}">
			  					<g:formatDate date="${post.date}" format="yyyy-MM-dd HH:mm:ss"/>
				  			</div>
				  		</div>
		  				<div class="panel-body">
		    				${post.content}
		  				</div>
					</div>
				</g:each>
			</div>
		</div>
		</div>
	</body>
</html>
