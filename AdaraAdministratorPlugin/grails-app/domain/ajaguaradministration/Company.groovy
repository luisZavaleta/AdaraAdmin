package ajaguaradministration


class Company {	
	static expose = 'company'
	
	User agent;//Representante
	String name;
	String address;
	String telephone;
	
	static hasMany = [section : Section,user : User, menu : Menu]

	

    static constraints = {
		agent(blank:true, nullable:true)
		name()
		address()
		telephone()
    }
}
