$(function() {
	$("#searchBtn").click(searchItems);
	$("#searchInput").keypress(enterSearchItems);
});

function enterSearchItems(param) {
	if (param.keyCode == 13) {
		searchItems();
	}
};

function searchItems() {
	var search = $.get("https://api.mercadolibre.com/sites/MLA/search",
						{q: $("#searchInput").val(),
						offset: 0,
						limit: 10,
						condition: "new",
						buying_mode: "buy_it_now"});
	search.done(showResults);
	search.fail(showError);
};

function showResults(data) {
	$.each(data.results, addResults);
};
			
function addResults (index, item) {
	$("#search_result").empty();
	var search_item = $.get("https://api.mercadolibre.com/items/"+item.id);
	search_item.done(function(res) {		
		var content = $("#search_item_template").html();
		content = content.replace("#itemTitle", res.title);
		content = content.replace("#itemPrice", res.price);
		content = content.replace("#urlImg", res.pictures[0].url);
		$("#search_result").append(content);
	});
	search_item.fail(showError);
};

			
function showError() {
	$("#search_result").empty();
	$("#search_result").append($("#error_search"));
};
