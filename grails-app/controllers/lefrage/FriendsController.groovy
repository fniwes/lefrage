package lefrage

import grails.plugin.springsecurity.annotation.*
import security.*

@Secured(['ROLE_USER'])
class FriendsController {

	def springSecurityService

    def index() { 
    	def currentSpringUser = springSecurityService.currentUser
    	def user = User.findBySpringUser(currentSpringUser)
    	[friends: user.friends.sort{it.name}]
    }

    def unFriend(long id){
    	def currentSpringUser = springSecurityService.currentUser
    	def currentUser = User.findBySpringUser(currentSpringUser)
    	def friend = User.get(id)
    	currentUser.removeFromFriends(friend)
    	friend.removeFromFriends(currentUser)
    	currentUser.save(flush: true, failOnError: true)
    	friend.save(flush: true, failOnError: true)
    	redirect(controller: "Friends",action: "index")
    }
}
