package example

import grails.plugin.springcache.annotations.*

class WifiController {
	def jmsService
//	def mailingService
	def geocodingService
	

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [wifiInstanceList: Wifi.list(params), wifiInstanceTotal: Wifi.count()]
    }

    def create = {
        def wifiInstance = new Wifi()
        wifiInstance.properties = params
        return [wifiInstance: wifiInstance]
    }

	@CacheFlush(["lastWifisCache", "likesPersonCache"])
    def save = {
        def wifiInstance = new Wifi(params)
		wifiInstance.creator = session.person
		wifiInstance = geolocalize(wifiInstance)
        if (wifiInstance.save(flush:true)) {
			wifiInstance.likesTo(wifiInstance.creator)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'wifi.label', default: 'Wifi'), wifiInstance.id])}"
            redirect(action: "show", id: wifiInstance.id)
        }
        else {
            render(view: "create", model: [wifiInstance: wifiInstance])
        }
    }

    def show = {
        def wifiInstance = Wifi.get(params.id)
        if (!wifiInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifi.label', default: 'Wifi'), params.id])}"
            redirect(action: "list")
        }
        else {
            [wifiInstance: wifiInstance]
        }
    }

    def edit = {
        def wifiInstance = Wifi.get(params.id)
        if (!wifiInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifi.label', default: 'Wifi'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [wifiInstance: wifiInstance]
        }
    }

    def update = {
        def wifiInstance = Wifi.get(params.id)
        if (wifiInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (wifiInstance.version > version) {
                    
                    wifiInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'wifi.label', default: 'Wifi')] as Object[], "Another user has updated this Wifi while you were editing")
                    render(view: "edit", model: [wifiInstance: wifiInstance])
                    return
                }
            }
            wifiInstance.properties = params
			wifiInstance = geolocalize(wifiInstance)
            if (!wifiInstance.hasErrors() && wifiInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'wifi.label', default: 'Wifi'), wifiInstance.id])}"
                redirect(action: "show", id: wifiInstance.id)
            }
            else {
                render(view: "edit", model: [wifiInstance: wifiInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifi.label', default: 'Wifi'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def wifiInstance = Wifi.get(params.id)
        if (wifiInstance) {
            try {
                wifiInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'wifi.label', default: 'Wifi'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'wifi.label', default: 'Wifi'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifi.label', default: 'Wifi'), params.id])}"
            redirect(action: "list")
        }
    }
	
	@Cacheable("lastWifisCache")
	def last = {
		def wifis = Wifi.listOrderById(max:10, order:"desc")
		render(template:'last', model:[wifis: wifis])
	}
	
	@CacheFlush("likesPersonCache")
	def like = {
		def person = session.person
		def wifi = Wifi.get(params.id)
		if(wifi){
			if(Like.findByPersonAndWifi(person, wifi)){
				flash.message = "Is in your likes"
			}else{
				wifi.likesTo(person)
				flash.message = "Liked! :)"
			}
			redirect(action: "show", id: wifi.id)
		}else{
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifi.label', default: 'Wifi'), params.id])}"
            redirect(action: "list")
		}
	}
	
	def share = {
		def wifi = Wifi.get(params.id)
		if(wifi){
		def urlBase = "http://"+request.getServerName()
			if (request.getLocalPort() != 80) {
				urlBase = urlBase +":"+request.getLocalPort()
			}
			def body = "Hi, <br/> @${session.person.username} has sent you <a href=\"${urlBase}${g.createLink(controller:'wifi', action:'show', id: params.id)}\">${urlBase}${g.createLink(controller:'wifi', action:'show', id: params.id)}</a>"
			def message = [email:params.email, subject:'wifi point', body:body.toString()]
//			mailingService.sendEmail(message)
			jmsService.send(service: 'mailing', method: 'sendEmail', message)
			flash.message = "Shared with ${params.email}"
	        redirect(action: "show", id: params.id)
		}else{
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifi.label', default: 'Wifi'), params.id])}"
            redirect(action: "list")
		}
	}
	
	private geolocalize(wifiInstance){
		def latlng = geocodingService.findLatLngByAddress("${wifiInstance.city}, ${wifiInstance.address}")
		if(latlng){
			wifiInstance.lat = latlng.lat
			wifiInstance.lng = latlng.lng
		}
		return wifiInstance
	}
}
