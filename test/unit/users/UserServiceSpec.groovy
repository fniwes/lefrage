package users

import lefrage.*
import security.*
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(UserService)
class UserServiceSpec extends Specification {
	void setup() {
    	def springUser = new SpringUser(username: "fniwes", password: "fernando")
    	mockDomain(SpringUser, [springUser])

    	def user = new User(springUser: springUser, name: "Fernando Ariel", surname: "Niwes Naufal", dateOfBirth: new Date())
    	mockDomain(User, [user])

    	def springSecurityMock = [currentUser: springUser]
    	service.springSecurityService = springSecurityMock
	}

    void "test se puede cambiar la contraseña"() {
    	given:
    	def name = "Fernando"
    	def surname = "Niwes"
    	def date = "14/09/1980"
    	def password = "ariel"

    	when:
    	def result = service.update(name, surname, date, password)

    	then:
    	result.name == "Fernando"
    	result.surname == "Niwes"
    	result.springUser.password == "ariel"
    }

    void "test si no especifico la clave queda la anterior"() {
    	given:
    	def name = "Fernando"
    	def surname = "Niwes"
    	def date = "14/09/1980"

    	when:
    	def result = service.update(name, surname, date, null)

    	then:
    	result.name == "Fernando"
    	result.surname == "Niwes"
    	result.springUser.password == "fernando"
    }

    void "test si la contraseña es vacia no cambia la clave"() {
    	given:
    	def name = "Fernando"
    	def surname = "Niwes"
    	def date = "14/09/1980"

    	when:
    	def result = service.update(name, surname, date, "")

    	then:
    	result.name == "Fernando"
    	result.surname == "Niwes"
    	result.springUser.password == "fernando"
    }
}
