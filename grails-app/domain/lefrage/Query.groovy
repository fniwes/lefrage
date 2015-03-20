package lefrage

class Query {

	String queryString

	static hasMany = [stats: Stat] // render up to 4

    static constraints = {
    	
    }
}
