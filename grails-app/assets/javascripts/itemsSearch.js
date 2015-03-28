$(function() {
	$("#btn-previous").hide();	
	$("#btn-next").hide();	
});

function searchItems(offset, item) {
	var search = $.get("https://api.mercadolibre.com/sites/MLA/search",
						{q: item,
						offset: offset,
						limit: 9,
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

		if (data.paging.offset > data.paging.total - 9) {
			$("#btn-next").hide();
			$("#btn-favourite").hide();
		} else {
			$("#btn-next").show();
			$("#btn-favourite").show();
		};
	});

	$("#btn-next").off("click").click(function() {
		searchItems(data.paging.offset + 9, data.query);
	});

	$("#btn-previous").off("click").click(function() {
		searchItems(data.paging.offset - 9, data.query);
	});

/*	$("#btn-favourite").off("click").click(function() {
		$.ajax({
			method:"POST",
			url: ,
			success: function(){

			}
		});
	});*/
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
		content = content.replace(/#itemTitle/g, res.title);
		content = content.replace(/#itemPrice/g, res.price);
		content = content.replace(/#urlImg/g, res.pictures[0].url);
		$("#search_result").append(content);
	});
	search_item.fail(showError);
	return search_item;
};

			
function showError() {
	$("#search_result").empty();
	$("#search_result").append($("#error_search"));
};
