class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/$username/Muro"(controller: "wall", action: "index")
        "/$username/Amigos"(controller: "friends", action: "index")
        "/"(view:"/index")
        "500"(view:'/error')
	}
}
