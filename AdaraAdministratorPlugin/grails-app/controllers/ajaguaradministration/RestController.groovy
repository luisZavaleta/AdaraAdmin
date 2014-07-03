package ajaguaradministration

import java.util.List;

import grails.converters.JSON
import groovyx.net.http.HTTPBuilder
import grails.web.*
import ajaguaradministration.vo.*


class RestController {

	/* ADARA ADMINISTRATION 7070 */
	
	

	def static adaraURL = "http://localhost:8080/AdaraUsersPlugin/";

	def http = new HTTPBuilder(adaraURL)
	MenuHelper mh = new MenuHelper()



	def showEx = {
		println("TA DA")

		def jsonExpando = new Expando();
		jsonExpando.success = true;

		def data = new Expando()
		jsonExpando.data = data.properties

		List relationList = new ArrayList();

		http.get(path:"rest/1"){ resp, json ->

			json.data.relations.each{
				def o3D = Object3D.get(it.i3DObject)
				def ma = Marker.get(it.idMarker)
				def me = Menu.get(it.idMenu)

				def o3de = new Expando()
				o3de.id = o3D.id
				o3de.obj = "o3D.obj"
				o3de.mtl = "o3D.mtl"
				o3de.img = "o3D.img"
				o3de.imageExtension = o3D.imageExtension
				o3de.baseURL = o3D.baseURL
				o3de.baseFileName = o3D.baseFileName

				def mae = new Expando()
				mae.id = ma.id
				mae.name = ma.name
				mae.pattern = "ma.pattern"
				//mae.childs =  mh.getChilds(ma.id)

				def mee = new Expando()
				mee.id = me.id
				mee.parentMenu = me.parentMenu
				mee.order =  me.orden
				mee.text = me.texto
				mee.childs =  mh.getChildsVO(me.id)

				def loce = new Expando();
				loce.latitude = it.latitude
				loce.longitude = it.longitude
				loce.altitude = it.altitude

				def relation =[object3D:o3de.properties, marker:mae.properties, menu:mee.properties, localization:loce.properties];

				relationList.add(relation)
			}

			data.relation = relationList
		}

		render jsonExpando.properties as JSON
	}

	
	def update = {
	}

	def delete = {
	}

	def save = {
	}



	
	def show = {
		
		println("THE SHOW MUST GO ON")
		
			RestResponseVO rr = new RestResponseVO()
		
				//def jsonExpando = new Expando();
				rr.success = true;
		
				//def data = new Expando()
				DataVO data = new DataVO();
				
				
				
				rr.data = data
		
				List<RelationVO> relationList = new ArrayList<RelationVO>();
				
				//List relationList = new ArrayList();
		
				http.get(path:"rest/1"){ resp, json ->
		
					
					println("JSON--->"+ json)
					json.data.relations.each{
						println("EACH--->"+ it.id3DObject)
						//println("relation--->"+ it.getValue())
						
										 
						def o3D = Object3D.get(it.id3DObject)
						println("O3D" + o3D)
							
						def ma = Marker.get(it.idMarker)
						def me = Menu.get(it.idMenu)
		
						//def o3de = new Expando()
						def o3de = new Object3DVO()
						
						
						o3de.id = o3D.id
						o3de.obj = "o3D.obj"
						o3de.mtl = "o3D.mtl"
						o3de.img = "o3D.img"
						o3de.imageExtension = o3D.imageExtension
						o3de.baseURL = o3D.baseURL
						o3de.baseFileName = o3D.baseFileName
		
						//def mae = new Expando()
						def mae = new MarkerVO()
						mae.id = ma.id
						mae.name = ma.name
						mae.pattern = "ma.pattern"
		
						//def mee = new Expando()
						def mee = new MenuVO()
						
						mee.id = me.id
						if(me.parentMenu!= null){
							mee.parentMenu = me.parentMenu.id
						}
						mee.order =  me.orden
						mee.text = me.texto
						mee.childs =  mh.getChildsVO(me.id)
		
						//def loce = new Expando();
						def loce = new LocalizationVO()
						loce.id = 1//it.locId
						loce.latitude = 1//it.latitude
						loce.longitude = 1//it.longitude
						loce.altitude = 1//it.altitude
		
						//def relation =[object3D:o3de.properties, marker:mae.properties, menu:mee.properties, localization:loce.properties];
						def relation = new RelationVO();
						relation.object3D = o3de
						relation.marker = mae
						relation.menu = mee
						relation.localization = loce
						relation.id = it.id
						relationList.add(relation)
					}
		
					data.relation = relationList
				}
		
				render rr as JSON
			}
	
	
	

}


