package lefrage

import grails.plugin.springsecurity.annotation.*
import security.*
import org.springframework.security.core.context.SecurityContextHolder // necessary to obtain current user

@Secured(['ROLE_USER'])
class WallController {
   	
   	def springSecurityService

    def index() { 

    	def springUser = SpringUser.findByUsername(params.username)
    	def user = User.findBySpringUser(springUser)
    	def currentSpringUser = springSecurityService.currentUser
    	def currentUser = User.findBySpringUser(currentSpringUser)

      // currentUser no puede acceder a user si no son amigos
      if (!(user.friends.find{it == currentUser}) && user != currentUser) {
        render("No sos amigo")
        sleep(1000)
        //redirect(controller: "wall", action: "index")
      }

      def sortedPosts = user.wallPosts.sort{it.date}.reverse(true)
    	def autoPostBoolean = user.id == currentUser.id
      
      def friendsCount = user.friends.size()

    	[isAutoPost: autoPostBoolean, name: user.name,
      surname: user.surname, username: springUser.username,
      currentUserName: currentUser.name, userPosts: sortedPosts,
      profileDOB: user.dateOfBirth, profileFriendsCount: friendsCount]

    }

    def writePost() {
    	def urlSpringUser = SpringUser.findByUsername(params.username)
    	def wallOwner = User.findBySpringUser(urlSpringUser)

      def currentSpringUser = springSecurityService.currentUser
      def loggedUser = User.findBySpringUser(currentSpringUser)

      	Date newDate = new Date()
      	def newPost = new Post(
        	content: params.HTMLpostContent,
        	date: newDate,
        	author: loggedUser,
          containingWallUser: wallOwner
     	)

        newPost.save(flush: true, failOnError: true)
        wallOwner.addToWallPosts(newPost)
        //wallOwner.save(flush: true, failOnError: true)

      	redirect(controller: "Wall", action: "index", params: params)

    }

    def searches(){ 
      def springUser = SpringUser.findByUsername(params.username)
      def user = User.findBySpringUser(springUser)
      def currentSpringUser = springSecurityService.currentUser
      def currentUser = User.findBySpringUser(currentSpringUser)
      [name:user.name, surname: user.surname]
    }

}
