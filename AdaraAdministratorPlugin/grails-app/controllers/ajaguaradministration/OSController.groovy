package ajaguaradministration

class OSController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [OSInstanceList: OS.list(params), OSInstanceTotal: OS.count()]
    }

    def create = {
        def OSInstance = new OS()
        OSInstance.properties = params
        return [OSInstance: OSInstance]
    }

    def save = {
        def OSInstance = new OS(params)
        if (OSInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'OS.label', default: 'OS'), OSInstance.id])}"
            redirect(action: "show", id: OSInstance.id)
        }
        else {
            render(view: "create", model: [OSInstance: OSInstance])
        }
    }

    def show = {
        def OSInstance = OS.get(params.id)
        if (!OSInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'OS.label', default: 'OS'), params.id])}"
            redirect(action: "list")
        }
        else {
            [OSInstance: OSInstance]
        }
    }

    def edit = {
        def OSInstance = OS.get(params.id)
        if (!OSInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'OS.label', default: 'OS'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [OSInstance: OSInstance]
        }
    }

    def update = {
        def OSInstance = OS.get(params.id)
        if (OSInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (OSInstance.version > version) {
                    
                    OSInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'OS.label', default: 'OS')] as Object[], "Another user has updated this OS while you were editing")
                    render(view: "edit", model: [OSInstance: OSInstance])
                    return
                }
            }
            OSInstance.properties = params
            if (!OSInstance.hasErrors() && OSInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'OS.label', default: 'OS'), OSInstance.id])}"
                redirect(action: "show", id: OSInstance.id)
            }
            else {
                render(view: "edit", model: [OSInstance: OSInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'OS.label', default: 'OS'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def OSInstance = OS.get(params.id)
        if (OSInstance) {
            try {
                OSInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'OS.label', default: 'OS'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'OS.label', default: 'OS'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'OS.label', default: 'OS'), params.id])}"
            redirect(action: "list")
        }
    }
}
