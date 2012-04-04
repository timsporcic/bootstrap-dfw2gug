package org.dfw2gug

import org.springframework.dao.DataIntegrityViolationException

class ArtistController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [artistInstanceList: Artist.list(params), artistInstanceTotal: Artist.count()]
    }

    def create() {
        [artistInstance: new Artist(params)]
    }

    def save() {
        def artistInstance = new Artist(params)
        if (!artistInstance.save(flush: true)) {
            render(view: "create", model: [artistInstance: artistInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'artist.label', default: 'Artist'), artistInstance.id])
        redirect(action: "show", id: artistInstance.id)
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

        artistInstance.birthDate = Date.parse('MM/dd/yyyy',params.birthDate)

        if (!artistInstance.save(flush: true)) {
            render(view: "edit", model: [artistInstance: artistInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'artist.label', default: 'Artist'), artistInstance.id])
        redirect(action: "show", id: artistInstance.id)
    }

    def delete() {
        def artistInstance = Artist.get(params.id)
        if (!artistInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'artist.label', default: 'Artist'), params.id])
            redirect(action: "list")
            return
        }

        try {
            artistInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'artist.label', default: 'Artist'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'artist.label', default: 'Artist'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
