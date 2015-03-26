package lefrage
import java.util.Date

class Post {

	String content

	String itemID // can be null; in the case of product sharing

	Date date

	User author // author of post
	
	static belongsTo = [containingWallUser: User] // the user in whose wall this post lives

	// [TODO] like

    static constraints = {
		content blank: false
		itemID nullable: true
    }

}
