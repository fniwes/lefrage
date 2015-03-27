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

    def unfriend(long id) {
        def friend = User.get(id)
        friendService.unFriend(friend)
        render "okk"
    }

    def befriend(long id) {
        def friend = User.get(id)
        friendService.befriend(friend)
        render "okk"
    }

    def revert(long id) {
        def friend = User.get(id)
        friendService.revert(friend)
        render "okk"
    }

    def acceptRequest(long id) {
        friendService.accept(id)
        render "okk"
    }

    def denyRequest(long id) {
        friendService.deny(id)
        render "okk"
    }
}
