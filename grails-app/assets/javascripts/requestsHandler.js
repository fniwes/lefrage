function acceptRequest(id) {
	var promise = $.post("/lefrage/friends/acceptRequest/" + id);

	promise.done(function() {
		alert("Se aceptó la solicitud!");
		var actual = $("#requests").text();
		$("#requests").text( actual-1 );
		$("#user"+id).remove();
	});
};

function denyRequest(id) {
	var promise = $.post("/lefrage/friends/denyRequest/" + id);

	promise.done(function() {
		alert("Se canceló la solicitud!");
		var actual = $("#requests").text();
		$("#requests").text( actual-1 );
		$("#user"+id).remove();
	});
};