import grails.plugin.springsecurity.annotation.*
import security.*
import org.springframework.security.core.context.SecurityContextHolder // necessary to obtain current user
import lefrage.User

class NavbarTagLib {
	def springSecurityService

	static namespace = "Navbar"

   	def showLinks = {
   		def username = springSecurityService.currentUser.username
       	out << render(template:"/templates/Navbar/showLinks", model:[username:username])
   	}

      def showRequests = {
         
         def currentSpringUser = springSecurityService.currentUser
         def currentUser = User.findBySpringUser(currentSpringUser)

         def queue = currentUser.pendingRequests

         out << render(template: "/templates/Navbar/showRequests", model:[pendingRequests: queue])
      }


   	def search = { attrs ->
   		def query = ""
   		println attrs.search
   		if (attrs.search!=null) query=attrs.search
   		out << render(template:"/templates/Navbar/search", model:[query:query])
   	}

   	def option = { attrs->
   		println attrs.name
   		def value = "Amigos"
   		def name ="Personas"
   		if(attrs.value != null){
   			value = attrs.value
   			name = attrs.name
   		}
   		out << render(template:"/templates/Navbar/option", model:[name:name, value: value]) 
   	}
}