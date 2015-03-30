function completePostTemplate(urlImg, itemTitle, itemPrice) {
	
	$("#post_result").empty();
	var template = $("#post_item_template").html();
	template = template.replace("#urlImg", urlImg);
	template = template.replace("#itemTitle", itemTitle);
	template = template.replace("#itemPrice", itemPrice);
	$("#post_result").append(template);
};

function postProduct() {
	var productJSON = {
		text:  $("#postModal postContent").text(),
		title: $("#post_result h3").text(),
		price: $("#post_result p").text(),
		image: $("#post_result img").attr("src")
	};

	var urlController = '${createLink(controller: "wall", action: "writePost")}'
	$.ajax({
		url: urlController,
		data: productJSON,
		success: function() {

		}
	});

};
