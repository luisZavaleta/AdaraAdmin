package ajaguaradministration

class Section {
	static expose = 'section'
	

	Section parentSection;
	String nombre;
	Role role;
	static belongsTo = [company : Company]
	
    static constraints = {

		parentSection()
		nombre(blank:false, nullable:false)
    }
}
