import security.Role
import security.SpringUser
import security.SpringUserRole

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError: true);
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true, failOnError: true);
		
		def adminUser = new SpringUser(username: 'root', password: 'root');
		adminUser.save(flush: true, failOnError: true);

		SpringUserRole.create(adminUser, adminRole, true);
    }
    def destroy = {
    }
}
