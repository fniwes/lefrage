package lefrage

import grails.plugin.springsecurity.annotation.*
import security.*

@Secured(['ROLE_USER'])
class SearchController {

    def index() {
    	println params.option
    	if(params.option=="Meli")redirect(action: "meli", params: params)
    	else redirect(action: "friends", params: params)
    }

    def friends(){
    	[search: params.item_search]
    }

    def meli(){
    	[search: params.item_search]
    }
}
