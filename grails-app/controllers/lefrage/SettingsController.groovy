package lefrage
import grails.plugin.springsecurity.annotation.*
import org.springframework.security.core.context.SecurityContextHolder // necessary to obtain current user
import security.*

@Secured(['ROLE_USER'])
class SettingsController {

	def springSecurityService

    def index() {
    	def currentSpringUser = springSecurityService.currentUser
    	def currentUser = User.findBySpringUser(currentSpringUser)

    	[user: currentUser]
    }

    def deleteUser(long id){
    	def user = User.get(id);
        SpringUserRole.remove(user.springUser, user.springUser);
        user.springUser.delete(flush: true, failOnError: true);
        user.delete(flush: true, failOnError: true);
        redirect(controller: "settings", action: "index");
    }

	@Secured(['permitAll'])
    def updateUser(){
    	println params

    	def user = User.get(params.id_usr)
        user.name = params.name
        user.surname = params.surname
        user.dateOfBirth = Date.parse("dd/MM/yyyy", params.date)
        user.surname = params.surname

        if(params.password) {
            def springUser = user.springUser
            springUser.password = params.password
            springUser.save(failOnError: true)
        }

    	user.save(flush: true, failOnError: true)
        redirect(controller: "settings", action: "index")
    }
}
