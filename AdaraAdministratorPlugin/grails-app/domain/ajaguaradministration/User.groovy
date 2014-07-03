package ajaguaradministration

class User {
	static expose = 'user'
	
	

	Device device;
	Company company;
	String name;
	String address;
	String email;
	String job;
	String password;
	

    static constraints = {
		
	
		device(blank:false, nullable:false)
		company(nullable:true)
		name(blank:false, nullable:false)
		address()
		email(blank:false, nullable:false)
		job()
		password(blank:false,minLength:5, nullable:false)
		
    }
}

