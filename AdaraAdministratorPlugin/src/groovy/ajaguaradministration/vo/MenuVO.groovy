package ajaguaradministration.vo

import ajaguaradministration.Menu

class MenuVO {
	int id
	long parentMenu
	int order
	String text
	List<ChildMenuVO> childs

/*
	public MenuVO(Menu menu){
		if(menu != null){		
			
		if(menu.parentMenu != null){
		parentMenu = menu.parentMenu.id
		}
		order = menu.orden
		text = menu.texto
		}
	}*/
}
