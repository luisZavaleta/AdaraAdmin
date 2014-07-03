package ajaguaradministration

class Object3D {
	static expose = 'object3D'
	
	byte[] obj;
	byte[] img;
	byte[] mtl;
	String imageExtension;
	String baseURL;
	String baseFileName;

    static constraints = {


		obj(blank:false, nullable:false)
		mtl(blank:false, nullable:false)
		img(blank:false, nullable:false)
		imageExtension(blank:false)
		baseURL()
		baseFileName()
    }
}
