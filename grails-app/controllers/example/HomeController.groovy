package example

class HomeController {
	def jmsService

    def index = { 
		def wifis = Wifi.list([cache:true])
		withMobileDevice {
			render(view: "mobile", model: [wifis: wifis])
		}
		return [wifis: wifis]
	}
	
	def error = {
		def type = params.id
		if(type=="login"){
			render("debes autentificarte con twitter")
		}else{
			render("error")
		}
	}
	
	def queue = {
		jmsService.send(service: 'logging', 'hi world')
		render("respuesta de la request")
	}
}
