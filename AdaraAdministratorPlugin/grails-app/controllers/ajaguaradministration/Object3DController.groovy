package ajaguaradministration

class Object3DController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [object3DInstanceList: Object3D.list(params), object3DInstanceTotal: Object3D.count()]
    }

    def create = {
        def object3DInstance = new Object3D()
        object3DInstance.properties = params
        return [object3DInstance: object3DInstance]
    }

    def save = {
        def object3DInstance = new Object3D(params)
        if (object3DInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'object3D.label', default: 'Object3D'), object3DInstance.id])}"
            redirect(action: "show", id: object3DInstance.id)
        }
        else {
            render(view: "create", model: [object3DInstance: object3DInstance])
        }
    }

    def show = {
        def object3DInstance = Object3D.get(params.id)
        if (!object3DInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'object3D.label', default: 'Object3D'), params.id])}"
            redirect(action: "list")
        }
        else {
            [object3DInstance: object3DInstance]
        }
    }

    def edit = {
        def object3DInstance = Object3D.get(params.id)
        if (!object3DInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'object3D.label', default: 'Object3D'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [object3DInstance: object3DInstance]
        }
    }

    def update = {
        def object3DInstance = Object3D.get(params.id)
        if (object3DInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (object3DInstance.version > version) {
                    
                    object3DInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'object3D.label', default: 'Object3D')] as Object[], "Another user has updated this Object3D while you were editing")
                    render(view: "edit", model: [object3DInstance: object3DInstance])
                    return
                }
            }
            object3DInstance.properties = params
            if (!object3DInstance.hasErrors() && object3DInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'object3D.label', default: 'Object3D'), object3DInstance.id])}"
                redirect(action: "show", id: object3DInstance.id)
            }
            else {
                render(view: "edit", model: [object3DInstance: object3DInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'object3D.label', default: 'Object3D'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def object3DInstance = Object3D.get(params.id)
        if (object3DInstance) {
            try {
                object3DInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'object3D.label', default: 'Object3D'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'object3D.label', default: 'Object3D'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'object3D.label', default: 'Object3D'), params.id])}"
            redirect(action: "list")
        }
    }
}
