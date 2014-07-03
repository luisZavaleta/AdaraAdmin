package ajaguaradministration

class Menu {	
	static expose = 'menu'

	Menu parentMenu;
	int orden;
	String texto;
	
	static belongsTo = [company : Company]
	
    static constraints = {
		

		parentMenu()
		orden(unique:["id"],blank:false, nullable:false)
		texto(blank:false)
		
    }
}
