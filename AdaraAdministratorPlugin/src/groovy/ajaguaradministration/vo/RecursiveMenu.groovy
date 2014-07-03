package ajaguaradministration.vo

class RecursiveMenu {
	
	Integer id
	List<RecursiveMenu> recursiveMenu
	
	
	def getId(){id}
	def setId(id){this.id = id}
	
	def getRecursiveMenu(){recursiveMenu}
	def setRecursiveMenu(recursiveMenu){this.recursiveMenu = recursiveMenu}
	
	
	
	

}
