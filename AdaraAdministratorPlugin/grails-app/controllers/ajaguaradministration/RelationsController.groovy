package ajaguaradministration

class RelationsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [relationsInstanceList: Relations.list(params), relationsInstanceTotal: Relations.count()]
    }

    def create = {
        def relationsInstance = new Relations()
        relationsInstance.properties = params
        return [relationsInstance: relationsInstance]
    }

    def save = {
        def relationsInstance = new Relations(params)
        if (relationsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'relations.label', default: 'Relations'), relationsInstance.id])}"
            redirect(action: "show", id: relationsInstance.id)
        }
        else {
            render(view: "create", model: [relationsInstance: relationsInstance])
        }
    }

    def show = {
        def relationsInstance = Relations.get(params.id)
        if (!relationsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relations.label', default: 'Relations'), params.id])}"
            redirect(action: "list")
        }
        else {
            [relationsInstance: relationsInstance]
        }
    }

    def edit = {
        def relationsInstance = Relations.get(params.id)
        if (!relationsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relations.label', default: 'Relations'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [relationsInstance: relationsInstance]
        }
    }

    def update = {
        def relationsInstance = Relations.get(params.id)
        if (relationsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (relationsInstance.version > version) {
                    
                    relationsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'relations.label', default: 'Relations')] as Object[], "Another user has updated this Relations while you were editing")
                    render(view: "edit", model: [relationsInstance: relationsInstance])
                    return
                }
            }
            relationsInstance.properties = params
            if (!relationsInstance.hasErrors() && relationsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'relations.label', default: 'Relations'), relationsInstance.id])}"
                redirect(action: "show", id: relationsInstance.id)
            }
            else {
                render(view: "edit", model: [relationsInstance: relationsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relations.label', default: 'Relations'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def relationsInstance = Relations.get(params.id)
        if (relationsInstance) {
            try {
                relationsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'relations.label', default: 'Relations'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'relations.label', default: 'Relations'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'relations.label', default: 'Relations'), params.id])}"
            redirect(action: "list")
        }
    }
}
