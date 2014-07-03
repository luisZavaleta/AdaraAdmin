package ajaguaradministration

import ajaguaradministration.vo.ChildMenuVO
import ajaguaradministration.vo.MenuVO
import ajaguaradministration.vo.RecursiveMenu
import grails.converters.JSON

class MenuHelper {

	def getChilds(idParent){
		if(idParent != null){
			
			def menus =	Menu.findAllByParentMenu(Menu.get(idParent))
			List mnx = new ArrayList()
			
			menus.each{
				def menusEx = new Expando()
				menusEx.menu = it
				menusEx.childs = getChilds(it.id)
				
				mnx.add(menusEx.properties)
				}
			
			return mnx
			
			}
		return null		
		}

	
	def getChildsVO(idParent){
		
		println("idParent--->"+ idParent)
		if(idParent != null){
			
			def menus =	Menu.findAllByParentMenu(Menu.get(idParent))
			List<ChildMenuVO> mnx = new ArrayList<ChildMenuVO>()
			
			menus.each{
				def menusEx = new ChildMenuVO()
				
				def mvo = new MenuVO();
				mvo.id = it.id
				mvo.parentMenu = it.parentMenu.id
				mvo.order = it.orden
				mvo.text = it.texto
				
				
				menusEx.menu = mvo
				
				menusEx.childs = getChildsVO(it.id)
				
				mnx.add(menusEx)
				}
			
			return mnx
			
			}
		
		return null
		}
	
	
}