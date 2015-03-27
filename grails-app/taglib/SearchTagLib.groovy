import grails.plugin.springsecurity.annotation.*
import security.*
import lefrage.*

class SearchTagLib {
	def springSecurityService

	static namespace="Search"

	def friendButton = { attrs ->
      def currentSpringUser = springSecurityService.currentUser
      def currentUser = User.findBySpringUser(currentSpringUser) 
      if(currentUser!=attrs.friend){
         if(currentUser.sentRequests.find{it==attrs.friend})
            out << render(template: "/templates/Search/sentRequestButton", model:[friend:attrs.friend])
         else if(currentUser.friends.find{it==attrs.friend})
            out << render(template: "/templates/Search/unfriendButton", model:[friend:attrs.friend])
         else
            out << render(template: "/templates/Search/friendButton", model:[friend:attrs.friend])
      }
   }
}