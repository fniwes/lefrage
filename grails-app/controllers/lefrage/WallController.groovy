package lefrage

import grails.plugin.springsecurity.annotation.*
import security.*
import org.springframework.security.core.context.SecurityContextHolder // necessary to obtain current user

@Secured(['ROLE_USER'])
class WallController {
   	
   	def springSecurityService

    def index() { 
    	
    	def urlSpringUser = SpringUser.findByUsername(params.username)
    	def urlUser = User.findBySpringUser(urlSpringUser)
    	def sortedPosts = urlUser.posts.sort{it.id}
      
    	[wallUserName: urlUser.name, wallUserPosts: sortedPosts]
		
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
