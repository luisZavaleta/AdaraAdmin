package ajaguaradministration

class Device {	
	static expose = 'device'
	
	String model;
	OS os;
	int widthScreen;
	int heightScreen;
	boolean camera;
	boolean minRequiremensServer;
	boolean tested;
	
	

    static constraints = {
		
		model(blank:false, nullable:false)
		os(blank:false, nullable:false)
		widthScreen(blank: false, min:0, nullable:false)
		heightScreen(blank: false, min:0, nullable:false)
		camera(blank: false, nullable:false)
		minRequiremensServer(blank: false, nullable:false)
		tested(blank: false, nullable:false)
		
    }
}
