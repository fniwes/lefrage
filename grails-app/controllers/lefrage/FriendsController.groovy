package lefrage

import grails.plugin.springsecurity.annotation.*
import security.*

@Secured(['ROLE_USER'])
class FriendsController {

	def springSecurityService

    def index() { 
    	def currentSpringUser = springSecurityService.currentUser
    	def user = User.findBySpringUser(currentSpringUser)
    	[friends: user.friends]
    }
}
