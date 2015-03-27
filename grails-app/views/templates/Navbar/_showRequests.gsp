<a class="btn config-link dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
Solicitudes <span class="badge">${pendingRequests.size()}</span>
</a>
<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
	<g:if test="${pendingRequests.size() == 0}">
		<li role="presentation">
          	<span class="fa fa-check">No tienes solicitudes pendientes!!!!</span>
        </li>

	</g:if>
	<g:else>
		<g:each var="request" in="${pendingRequests}">
			<li role="presentation">
				<a role="menuitem" tabindex="-1">${request.name} ${request.surname}</a>
			</li>
		</g:each>
	</g:else>
</ul>
