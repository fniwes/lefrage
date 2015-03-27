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

    def befriend(friend) {
    	def currentSpringUser = springSecurityService.currentUser
        def currentUser = User.findBySpringUser(currentSpringUser)
        currentUser.addToSentRequests(friend)
        friend.addToPendingRequests(currentUser)
        currentUser.save(flush: true, failOnError: true)
        friend.save(flush: true, failOnError: true)
    }

    def revert(friend) {
        def currentSpringUser = springSecurityService.currentUser
    	def currentUser = User.findBySpringUser(currentSpringUser)
    	currentUser.removeFromSentRequests(friend)
    	friend.removeFromPendingRequests(currentUser)
    	currentUser.save(flush: true, failOnError: true)
    	friend.save(flush: true, failOnError: true)
        
    }

    def accept(id) {
        def currentSpringUser = springSecurityService.currentUser
        def currentUser = User.findBySpringUser(currentSpringUser)
        def friendUser = User.get(id)

        currentUser.removeFromPendingRequests(friendUser)
        friendUser.removeFromSentRequests(currentUser)

        currentUser.addToFriends(friendUser)
        friendUser.addToFriends(currentUser)        

        currentUser.save(flush: true, failOnError: true)
        friendUser.save(flush: true, failOnError: true)
    }

    def deny(id) {
        def currentSpringUser = springSecurityService.currentUser
        def currentUser = User.findBySpringUser(currentSpringUser)
        def friendUser = User.get(id)

        currentUser.removeFromPendingRequests(friendUser)
        friendUser.removeFromSentRequests(currentUser)

        currentUser.save(flush: true, failOnError: true)
        friendUser.save(flush: true, failOnError: true)
    }
}
