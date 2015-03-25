import grails.plugin.springsecurity.annotation.*
import security.*

class NavbarTagLib {
	def springSecurityService

	static namespace="Navbar"

   	def showLinks = {
   		def username = springSecurityService.currentUser.username
       	out << render(template:"/templates/showLinks", model:[username:username])
   	}

   	def search = { attrs ->
   		def query=""
   		println attrs.search
   		if (attrs.search!=null) query=attrs.search
   		out << render(template:"/templates/search", model:[query:query])
   	}

   	def option = { attrs->
   		println attrs.value
   		def value="Amigos"
   		if(attrs.value!=null) value=attrs.value
   		out << render(template:"/templates/option", model:[value: value]) 
   	}
}