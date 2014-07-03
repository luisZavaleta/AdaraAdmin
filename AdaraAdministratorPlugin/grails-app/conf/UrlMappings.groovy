class UrlMappings {

	static mappings = {
		
		
		"/rest/menuChilds/$id"(controller:"menuChild"){
			action = [GET:"show", PUT:"update", DELETE:"delete", POST:"save"]
		}
		
		"/rest/roleData/$id"(controller:"rest"){
			action = [GET:"show", PUT:"update", DELETE:"delete", POST:"save"]
		}
		
		
		
		
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
