package ajaguaradministration

class Localization {
	static expose = 'localization'
	double latitude;
	double longitude;
	double altitude;
	
	static constraints = {
		latitude(blank:false, nullable:false)
		longitude(blank:false, nullable:false)
		altitude()
		
	}
	
}

