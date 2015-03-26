<!DOCTYPE html>
<html>
	<head>
		<title>Le Muro de ${wallUserName}</title>
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
			<a href="/lefrage/${username}/busquedas" class="btn btn-default green-btn" style="margin-top:0px; width:100%; margin-top:10px">
				Búsquedas
			</a>
		</div>
		<br>
		<div style="margin-right:90px">
		<div class="well well-lg" style="width:800px;margin-left:auto;">
			<g:form style="margin-left:auto;margin-right:auto;width:700px" method="post" controller="wall" action="writePost">
	       		<div>
	            	<g:textArea style="font-size:13pt" placeholder="Le post text..." class="form-control" name="HTMLpostContent"/>
	            </div>
	            <br/>
	            <button class="btn btn-primary pull-right">Postear</button>
	            <p/>
	            <button type="reset" class="btn btn-default pull-right">Borrar</button>	
	            <br />
	        </g:form>
	    </div>
    	<br/><br/>
		<div class="well well-lg" style="width:800px;margin-left:auto;">
			<div style="width:700px;margin-left:auto;margin-right:auto" >
				<g:each status="i" var="post" in="${userPosts}">
					<div style="font-size:15pt"	class="panel panel-default">
				  		<div class="panel-heading ${isAutoPost ? "autopost" : (isML ? "ml" : "")}">
				  			${post.author.name}
				  			<div style="float:right" id="parsedDate${i}">
			  					<g:formatDate date="${post.date}" format="yyyy-MM-dd"/>
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
