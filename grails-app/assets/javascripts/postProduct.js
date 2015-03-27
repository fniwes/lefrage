function completePostTemplate(urlImg, itemTitle, itemPrice) {
	
	$("#post_result").empty();
	var template = $("#post_item_template").html();
	template = template.replace("#urlImg", urlImg);
	template = template.replace("#itemTitle", itemTitle);
	template = template.replace("#itemPrice", itemPrice);
	$("#post_result").append(template);
};

function postProduct() {

};
