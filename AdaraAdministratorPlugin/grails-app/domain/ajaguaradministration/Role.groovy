package ajaguaradministration

class Role {
	static expose = 'role'


	String name;
	
    static constraints = {
		
		name(blank:false, nullable:false)
    }
}
