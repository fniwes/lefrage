package lefrage

import grails.plugin.springsecurity.annotation.*
import security.*

@Secured(['ROLE_USER'])
class SearchController {

    def index() {
    	[search: params.item_search]
    }
}
