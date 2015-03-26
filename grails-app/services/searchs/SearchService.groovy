package searchs

import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.*
import lefrage.User

@Transactional
class SearchService {

    def springSecurityService

    def searchPeople(query) {
        def currentSpringUser = springSecurityService.currentUser
        def user = User.findBySpringUser(currentSpringUser)
        return User.findAllByNameLikeOrSurnameLike("%"+query+"%", "%"+query+"%")
    }
}
