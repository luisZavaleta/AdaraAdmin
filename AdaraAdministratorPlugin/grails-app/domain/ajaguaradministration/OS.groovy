package ajaguaradministration

class OS {	
	static expose = 'os'

	String name;
	boolean supported;


    static constraints = {		
		name(blank:false, nullable:false)
		supported(blank:false, nullable:false)
    }
}
