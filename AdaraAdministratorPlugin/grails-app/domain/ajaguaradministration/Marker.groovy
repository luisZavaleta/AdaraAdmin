package ajaguaradministration

class Marker {	
	static expose = 'marker'
	
	String name;
	byte[] pattern;

    static constraints = {

		name(blank:false, nullable:false)
		pattern(blank:false, nullable:false)
    }
}
