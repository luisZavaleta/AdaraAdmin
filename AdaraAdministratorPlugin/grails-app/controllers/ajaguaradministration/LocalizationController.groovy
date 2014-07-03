package ajaguaradministration

class LocalizationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [localizationInstanceList: Localization.list(params), localizationInstanceTotal: Localization.count()]
    }

    def create = {
        def localizationInstance = new Localization()
        localizationInstance.properties = params
        return [localizationInstance: localizationInstance]
    }

    def save = {
        def localizationInstance = new Localization(params)
        if (localizationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'localization.label', default: 'Localization'), localizationInstance.id])}"
            redirect(action: "show", id: localizationInstance.id)
        }
        else {
            render(view: "create", model: [localizationInstance: localizationInstance])
        }
    }

    def show = {
        def localizationInstance = Localization.get(params.id)
        if (!localizationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'localization.label', default: 'Localization'), params.id])}"
            redirect(action: "list")
        }
        else {
            [localizationInstance: localizationInstance]
        }
    }

    def edit = {
        def localizationInstance = Localization.get(params.id)
        if (!localizationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'localization.label', default: 'Localization'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [localizationInstance: localizationInstance]
        }
    }

    def update = {
        def localizationInstance = Localization.get(params.id)
        if (localizationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (localizationInstance.version > version) {
                    
                    localizationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'localization.label', default: 'Localization')] as Object[], "Another user has updated this Localization while you were editing")
                    render(view: "edit", model: [localizationInstance: localizationInstance])
                    return
                }
            }
            localizationInstance.properties = params
            if (!localizationInstance.hasErrors() && localizationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'localization.label', default: 'Localization'), localizationInstance.id])}"
                redirect(action: "show", id: localizationInstance.id)
            }
            else {
                render(view: "edit", model: [localizationInstance: localizationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'localization.label', default: 'Localization'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def localizationInstance = Localization.get(params.id)
        if (localizationInstance) {
            try {
                localizationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'localization.label', default: 'Localization'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'localization.label', default: 'Localization'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'localization.label', default: 'Localization'), params.id])}"
            redirect(action: "list")
        }
    }
}
