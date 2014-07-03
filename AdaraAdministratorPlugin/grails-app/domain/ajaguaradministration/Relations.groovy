package ajaguaradministration

class Relations {
	static expose = 'relations'
	

	User user;
	Object3D _3DObject;
	Marker marker;
	Menu menu;
	double latitude;
	double longitude;
	double altitude;
	

    static constraints = {

		user(blank:false, nullable:false)
		_3DObject(blank:false, nullable:false)
		marker(blank:false, nullable:false)
		menu(blank:false, nullable:false)
		latitude()
		longitude()
		altitude()
    }
}
