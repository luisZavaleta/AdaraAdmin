package ajaguaradministration

class SectionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sectionInstanceList: Section.list(params), sectionInstanceTotal: Section.count()]
    }

    def create = {
        def sectionInstance = new Section()
        sectionInstance.properties = params
        return [sectionInstance: sectionInstance]
    }

    def save = {
        def sectionInstance = new Section(params)
        if (sectionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'section.label', default: 'Section'), sectionInstance.id])}"
            redirect(action: "show", id: sectionInstance.id)
        }
        else {
            render(view: "create", model: [sectionInstance: sectionInstance])
        }
    }

    def show = {
        def sectionInstance = Section.get(params.id)
        if (!sectionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'section.label', default: 'Section'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sectionInstance: sectionInstance]
        }
    }

    def edit = {
        def sectionInstance = Section.get(params.id)
        if (!sectionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'section.label', default: 'Section'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sectionInstance: sectionInstance]
        }
    }

    def update = {
        def sectionInstance = Section.get(params.id)
        if (sectionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sectionInstance.version > version) {
                    
                    sectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'section.label', default: 'Section')] as Object[], "Another user has updated this Section while you were editing")
                    render(view: "edit", model: [sectionInstance: sectionInstance])
                    return
                }
            }
            sectionInstance.properties = params
            if (!sectionInstance.hasErrors() && sectionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'section.label', default: 'Section'), sectionInstance.id])}"
                redirect(action: "show", id: sectionInstance.id)
            }
            else {
                render(view: "edit", model: [sectionInstance: sectionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'section.label', default: 'Section'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sectionInstance = Section.get(params.id)
        if (sectionInstance) {
            try {
                sectionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'section.label', default: 'Section'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'section.label', default: 'Section'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'section.label', default: 'Section'), params.id])}"
            redirect(action: "list")
        }
    }
}
