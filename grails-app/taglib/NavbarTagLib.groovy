import grails.plugin.springsecurity.annotation.*
import security.*

class NavbarTagLib {
	def springSecurityService

	static namespace="Navbar"

   	def showLinks = {
   		def username = springSecurityService.currentUser.username
       	out << render(template:"/templates/Navbar/showLinks", model:[username:username])
   	}

   	def search = { attrs ->
   		def query=""
   		println attrs.search
   		if (attrs.search!=null) query=attrs.search
   		out << render(template:"/templates/Navbar/search", model:[query:query])
   	}

   	def option = { attrs->
   		println attrs.name
   		def value="Amigos"
   		def name ="Amigos"
   		if(attrs.value!=null){
   			value=attrs.value
   			name=attrs.name
   		}
   		out << render(template:"/templates/Navbar/option", model:[name:name, value: value]) 
   	}
}