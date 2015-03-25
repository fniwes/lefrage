package friends

import grails.transaction.Transactional

@Transactional
class FriendService {

    def unFriend() {
		def currentSpringUser = springSecurityService.currentUser
    	def currentUser = User.findBySpringUser(currentSpringUser)
    	currentUser.removeFromFriends(friend)
    	friend.removeFromFriends(currentUser)
    	currentUser.save(flush: true, failOnError: true)
    	friend.save(flush: true, failOnError: true)
    }
}
