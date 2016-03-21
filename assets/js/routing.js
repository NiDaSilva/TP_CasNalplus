var route = {
	routeListe: {},
	default_route: "",
	current_route: "",

	// Ajoute une route pour la fonction (ex: #login => login.action)
	add: function(route, func){
		this.routeListe[route] = func;
	},

	// Retourne la route en fonction de la demande.
	getRoute: function(fallback){
		url = window.location.toString();
		if(url.indexOf("#") != -1){
			anchor = url.substring(url.indexOf("#")+1);
		}
		else{
			anchor = fallback;
		}
		return anchor;
	},

	// Route par default si aucun ne match
	setDefault: function(func){
		this.default_route = func;
	},

	sendEvent: function(eventMessage){
		$("body").trigger( "routeChange", [eventMessage] );
	},

	// Redirige vers la route demande.
	go: function(route){
		//window.location = "#"+route;
		window.location.hash = "#"+route;
		this.current_route = route;
		if(route in this.routeListe){
			this.routeListe[route]();
			this.sendEvent(route);
		}else{
			this.default_route();
			this.sendEvent("default_route");
		}
	}
};