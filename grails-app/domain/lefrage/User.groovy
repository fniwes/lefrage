package lefrage
import java.util.Date
import security.SpringUser

class User {

	String name, surname

	Date dateOfBirth

	static hasMany = [posts: Post, queries: Query, friends: User, 
					  sendRequests: User, pendingRequests: User]

	// static hasOne = [springUser: SpringUser]

	SpringUser springUser

	// [TODO] String photoURL

    static constraints = {
    	name blank: true
    	surname blank: true
    }

}
	