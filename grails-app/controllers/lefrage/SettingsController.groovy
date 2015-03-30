package lefrage
import grails.plugin.springsecurity.annotation.*
import org.springframework.security.core.context.SecurityContextHolder // necessary to obtain current user
import security.*
import users.UserService

@Secured(['ROLE_USER'])
class SettingsController {

	def springSecurityService
    def userService

    def index() {
    	def currentSpringUser = springSecurityService.currentUser
    	def currentUser = User.findBySpringUser(currentSpringUser)

    	[user: currentUser]
    }

    def deleteUser(){
        userService.delete()
        render "okk"
    }

    def updateUser() {
        userService.update(params.name, params.surname, params.date, params.password)
        redirect(controller: "settings", action: "index")
    }
}
