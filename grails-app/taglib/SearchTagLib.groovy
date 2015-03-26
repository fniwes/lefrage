import grails.plugin.springsecurity.annotation.*
import security.*
import lefrage.*

class SearchTagLib {
	def springSecurityService

	static namespace="Search"

	def friendButton = { attrs ->
      def currentSpringUser = springSecurityService.currentUser
      if(User.findBySpringUser(currentSpringUser)!=attrs.friend){
         if(User.findBySpringUser(currentSpringUser).friends.find{it==attrs.friend})
            out << render(template: "/templates/Search/unfriendButton", model:[friend:attrs.friend])
         else
            out << render(template: "/templates/Search/friendButton", model:[friend:attrs.friend])
      }
   }
}