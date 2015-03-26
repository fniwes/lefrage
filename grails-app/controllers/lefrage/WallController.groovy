package lefrage

import grails.plugin.springsecurity.annotation.*
import security.*
import org.springframework.security.core.context.SecurityContextHolder // necessary to obtain current user

@Secured(['ROLE_USER'])
class WallController {
   	
   	def springSecurityService

    def index() { 
    	def springUser=SpringUser.findByUsername(params.username)
    	def user=User.findBySpringUser(springUser)
    	def currentSpringUser = springSecurityService.currentUser
    	def currentUser = User.findBySpringUser(currentSpringUser)
    	[name: user.name, surname: user.surname, username: springUser.username, 
    		currentUserName: currentUser.name, userPosts: user.posts]
    }

    def writePost() {

      def urlSpringUser = SpringUser.findByUsername(params.username)
      def urlUser = User.findBySpringUser(urlSpringUser)

      Date newDate = new Date()
      def newPost = new Post(
        content: params.HTMLpostContent,
        date: newDate,
        author: urlUser)

      urlUser.addToPosts(newPost)

      newPost.save(flush: true, failOnError: true)

      redirect(controller: "Wall", action: "index")
    }

}
