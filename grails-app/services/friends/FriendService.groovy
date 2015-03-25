package friends

import lefrage.User
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.*

@Transactional
class FriendService {

	def springSecurityService

    def unFriend(friend) {
		def currentSpringUser = springSecurityService.currentUser
    	def currentUser = User.findBySpringUser(currentSpringUser)
    	currentUser.removeFromFriends(friend)
    	friend.removeFromFriends(currentUser)
    	currentUser.save(flush: true, failOnError: true)
    	friend.save(flush: true, failOnError: true)
    }
}
