package example

import grails.converters.*

class CallbackController {
	def oauthService
	

    def index = {
		if (session.oauthToken != null) {
			def person = findOrRegisterUser(session)
			session.person = person
			redirect(controller: 'home')
		} else{
			render "No se ha podido autentificar"
		}
	}
	
	private def findOrRegisterUser(session){
		def apiUrl = "http://api.twitter.com/1/account/verify_credentials.json"
		def response = oauthService.accessResource(apiUrl, 'twitter', [key:session.oauthToken.key, secret:session.oauthToken.secret], 'GET')
		def profile = JSON.parse(response)
		def person = Person.findByUsername(profile.screen_name)
		if(!person){
			person = new Person(username:profile.screen_name, avatar:profile.profile_image_url, description: profile.description, web: profile.url)
			person.save(flush:true)
		}
		return person
	}
}
