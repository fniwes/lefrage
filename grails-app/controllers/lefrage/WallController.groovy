package lefrage

import grails.plugin.springsecurity.annotation.*

import org.springframework.security.core.context.SecurityContextHolder // necessary to obtain current user

@Secured(['ROLE_USER'])
class WallController {
   	
   	def springSecurityService

    def index() { 
    	def currentSpringUser = springSecurityService.currentUser
    	def currentUser = User.findBySpringUser(currentSpringUser)
    	println currentUser.posts
    	[currentUserName: currentUser.name, currentUserPosts: currentUser.posts]
    }

}
