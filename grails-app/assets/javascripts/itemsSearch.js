$(function() {
	$("#searchBtn").click( function() {
		searchItems(0);
	});
	$("#searchInput").keypress(enterSearchItems);
	$("#btn-previous").hide();	
	$("#btn-next").hide();	

});

function enterSearchItems(param) {
	if (param.keyCode == 13) {
		searchItems(0);
	}
};

function searchItems(offset) {
	var search = $.get("https://api.mercadolibre.com/sites/MLA/search",
						{q: $("#searchInput").val(),
						offset: offset,
						limit: 12,
						condition: "new",
						buying_mode: "buy_it_now"});
	search.done(showResults);
	search.fail(showError);
};

function showResults(data) {
	$("#search_result").empty();

	var super_promise = fetchItemData(data);

	super_promise.done(function() {
		if (data.paging.offset > 0) {
			$("#btn-previous").show();
		} else {
			$("#btn-previous").hide();	
		};

		if (data.paging.offset > data.paging.total - 12) {
			$("#btn-next").hide();
		} else {
			$("#btn-next").show();
		};
	});

	$("#btn-next").off("click").click(function() {
		searchItems(data.paging.offset + 12);
	});

	$("#btn-previous").off("click").click(function() {
		searchItems(data.paging.offset - 12);
	});
};

function fetchItemData(data) {
	var promises = [];
	$.each(data.results, function(index, item) {
		var promise = addResults(index, item);
		promises.push(promise);
	});

	var super_promise = $.when.apply(this, promises);
	return super_promise;
};
			
function addResults (index, item) {
	var search_item = $.get("https://api.mercadolibre.com/items/"+item.id);
	search_item.done(function(res) {		
		var content = $("#search_item_template").html();
		content = content.replace("#itemTitle", res.title);
		content = content.replace("#itemPrice", res.price);
		content = content.replace("#urlImg", res.pictures[0].url);
		$("#search_result").append(content);
	});
	search_item.fail(showError);
	return search_item;
};

			
function showError() {
	$("#search_result").empty();
	$("#search_result").append($("#error_search"));
};
