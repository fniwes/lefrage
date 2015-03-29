package users

import grails.transaction.Transactional
import lefrage.User
import security.SpringUser
import security.SpringUserRole
import security.Role
import java.util.Date

@Transactional
class UserService {
	def springSecurityService

    def create(name, surname, nick, password, dateOfBirth) {

    	User us = new User(name: name, surname: surname, dateOfBirth: Date.parse("yyyy/MM/dd",dateOfBirth))
    	SpringUser sp = new SpringUser(username: nick, password: password)
    	sp.save(flush: true, failOnError: true)
    	us.springUser = sp
    	us.save(flush: true, failOnError: true)
        Role role = Role.list().find{it.authority == "ROLE_USER"};
    	SpringUserRole.create(sp, role, true)
    }

    def update(name, surname, date, password) {
    	def currentSpringUser = springSecurityService.currentUser
        def currentUser = User.findBySpringUser(currentSpringUser)

        currentUser.name = name
        currentUser.dateOfBirth = Date.parse("dd/MM/yyyy", date)
        currentUser.surname = surname

        if(password) {
            def springUser = currentUser.springUser
            springUser.password = password
            springUser.save(failOnError: true)
        }

        currentUser.save(failOnError: true)
    }

    def delete() {
    	def currentSpringUser = springSecurityService.currentUser
        def currentUser = User.findBySpringUser(currentSpringUser)

        SpringUserRole.removeAll(currentSpringUser, true)

        for(friend in currentUser.sentRequests) {
            friend.removeFromPendingRequests(currentUser)
        }

        for(friend in currentUser.friends) {
            friend.removeFromFriends(currentUser)
        }

        currentUser.delete(flush: true, failOnError: true)
        currentSpringUser.delete(flush: true, failOnError: true)
    }
}
