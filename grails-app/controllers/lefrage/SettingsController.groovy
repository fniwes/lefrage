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
    def updateUser(args){
    	println args

    	def user = User.get(args.id_usr)
        user.name = args.name
        user.surname = args.surname
        user.dateOfBirth = args.date
        user.surname = args.surname

        def sp = SpringUser.get(args.springUser.id)
        sp.username = args.nick
        sp.password = args.password

    	sp.save(flush: true, failOnError: true)
    	user.springUser = sp
    	user.save(flush: true, failOnError: true)

        redirect(controller: "settings", action: "index")
    }
}
