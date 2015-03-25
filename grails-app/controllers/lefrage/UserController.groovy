package lefrage
import grails.plugin.springsecurity.annotation.*
import security.*
import users.UserService

class UserController {

	def userService

    def register() {

    }

    def createUser() {
    	userService.create(params.name, params.surname, 
    		params.nick, params.password, params.date)
    	redirect(controller: "User", action: "register")
    }

}
