package lefrage
import java.util.Date
import security.SpringUser

class User {

	String name, surname

	Date dateOfBirth

	static hasMany = [wallPosts: Post, queries: Query, friends: User, 
					  sendRequests: User, pendingRequests: User]

	SpringUser springUser

	// [TODO] String photoURL
	static mappedBy = [wallPosts: 'containingWallUser']

    static constraints = {
    	name blank: true
    	surname blank: true
    }

}
	