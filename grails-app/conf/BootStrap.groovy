import security.Role
import security.SpringUser
import security.SpringUserRole
import java.util.Date
import lefrage.User
import lefrage.Post

class BootStrap {

	def init = { servletContext ->
    	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError: true);
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true, failOnError: true);
		
		def adminUser = new SpringUser(username: 'root', password: 'root');
		adminUser.save(flush: true, failOnError: true);

		SpringUserRole.create(adminUser, adminRole, true);

		User us1 = new User(name: "Shai", surname: "Bianchi", dateOfBirth: new Date())
		def springUs1 = new SpringUser(username: "shai", password: "shai")
		springUs1.save(flush: true, failOnError: true)
		us1.springUser = springUs1
		us1.save(flush:true, failOnError: true)
		SpringUserRole.create(springUs1, userRole, true)

		User us2 = new User(name: "Lucas", surname: "Rossi", dateOfBirth: new Date())
		def springUs2 = new SpringUser(username: "lucas", password: "lucas")
		springUs2.save(flush: true, failOnError: true)
		us2.springUser = springUs2
		us2.save(flush:true, failOnError: true)
		SpringUserRole.create(springUs2, userRole, true)

		us1.addToFriends(us2)
		us2.addToFriends(us1)

		/*
		def newPost1 = new Post()
		Date newDate1 = new Date()
		newPost1.content = 'que deje de cortarse la luz porfi'
		newPost1.date = newDate1
		newPost1.save(flush: true, failOnError: true)

		def newPost2 = new Post()
		Date newDate2 = new Date()
		newPost2.content = 'es re molesto postis'
		newPost2.date = newDate2
		newPost2.save(flush: true, failOnError: true)

		def newPost3 = new Post()
		Date newDate3 = new Date()
		newPost3.content = 'se me apaga el wifi'
		newPost3.date = newDate3
		newPost3.save(flush: true, failOnError: true)

		us1.addToPosts(newPost1)
		us1.addToPosts(newPost2)
		us1.addToPosts(newPost3)
		*/

    }
    def destroy = {
    }
}
