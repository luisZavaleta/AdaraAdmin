package ajaguaradministration

class MarkerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [markerInstanceList: Marker.list(params), markerInstanceTotal: Marker.count()]
    }

    def create = {
        def markerInstance = new Marker()
        markerInstance.properties = params
        return [markerInstance: markerInstance]
    }

    def save = {
        def markerInstance = new Marker(params)
        if (markerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'marker.label', default: 'Marker'), markerInstance.id])}"
            redirect(action: "show", id: markerInstance.id)
        }
        else {
            render(view: "create", model: [markerInstance: markerInstance])
        }
    }

    def show = {
        def markerInstance = Marker.get(params.id)
        if (!markerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'marker.label', default: 'Marker'), params.id])}"
            redirect(action: "list")
        }
        else {
            [markerInstance: markerInstance]
        }
    }

    def edit = {
        def markerInstance = Marker.get(params.id)
        if (!markerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'marker.label', default: 'Marker'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [markerInstance: markerInstance]
        }
    }

    def update = {
        def markerInstance = Marker.get(params.id)
        if (markerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (markerInstance.version > version) {
                    
                    markerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'marker.label', default: 'Marker')] as Object[], "Another user has updated this Marker while you were editing")
                    render(view: "edit", model: [markerInstance: markerInstance])
                    return
                }
            }
            markerInstance.properties = params
            if (!markerInstance.hasErrors() && markerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'marker.label', default: 'Marker'), markerInstance.id])}"
                redirect(action: "show", id: markerInstance.id)
            }
            else {
                render(view: "edit", model: [markerInstance: markerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'marker.label', default: 'Marker'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def markerInstance = Marker.get(params.id)
        if (markerInstance) {
            try {
                markerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'marker.label', default: 'Marker'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'marker.label', default: 'Marker'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'marker.label', default: 'Marker'), params.id])}"
            redirect(action: "list")
        }
    }
}
