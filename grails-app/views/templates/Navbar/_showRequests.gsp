<a class="btn config-link dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
Solicitudes <span id="requests" class="badge">${pendingRequests.size()}</span>
</a>
<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
	<g:if test="${pendingRequests.size() == 0}">
		<li role="presentation">
          	<span class="fa fa-check fa-lg">No tienes solicitudes pendientes!!!!</span>
        </li>

	</g:if>
	<g:else>
		<g:each var="request" in="${pendingRequests}">
			<li role="presentation">
				<div id="user${request.id}" class="thumbnail" style="text-align: center">	
					<a role="menuitem" tabindex="-1">${request.name} ${request.surname}</a>
					<a type="button" onclick="acceptRequest(${request.id})" class="fa fa-check fa-lg"></a>
					<a type="button" onclick="denyRequest(${request.id})" class="fa fa-times fa-lg"></a>
				</div>
			</li>
		</g:each>
	</g:else>
</ul>
