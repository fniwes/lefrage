package lefrage
import grails.plugin.springsecurity.annotation.*
import security.*
import lefrage.User
import searchs.SearchService

@Secured(['ROLE_USER'])
class SearchController {

    def searchService

    def index() {
    	if(params.option=="Meli")redirect(action: "meli", params: params)
    	else redirect(action: "friends", params: params)
    }

    def friends(){
        render(view:"/friends/index", model: [friends: searchService.searchPeople(params.item_search)])
    }


    def meli(){
    	[search: params.item_search, option: params.option]
    }
}
