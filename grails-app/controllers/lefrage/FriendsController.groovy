package lefrage

import grails.plugin.springsecurity.annotation.*
import security.*
import friends.FriendService

@Secured(['ROLE_USER'])
class FriendsController {

	def springSecurityService
	def friendService

    def index() { 
    	def currentSpringUser = springSecurityService.currentUser
    	def user = User.findBySpringUser(currentSpringUser)
    	[friends: user.friends.sort{it.name}]
    }

    def unfriend(long id){
        def friend = User.get(id)
        friendService.unFriend(friend)
        render "ok"
    }

    def befriend(long id){
        def friend = User.get(id)
        friendService.befriend(friend)
        redirect(controller: "Friends",action: "index")
    }
}
