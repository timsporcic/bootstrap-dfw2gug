package org.dfw2gug

import java.text.ParseException

class DemoController {

    def index() { }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [artistInstanceList: Artist.list(params), artistInstanceTotal: Artist.count()]
    }

    def show() {
        def artistInstance = Artist.get(params.id)
        if (!artistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'artist.label', default: 'Artist'), params.id])
            redirect(action: "list")
            return
        }

        [artistInstance: artistInstance]
    }

    def edit() {
        def artistInstance = Artist.get(params.id)
        if (!artistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'artist.label', default: 'Artist'), params.id])
            redirect(action: "list")
            return
        }

        [artistInstance: artistInstance]
    }

    def update() {
        def artistInstance = Artist.get(params.id)
        if (!artistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'artist.label', default: 'Artist'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (artistInstance.version > version) {
                artistInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'artist.label', default: 'Artist')] as Object[],
                        "Another user has updated this Artist while you were editing")
                render(view: "edit", model: [artistInstance: artistInstance])
                return
            }
        }

        artistInstance.properties['name','style'] = params

        try {
            if (params.birthDate.length() > 0)
            artistInstance.birthDate = Date.parse('MM/dd/yyyy',params.birthDate)
        } catch(ParseException pex) {
            flash.message = message(code: 'invalid.date.format', args: [params.birthDate])
            render(view: "edit", model: [artistInstance: artistInstance])
            return
        }

        if (!artistInstance.save(flush: true)) {
            render(view: "edit", model: [artistInstance: artistInstance])
            return
        }

        flash.message = message(code: 'artist.updated.message', args: [artistInstance.name])
        redirect(action: "show", id: artistInstance.id)
    }


}
