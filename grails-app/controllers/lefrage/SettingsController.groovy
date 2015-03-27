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

    @Secured(['permitAll'])
    def deleteUser(){
    	def user = User.get(params.id);
        SpringUserRole.remove(user.springUser, user.springUser);
        user.springUser.delete(flush: true, failOnError: true);
        user.delete(flush: true, failOnError: true);
        redirect(controller: "settings", action: "index");
    }

	@Secured(['permitAll'])
    def updateUser() {
        userService.update(params.id_usr, params.name, params.surname, params.date, params.password)
        redirect(controller: "settings", action: "index")
    }
}
