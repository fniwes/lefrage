package lefrage

import grails.plugin.springsecurity.annotation.*
import security.*

@Secured(['ROLE_USER'])
class SearchController {

    def index() {
    	if(params.option=="Meli")redirect(action: "meli", params: params)
    	else redirect(action: "friends", params: params)
    }

    def friends(){
    	[search: params.item_search, option: params.option]
    }

    def meli(){
    	[search: params.item_search, option: params.option]
    }
}
