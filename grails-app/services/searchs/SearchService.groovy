package searchs

import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.*
import lefrage.*

@Transactional
class SearchService {

    def springSecurityService

    def searchPeople(query) {
        def currentSpringUser = springSecurityService.currentUser
        def user = User.findBySpringUser(currentSpringUser)
        return User.findAllByNameLikeOrSurnameLike("%"+query+"%", "%"+query+"%")
    }

    def favourite(queryString){
    	def query = new Query(queryString: queryString)
        def currentSpringUser = springSecurityService.currentUser
        def currentUser = User.findBySpringUser(currentSpringUser)
        currentUser.addToQueries(query)
    }
}
