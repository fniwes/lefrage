package lefrage

class Product {
	
	String productTitle

	String productUrlImg

	String productPrice

	static belongsTo = [post: Post]

    static constraints = {
    }
}
