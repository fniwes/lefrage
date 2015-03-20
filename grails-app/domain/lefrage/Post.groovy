package lefrage
import java.util.Date

class Post {

	String content

	String itemID // can be null; in the case of product sharing

	Date date
	
	static belongsTo = [author: User]

	// [TODO] like

    static constraints = {

    }

}
