package users

import grails.transaction.Transactional
import lefrage.User
import security.SpringUser
import security.SpringUserRole
import security.Role
import java.util.Date

@Transactional
class UserService {

    def create(name, surname, nick, password, dateOfBirth) {

    	User us = new User(name: name, surname: surname, dateOfBirth: new Date())	
    	SpringUser sp = new SpringUser(username: nick, password: password)
    	sp.save(flush: true, failOnError: true)
    	us.springUser = sp
    	us.save(flush: true, failOnError: true)
        Role role = Role.list().find{it.authority == "ROLE_USER"};
    	SpringUserRole.create(sp, role, true)
    }
}
